PORTNAME=	appimagetool
DISTVERSION=	g20250421
CATEGORIES=	sysutils devel

MAINTAINER=	arrowd@FreeBSD.org
COMMENT=	Low-level tool to generate an AppImage from an existing AppDir
WWW=		https://github.com/AppImage/appimagetool

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libargp.so:devel/argp-standalone \
		libcurl.so:ftp/curl \
		libgcrypt.so:security/libgcrypt \
		libgpgme.so:security/gpgme
RUN_DEPENDS=	appstreamcli:devel/appstream \
		ca_root_nss>0:security/ca_root_nss \
		mksquashfs:filesystems/squashfs-tools \
		zsyncmake:net/zsync \
		${LOCALBASE}/share/appimage-type2-runtime/runtime:devel/appimage-type2-runtime

USES=		cmake desktop-file-utils gnome pkgconfig

USE_GNOME=	glib20

USE_GITHUB=	yes
GH_ACCOUNT=	AppImage
GH_TAGNAME=	cb0115379a3c03ea9ec13cebf8afc4f27eb1cf6b

PLIST_FILES=	bin/appimagetool \
		share/applications/appimagetool.desktop \
		share/icons/hicolor/128x128/apps/appimagetool.png \
		share/metainfo/appimagetool.appdata.xml

.include <bsd.port.mk>
