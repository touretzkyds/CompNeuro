% matmem - matrix memory demo

global KBITS TLEN NUNITS NMEM Weights

TLEN = 3;  % number of letters in an input or output pattern
NMEM = 14;  % number of memories that can be toggled
DENSITY = 'd';  % 'd' for dense, 's' for sparse

make_codebook
init_graphics

clear_memory
