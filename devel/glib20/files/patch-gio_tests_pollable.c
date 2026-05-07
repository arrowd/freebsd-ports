--- gio/tests/pollable.c.orig	2026-02-13 19:08:16 UTC
+++ gio/tests/pollable.c
@@ -185,6 +185,22 @@ test_streams (GPollableInputStream *in,
     g_clear_object (&out);                                              \
   } G_STMT_END
 
+#define g_assert_pollable(fd) \
+  G_STMT_START {                                                        \
+    GPollableInputStream *in = NULL;                                    \
+    GOutputStream *out = NULL;                                          \
+                                                                        \
+    in = G_POLLABLE_INPUT_STREAM (g_unix_input_stream_new (fd, FALSE)); \
+    out = g_unix_output_stream_new (fd, FALSE);                         \
+                                                                        \
+    g_assert_true (g_pollable_input_stream_can_poll (in));             \
+    g_assert_true (g_pollable_output_stream_can_poll (                 \
+        G_POLLABLE_OUTPUT_STREAM (out)));                               \
+                                                                        \
+    g_clear_object (&in);                                               \
+    g_clear_object (&out);                                              \
+  } G_STMT_END
+
 static void
 test_pollable_unix_pipe (void)
 {
@@ -271,7 +287,7 @@ test_pollable_unix_nulldev (void)
   int fd = g_open ("/dev/null", O_RDWR, 0);
   g_assert_cmpint (fd, !=, -1);
 
-  g_assert_not_pollable (fd);
+  g_assert_pollable (fd);
 
   close (fd);
 #else
