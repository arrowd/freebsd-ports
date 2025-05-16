--- sys/inotify.h.orig	2024-07-23 19:29:17 UTC
+++ sys/inotify.h
@@ -1,6 +1,9 @@
 #ifndef __BSD_INOTIFY_H__
 #define __BSD_INOTIFY_H__
 
+#ifdef WITH_NATIVE_INOTIFY
+#include </usr/include/sys/inotify.h>
+
 #if defined (__STDC_VERSION__) && (__STDC_VERSION__ >= 199901L)
 #include <stdint.h>
 #define LIBINOTIFY_FLEXIBLE_ARRAY_MEMBER /**/
@@ -34,6 +37,10 @@
 #define IN_MAX_USER_INSTANCES		2
 #define IN_DEF_MAX_USER_INSTANCES	2147483646
 
+#define IN_DIRECT	0x80000000
+
+#else // WITH_NATIVE_INOTIFY
+
 /* Flags for the parameter of inotify_init1. */
 #define IN_CLOEXEC	02000000	/* Linux x86 O_CLOEXEC */
 #define IN_NONBLOCK	00004000	/* Linux x86 O_NONBLOCK */
@@ -108,6 +115,12 @@ int inotify_rm_watch (int fd, int wd) __THROW;
 
 /* Remove the watch specified by WD from the inotify instance FD. */
 int inotify_rm_watch (int fd, int wd) __THROW;
+
+#endif //WITH_NATIVE_INOTIFY
+
+#ifdef WITH_NATIVE_INOTIFY
+__BEGIN_DECLS
+#endif
 
 /* Libinotify specific. Set inotify instance parameter. */
 int libinotify_set_param (int fd, int param, intptr_t value) __THROW;
