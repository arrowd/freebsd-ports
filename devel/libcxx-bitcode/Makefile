# $FreeBSD$

PORTNAME=	libcxx-bitcode
DISTVERSION=	8.0.1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/llvm/llvm-project/releases/download/llvmorg-${DISTVERSION}/
DISTNAME=	llvm-${DISTVERSION}.src
DISTFILES=	llvm-${DISTVERSION}.src${EXTRACT_SUFX} \
		libcxx-${DISTVERSION}.src${EXTRACT_SUFX}

MAINTAINER=	arrowd@FreeBSD.org
COMMENT=	libc++ library compiled to a single LLVM IR bitcode file

LICENSE=		LLVM
LICENSE_FILE_LLVM=	${LICENSE_DIR}/LICENSE.TXT

# TODO: review binutils dependency after PR 241437 is fixed
BUILD_DEPENDS=	binutils>=2:devel/binutils \
		llvm-ar${LLVM_SUFFIX}:devel/llvm${LLVM_SUFFIX} \
		gclang:devel/gllvm

USES=		cmake:noninja python:3.6+,build tar:xz

CMAKE_ARGS=	-DLLVM_ENABLE_PROJECTS=libcxx \
		-DLLVM_ENABLE_THREADS:BOOL=OFF \
		-DLIBCXX_ENABLE_THREADS:BOOL=OFF \
		-DLIBCXX_ENABLE_SHARED:BOOL=ON

CC=		${LOCALBASE}/bin/gclang
CXX=		${LOCALBASE}/bin/gclang++

MAKE_ENV=	LLVM_CC_NAME=clang${LLVM_SUFFIX} \
		LLVM_CXX_NAME=clang++${LLVM_SUFFIX} \
		GLLVM_OBJCOPY=${LOCALBASE}/bin/objcopy
CONFIGURE_ENV=	${MAKE_ENV}

ALL_TARGET=	cxx

# LLVM version is determined by security/klee one
LLVM_RELEASE=	${DISTVERSION:C/rc.*//}
LLVM_MAJOR=	${LLVM_RELEASE:C/\.[0-9]\.[0-9]$//}
LLVM_SUFFIX=	${LLVM_RELEASE:C/\.[0-9]$//:C/\.//}

post-extract:
	${LN} -s ${WRKDIR}/libcxx-${DISTVERSION}.src ${WRKDIR}/libcxx

post-patch:
	cd ${WRKDIR}/libcxx && ${PATCH} < ${PATCHDIR}/gets-fix

post-build:
	${LOCALBASE}/bin/get-bc -a llvm-ar${LLVM_SUFFIX} -l llvm-link${LLVM_SUFFIX} -r ${LOCALBASE}/bin/ar ${WRKDIR}/.build/lib/libc++.a

do-install:
	${INSTALL_DATA} ${WRKDIR}/.build/lib/libc++.bca ${STAGEDIR}${PREFIX}/lib
	${MAKE} -C ${WRKDIR}/.build DESTDIR=${STAGEDIR} install-libcxx-headers
	${MKDIR} ${STAGEDIR}${PREFIX}/include/${PORTNAME}
	${MV} ${STAGEDIR}${PREFIX}/include/c++ ${STAGEDIR}${PREFIX}/include/${PORTNAME}
	${RM} -r ${STAGEDIR}${PREFIX}/include/include

.include <bsd.port.mk>
