--- libpkg/pkg_add.c.orig	2026-08-12 15:43:44 UTC
+++ libpkg/pkg_add.c
@@ -1415,15 +1415,14 @@ pkg_add_check_pkg_archive(struct pkgdb *db, struct pkg
 			if (pkgdb_is_shlib_provided(db, shlibname))
 				continue;
 
-			char provdir[MAXPATHLEN];
-			snprintf(provdir, sizeof(provdir), "%s/shlibs/%s",
+			char provsymlink[MAXPATHLEN];
+			snprintf(provsymlink, sizeof(provsymlink), "%s/shlibs/%s",
 			    parentdir, shlibname);
-			char *provider = select_provider_from_dir(
-			    provdir, ext);
+			char *provider = realpath(provsymlink, NULL);
 
 			if (provider == NULL) {
-				pkg_emit_error("Missing shlib %s required by %s",
-				    pkg->shlibs_required.d[si], pkg->name);
+				pkg_emit_error("Missing shlib %s required by %s: can't read symlink: %s",
+				    pkg->shlibs_required.d[si], pkg->name, strerror(errno));
 				if ((flags & PKG_ADD_FORCE_MISSING) == 0)
 					goto cleanup;
 				continue;
