# Created by: Mark Pulford <mark@kyne.com.au>
# $FreeBSD$

PORTNAME=	dadadodo
PORTVERSION=	1.04
CATEGORIES=	textproc
MASTER_SITES=	https://www.jwz.org/dadadodo/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Text processor which analyses text and generates random sentences

PLIST_FILES=	bin/dadadodo

pre-patch:
	${REINPLACE_CMD} -E "s/^(CC|CFLAGS).+//" ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/dadadodo ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
