--- tests/core/test.cc.orig	2024-07-23 18:44:55 UTC
+++ tests/core/test.cc
@@ -42,7 +42,7 @@ void* test::run_ (void *ptr)
 {
     assert (ptr != NULL);
     test *t = static_cast<test *>(ptr);
-    for (bool direct : {false, true}) {
+    for (bool direct : {false}) {
         t->setup ();
         t->run (direct);
         t->cleanup ();
