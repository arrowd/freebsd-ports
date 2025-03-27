PORTNAME=	type2-runtime
DISTVERSION=	g20250306
CATEGORIES=	devel
PKGNAMEPREFIX=	appimage-

MAINTAINER=	arrowd@FreeBSD.org
COMMENT=	Statically linked AppImage runtime part
WWW=		https://docs.appimage.org/introduction/software-overview.html\#ref-appimagekit

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

EXTRACT_DEPENDS=${NONEXISTENT}:filesystems/squashfuse:extract \
		${LOCALBASE}/include/squashfuse:filesystems/squashfuse
BUILD_DEPENDS=	ld.bfd:devel/binutils \
		${LOCALBASE}/lib/libzstd.a:archivers/zstd \
		${LOCALBASE}/lib/libfuse3.a:filesystems/fusefs-libs3 \
		${LOCALBASE}/lib/libsquashfuse_ll.a:filesystems/squashfuse \
		${LOCALBASE}/lib/libmimalloc.a:devel/mimalloc

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	AppImage
GH_TAGNAME=	2df896eb93b2c63664605cd531c19d09a4266894

DATADIR=	${PREFIX}/share/appimage-${PORTNAME}
PLIST_FILES=	${DATADIR}/runtime
BUILD_MAKE_ENV=	LOCALBASE=${LOCALBASE} \
		SQUASHFUSE_HEADERS_DIR=${SQUASHFUSE_HEADERS_DIR} \
		DEBUG_FLAGS="-O0 ${DEBUG_FLAGS}"

SQUASHFUSE_HEADERS_DIR=	${WRKDIR}/squashfuse_headers

post-extract:
	@${MKDIR} ${SQUASHFUSE_HEADERS_DIR}
	${CP} -r ${LOCALBASE}/include/squashfuse ${SQUASHFUSE_HEADERS_DIR}/squashfuse
	${CP} $$(${MAKE} -C ${PORTSDIR}/filesystems/squashfuse -V WRKSRC)/fuseprivate.h \
		${SQUASHFUSE_HEADERS_DIR}/squashfuse

do-build:
	cd ${WRKSRC}/src/runtime && \
		${GMAKE} ${BUILD_MAKE_ENV}

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_LIB} ${WRKSRC}/src/runtime/runtime ${STAGEDIR}${DATADIR}/runtime

.include <bsd.port.mk>
