# $FreeBSD$

PORTNAME=	rails-i18n
PORTVERSION=	5.1.2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	Common locale data and translations for Rails i18n

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE.txt

DEPRECATED=	Use devel/rubygem-rails-i18n-rails5 instead
EXPIRATION_DATE=2019-08-31

RUN_DEPENDS=	rubygem-i18n>=0.7:devel/rubygem-i18n \
		rubygem-railties5>=5.0:www/rubygem-railties5

USES=		gem
USE_RUBY=	yes

NO_ARCH=	yes

.include <bsd.port.mk>
