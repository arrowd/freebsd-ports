# $FreeBSD$

PORTNAME=	gobject-introspection
PORTVERSION=	3.3.7
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Ruby binding for GObjectIntrospection

LICENSE=	LGPL21+

BROKEN_sparc64=	does not build: fails to compile rb-gi-function-info.c

BUILD_DEPENDS=	rubygem-pkg-config>=0:devel/rubygem-pkg-config
RUN_DEPENDS=	rubygem-glib2>=${PORTVERSION}:devel/rubygem-glib2

USES=		gem gnome
USE_GNOME=	introspection
USE_RUBY=	yes

.include <bsd.port.mk>
