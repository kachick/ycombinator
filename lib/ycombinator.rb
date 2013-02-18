# Copyright (c) 2012 Kenichi Kamiya

# @note
#  Inspired from http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-list/35058
module YCombinator

  VERSION = '0.0.1'.freeze
  
  COMBINATOR = ->g{
    ->f1{g.call(f1.call(f1))}[->f2{g[->y{f2[f2][y]}]}]
  }.freeze
  
  class ArityError < ArgumentError; end

  class << self
    
    def accept?(_proc)
      assert_proc _proc
    rescue
      false
    else
      true
    end
    
    def [](func)
      COMBINATOR[proc_for(func)]
    end
    
    def assert_proc(_proc)
      proc_for _proc
    rescue
      raise
    else
      nil
    end
    
    # @param [#to_proc] _proc
    # @return [Proc] valid argument for #[]
    def proc_for(_proc)
      raise TypeError unless _proc.respond_to?(:to_proc)
      _proc = _proc.to_proc
      raise ArityError unless _proc.arity == 1

      _proc
    end
    
  end
  
  module_function

  def YCombinator(&block)
    ::YCombinator[block]
  end

end