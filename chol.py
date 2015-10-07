#!/usr/bin/env python3

import time

import numpy

N = 3000
m = (numpy.random.rand(N, N) - 0.5)
m = m.transpose()*m
for i in range(N):
    m[i, i] += N/2

start = time.time()
l = numpy.linalg.cholesky(m)
finish = time.time()
print("took: ", finish - start)
