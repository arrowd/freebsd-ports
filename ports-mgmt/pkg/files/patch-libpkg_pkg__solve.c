From ccfbf0c0812bb28681f33729db635fef7a8d9294 Mon Sep 17 00:00:00 2001
From: Gleb Popov <6yearold@gmail.com>
Date: Wed, 28 Feb 2024 17:53:44 +0300
Subject: [PATCH] Take PKG_ATTR_{VITAL,LOCKED} into account when solving for
 pkg upgrade.

The package marked "vital" could not be removed. However, the plan generated
by the solver may still contain such decisions. Such plans will fail when
executed, but this change prevent them from being generated to begin with.

Sponsored by:	Serenity Cybersecurity, LLC
--- libpkg/pkg_solve.c.orig	2024-05-22 14:56:17 UTC
+++ libpkg/pkg_solve.c
@@ -1,5 +1,7 @@
 /*-
  * Copyright (c) 2013-2017 Vsevolod Stakhov <vsevolod@FreeBSD.org>
+ * Copyright (c) 2024 Serenity Cyber Security, LLC <license@futurecrew.ru>
+ *                    Author: Gleb Popov <arrowd@FreeBSD.org>
  * All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without
@@ -1119,7 +1121,7 @@ reiterate:
 		for (i = 0; i < problem->nvars; i ++) {
 			struct pkg_solve_variable *var = &problem->variables[i];
 
-			if (var->flags & PKG_VAR_TOP) {
+			if (var->flags & PKG_VAR_TOP || var->unit->pkg->vital) {
 				if (var->flags & PKG_VAR_FAILED) {
 					var->flags ^= PKG_VAR_INSTALL | PKG_VAR_FAILED;
 				}
