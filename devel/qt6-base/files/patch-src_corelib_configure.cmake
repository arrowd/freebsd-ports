--- src/corelib/configure.cmake.orig	2026-01-13 10:18:17 UTC
+++ src/corelib/configure.cmake
@@ -569,6 +569,23 @@ renameat2(AT_FDCWD, argv[1], AT_FDCWD, argv[2], RENAME
 }
 ")
 
+# freebsd_renameat2
+qt_config_compile_test(freebsd_renameat2
+    LABEL "freebsd_renameat2()"
+    CODE
+"
+#include <sys/fcntl.h>
+#include <stdio.h>
+
+int main(int, char **argv)
+{
+    /* BEGIN TEST: */
+renameat2(AT_FDCWD, argv[1], AT_FDCWD, argv[2], AT_RENAME_NOREPLACE);
+    /* END TEST: */
+    return 0;
+}
+")
+
 qt_config_compile_test(winsdkicu
     LABEL "Windows SDK: ICU"
     LIBRARIES icu
@@ -889,7 +906,7 @@ qt_feature("renameat2" PRIVATE
 )
 qt_feature("renameat2" PRIVATE
     LABEL "renameat2()"
-    CONDITION ( LINUX OR HURD ) AND TEST_renameat2
+    CONDITION ( LINUX OR HURD OR FREEBSD ) AND (TEST_renameat2 OR TEST_freebsd_renameat2)
 )
 qt_feature("slog2" PRIVATE
     LABEL "slog2"
