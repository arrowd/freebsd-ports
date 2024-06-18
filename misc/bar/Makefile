PORTNAME=	bar
PORTVERSION=	1
CATEGORIES=	misc
DISTFILES=

LICENSE=	BSD3CLAUSE

LIB_DEPENDS=	libdep.so:misc/libdep

USES=	localbase:ldflags

PLIST_FILES=	bin/bar1

DESCR=		Makefile

do-build:
	${ECHO_CMD} fails with new libdep && ${FALSE}
	${CC} ${CFLAGS} ${LDFLAGS} -ldep -o ${WRKDIR}/bar1 ${.CURDIR}/bar.c

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/bar1 ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
