# Created by: Kris Moore <kmoore@FreeBSD.org>
# $FreeBSD$

PORTNAME=	pcbsd-utils-qt5
PORTVERSION=	1444236547
PORTREVISION=	11
CATEGORIES=	sysutils

MAINTAINER=	kmoore@FreeBSD.org
COMMENT=	PC-BSD Qt5 Utilities

LICENSE=	BSD3CLAUSE

BROKEN_FreeBSD_12=	fails to compile: netif.cpp: error: use of undeclared identifier 'IFM_FDDI'
BROKEN_FreeBSD_13=	fails to compile: netif.cpp: error: use of undeclared identifier 'IFM_FDDI'

BUILD_DEPENDS=	sphinx-build:textproc/py-sphinx \
		${PYTHON_PKGNAMEPREFIX}sphinx-intl>=0:textproc/py-sphinx-intl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-httpdomain>=0:textproc/py-sphinxcontrib-httpdomain@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx_rtd_theme>=0:textproc/py-sphinx_rtd_theme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}alabaster>=0:textproc/py-alabaster@${PY_FLAVOR} \
		tex-formats>=0:print/tex-formats \
		tex-dvipsk>=0:print/tex-dvipsk
RUN_DEPENDS=	pc-updatemanager:sysutils/pcbsd-utils \
		${PYTHON_PKGNAMEPREFIX}dbus>=0:devel/py-dbus@${PY_FLAVOR} \
		cdda2wav:sysutils/cdrtools
LIB_DEPENDS=	libcurl.so:ftp/curl \
		libpoppler-qt5.so:graphics/poppler-qt5

MAKE_JOBS_UNSAFE=yes
ONLY_FOR_ARCHS=	amd64
USE_LDCONFIG=	yes
USE_QT=		core gui network svg linguist \
		webkit buildtools x11extras
USES=		desktop-file-utils python qmake qt:5 shebangfix
SHEBANG_FILES=	pc-netmanager/src/NetworkManager/resources/umts_stick \
		pc-sysmanager/scripts/fastest_cvsup

WRKSRC_SUBDIR=	src-qt5

QMAKE_ARGS=	CONFIG+="configure"

USE_GITHUB=	yes
GH_ACCOUNT=	pcbsd
GH_PROJECT=	pcbsd
GH_TAGNAME=	3c4d2b

post-install:
	@${FIND} ${STAGEDIR}${PREFIX}/share/pcbsd/doc/html -type f | \
		${SED} "s,^${STAGEDIR}${PREFIX}/,," >> ${TMPPLIST}

.include <bsd.port.mk>
