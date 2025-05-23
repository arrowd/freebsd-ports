PORTNAME=	k3b
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	sysutils multimedia kde-applications

MAINTAINER=	kde@FreeBSD.org
COMMENT=	KDE CD/DVD writing suite
WWW=		https://www.k3b.org/

LIB_DEPENDS=	libFLAC.so:audio/flac \
		libKCddb6.so:audio/libkcddb \
		libcdda_paranoia.so:audio/cdparanoia \
		libdvdread.so:multimedia/libdvdread \
		libmad.so:audio/libmad \
		libmp3lame.so:audio/lame \
		libogg.so:audio/libogg \
		libsamplerate.so:audio/libsamplerate \
		libsndfile.so:audio/libsndfile \
		libtag.so:audio/taglib \
		libvorbis.so:audio/libvorbis
RUN_DEPENDS=	cdrecord:sysutils/cdrtools
BUILD_DEPENDS=	cdrecord:sysutils/cdrtools

USES=		cmake compiler:c++11-lang desktop-file-utils gettext iconv \
		kde:6 pkgconfig qt:6 shared-mime-info tar:xz xorg

USE_KDE=	archive attica auth bookmarks codecs colorscheme completion config \
		configwidgets coreaddons filemetadata i18n iconthemes \
		itemviews jobwidgets kcmutils kio newstuff notifications \
		notifyconfig service solid widgetsaddons windowsystem xmlgui \
		ecm:build
USE_QT=		base webengine
USE_XORG=	x11

# The ffmpeg-plugin needs patching
CMAKE_ARGS=	-DK3B_BUILD_FFMPEG_DECODER_PLUGIN:BOOL=FALSE

OPTIONS_DEFINE=		CDRDAO CDRSKIN DVDPLUSRW VCDIMAGER DOCS
OPTIONS_DEFAULT=	${OPTIONS_DEFINE}

CDRDAO_DESC=		Burning: cdrdao
CDRDAO_RUN_DEPENDS=	cdrdao:sysutils/cdrdao

DVDPLUSRW_DESC=		Burning: DVD+RW tools (DVD+/-R(W))
DVDPLUSRW_RUN_DEPENDS=	dvd+rw-format:sysutils/dvd+rw-tools

VCDIMAGER_DESC=		Burning: VCDImager (video CDs)
VCDIMAGER_RUN_DEPENDS=	vcdxrip:multimedia/vcdimager

CDRSKIN_DESC=		Burning: cdrskin (improved performance)
CDRSKIN_RUN_DEPENDS=	cdrskin:devel/libburn

.include <bsd.port.mk>
