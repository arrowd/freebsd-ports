# $FreeBSD$

PORTNAME=	libc-bitcode
DISTVERSION=	8.0.1
CATEGORIES=	devel
DISTFILES=

MAINTAINER=	arrowd@FreeBSD.org
COMMENT=	FreeBSD libc library compiled to a single LLVM IR bitcode file

LICENSE=	BSD2CLAUSE

# TODO: review binutils dependency after PR 241437 is fixed
BUILD_DEPENDS=	binutils>=2:devel/binutils \
		llvm-ar${LLVM_SUFFIX}:devel/llvm${LLVM_SUFFIX} \
		gclang:devel/gllvm

CC=		${LOCALBASE}/bin/gclang
CXX=		${LOCALBASE}/bin/gclang++

MAKE_ENV=	LLVM_CC_NAME=clang${LLVM_SUFFIX} \
		LLVM_CXX_NAME=clang++${LLVM_SUFFIX} \
		GLLVM_OBJCOPY=${LOCALBASE}/bin/objcopy \
		MAKEOBJDIRPREFIX=${WRKDIR}

# LLVM version is determined by security/klee one
LLVM_RELEASE=	${DISTVERSION:C/rc.*//}
LLVM_MAJOR=	${LLVM_RELEASE:C/\.[0-9]\.[0-9]$//}
LLVM_SUFFIX=	${LLVM_RELEASE:C/\.[0-9]$//:C/\.//}

PLIST_FILES=	lib/klee-libc.bca \
		lib/libc.bca

.include <bsd.port.pre.mk>

.if !exists(${SRC_BASE}/Makefile)
IGNORE=	requires FreeBSD source files in ${SRC_BASE}
.endif

do-fetch:
	${DO_NADA}

do-build:
	cd ${SRC_BASE}/lib/libnetbsd && ${SETENV} -i ${MAKE_ENV} ${MAKE} -j${MAKE_JOBS_NUMBER}
	cd ${SRC_BASE}/lib/libc && ${SETENV} -i ${MAKE_ENV} ${MAKE} -j${MAKE_JOBS_NUMBER}

post-build:
	${LOCALBASE}/bin/get-bc -a llvm-ar${LLVM_SUFFIX} -l llvm-link${LLVM_SUFFIX} -r ${LOCALBASE}/bin/ar ${WRKDIR}/usr/src/amd64.amd64/lib/libc/libc.a
	${CP} ${WRKDIR}/usr/src/amd64.amd64/lib/libc/libc.bca ${WRKDIR}/usr/src/amd64.amd64/lib/libc/klee-libc.bca
	${LOCALBASE}/bin/ar d ${WRKDIR}/usr/src/amd64.amd64/lib/libc/klee-libc.bca .stat.o.bc

do-install:
	${INSTALL_DATA} ${WRKDIR}/usr/src/amd64.amd64/lib/libc/libc.bca ${STAGEDIR}${PREFIX}/lib
	${INSTALL_DATA} ${WRKDIR}/usr/src/amd64.amd64/lib/libc/klee-libc.bca ${STAGEDIR}${PREFIX}/lib

.include <bsd.port.post.mk>
