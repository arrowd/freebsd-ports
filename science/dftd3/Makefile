PORTNAME=	dftd3
DISTVERSIONPREFIX=	v
DISTVERSION=	3.2.0-3
PORTREVISION=	1
DISTVERSIONSUFFIX=	-g8e5463e
CATEGORIES=	science # quantum-chemistry

MAINTAINER=	yuri@FreeBSD.org
COMMENT=	S. Grimme's dispersion correction for DFT, Hartree-Fock methods
WWW=		https://www.chemie.uni-bonn.de/pctc/mulliken-center/software/dft-d3

LICENSE=	GPLv1+
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake fortran

USE_GITHUB=	yes
GH_ACCOUNT=	loriab

PLIST_FILES=	bin/dftd3

.include <bsd.port.pre.mk>

.if ${FORTRAN_DEFAULT} == flang
# https://github.com/llvm/llvm-project/issues/158438
BROKEN=	dftd3.f:268:14: error: No explicit type declared for 'iargc'
.endif

.include <bsd.port.post.mk>
