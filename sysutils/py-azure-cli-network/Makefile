# $FreeBSD$

PORTNAME=	azure-cli-network
PORTVERSION=	2.5.2
CATEGORIES=	sysutils python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	dbaio@FreeBSD.org
COMMENT=	Microsoft Azure Command-Line Tools Network Command Module

LICENSE=	MIT

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}azure-mgmt-network>=3.0.0:devel/py-azure-mgmt-network@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}azure-mgmt-trafficmanager>=0.51.0:devel/py-azure-mgmt-trafficmanager@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}azure-mgmt-dns>=2.1.0:devel/py-azure-mgmt-dns@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}azure-cli-core>=0:sysutils/py-azure-cli-core@${PY_FLAVOR}

USES=		azurepy python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
