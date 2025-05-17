--- inotify-test.c.orig	2024-07-23 19:21:15 UTC
+++ inotify-test.c
@@ -34,6 +34,12 @@
 
 #include <sys/inotify.h>
 
+#ifndef IN_DIRECT
+#define IN_DIRECT (-1)
+#define libinotify_direct_readv(a,b,c,d) (-1)
+#define libinotify_free_iovec(x)
+#endif
+
 void get_event (int fd, const char * target);
 void get_event_direct (int fd, const char * target);
 void handle_error (int error);
