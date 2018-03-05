# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin:/opt/gradle/gradle-4.0/bin

export PATH
export JAVA_HOME=/usr/lib/jvm/java
export GRADLE_HOME=/opt/gradle/gradle-4.0
