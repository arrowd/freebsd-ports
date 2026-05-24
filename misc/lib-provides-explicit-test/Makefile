PORTNAME=	lib-provides-explicit-test
PORTVERSION=	1
CATEGORIES=	misc
DISTFILES=

LICENSE=	BSD3CLAUSE

NO_EXTRACT=	yes
NO_BUILD=	yes
DESCR=		/etc/hosts
WITH_TESTING=	yes

OPTIONS_DEFINE=	USB ZFS

OPTIONS_SUB=	yes

LIB_PROVIDES=		lib/libsys.so
USB_LIB_PROVIDES=	lib/libusb.so
ZFS_LIB_PROVIDES=	lib/libzfs.so

do-install:
	${INSTALL_LIB} /usr/lib/libsys.so ${STAGEDIR}${PREFIX}/lib

post-install-USB-on:
	${INSTALL_LIB} /usr/lib/libusb.so ${STAGEDIR}${PREFIX}/lib

post-install-ZFS-on:
	${INSTALL_LIB} /usr/lib/libzfs.so ${STAGEDIR}${PREFIX}/lib

do-test:
	${MAKE} -C ${.CURDIR} lib-provides-list > ${WRKDIR}/actual_output
	${DIFF} -uB ${WRKDIR}/actual_output ${.CURDIR}/expected_output

.include <bsd.port.mk>
