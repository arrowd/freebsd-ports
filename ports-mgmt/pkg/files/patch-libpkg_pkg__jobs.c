--- libpkg/pkg_jobs.c.orig	2024-05-22 14:56:17 UTC
+++ libpkg/pkg_jobs.c
@@ -667,7 +667,7 @@ _is_orphaned(struct pkg_jobs *j, const char *uid)
 		return (false);
 	unit = pkg_jobs_universe_find(j->universe, uid);
 	if (unit != NULL) {
-		if (!unit->pkg->automatic)
+		if (!unit->pkg->automatic || unit->pkg->vital)
 			return (false);
 		npkg = unit->pkg;
 	} else {
@@ -676,7 +676,7 @@ _is_orphaned(struct pkg_jobs *j, const char *uid)
 		    PKG_LOAD_SHLIBS_REQUIRED|PKG_LOAD_REQUIRES);
 		if (npkg == NULL)
 			return (false);
-		if (!npkg->automatic) {
+		if (!npkg->automatic || npkg->vital) {
 			pkg_free(npkg);
 			return (false);
 		}
@@ -1499,7 +1499,7 @@ jobs_solve_deinstall(struct pkg_jobs *j)
 		while (pkgdb_it_next(it, &pkg, PKG_LOAD_BASIC|PKG_LOAD_RDEPS|
 		    PKG_LOAD_DEPS|PKG_LOAD_ANNOTATIONS|PKG_LOAD_PROVIDES|
 		    PKG_LOAD_SHLIBS_PROVIDED) == EPKG_OK) {
-			if(pkg->locked) {
+			if(pkg->locked || pkg->vital) {
 				if (tsearch(pkg, &j->lockedpkgs, comp) == NULL) {
 					pkgdb_it_free(it);
 					return (EPKG_FATAL);
