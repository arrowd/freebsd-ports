# $FreeBSD$

PORTNAME=	ocrmypdf
DISTVERSION=	9.0.1
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	kai@FreeBSD.org
COMMENT=	Adds an OCR test layer to scanned PDF files

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.9.1:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-runner>=0:devel/py-pytest-runner@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools_scm>=0:devel/py-setuptools_scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools_scm_git_archive>=0:devel/py-setuptools_scm_git_archive@${PY_FLAVOR}
LIB_DEPENDS=	liblept.so:graphics/leptonica
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.9.1:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}img2pdf>=0.3.0,<0.4:graphics/py-img2pdf@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pillow>=4.0.0:graphics/py-pillow@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tqdm>=4:misc/py-tqdm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}reportlab>=3.3.0:print/py-reportlab@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}chardet>=3.0.4,<4:textproc/py-chardet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pdfminer.six>=20181108:textproc/py-pdfminer.six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pikepdf>=1.6.0,<2:textproc/py-pikepdf@${PY_FLAVOR} \
		tesseract:graphics/tesseract
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=4.4.1,<5:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-helpers-namespace>=2019.1.8:devel/py-pytest-helpers-namespace@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=1.28.0:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=2.6.1:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pdf2>=1.26.0:print/py-pdf2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-xmp-toolkit>=0:textproc/py-python-xmp-toolkit@${PY_FLAVOR}

USES=		ghostscript:run python:3.6+ shebangfix
USE_PYTHON=	autoplist concurrent distutils

SHEBANG_FILES=	src/ocrmypdf/__main__.py \
		src/ocrmypdf/hocrtransform.py \
	       	src/ocrmypdf/leptonica.py \
		src/ocrmypdf/pdfinfo/__init__.py \
		tests/spoof/gs_feature_elision.py \
		tests/spoof/gs_pdfa_failure.py \
		tests/spoof/tesseract_badutf8.py \
		tests/spoof/tesseract_big_image_error.py \
		tests/spoof/tesseract_cache.py \
		tests/spoof/tesseract_noop.py \
		tests/spoof/unpaper_oldversion.py \
		tests/spoof/gs_render_failure.py \
		tests/spoof/gs_raster_failure.py \
		tests/spoof/tesseract_crash.py

USE_LOCALE=	en_US.UTF-8

NO_ARCH=	yes

PLIST_FILES=	etc/bash_completion.d/ocrmypdf.bash share/fish/vendor_completions.d/ocrmypdf.fish

OPTIONS_DEFINE=	PNGQUANT

PNGQUANT_DESC=	Optimizes the encoding of PNG-style images in PDFs

PNGQUANT_RUN_DEPENDS=	pngquant:graphics/pngquant

# This workaround copes with the files that are generated in the CFFI
# out-of-line ABI mode (through devel/py-cffi). Those files are installed but
# aren't recorded to .PLIST.pymodtmp by Python's distutils.
#
# See here for a related issue from another port (audio/py-sounddevice):
# https://github.com/spatialaudio/python-sounddevice/issues/116
post-install:
	${ECHO_CMD} "${PYTHONPREFIX_SITELIBDIR}/ocrmypdf/lib/__pycache__/_leptonica.cpython-${PYTHON_SUFFIX}.opt-1.pyc" >> ${_PYTHONPKGLIST}
	${ECHO_CMD} "${PYTHONPREFIX_SITELIBDIR}/ocrmypdf/lib/__pycache__/_leptonica.cpython-${PYTHON_SUFFIX}.pyc" >> ${_PYTHONPKGLIST}
	${ECHO_CMD} "${PYTHONPREFIX_SITELIBDIR}/ocrmypdf/lib/_leptonica.py" >> ${_PYTHONPKGLIST}

	# Install shell completion files
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/bash_completion.d ${STAGEDIR}${PREFIX}/share/fish/vendor_completions.d/
	${INSTALL_DATA} ${WRKSRC}/misc/completion/ocrmypdf.bash ${STAGEDIR}${PREFIX}/etc/bash_completion.d/
	${INSTALL_DATA} ${WRKSRC}/misc/completion/ocrmypdf.fish ${STAGEDIR}${PREFIX}/share/fish/vendor_completions.d/

# Note: The test "test_mono_not_inverted" will fail if graphics/pngquant is installed.
# See also: https://github.com/jbarlow83/OCRmyPDF/issues/417
do-test:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} -m pytest -rs -v \
	       	-n ${MAKE_JOBS_NUMBER} -k ' \
		not test_dev_null'

.include <bsd.port.mk>
