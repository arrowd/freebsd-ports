--- src/runtime/src/libraries/Common/src/Interop/BSD/System.Native/Interop.Sysctl.cs.orig	2025-05-20 22:48:44 UTC
+++ src/runtime/src/libraries/Common/src/Interop/BSD/System.Native/Interop.Sysctl.cs
@@ -6,8 +6,6 @@ using System.Text;
 using System.Runtime.InteropServices;
 using System.Text;
 
-using size_t = System.IntPtr;
-
 // This implements shim for sysctl calls.
 // They are available on BSD systems - FreeBSD, OSX and others.
 // Linux has sysctl() but it is deprecated as well as it is missing sysctlbyname()
@@ -17,22 +15,22 @@ internal static partial class Interop
     internal static partial class Sys
     {
         [LibraryImport(Libraries.SystemNative, EntryPoint = "SystemNative_Sysctl", SetLastError = true)]
-        private static unsafe partial int Sysctl(int* name, int namelen, void* value, size_t* len);
+        private static unsafe partial int Sysctl(int* name, uint namelen, void* value, nuint* len);
 
         // This is 'raw' sysctl call, only wrapped to allocate memory if needed
         // caller always needs to free returned buffer using  Marshal.FreeHGlobal()
 
-        internal static unsafe void Sysctl(ReadOnlySpan<int> name, ref byte* value, ref int len)
+        internal static unsafe void Sysctl(ReadOnlySpan<int> name, ref byte* value, ref uint len)
         {
             fixed (int* ptr = &MemoryMarshal.GetReference(name))
             {
-                Sysctl(ptr, name.Length, ref value, ref len);
+                Sysctl(ptr, (uint)name.Length, ref value, ref len);
             }
         }
 
-        private static unsafe void Sysctl(int* name, int name_len, ref byte* value, ref int len)
+        private static unsafe void Sysctl(int* name, uint name_len, ref byte* value, ref uint len)
         {
-            nint bytesLength = len;
+            nuint bytesLength = len;
             int ret = -1;
             bool autoSize = (value == null && len == 0);
 
@@ -42,7 +40,7 @@ internal static partial class Interop
                 ret = Sysctl(name, name_len, value, &bytesLength);
                 if (ret != 0)
                 {
-                    throw new InvalidOperationException(SR.Format(SR.InvalidSysctl, *name, Marshal.GetLastPInvokeError()));
+                    throw MkException(name, name_len);
                 }
                 value = (byte*)Marshal.AllocHGlobal((int)bytesLength);
             }
@@ -64,9 +62,9 @@ internal static partial class Interop
                 }
                 else
                 {
-                    bytesLength = (int)bytesLength * 2;
+                    bytesLength = bytesLength * 2;
                 }
-                value = (byte*)Marshal.AllocHGlobal(bytesLength);
+                value = (byte*)Marshal.AllocHGlobal((int)bytesLength);
                 ret = Sysctl(name, name_len, value, &bytesLength);
             }
             if (ret != 0)
@@ -75,10 +73,24 @@ internal static partial class Interop
                 {
                     Marshal.FreeHGlobal((IntPtr)value);
                 }
-                throw new InvalidOperationException(SR.Format(SR.InvalidSysctl, *name, Marshal.GetLastPInvokeError()));
+                throw MkException(name, name_len);
             }
 
-            len = (int)bytesLength;
+            len = (uint)bytesLength;
+        }
+
+        private static unsafe InvalidOperationException MkException(int* name, uint name_len)
+        {
+            int mib0 = name[0];
+            int mib1 = name_len > 1 ? name[1] : -1;
+            int mib2 = name_len > 2 ? name[2] : -1;
+            int mib3 = name_len > 3 ? name[3] : -1;
+            return new InvalidOperationException(SR.Format(SR.InvalidSysctl,
+                                                           mib0,
+                                                           mib1,
+                                                           mib2,
+                                                           mib3,
+                                                           Marshal.GetLastPInvokeError()));
         }
     }
 }
