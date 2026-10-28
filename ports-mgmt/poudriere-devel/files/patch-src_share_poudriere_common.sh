--- src/share/poudriere/common.sh.orig	2026-04-25 21:19:02 UTC
+++ src/share/poudriere/common.sh
@@ -5632,6 +5632,12 @@ build_port() {
 			${NULLMOUNT} \
 				"${PACKAGES:?}/.npkg/${pkgname:?}" \
 				"${mnt:?}/.npkg"
+			mkdir "${mnt:?}/.npkg/provides"
+			mkdir "${mnt:?}/.npkg/shlibs"
+			# cp -R ${POUDRIERE_DATA:?}/packages/${MASTERNAME}/provides/* "${mnt:?}/.npkg/provides/"
+			# cp -R ${POUDRIERE_DATA:?}/packages/${MASTERNAME}/shlibs/* "${mnt:?}/.npkg/shlibs/"
+			cp -R ${PACKAGES:?}/provides/* "${mnt:?}/.npkg/provides/"
+			cp -R ${PACKAGES:?}/shlibs/* "${mnt:?}/.npkg/shlibs/"
 			chown -R ${JUSER} "${mnt:?}/.npkg"
 			:> "${mnt:?}/.npkg_mounted"
 
@@ -5882,6 +5888,8 @@ build_port() {
 	if [ -d "${PACKAGES}/.npkg/${pkgname}" ]; then
 		# everything was fine we can copy the package to the package
 		# directory
+		# rm -f "${PACKAGES:?}/.npkg/provides"
+		# rm -f "${PACKAGES:?}/.npkg/shlibs"
 		find "${PACKAGES:?}/.npkg/${pkgname}" \
 		    -mindepth 1 \( -type f -or -type l \) |
 		    while mapfile_read_loop_redir pkg_path; do
@@ -6956,6 +6964,8 @@ stop_build() {
 			unlink "${mnt:?}/.npkg_mounted"
 		fi
 		rm -rfx "${PACKAGES:?}/.npkg/${pkgname:?}"
+		rm -f "${PACKAGES:?}/.npkg/provides"
+		rm -f "${PACKAGES:?}/.npkg/shlibs"
 
 		if [ "${PORTTESTING}" -eq 1 ]; then
 			if jail_has_processes; then
