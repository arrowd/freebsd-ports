--- src/runtime/src/libraries/Common/src/Interop/FreeBSD/Interop.Process.cs.orig	2025-05-20 22:48:44 UTC
+++ src/runtime/src/libraries/Common/src/Interop/FreeBSD/Interop.Process.cs
@@ -79,12 +79,12 @@ internal static partial class Interop
         {
             ReadOnlySpan<int> sysctlName = [CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, pid];
             byte* pBuffer = null;
-            int bytesLength = 0;
+            uint bytesLength = 0;
 
             try
             {
                 Interop.Sys.Sysctl(sysctlName, ref pBuffer, ref bytesLength);
-                return System.Text.Encoding.UTF8.GetString(pBuffer, bytesLength - 1);
+                return System.Text.Encoding.UTF8.GetString(pBuffer, (int)bytesLength - 1);
             }
             finally
             {
