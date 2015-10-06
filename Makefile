FLAGS       := -I/home/denplusplus/Temp/CUDA/NVIDIA_CUDA-6.5_Samples/common/inc --generate-code arch=compute_11,code=sm_11

all : chol

chol_gold.o : chol_gold.cpp chol.h
	g++ -c -O3 chol_gold.cpp -o chol_gold.o

chol.o : chol.cu chol_kernel.cu chol.h
	nvcc -c -O3 chol.cu -o chol.o $(FLAGS)

chol : chol.o chol_gold.o
	nvcc -g -O3 chol.o chol_gold.o -o chol

clean:
	rm chol *.o
