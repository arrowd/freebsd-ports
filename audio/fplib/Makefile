# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	fplib
PORTVERSION=	20121001
PORTREVISION=	4
CATEGORIES=	audio

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Last.fm fingerprint library

LICENSE=	GPLv3+

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libfftw3.so:math/fftw3 \
		libfftw3f.so:math/fftw3-float \
		libmad.so:audio/libmad \
		libsamplerate.so:audio/libsamplerate \
		libtag.so:audio/taglib

USES=		cmake compiler:c++11-lang localbase:ldflags

MAKE_JOBS_UNSAFE=	yes
USE_LDCONFIG=	yes

GH_ACCOUNT=	lastfm
GH_PROJECT=	Fingerprinter
GH_TAGNAME=	b728727
USE_GITHUB=	yes

.include <bsd.port.mk>
