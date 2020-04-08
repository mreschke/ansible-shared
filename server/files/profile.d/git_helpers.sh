# mReschke git helpers

alias gits='git status'
alias gitc='git config -l'

function ga() {
    git add .
    git commit -a -m "$1"
}

function gap() {
    git add .
    git commit -a -m "$1"
    git push
}

function gt() {
    git tag -a $1 -m "Tagged for $1 release"
    git push origin $1
}

function git-merge-into() {
    into=$1
    branch=$(git branch | sed -n '/\* /s///p')
    if [ "$into" == "" ]; then
        echo "Usage: git-merge-into master"
        return
    elif [ "$branch" == "" ]; then
        echo "Please push your current '$branch' branch first"
        return
    fi
    pushed=$(git status | grep -c 'nothing to commit')
    if [ $pushed -eq 1 ]; then
        read -r -p "You are about to merge $branch into $into.  Are you sure? " response
        if [ "$response" == "y" ]; then
            git checkout $into && git merge $branch && git push && git checkout $branch
        fi
    fi
}

