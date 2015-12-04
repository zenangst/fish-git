function diff
  git difftool $argv
end

function root
  set git_root (git rev-parse --show-toplevel)
  cd $git_root
end

function gh
  github $argv
end

function clone
  git clone $argv
end

function +
  git add .; git commit -m "$argv"
end

function ++
  set branch (git rev-parse --abbrev-ref HEAD)

  if test (echo $argv | wc -w) -ge 1
    git push -u origin $argv
  else
    git push -u origin $branch
  end
end

function +++
  set pullrequest (git pull-request -m "$argv")
  echo $pullrequest | xargs open
end

function blame
  git blame $argv > /tmp/git-blame.gitlog; and coda /tmp/git-blame.gitlog
end

function gh
  github $argv
end

function branch
  if test (echo $argv | wc -w) -ge 1
    git branch $argv
  else
    git branch -a -v
  end
end

function master
  if test (echo $argv | wc -w) -ge 1
    git checkout master; $argv
  else
    git checkout master
  end
end

function hyperpod
  git clone https://github.com/hyperoslo/pod-template "$argv"; cd "$argv"; ./init.rb "$argv";
end

function hypermystore
  git clone https://github.com/hyperoslo/mystore-ios-template "$argv"; cd "$argv"; ./init.rb;
end

function git-ksdiff
  ruby ~/.oh-my-fish/bin/git-ksdiff.rb $argv
end

function git-toplist
  git shortlog -s -n
end

function git-pull-submodules
  git pull --recurse-submodules
end

function git-update-submodules
  git submodule init
  git submodule update
  git submodule foreach 'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD); git reset --hard origin/$(git rev-parse --abbrev-ref HEAD); git submodule update --recursive; git clean -dfx'
end

