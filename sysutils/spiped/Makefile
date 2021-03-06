# $FreeBSD$

PORTNAME=	spiped
PORTVERSION=	1.6.0
PORTREVISION=	4
CATEGORIES=	sysutils security
MASTER_SITES=	http://www.tarsnap.com/spiped/

MAINTAINER=	cperciva@tarsnap.com
COMMENT=	Daemon for creating secure symmetric pipes

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

# The spiped build only needs C99, but asking for compiler:c11 will help to
# get us a compiler which has support for AESNI on x86 systems
USES=		compiler:c11 tar:tgz ssl

# Install into ${STAGEDIR}${PREFIX}
MAKE_ARGS+=	BINDIR=${STAGEDIR}${PREFIX}/bin
MAKE_ARGS+=	MAN1DIR=${STAGEDIR}${PREFIX}/man/man1

# Force __BSD_VISIBLE on since it works and improves performance;
# add -I and -L directories for OpenSSL
MAKE_ARGS+=	CFLAGS="-O2 -D__BSD_VISIBLE -I${OPENSSLINC}"
MAKE_ARGS+=	LDADD_EXTRA="-L${OPENSSLLIB}"

PORTDOCS=	BUILDING CHANGELOG COPYRIGHT README.md STYLE
PLIST_FILES=	bin/spipe \
		bin/spiped \
		man/man1/spipe.1.gz \
		man/man1/spiped.1.gz

USE_RC_SUBR=	spiped

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
