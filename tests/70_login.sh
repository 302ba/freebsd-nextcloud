#!/bin/sh
export PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"

CURL_CMD=$( which curl 2>/dev/null )

if [ -z "${CURL_CMD}" ]; then
	echo "no such curl"
	exit 1
fi

GREP_VAL="body-login"

printf "Check for login page https://$1/login ( filter cmd: ${GREP_VAL} )..." 2>&1
${CURL_CMD} -k --no-progress-meter -L https://$1/login | grep "${GREP_VAL}"
exit $?
