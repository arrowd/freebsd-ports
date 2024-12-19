PORTNAME=	libblkid
PORTVERSION=	1.1.0
CATEGORIES=	filesystems

MAINTAINER=	kekek2@ya.ru
COMMENT=	Library generates and parses 128-bit Universally Unique IDs (UUIDs)
WWW=		https://git.kernel.org/cgit/utils/util-linux/util-linux.git

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/Documentation/licenses/COPYING.BSD-3-Clause

USES=		bison meson pkgconfig tar:xz

USE_GITHUB=	yes
GH_ACCOUNT=	util-linux
GH_PROJECT=	util-linux
GH_TAGNAME=	e78bcb49ae9fba2f4d17a69e8a7b59d27c59a320

USE_LDCONFIG=	yes
OPTIONS_SUB=	yes
# disable all Meson features because the project has gazillion of them and we only need one
MESON_ARGS=	--auto-features=disabled -Dbuild-libblkid=enabled -Dprogram-tests=false \
		-Db_lundef=false

OPTIONS_DEFINE=		MANPAGES
MANPAGES_BUILD_DEPENDS=	asciidoctor:textproc/rubygem-asciidoctor

UTIL_LINUX_VERSION=	2.40.2

.include <bsd.port.mk>
