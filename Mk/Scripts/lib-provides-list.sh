#!/bin/sh
# MAINTAINER: portmgr@FreeBSD.org

. ${SCRIPTSDIR}/functions.sh

validate_env PREFIX LOCALBASE PLIST USE_LDCONFIG AGAINST_TMPPLIST

[ -n "${DEBUG_MK_SCRIPTS}" -o -n "${DEBUG_MK_SCRIPTS_LIB_PROVIDES_LIST}" ] && set -x

set -u

custom_prefix="no"
if [ "$PREFIX" != ${LOCALBASE} ]; then
	custom_prefix="yes"
fi

custom_ldconfig="no"
if [ ! -z "${USE_LDCONFIG}" -a "${USE_LDCONFIG}" != "yes" ]; then
	custom_ldconfig="yes"
fi

plist=${PLIST}
if [ ! -z "${AGAINST_TMPPLIST}" ]; then
	plist="${TMPPLIST}"
fi

check_match()
{
	local item=$1
	# strip the @@subpackages@@ prefix
	item=$(echo $item | sed 's|^@@.*@@||')
	# strip the %%SUB%% prefix
	local item_wo_subs=$(echo $item | sed 's|^%%.*%%||')
	# if we're running against TMPPLIST, then the caller expects no %%SUB%%
	# prefixes in the output. This holds for TMPPLIST contents, but we also
	# draw items from _REALLY_ALL_PLIST_FILES, which might have synthetic
	# %%SUB%% prefixed items. Do not allow such items to slip into the output
	if [ ! -z "${AGAINST_TMPPLIST}" ]; then
		item="$item_wo_subs"
	fi

	case "$item_wo_subs" in
		lib/*/*.so*)
			# do nothing, we'll handle these later in the ldconfig loop
			;;
		lib/*/*/*.so*)
			;;
		lib/*/*/*/*.so*)
			;;
		lib/*/*/*/*/*.so*)
			;;
		lib/*.so*)
			if [ $custom_prefix = no ]; then
				echo $item
				continue
			fi
			;;
	esac

	if [ $custom_ldconfig = yes ]; then
		for ldconfig_dir in ${USE_LDCONFIG}; do
			# remove slashes at the end
			ldconfig_dir=$(echo $ldconfig_dir | sed -E 's|/+$||')
			# remove prefix from the beginning
			ldconfig_dir=$(echo $ldconfig_dir | sed -E "s|^${PREFIX}/||")
			case "$item_wo_subs" in
				${ldconfig_dir}/*.so*)
					echo $item
					continue
					;;
			esac
		done
	fi
}

provides_from_plist()
{
	local _plist=$1

	while read -r item; do
		check_match $item
	done < ${_plist}
}

provides_from_knob()
{
	for item in ${PLIST_FILES}; do
		check_match $item
	done
}

lib_provides=""

if [ -f "$plist" ]; then
	lib_provides="$lib_provides $(provides_from_plist "$plist")"
fi

if [ ! -z "$PLIST_FILES" -a -z "${AGAINST_TMPPLIST}" ]; then
	lib_provides="$lib_provides $(provides_from_knob)"
fi

(
for lib in $lib_provides; do
	echo $lib
done
) | sort | uniq
