PORTNAME=	libdep
PORTVERSION=	2
CATEGORIES=	misc
DISTFILES=

PLIST_FILES=	lib/libdep.so \
		lib/libdep.so.1 \
		share/foo

DESCR=		Makefile

do-build:
	${CC} -Wall -Werror -fPIC -shared -o ${WRKDIR}/libdep.so.1 -Wl,-soname,libdep.so.1 ${.CURDIR}/lib.c

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/libdep.so.1 ${STAGEDIR}${PREFIX}/lib/
	${LN} -s libdep.so.1 ${STAGEDIR}${PREFIX}/lib/libdep.so
	${TOUCH} ${STAGEDIR}${PREFIX}/share/foo

.include <bsd.port.mk>
