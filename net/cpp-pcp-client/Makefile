PORTNAME=	cpp-pcp-client
PORTVERSION=	1.7.7
PORTREVISION=	8
CATEGORIES=	net

MAINTAINER=	puppet@FreeBSD.org
COMMENT=	Client libraries for the PCP protocol
WWW=		https://github.com/puppetlabs/cpp-pcp-client

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN=		fails to build with Boost>=1.87
DEPRECATED=	Project got archived, broken
EXPIRATION_DATE=2025-05-08

LIB_DEPENDS=	libboost_filesystem.so:devel/boost-libs \
		libleatherman_json_container.so:devel/leatherman

USES=		cmake compiler:c++11-lang ssl
USE_GITHUB=	yes
USE_LDCONFIG=	yes

GH_ACCOUNT=	puppetlabs

CMAKE_OFF=	ENABLE_CXX_WERROR
PLIST_SUB+=	PORTVERSION=${PORTVERSION}

.include <bsd.port.mk>
