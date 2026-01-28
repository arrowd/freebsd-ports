# Provide support for MySQL clients
#
# Feature:	mysql
# Usage:	USES=mysql[:args]
# Valid ARGS:	<none>, build, lib, run
#		<none>:   (default) same as lib
#		build:    add BUILD_DEPENDS
#		lib:      add LIB_DEPENDS
#		run:      add RUN_DEPENDS
#		mysql:    use mysql-client disregarding ${MYSQL_CLIENT_DEFAULT}
#		mariadb:  use mariadb-client disregarding ${MYSQL_CLIENT_DEFAULT}
#
# Additionally this USES defines the following knobs for ports to use:
#		DBD_MYSQL can be used a value for *_DEPENDS, points to
#			either p5-DBD-mysql or p5-DBD-MariaDB
#
# MAINTAINER:	ports@FreeBSD.org

.if !defined(_INCLUDE_USES_MYSQL_MK)
_INCLUDE_USES_MYSQL_MK=	yes

_mysql_depends=		build lib run
_mysql_valid_args=	${_mysql_depends} mysql mariadb
.  for _arg in ${mysql_ARGS:O:u}
.    if empty(_mysql_valid_args:M${_arg})
IGNORE=	"Invalid argument 'mysql:${_arg}'. Only '${_mysql_valid_args}' are supported."
.    endif
.  endfor

.  if ${mysql_ARGS:Mmysql} && ${mysql_ARGS:Mmariadb}
IGNORE=	"Invalid arguments 'mysql:${mysql_ARGS:tW:C/ /,/}'. Only one of 'mysql' and 'mariadb' are supported."
.  endif

_mysql_depend=	#
.  for _depend in ${_mysql_depends:O:u}
.    if ${mysql_ARGS:M${_depend}}
_mysql_depend+=	${_depend}
.    endif
.  endfor
.  if empty(_mysql_depend)
_mysql_depend=	lib
.  endif

_mysql_default=		${MYSQL_CLIENT_DEFAULT}

.  if ${mysql_ARGS:Mmysql}
_mysql_default=		mysql
.  elif ${mysql_ARGS:Mmariadb}
_mysql_default=		mariadb
.  endif

# chose the client's origin depending on ${_mysql_default}
_MYSQL_CLIENT_PORT=	databases/${_mysql_default}-client
.  if ${_mysql_default} == mysql
_MYSQL_CLIENT_LIB=	libmysqlclient.so
DBD_MYSQL=		p5-DBD-mysql>=0:databases/p5-DBD-mysql
.  elif ${_mysql_default} == mariadb
_MYSQL_CLIENT_LIB=	libmariadb.so
DBD_MYSQL=		p5-DBD-MariaDB>=0:databases/p5-DBD-MariaDB
.  endif

_MYSQL_CLIENT_BUILD_DEPENDS=	${_mysql_default}-client>=0:${_MYSQL_CLIENT_PORT}
_MYSQL_CLIENT_LIB_DEPENDS=	${_MYSQL_CLIENT_LIB}:${_MYSQL_CLIENT_PORT}
_MYSQL_CLIENT_RUN_DEPENDS=	mysql:${_MYSQL_CLIENT_PORT}

# === Dependency handling
.  for _depend in ${_mysql_depend}
${_depend:tu}_DEPENDS+=	${_MYSQL_CLIENT_${_depend:tu}_DEPENDS}
.  endfor
.endif
