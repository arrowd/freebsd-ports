PORTNAME=	pyjwt1
PORTVERSION=	1.7.1
PORTREVISION=	1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyJWT-${PORTVERSION}

MAINTAINER=	terje@elde.net
COMMENT=	JSON Web Token implementation in Python
WWW=		https://github.com/progrium/pyjwt

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

# Some tests are skipped without pycrypto, but its not
# referenced as a requirement anymore.
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pycryptodome>=0:security/py-pycryptodome@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent cryptography_test distutils

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}-pyjwt

OPTIONS_DEFINE=	RSASSA

RSASSA_DESC=		RSASSA-PKCS1 v1.5 signature support
RSASSA_USE=		PYTHON=cryptography

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -v -rs -o addopts=

.include <bsd.port.mk>
