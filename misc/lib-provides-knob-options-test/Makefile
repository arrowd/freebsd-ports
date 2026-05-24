PORTNAME=	lib-provides-knob-options-test
PORTVERSION=	1
CATEGORIES=	misc
DISTFILES=

LICENSE=	BSD3CLAUSE

NO_EXTRACT=	yes
NO_BUILD=	yes
DESCR=		/etc/hosts
WITH_TESTING=	yes

PLIST_FILES=	lib/libsys.so

OPTIONS_DEFINE=	USB ZFS

USB_PLIST_FILES=lib/libusb.so
ZFS_PLIST_FILES=lib/libzfs.so

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
