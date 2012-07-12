
# Find homebrew prefix if it is available.
brew_prefix=$(brew --prefix)

# Enable bash_completion from brew.
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi

# Put homebrew PHP ahead in $PATH a la http://justinhileman.info/article/reinstalling-php-53-on-mac-os-x/
export PATH=$brew_prefix/sbin:$brew_prefix/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/Library/Frameworks/PROJ.framework/Programs:$PATH

# Prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[31;38m\]\u\[\033[00m\]:\[\033[31;38m\]\w\[\033[1;31m\]\$(parse_git_branch)\[\033[00m\] "
export NODE_PATH="/usr/local/lib/node_modules"
