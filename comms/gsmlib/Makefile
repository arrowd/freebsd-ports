# Created by: ijliao
# $FreeBSD$

PORTNAME=	gsmlib
PORTVERSION=	1.10
PORTREVISION=	8
CATEGORIES=	comms
MASTER_SITES=	DEBIAN
#TODO: examine the Debian patches, and changes in the Mandrake
#gsmlib-1.11-0.2mdv2007.0.src.rpm, for use in this port
DISTFILES=	gsmlib_1.10.orig.tar.gz

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Library to access GSM mobile phones through GSM modems

LICENSE=	LGPL20
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN=		unfetchable

USES=		gmake libtool
USE_CXXSTD=	c++98
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

CPPFLAGS+=	-DBROKEN_STRFTIME -DHAVE_DECL_GETOPT
LDFLAGS+=	-lpthread

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext localbase:ldflags
NLS_CONFIGURE_ENABLE=	nls

post-patch:
	@${GREP} -lR "<malloc.h>" ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} -e \
		's|<malloc\.h>|<stdlib.h>|g'

.include <bsd.port.mk>
