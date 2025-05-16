PORTNAME=	libinotify
PORTVERSION=	20240724
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libinotify-kqueue/libinotify-kqueue/releases/download/${PORTVERSION}/

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Kevent based inotify compatible library
WWW=		https://github.com/libinotify-kqueue/libinotify-kqueue

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		libtool

CONFIGURE_ARGS=	--enable-skip-subfiles=fusefs,smbfs \
		--enable-debug \
		--enable-perrors
GNU_CONFIGURE=	yes
#INSTALL_TARGET=	install-strip
TEST_TARGET=	test
USE_LDCONFIG=	yes

WITH_DEBUG=	yes
CFLAGS=		-DWITH_NATIVE_INOTIFY
CPPFLAGS=	-DWITH_NATIVE_INOTIFY

.include <bsd.port.mk>
