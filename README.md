

# Reset local repo as if newly born. Push as new to github. Remote branches are maintained.

> Note this does NOT remove remote branches.

ALL **history <span class="underline">AND</span> local branches** will be lost but your **.git/config**, **.git/info/exclude** and **.gitignore** will be maintained.


## [resgithub.sh](resgithub.sh)

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


## Tasks


### TODO [#A] dont do anything if it's a bare repo as everything will be gone!


### TODO [#C] remove github references as is generic to all origins
