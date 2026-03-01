--- src/corelib/io/qfilesystemengine_unix.cpp.orig	2026-01-13 10:18:17 UTC
+++ src/corelib/io/qfilesystemengine_unix.cpp
@@ -51,6 +51,10 @@
 # include <copyfile.h>
 #endif
 
+#ifdef Q_OS_FREEBSD
+#define RENAME_NOREPLACE AT_RENAME_NOREPLACE
+#endif
+
 #ifdef Q_OS_MACOS
 #include <CoreServices/CoreServices.h>
 #endif
