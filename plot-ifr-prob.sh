reset
set multiplot
set size 0.5

set logscale y

set yrange [0.5:*]

G1 = 4791961
N1 = 371775
G2 = 4878012
N2 = 549086
G3 = 4631469
N3 = 901383

myps = 0.5

set xrange [0:250]
set xtics 50
set origin 0,0.5
set xlabel "l"
set ylabel "Expected number of IFRs of\nlength >= l in simulated genome"
#set ytics (0.01, 0.05, 0.1, 1, 10, 1e2, 1e3, 1e4, 1e5, 1e6)
set label 1 at graph 0.05, graph 0.9 "A" font "Arial Black, 12" 
plot "outnumgene-new-0.txt" u 1:3 ls 1 ps myps pt 9 title "Langridge", "outnumgene-new-1.txt" u 1:3 ls 3 ps myps pt 11 title "Barquist", "outnumgene-new-2.txt" u 1:3 ps myps pt 5 lc rgbcolor "#888888" title "This study" #N1*exp(-x*N1/G1) ls 1, N2*exp(-x*N2/G2) ls 3, N3*exp(-x*N3/G3) lc rgbcolor "#888888" #, 4e5*exp(-0.082*x) ls 1 notitle, 6e5*exp(-0.12*x) ls 3 notitle, 8.2e5*exp(-0.2*x) ls 6 notitle, 0.05 lw 2 lc rgbcolor "#000000" notitle, 200 lw 2 lc rgbcolor "#000000" notitle, 40 lw 2 lc rgbcolor "#000000" notitle

set xrange [0:100]
set xtics 20
set origin 0,0
set xlabel "l"
set ylabel "Expected number of IFRs of\nlength >= l in simulated gene"
#set ytics (0.01, 0.05, 0.1, 1, 10, 1e2, 1e3, 1e4, 1e5, 1e6)
set label 1 at graph 0.05, graph 0.9 "C" font "Arial Black, 12" 
plot "outnumgene-new-3.txt" u 1:3 ls 1 ps myps pt 9 title "Langridge", "outnumgene-new-4.txt" u 1:3 ls 3 ps myps pt 11 title "Barquist", "outnumgene-new-5.txt" u 1:3 ps myps pt 5 lc rgbcolor "#888888" title "This study" #, 4e5*exp(-0.082*x) ls 1 notitle, 6e5*exp(-0.12*x) ls 3 notitle, 8.2e5*exp(-0.2*x) ls 6 notitle, 0.05 lw 2 lc rgbcolor "#000000" notitle, 200 lw 2 lc rgbcolor "#000000" notitle, 40 lw 2 lc rgbcolor "#000000" notitle


unset logscale y
set yrange [*:*]


set xrange [0:250]
set xtics 50
set origin 0.5,0.5
set xlabel "l"
set ylabel "Probability of >= 1 IFR of\nlength >= l in simulated genome"
#set ytics (0.01, 0.05, 0.1, 1, 10, 1e2, 1e3, 1e4, 1e5, 1e6)
set label 1 at graph 0.05, graph 0.9 "B" font "Arial Black, 12" 
plot "outprobgene-new-0.txt" ls 1 ps myps pt 9 title "Langridge", "outprobgene-new-1.txt" ls 3 ps myps pt 11 title "Barquist", "outprobgene-new-2.txt" ps myps pt 5 lc rgbcolor "#888888" title "This study", 0.05 lc rgbcolor "#000000"  #, 4e5*exp(-0.082*x) ls 1 notitle, 6e5*exp(-0.12*x) ls 3 notitle, 8.2e5*exp(-0.2*x) ls 6 notitle, 0.05 lw 2 lc rgbcolor "#000000" notitle, 200 lw 2 lc rgbcolor "#000000" notitle, 40 lw 2 lc rgbcolor "#000000" notitle

set xrange [0:100]
#set logscale y
set xtics 20
set origin 0.5,0
set xlabel "l"
set ylabel "Probability of >= 1 IFR of\nlength >= l in simulated gene"
set label 1 at graph 0.05, graph 0.9 "D" font "Arial Black, 12" 
#set ytics (0.01, 0.05, 0.1, 1, 10, 1e2, 1e3, 1e4, 1e5, 1e6)
plot "outprobgene-new-3.txt" ls 1 ps myps pt 9 title "Langridge", "outprobgene-new-4.txt" ls 3 ps myps pt 11 title "Barquist", "outprobgene-new-5.txt" ps myps pt 5 lc rgbcolor "#888888" title "This study", 0.05 lc rgbcolor "#000000"  #, 4e5*exp(-0.082*x) ls 1 notitle, 6e5*exp(-0.12*x) ls 3 notitle, 8.2e5*exp(-0.2*x) ls 6 notitle, 0.05 lw 2 lc rgbcolor "#000000" notitle, 200 lw 2 lc rgbcolor "#000000" notitle, 40 lw 2 lc rgbcolor "#000000" notitle
