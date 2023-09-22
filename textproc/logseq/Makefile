PORTNAME=	logseq
PORTVERSION=	0.9.18
CATEGORIES=	textproc
MASTER_SITES=	https://github.com/logseq/logseq/releases/download/${PORTVERSION}/
DISTNAME=	Logseq-linux-x64-${PORTVERSION}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	arrowd@FreeBSD.org
COMMENT=	Open-source platform for knowledge management and collaboration
WWW=		https://logseq.com

LICENSE=	AGPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		desktop-file-utils electronfix:24 gettext-runtime gl gnome \
		iconv jpeg xorg zip

USE_GL=		gbm gl glesv2
USE_GNOME=	cairo gdkpixbuf2 glib20 gtk30 libxml2 libxslt
USE_XORG=	x11 xcb xcomposite xcursor xdamage xext xfixes xi xrandr \
		xrender xscrnsaver xtst

ELECTRONFIX_MAIN_EXECUTABLE=	Logseq
SUB_FILES=	Logseq
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/Logseq-linux-x64
STRIP=

do-install:
	cd ${WRKSRC} && ${COPYTREE_SHARE} \* ${STAGEDIR}${DATADIR}
	${INSTALL_PROGRAM} ${WRKDIR}/Logseq ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${PATCHDIR}/Logseq.desktop ${STAGEDIR}${DESKTOPDIR}/Logseq.desktop
	${INSTALL_DATA} ${WRKSRC}/resources/app/icon.png ${STAGEDIR}${PREFIX}/share/pixmaps/Logseq.png
	${FIND} ${STAGEDIR}${DATADIR} -type d -empty -delete

.include <bsd.port.mk>
