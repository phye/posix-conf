#!/bin/bash

if [ ! ${#} -ge 2 ]; then
    echo 1>&2 "Usage: ${0} LOCAL REMOTE [MERGED BASE]"
    echo 1>&2 "       (LOCAL, REMOTE, MERGED, BASE can be provided by \`git mergetool'.)"
    exit 1
fi

_EMACSCLIENT=$(which emacsclient)

_LOCAL=${1}
_REMOTE=${2}
_MERGED=${3:-${_REMOTE}}

if [ "${4}" ] && [ -r "${4}" ] ; then
    _EVAL="(phye/ediff-start #'ediff-merge-files-with-ancestor \"${_LOCAL}\" \"${_REMOTE}\" \"${4}\" nil \"${_MERGED}\")"
elif [ "${_REMOTE}" = "${_MERGED}" ] ; then
    _EVAL="(phye/ediff-start #'ediff \"${_LOCAL}\" \"${_REMOTE}\")"
else
    _EVAL="(phye/ediff-start #'ediff-merge-files \"${_LOCAL}\" \"${_REMOTE}\" nil \"${_MERGED}\")"
fi

_SOCKET=$(tmux display-message -p '#S')
if [ "${TERM}" = "linux" ]; then
    unset DISPLAY
    _EMACSCLIENTOPTS="-t --socket=${_SOCKET}"
else
    _EMACSCLIENTOPTS="-c -t --socket=${_SOCKET}"
fi

${_EMACSCLIENT} ${_EMACSCLIENTOPTS} -a "" -e "${_EVAL}" 2>&1
_EXITCODE=$?

if [ ${_EXITCODE} -ne 0 ]; then
    # Reset terminal settings
    stty sane
    exit ${_EXITCODE}
fi

# check for unresolved conflict markers
if [ ! "$(grep -Ec '^(<<<<<<<|=======|>>>>>>>|####### Ancestor)' "${_MERGED}")" = 0 ]; then
    _MERGEDSAVE=$(mktemp --tmpdir "$(basename "${_MERGED}")".XXXXXXXXXX)
    cp "${_MERGED}" "${_MERGEDSAVE}"
    echo 1>&2 "Oops! Conflict markers detected in $_MERGED."
    echo 1>&2 "Saved your changes to ${_MERGEDSAVE}"
    exit 1
fi

exit 0
