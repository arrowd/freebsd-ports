PORTNAME=	kcoreaddons
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

COMMENT=	Qt addon library with a collection of non-GUI utilities
MAINTAINER=	kde@FreeBSD.org

USES=		cmake kde:6 qt:6 shared-mime-info tar:xz
USE_KDE=	ecm:build
USE_QT=		base declarative tools

# Requires PySide and Shiboken.
CMAKE_ON=	CMAKE_DISABLE_FIND_PACKAGE_INOTIFY BUILD_TESTING
CMAKE_OFF=	BUILD_PYTHON_BINDINGS

ALL_TARGET=	kdirwatch_inotify_benchmarktest
TEST_TARGET=	test

.include <bsd.port.mk>
