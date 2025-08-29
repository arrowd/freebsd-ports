--- src/runtime/src/libraries/Common/src/Interop/FreeBSD/Interop.Process.GetProcInfo.cs.orig	2025-05-20 22:48:44 UTC
+++ src/runtime/src/libraries/Common/src/Interop/FreeBSD/Interop.Process.GetProcInfo.cs
@@ -191,14 +191,14 @@ internal static partial class Interop
                 [CTL_KERN, KERN_PROC, KERN_PROC_PID | (threads ? KERN_PROC_INC_THREAD : 0), pid]; // get specific process, possibly with threads
 
             byte* pBuffer = null;
-            int bytesLength = 0;
+            uint bytesLength = 0;
             Interop.Sys.Sysctl(sysctlName, ref pBuffer, ref bytesLength);
 
             kinfo_proc* kinfo = (kinfo_proc*)pBuffer;
 
             Debug.Assert(kinfo->ki_structsize == sizeof(kinfo_proc));
 
-            count = (int)bytesLength / sizeof(kinfo_proc);
+            count = (int)(bytesLength / sizeof(kinfo_proc));
 
             // Buffer ownership transferred to the caller
             return kinfo;
