PORTNAME=	libdep
PORTVERSION=	2
CATEGORIES=	misc
DISTFILES=

PLIST_FILES=	lib/libdep.so \
		lib/libdep.so.2

DESCR=		Makefile

do-build:
	${CC} -Wall -Werror -fPIC -shared -o ${WRKDIR}/libdep.so.2 -Wl,-soname,libdep.so.2 ${.CURDIR}/lib.c

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/libdep.so.2 ${STAGEDIR}${PREFIX}/lib/
	${LN} -s libdep.so.2 ${STAGEDIR}${PREFIX}/lib/libdep.so

.include <bsd.port.mk>
