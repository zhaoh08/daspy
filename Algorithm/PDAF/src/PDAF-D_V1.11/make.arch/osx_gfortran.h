######################################################
# Include file with machine-specific definitions     #
# for building PDAF.                                 #
#                                                    #
# Variant for MacOS X with gfortran                  #
# without MPI.                                       #
#                                                    #
# In the case of compilation without MPI, a dummy    #
# implementation of MPI, like provided in the        #
# directory nullmpi/ has to be linked when building  #
# an executable.                                     #
######################################################
# $Id: osx_gfortran.h 1542 2014-12-20 15:10:44Z lnerger $


# Compiler, Linker, and Archiver
FC = gfortran
LD = $(FC)
AR = ar
RANLIB = ranlib

# C preprocessor
# (only required, if preprocessing is not performed via the compiler)
CPP = /sw/bin/cpp-4

# Definitions for CPP
# Define USE_PDAF to include PDAF
# Define PDAF_NO_UPDATE to deactivate the analysis step of the filter
# (if the compiler does not support get_command_argument()
# from Fortran 2003 you should define F77 here.)
CPP_DEFS = -DUSE_PDAF

# Optimization specs for compiler
# To use OpenMP parallelization in PDAF, specify it here (-fopenmp (gfortran) or -openmp (ifort))
#   (You should explicitly define double precision for floating point
#   variables in the compilation)  
OPT = -O3 -fdefault-real-8 -Warray-temporaries 

# Optimization specifications for Linker
OPT_LNK = $(OPT)

# Linking libraries (BLAS, LAPACK, if required: MPI)
LINK_LIBS =-L/usr/lib -llapack  -lblas   -lm

# Specifications for the archiver
AR_SPEC = 

# Specifications for ranlib
RAN_SPEC =

# Include path for MPI header file
MPI_INC =  -Idummympi

# Object for nullMPI - if compiled without MPI library
OBJ_MPI = nullmpi.o

# NetCDF (only required for Lorenz96)
NC_LIB   = -L/sw/lib -lnetcdff -lnetcdf
NC_INC   = -I/sw/include
