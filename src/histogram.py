#!/usr/bin/env python3

import sys
from bashplotlib.histogram import plot_hist

file = sys.argv[1]
bincount = 50
height=15

plot_hist(file, bincount=bincount, height=height)
