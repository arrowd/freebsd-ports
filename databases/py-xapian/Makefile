# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	xapian
PORTVERSION=	1.4.12
DISTVERSIONPREFIX=	bindings-
CATEGORIES=	databases python
MASTER_SITES=	https://oligarchy.co.uk/xapian/${PORTVERSION}/ \
		LOCAL/sunpoet
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Python binding for Xapian

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN_aarch64=	fails to build: Fatal Python error: swig_pythreadstate set in XapianSWIG_Python_Thread_Allow ctor

BUILD_DEPENDS=	xapian-core>=${PORTVERSION}:databases/xapian-core
LIB_DEPENDS=	libxapian.so:databases/xapian-core

CONFLICTS_INSTALL=	xapian-bindings12

OPTIONS_DEFINE=	DOCS

PORTSCOUT=	limitw:1,even

USES=		compiler:c++11-lang libtool python tar:xz

CONFIGURE_ARGS=	--datarootdir=${DATADIR} \
		--docdir=${DOCSDIR} \
		--enable-shared \
		--enable-static \
		--without-csharp \
		--without-java \
		--without-lua \
		--without-perl \
		--without-php \
		--without-php7 \
		--without-ruby \
		--without-tcl
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_CXXSTD=	c++11
USE_PYTHON=	flavors

PORTDOCS=	*

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=1.4.8:textproc/py-sphinx@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} > 3000
CONFIGURE_ARGS+=--with-python3 \
		--without-python
CONFIGURE_ENV+=	PYTHON3=${PYTHON_CMD}
.else
CONFIGURE_ARGS+=--with-python \
		--without-python3
CONFIGURE_ENV+=	PYTHON2=${PYTHON_CMD}
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-lstdc++||g' ${WRKSRC}/configure

post-patch-DOCS-off:
	@${REINPLACE_CMD} -e 's| all-local||; s| install-data-local install-dist_exampledataDATA||' ${WRKSRC}/python/Makefile.in ${WRKSRC}/python3/Makefile.in

.include <bsd.port.post.mk>
