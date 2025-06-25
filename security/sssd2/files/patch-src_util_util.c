Can be removed in FreeBSD 15

--- src/util/util.c.orig	2025-06-24 10:24:24 UTC
+++ src/util/util.c
@@ -830,8 +830,10 @@ errno_t sss_utc_to_time_t(const char *str, const char 
         return EINVAL;
     }
 
+#ifndef HAVE_TIMEZONE
     tzset();
     ut -= timezone;
+#endif
     *_unix_time = ut;
     return EOK;
 }
