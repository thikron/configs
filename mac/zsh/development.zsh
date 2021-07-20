showDotFiles() {
    defaults write com.apple.finder AppleShowAllFiles YES
    killall Finder /System/Library/CoreServices/Finder.app
}

hideDotFiles() {
    defaults write com.apple.finder AppleShowAllFiles NO
    killall Finder /System/Library/CoreServices/Finder.app
}

svn_get_repo_url () {
    svn info | grep '^URL' | awk '{print $NF}'
}

svn_show_open_branch_revs () {
    svn mergeinfo --show-revs eligible svn+ssh://rsassen@svn.intern.neusta.de/srv/svn/repos/bforu/releases/$1 $(svn_get_repo_url)
}

svn_merge_revs_from_branch () {
    svn merge $1 svn+ssh://rsassen@svn.intern.neusta.de/srv/svn/repos/bforu/releases/$2
}

svn_merge_revs_from_branch_record_only () {
    svn merge $1 svn+ssh://rsassen@svn.intern.neusta.de/srv/svn/repos/bforu/releases/$2 --record-only
}

setenc_uni () {
    LANG="de_DE.UTF-8"
    LC_COLLATE="de_DE.UTF-8"
    LC_CTYPE="de_DE.UTF-8"
    LC_MESSAGES="de_DE.UTF-8"
    LC_MONETARY="de_DE.UTF-8"
    LC_NUMERIC="de_DE.UTF-8"
    LC_TIME="de_DE.UTF-8"
    LC_ALL="de_DE.UTF-8"
}

setenc_iso () {
    LANG="de_DE.ISO-8859-1"
    LC_COLLATE="de_DE.ISO-8859-1"
    LC_CTYPE="de_DE.ISO-8859-1"
    LC_MESSAGES="de_DE.ISO-8859-1"
    LC_MONETARY="de_DE.ISO-8859-1"
    LC_NUMERIC="de_DE.ISO-8859-1"
    LC_TIME="de_DE.ISO-8859-1"
    LC_ALL="de_DE.ISO-8859-1"
}

brew_upgrade_all () {
    brew update && brew install `brew outdated`
}

what_listens_on_port () {
    lsof -n -i4TCP:$1 | grep LISTEN
}

ddown () {
    docker-compose down
}

dup () {
    docker-compose up
}

docker_delete_images_and_containers() {
    # Delete all containers
    docker rm $(docker ps -a -q)
    # Delete all images
    docker rmi $(docker images -q)
}

runChromeInsecure() {
    open /Applications/Google\ Chrome.app --args --disable-web-security  --user-data-dir="~/__ChromeData"
}
