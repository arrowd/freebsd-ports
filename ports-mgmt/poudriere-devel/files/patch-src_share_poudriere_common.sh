--- src/share/poudriere/common.sh.orig	2026-04-25 21:19:02 UTC
+++ src/share/poudriere/common.sh
@@ -5627,11 +5627,22 @@ build_port() {
 		"package")
 			echo "PACKAGES=/.npkg" >> "${mnt:?}/etc/make.conf"
 			# Create sandboxed staging dir for new package for this build
+echo '---> Poudreire: package phase'
+echo '${POUDRIERE_DATA:?}/packages/${MASTERNAME}'
+echo ${POUDRIERE_DATA:?}/packages/${MASTERNAME}
 			rm -rf "${PACKAGES:?}/.npkg/${pkgname:?}"
 			mkdir -p "${PACKAGES:?}/.npkg/${pkgname:?}"
 			${NULLMOUNT} \
 				"${PACKAGES:?}/.npkg/${pkgname:?}" \
 				"${mnt:?}/.npkg"
+			mkdir "${mnt:?}/.npkg/provides"
+			mkdir "${mnt:?}/.npkg/shlibs_provided"
+			# cp -R ${POUDRIERE_DATA:?}/packages/${MASTERNAME}/provides/* "${mnt:?}/.npkg/provides/"
+			# cp -R ${POUDRIERE_DATA:?}/packages/${MASTERNAME}/shlibs_provided/* "${mnt:?}/.npkg/shlibs_provided/"
+			cp -R ${PACKAGES:?}/provides/* "${mnt:?}/.npkg/provides/"
+			cp -R ${PACKAGES:?}/shlibs_provided/* "${mnt:?}/.npkg/shlibs_provided/"
+echo "---> Copied shlibs_provided from host:"
+echo "ZZZZZZ $(ls -l ${mnt:?}/.npkg/shlibs_provided)"
 			chown -R ${JUSER} "${mnt:?}/.npkg"
 			:> "${mnt:?}/.npkg_mounted"
 
@@ -5882,12 +5893,18 @@ build_port() {
 	if [ -d "${PACKAGES}/.npkg/${pkgname}" ]; then
 		# everything was fine we can copy the package to the package
 		# directory
+echo "---> Copying from jail back to host, shlibs_provided:"
+ls "${PACKAGES:?}/.npkg/${pkgname}/shlibs_provided/"
+		# rm -f "${PACKAGES:?}/.npkg/provides"
+		# rm -f "${PACKAGES:?}/.npkg/shlibs_provided"
 		find "${PACKAGES:?}/.npkg/${pkgname}" \
 		    -mindepth 1 \( -type f -or -type l \) |
 		    while mapfile_read_loop_redir pkg_path; do
 			pkg_file="${pkg_path#"${PACKAGES}/.npkg/${pkgname:?}"}"
 			pkg_base="${pkg_file%/*}"
 			mkdir -p "${PACKAGES:?}/${pkg_base:?}"
+echo mkdir -p "${PACKAGES:?}/${pkg_base:?}"
+echo rename "${pkg_path}" " ---> " "${PACKAGES:?}/${pkg_base:?}/${pkg_path##*/}"
 			# rename as this is expected to be on the same
 			# filesystem.
 			rename "${pkg_path}" \
@@ -6956,6 +6973,8 @@ stop_build() {
 			unlink "${mnt:?}/.npkg_mounted"
 		fi
 		rm -rfx "${PACKAGES:?}/.npkg/${pkgname:?}"
+		rm -f "${PACKAGES:?}/.npkg/provides"
+		rm -f "${PACKAGES:?}/.npkg/shlibs_provided"
 
 		if [ "${PORTTESTING}" -eq 1 ]; then
 			if jail_has_processes; then
