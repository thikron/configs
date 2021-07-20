export SSH_SVN='ssh -q -l svn'
#eval `ssh-agent`
export M2_HOME=/usr/local/Cellar/maven/3.5.2/libexec
export M2=$M2_HOME/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.0.1.jdk/Contents/Home/
export JDK_HOME=$JAVA_HOME
export LANG=en_US.UTF-8
export LC_ALL=$LANG
export PKG_CONFIG_PATH=/usr/local/bin/pkg-config
export SCALA_HOME=/usr/local/share/scala
export TOMCAT=/usr/local/apache-tomcat-8.0.21
export CATALINA_HOME=$TOMCAT
export CATALINA_OPTS=-Dfile.encoding=ISO-8859-1

alias g='git' $*
alias mci='mvn clean install' $*
alias mcip='mvn clean install -P local'
alias ll='ls -al'


alias di='docker images'
alias dco='docker container' $*
alias dll='docker container ls -a'
alias d='docker' $*
alias pym='python manage.py' $*

alias swagger='docker run --rm -it --user $(id -u):$(id -g) -e GOPATH=$(go env GAOPATH):/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger'
