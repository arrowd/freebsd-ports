PORTNAME=	foo
PORTVERSION=	2
CATEGORIES=	misc
DISTFILES=

LICENSE=	BSD3CLAUSE

LIB_DEPENDS=	libdep.so:misc/libdep

USES=	localbase:ldflags

PLIST_FILES=	bin/foo1

DESCR=		Makefile

do-build:
	${CC} ${CFLAGS} ${LDFLAGS} -ldep -o ${WRKDIR}/foo1 ${.CURDIR}/foo.c

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/foo1 ${STAGEDIR}${PREFIX}/bin
	${TOUCH} ${STAGEDIR}${PREFIX}/share/foo

.include <bsd.port.mk>
