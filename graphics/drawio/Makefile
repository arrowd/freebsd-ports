PORTNAME=	drawio
PORTVERSION=	22.0.3
DISTVERSIONPREFIX=	x86_64-
CATEGORIES=	graphics
MASTER_SITES=	https://github.com/jgraph/drawio-desktop/releases/download/v${PORTVERSION}/
EXTRACT_SUFX=	.rpm

MAINTAINER=	636808@mail.ru
COMMENT=	Diagramming and whiteboarding desktop app
WWW=		https://drawio.com/

LICENSE=	APACHE20

USES=		desktop-file-utils electronfix:25 gettext-runtime gl gnome \
			iconv jpeg xorg

USE_GL=		gbm gl glesv2
USE_GNOME=	cairo gdkpixbuf2 glib20 gtk30 libxml2 libxslt
USE_XORG=	x11 xcb xcomposite xcursor xdamage xext xfixes xi xrandr \
			xrender xscrnsaver xtst

ELECTRONFIX_MAIN_EXECUTABLE=	drawio
SUB_FILES=	drawio
NO_WRKSUBDIR=	yes
NO_BUILD=	yes
STRIP=

do-install:
	cd ${WRKSRC}/opt/ && ${COPYTREE_SHARE} ${PORTNAME} ${STAGEDIR}${PREFIX}/share
	cd ${WRKSRC}/usr && ${COPYTREE_SHARE} share ${STAGEDIR}${PREFIX}
	${INSTALL_PROGRAM} ${WRKDIR}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${FIND} ${STAGEDIR}${PREFIX} -name '*.orig' -delete

.include <bsd.port.mk>
