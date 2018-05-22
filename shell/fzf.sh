################################################################################
# Shell builtin
# prefix: fzf_
################################################################################
# fd - cd to selected directory
fzf_run_cd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

################################################################################
# Git
# prefix: fzf_git_
################################################################################

# fbr - checkout git branch
fzf_git_run_checkout_branch() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fzf_git_run_checkout_branch_with_remote() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fzf_git_run_checkout_branch_tag() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fcoc - checkout git commit
fzf_git_run_checkout_commit() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow - git commit browser
fzf_git_run_commit_browser() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fcs - get modified files
# example usage: git checkout -- `fzf_git_print_get_files`
fzf_git_print_get_files() {
  local files file_selected
  files=$(git status -s) &&
  file_selected=$(echo "$files" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$file_selected" | sed 's/^...//')
}


# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fzf_git_print_get_git_commit_sha() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# git commit --fixup=
fzf_git_run_commit_fixup() {
  local commits commit sha1
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  git commit --fixup=$(echo "$commit" | sed "s/ .*//")
}

# sier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fzf_git_run_show_stashes() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

################################################################################
# SSH
# prefix: fzf_ssh_
################################################################################

fzf_ssh_print_complete_host() {
  local host="$(egrep -i '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh/conf -type f 2>/dev/null) | egrep -v '[*?]' | awk '{print $2}' | sort | fzf)"

  echo -n "${host}"
}

fzf_ssh_run_ssh() {
  local host="$(egrep -i '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh/conf -type f 2>/dev/null) | egrep -v '[*?]' | awk '{print $2}' | sort | fzf)"

  ssh "$host"
}

################################################################################
# Docker
################################################################################

fzf_docker_print_ps_all() {
  local name="$(docker ps -a --format "{{.Names}}"| awk '{print}' | sort | fzf)"

  echo -n "${name}"
}

fzf_docker_print_image_repository_tag() {
  local name="$(docker image ls --format "{{.Repository}}:{{.Tag}}"| awk '{print}' | sort | fzf)"

  echo -n "${name}"
}


################################################################################
# gcloud
################################################################################

fzf_gcloud_print_get_client_email() {
  local client_mail="$(egrep -i '"client_email":\s+.+' $(find $HOME/.config/gcloud -type f 2>/dev/null) | egrep -o '[^"]+@[^"]+' | sort | fzf)"

  echo -n "${client_mail}"
}
