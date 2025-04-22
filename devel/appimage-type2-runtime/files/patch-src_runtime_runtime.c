--- src/runtime/runtime.c.orig	2025-03-06 22:52:04 UTC
+++ src/runtime/runtime.c
@@ -1081,6 +1081,9 @@ int fusefs_main(int argc, char* argv[], void (* mounte
         }
     }
 
+    if (getenv("FORE") != NULL)
+        fuse_cmdline_opts.foreground = 1;
+
     /* OPEN FS */
     err = !(ll = sqfs_ll_open(opts.image, opts.offset));
 
