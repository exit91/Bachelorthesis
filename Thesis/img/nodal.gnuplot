set terminal pdf
set output 'nodal.pdf'

set parametric
set dummy t
set trange [-1:1]
set xrange [-1:1]
set samples 160
unset border
unset ytics
unset xtics
unset key
plot t**2,t**3 lt rgb "black" lw 2, t,0 lt rgb "black"
