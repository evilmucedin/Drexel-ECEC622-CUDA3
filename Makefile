FLAGS       := -O3 -I/home/denplusplus/Temp/CUDA/NVIDIA_CUDA-6.5_Samples/common/inc -I/home/denplusplus/Temp/OpenBLAS -L/home/denplusplus/Temp/OpenBLAS
NVFLAGS     := $(FLAGS) --generate-code arch=compute_11,code=sm_11

all : chol

chol_gold.o : chol_gold.cpp chol.h
	g++ -c chol_gold.cpp -o chol_gold.o $(FLAGS)

chol.o : chol.cu chol_kernel.cu chol.h
	nvcc -c chol.cu -o chol.o $(NVFLAGS)

chol : chol.o chol_gold.o
	nvcc -g chol.o chol_gold.o -o chol $(NVFLAGS) -l openblas

clean:
	rm chol *.o
