--- controller.c.orig	2024-07-23 21:43:04 UTC
+++ controller.c
@@ -37,6 +37,10 @@
 #include <stdlib.h>
 #include <unistd.h>
 
+#ifdef WITH_NATIVE_INOTIFY
+#include <dlfcn.h>
+#endif
+
 #include "sys/inotify.h"
 
 #include "compat.h"
@@ -97,6 +101,11 @@ inotify_init1 (int flags)
 int
 inotify_init1 (int flags)
 {
+#ifdef WITH_NATIVE_INOTIFY
+    void* libc = dlopen("/lib/libc.so.7", RTLD_NOW);
+    int (*native_inotify_init1)(int) = dlsym(libc, "inotify_init1");
+    return native_inotify_init1(flags);
+#endif
     struct worker *wrk, *iter;
     int lfd = -1;
 
@@ -160,6 +169,11 @@ inotify_add_watch (int         fd,
                    const char *name,
                    uint32_t    mask)
 {
+#ifdef WITH_NATIVE_INOTIFY
+    void* libc = dlopen("/lib/libc.so.7", RTLD_NOW);
+    int (*native_inotify_add_watch)(int, const char*, uint32_t) = dlsym(libc, "inotify_add_watch");
+    return native_inotify_add_watch(fd, name, mask);
+#endif
     struct stat st;
     struct worker_cmd cmd;
 
@@ -203,6 +217,11 @@ inotify_rm_watch (int fd,
 inotify_rm_watch (int fd,
                   int wd)
 {
+#ifdef WITH_NATIVE_INOTIFY
+    void* libc = dlopen("/lib/libc.so.7", RTLD_NOW);
+    int (*native_inotify_rm_watch)(int, int) = dlsym(libc, "inotify_rm_watch");
+    return native_inotify_rm_watch(fd, wd);
+#endif
     struct worker_cmd cmd;
 
     if (wd < 0) {
@@ -247,6 +266,9 @@ libinotify_set_param (int fd, int param, intptr_t valu
         if (!is_opened (fd)) {
             return -1;	/* errno = EBADF */
         }
+#ifdef WITH_NATIVE_INOTIFY
+        return 0;
+#endif
         worker_cmd_param (&cmd, param, value);
         return worker_exec (fd, &cmd);
 
@@ -259,6 +281,9 @@ int libinotify_direct_readv (int fd, struct iovec **ev
 
 int libinotify_direct_readv (int fd, struct iovec **events, int size, int no_block)
 {
+#ifdef WITH_NATIVE_INOTIFY
+        return -1;
+#endif
     int nevents;
     struct timespec timeout = {0};
     struct kevent received[size];
