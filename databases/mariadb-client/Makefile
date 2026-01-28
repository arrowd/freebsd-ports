PORTNAME=	mariadb
PKGNAMESUFFIX=	-client

COMMENT=	Multithreaded SQL database (client)

_MARIADB_LATEST=	118
MASTERDIR=	${.CURDIR}/../${PORTNAME}${_MARIADB_LATEST}-server

USE_LDCONFIG=	${PREFIX}/lib/mysql

ETCDIR=		${PREFIX}/etc/mysql

PLIST=		${.CURDIR}/pkg-plist

.include "${MASTERDIR}/Makefile"
