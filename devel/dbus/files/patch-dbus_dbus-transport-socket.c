--- dbus/dbus-transport-socket.c.orig	2025-02-27 16:29:06 UTC
+++ dbus/dbus-transport-socket.c
@@ -1204,7 +1204,7 @@ socket_do_iteration (DBusTransport *transport,
                                   * is guaranteed on linux at least.
                                   */
           
-          if (poll_fd.revents & _DBUS_POLLERR)
+          if (poll_fd.revents & _DBUS_POLLERR || poll_fd.revents == _DBUS_POLLHUP)
             do_io_error (transport);
           else
             {
