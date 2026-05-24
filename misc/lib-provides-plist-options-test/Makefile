PORTNAME=	lib-provides-plist-options-test
PORTVERSION=	1
CATEGORIES=	misc
DISTFILES=

LICENSE=	BSD3CLAUSE

NO_EXTRACT=	yes
NO_BUILD=	yes
DESCR=		/etc/hosts

OPTIONS_DEFINE=	USB ZFS

OPTIONS_SUB=	yes

do-install:
	${INSTALL_LIB} /usr/lib/libsys.so ${STAGEDIR}${PREFIX}/lib

post-install-USB-on:
	${INSTALL_LIB} /usr/lib/libusb.so ${STAGEDIR}${PREFIX}/lib

post-install-ZFS-on:
	${INSTALL_LIB} /usr/lib/libzfs.so ${STAGEDIR}${PREFIX}/lib

.include <bsd.port.mk>
