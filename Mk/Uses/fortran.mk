# Fortran support
#
# Feature:	fortran
# Usage:	USES=fortran
# Valid ARGS:	gfortran, quadmath
#
# MAINTAINER:	fortran@FreeBSD.org

.if !defined(_INCLUDE_USES_FORTRAN_MK)
_INCLUDE_USES_FORTRAN_MK=	yes

.  if empty(fortran_ARGS)
fortran_ARGS=	${FORTRAN_DEFAULT}
.  endif

# quadmath is provided by libquadmath, which is a part of gccXX
.  if ${fortran_ARGS} == quadmath
fortran_ARGS:=	${fortran_ARGS:S/quadmath/gfortran/}
.  endif

.  if ${fortran_ARGS} == gfortran
.    if empty(USE_GCC)
_GCC_VER=	${GCC_DEFAULT:S/.//}
.    else
_GCC_VER=	${_USE_GCC}
.    endif
BUILD_DEPENDS+=	gfortran${_GCC_VER}:lang/gcc${_GCC_VER}
RUN_DEPENDS+=	gfortran${_GCC_VER}:lang/gcc${_GCC_VER}
F77=		gfortran${_GCC_VER}
F90=		gfortran${_GCC_VER}
FC=		gfortran${_GCC_VER}
FFLAGS+=	-Wl,-rpath=${LOCALBASE}/lib/gcc${_GCC_VER}
F90FLAGS+=	-Wl,-rpath=${LOCALBASE}/lib/gcc${_GCC_VER}
FCFLAGS+=	-Wl,-rpath=${LOCALBASE}/lib/gcc${_GCC_VER}
LDFLAGS+=	-Wl,-rpath=${LOCALBASE}/lib/gcc${_GCC_VER} \
		-L${LOCALBASE}/lib/gcc${_GCC_VER}
CFLAGS_F2018=	-I${LOCALBASE}/include/gcc${_GCC_VER}
# Only needed on riscv64? See PR 287211
.    if ${ARCH} == "riscv64"
FCFLAGS+=  -B${LOCALBASE}/lib/gcc${_GCC_VER}
.    endif

USE_BINUTILS=	yes
.  elif ${fortran_ARGS} == flang
_FORTRAN_LLVM_VER=	21
BUILD_DEPENDS+=	flang${_FORTRAN_LLVM_VER}:devel/llvm${_FORTRAN_LLVM_VER}
RUN_DEPENDS+=	flang${_FORTRAN_LLVM_VER}:devel/llvm${_FORTRAN_LLVM_VER}
F77=		flang${_FORTRAN_LLVM_VER}
F90=		flang${_FORTRAN_LLVM_VER}
FC=		flang${_FORTRAN_LLVM_VER}
CC=		${LOCALBASE}/llvm${_FORTRAN_LLVM_VER}/bin/clang
CXX=		${LOCALBASE}/llvm${_FORTRAN_LLVM_VER}/bin/clang++
CPP=		${LOCALBASE}/llvm${_FORTRAN_LLVM_VER}/bin/clang-cpp
.  else
IGNORE=		USES=fortran: invalid arguments: ${fortran_ARGS}
.  endif

CONFIGURE_ENV+=	F77="${F77}" F90="${FC}" FC="${FC}"	\
		FFLAGS="${FFLAGS}" F90FLAGS="${FFLAGS}" FCFLAGS="${FCFLAGS}"
MAKE_ENV+=	F77="${F77}" F90="${FC}" FC="${FC}"	\
		FFLAGS="${FFLAGS}" F90FLAGS="${FFLAGS}" FCFLAGS="${FCFLAGS}"

.endif
