set terminal pdf
set output 'cuspidal.pdf'

set parametric
set dummy t
set trange [-1.32:1.32]
set xrange [-1:1]
set samples 160
unset border
unset ytics
unset xtics
unset key
plot t**2-1,t**3-t lt rgb "black" lw 2, t,-t  lt rgb "black", t,t lt rgb "black"
