#!/bin/bash
#SBATCH -J vasp
#SBATCH -N 1
#SBATCH --ntasks-per-node=32
#SBATCH -p kshcnormal

module purge
source /public/home/sz_lw/apprepo/vasp/5.4.4-ioptcell_intelmpi2017_hdf5_libxc/scripts/env.sh

export MKL_DEBUG_CPU_TYPE=5 #加速代码
export MKL_CBWR=AVX2 #使cpu默认支持avx2
export I_MPI_PIN_DOMAIN=numa #内存位置与cpu位置绑定，加速内存读取。对于内存带宽要求高的计算提速明显

srun --mpi=pmi2 vasp_std
