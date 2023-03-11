#!/usr/bin/env python3

import sys
from bashplotlib.histogram import plot_hist

plot_hist(sys.argv[1], bincount=50, height=15)
