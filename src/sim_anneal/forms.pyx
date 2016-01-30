# cython: profile=True

import math
cimport numpy as np
import numpy as np

# make an exponential class to avoid some computations

cpdef exponential(x,float a,float b):
    e = a*np.exp(b*x/x.max())
    return e

cpdef bell(x,float m1,float s1,float a1):
    g = a1*np.exp(-0.5*((x-m1)/s1)**2)
    return g

def bell_pair(x,m1,m2,s1,s2,a1,a2):
    g1 = a1*np.exp(-0.5*((x-m1)/s1)**2)
    g2 = a2*np.exp(-0.5*((x-m2)/s2)**2)
    penalty = 0.0
    penalty += (g1.sum() + g2.sum() - 1.0)**8
    penalty += (1.0/(0.00001 + (abs(m1-m2)/math.sqrt(s1*s2))))**8
    return g1 + g2 + penalty


