% File:  simplemat/script1.m

echo on

% first key-value pair
kA = [1 1 0 0 0 0]'
vA = [5 4 3 2 1]'
pause

% second key-value pair
kB = [0 0 1 1 0 0]'
vB = [3 1 4 1 5]'
pause

% third key-value pair
kC = [0 0 0 0 1 1]'
vC = [2 4 6 8 10]'
pause

% make the memory
M = vA*kA'/norm(kA)^2 + vB*kB'/norm(kB)^2 + vC*kC'/norm(kC)^2
pause

% test the memory
M * kA
M * kB
M * kC
pause

% add a fourth key-value pair: not orthogonal
kD = [1 0 0 0 0 1]'
vD = [9 8 7 6 5]'
pause

% make the memory again
Mx = vA*kA'/norm(kA)^2 + vB*kB'/norm(kB)^2+ vC*kC'/norm(kC)^2 + vD*kD'/norm(kD)^2
pause

% test with four key-value pairs:  results are bad
Mx * kA
Mx * kB
Mx * kC
Mx * kD
pause

% keys are linearly independent: use pseudo-inverse to make the weight matrix
K = [kA kB kC kD]
V = [vA vB vC vD]

MM = V*pinv(K)
pause

% test the pseudo-inverse weight matrix: results are correct
MM * kA
MM * kB
MM * kC
MM * kD

echo off
