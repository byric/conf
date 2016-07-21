#SoccerDog
alias dlogin='ssh xiaocunxcx@119.254.102.245'
alias mlogin='ssh -p2004 xiaocunxcx@119.254.102.245'
alias sphinxlogin='ssh -p 2003 xiaocunxcx@119.254.102.245'
alias sphinxonline='ssh -p 1101 xiaocunxcx@123.59.87.24'
alias dbtunnel='ssh -fNg -L 33061:127.0.0.1:3306  xiaocunxcx@119.254.102.245'
alias rdtunnel='ssh -fNg -L 63791:127.0.0.1:6379 xiaocunxcx@119.254.102.245'
alias dbreplace='ssh -fNg -L 3306:127.0.0.1:3306  xiaocunxcx@119.254.102.245'
alias rdreplace='ssh -fNg -L 6379:127.0.0.1:6379 xiaocunxcx@119.254.102.245'
alias jump='ssh xiaocun@123.59.58.186'
#
alias work='cd ~/Developer' 
alias jasmine='cd ~/Developer/php/jasmine'
alias xhis='cd ~/Developer/php/xhis'
alias ll='ls -l'

export CLICOLOR=brown
export LSCOLORS=GxFxCxDxBxegedabagaced

export LESSCHARSET=utf-8
export LESS=-Mrf

export LAVAREL_HOME="~/.composer/vendor/bin"
export MYSQL_HOME="/usr/local/mysql/bin"

#export JAVA_HOME=${/usr/libexec/java_home}
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/1.6.0_65-b14-462.jdk/Contents/Home"
export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"

# The orginal version is saved in .bash_profile.pysave
PATH=/opt/local/bin:/opt/local/sbin:$PATH:$JAVA_HOME:$LAVAREL_HOME:$MYSQL_HOME

##
# Your previous /Users/eric/.bash_profile file was backed up as /Users/eric/.bash_profile.macports-saved_2014-11-05_at_00:09:07
##

# MacPorts Installer addition on 2014-11-05_at_00:09:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

