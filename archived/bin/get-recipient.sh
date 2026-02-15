#!/bin/bash
if test -f "$1"; then
    { echo -e '--default-recipient \c' & gpg --list-only --no-default-keyring --decrypt $1 2>&1 | head -n 1 | sed 's/^.*, ID \(.*\),.*$/\1/'; } | tr -d '\n'
else
    echo -e " \c"
fi
