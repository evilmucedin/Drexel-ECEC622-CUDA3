FLAGS       := -I/home/denplusplus/Temp/CUDA/NVIDIA_CUDA-6.5_Samples/common/inc

all : chol

chol_gold.o : chol_gold.cpp
	g++ -c -O3 chol_gold.cpp -o chol_gold.o

chol.o : chol.cu
	nvcc -c -O3 chol.cu -o chol.o $(FLAGS)

chol : chol.o chol_gold.o
	nvcc -g chol.o chol_gold.o -o chol
