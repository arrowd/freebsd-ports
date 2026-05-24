PORTNAME=	lib-provides-ldconfig-test
PORTVERSION=	1
CATEGORIES=	misc
DISTFILES=

LICENSE=	BSD3CLAUSE

NO_EXTRACT=	yes
NO_BUILD=	yes
DESCR=		/etc/hosts
WITH_TESTING=	yes

USE_LDCONFIG=	${PREFIX}/lib/s \
		${PREFIX}/lib/u \
		${PREFIX}/lib/z

OPTIONS_DEFINE=	USB ZFS

OPTIONS_SUB=	yes

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/b
	${INSTALL_LIB} /usr/lib/libbsm.so ${STAGEDIR}${PREFIX}/lib/b
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/s
	${INSTALL_LIB} /usr/lib/libsys.so ${STAGEDIR}${PREFIX}/lib/s

post-install-USB-on:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/u
	${INSTALL_LIB} /usr/lib/libusb.so ${STAGEDIR}${PREFIX}/lib/u

post-install-ZFS-on:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/z
	${INSTALL_LIB} /usr/lib/libzfs.so ${STAGEDIR}${PREFIX}/lib/z

do-test:
	${MAKE} -C ${.CURDIR} lib-provides-list > ${WRKDIR}/actual_output
	${DIFF} -uB ${WRKDIR}/actual_output ${.CURDIR}/expected_output

.include <bsd.port.mk>
