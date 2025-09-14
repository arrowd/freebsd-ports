PORTNAME=	getdp
PORTVERSION=	3.6.0
PORTREVISION=	1
CATEGORIES=	science
MASTER_SITES=	http://www.geuz.org/getdp/src/
DISTNAME=	${PORTNAME}-${PORTVERSION}-source

MAINTAINER=	stephen@FreeBSD.org
COMMENT=	Rather general finite element solver using mixed finite elements
WWW=		https://www.geuz.org/getdp/

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

LIB_DEPENDS=	libgsl.so:math/gsl	\
		liblapack.so:math/lapack

USES=		fortran tar:tgz cmake

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.port.pre.mk>

.if ${FORTRAN_DEFAULT} == gfortran && ${GCC_DEFAULT} >= 10
# workaround for Rank mismatch in argument 'lines' at (1) (rank-1 and scalar)
FFLAGS+=	-fallow-argument-mismatch
.endif

.if ${FORTRAN_DEFAULT} == flang
BROKEN=	contrib/pewe/fortran/cylindrical_walloutabc2.f90:73:29: error: No explicit type declared for 'besjn'
.endif

do-test:
	cd ${WRKSRC}/demos && yes "" | ${STAGEDIR}${PREFIX}/bin/${PORTNAME} magnet.pro -solve MagSta_phi

.include <bsd.port.post.mk>
