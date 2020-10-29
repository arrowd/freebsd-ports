# $FreeBSD$

PORTNAME=	libcxx-bitcode
DISTVERSION=	8.0.1
CATEGORIES=	devel
DISTFILES=

MAINTAINER=	arrowd@FreeBSD.org
COMMENT=	libc++ library compiled to a single LLVM IR bitcode file

LICENSE=		LLVM
LICENSE_NAME=	LLVM
LICENSE_FILE1=	${SRC_BASE}/contrib/llvm-project/libcxx/LICENSE.TXT
LICENSE_FILE=	${SRC_BASE}/contrib/libc++/LICENSE.TXT
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

# TODO: review binutils dependency after PR 241437 is fixed
BUILD_DEPENDS=	binutils>=2:devel/binutils \
		llvm-ar${LLVM_SUFFIX}:devel/llvm${LLVM_SUFFIX} \
		gclang:devel/gllvm

CC=		${LOCALBASE}/bin/gclang
CXX=		${LOCALBASE}/bin/gclang++

MY_MAKE_ENV=	LLVM_CC_NAME=clang${LLVM_SUFFIX} \
		LLVM_CXX_NAME=clang++${LLVM_SUFFIX} \
		GLLVM_OBJCOPY=${LOCALBASE}/bin/objcopy \
		WLLVM_OUTPUT_LEVEL=DEBUG \
		WLLVM_OUTPUT_FILE=/tmp/gllvm.log \
		CC=${CC} \
		CXX=${CXX} \
		LD=${LD} \
		PATH=${PATH} \
		MAKEOBJDIRPREFIX=${WRKDIR}

# LLVM version is determined by security/klee one
LLVM_RELEASE=	${DISTVERSION:C/rc.*//}
LLVM_MAJOR=	${LLVM_RELEASE:C/\.[0-9]\.[0-9]$//}
LLVM_SUFFIX=	${LLVM_RELEASE:C/\.[0-9]$//:C/\.//}

.include <bsd.port.pre.mk>

.if !exists(${SRC_BASE}/Makefile)
IGNORE=	requires FreeBSD source files in ${SRC_BASE}
.endif

do-fetch:
	${DO_NADA}

do-build:
	cd ${SRC_BASE}/lib/libc++ && ${SETENV} -i ${MY_MAKE_ENV} ${MAKE}

post-build:
	${LOCALBASE}/bin/get-bc -a llvm-ar${LLVM_SUFFIX} -l llvm-link${LLVM_SUFFIX} -r ${LOCALBASE}/bin/ar ${WRKDIR}/usr/src/amd64.amd64/lib/libc++/libc++.so.1

do-install:
	${INSTALL_DATA} ${WRKDIR}/usr/src/amd64.amd64/lib/libc++/libc++.so.1.bca ${STAGEDIR}${PREFIX}/lib

.include <bsd.port.post.mk>
