PORTNAME=	lib-provides-plist-and-knob-test
PORTVERSION=	1
CATEGORIES=	misc
DISTFILES=

LICENSE=	BSD3CLAUSE

NO_EXTRACT=	yes
NO_BUILD=	yes
DESCR=		/etc/hosts

PLIST_FILES=	lib/libsys.so

do-install:
	${INSTALL_LIB} /usr/lib/libsys.so ${STAGEDIR}${PREFIX}/lib
	${INSTALL_LIB} /usr/lib/libusb.so ${STAGEDIR}${PREFIX}/lib

.include <bsd.port.mk>

