#!/usr/bin/bash
#Maintained in resgithub.org
tconfig=$(mktemp)
texclude=$(mktemp)
commitmsg=${1:-"git repository initialised"}
if [ -f .git/config ]; then
    cp .git/config "$tconfig"
    cp .git/info/exclude "$texclude"
    rm -rf .git
    git init .
    mv "$tconfig" .git/config
    mv "$texclude" .git/info/exclude
    git add .
    git commit -a -m "$commitmsg"
    git push -f
else
    echo "test Warning: No git config file found. Aborting.";exit;
fi
