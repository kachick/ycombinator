$VERBOSE = true

require_relative '../lib/ycombinator'
require_relative '../lib/ycombinator/core_ext'


include YCombinator

Y = YCombinator

fact = proc{|f| proc{|n| n == 0 ? 1 : n * f[n-1]}}
fib = proc{|f| proc{|n| n <= 1 ? n : f[n-1] + f[n-2]}}

p ->f{proc{|n| n == 0 ? 1 : n * f[n-1]}}.y(5)
p Y[fact][5] #=> 120
p Y[fib][10] #=> 55