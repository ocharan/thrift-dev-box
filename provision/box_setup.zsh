#!/usr/bin/env zsh

# Set missing language configuration
set_language() {
  echo "Setting ´vagrant´ user language configuration"
  echo -e "\n# Set locale configuration" >> ~/.profile
  echo 'export LC_ALL=en_US.UTF-8' >> ~/.profile
  echo 'export LANG=en_US.UTF-8' >> ~/.profile
  echo "export LANGUAGE=en_US.UTF-8\n" >> ~/.profile
}

# Install Matz Ruby Interpreter and common gems
install_ruby() {
  echo 'Installing Ruby 2.7'
  sudo apt-get install -y ruby \
    bundler \
    ri \
    ruby-dev  > /dev/null 2>&1
}

# Install Python 3
install_python() {
  echo 'Installing Python 3'
  sudo apt-get install -y python3-all \
    python3-all-dbg \
    python3-all-dev \
    python3-setuptools \
    python3-pip > /dev/null 2>&1
}

# Install Go
install_go() {
  echo 'Installing Go 1.3'
  sudo apt-get install -y golang \
  golang-go \
   > /dev/null 2>&1
}

# Install Java 8
install_java() {
  echo 'Installing Java 8'
  sudo apt-get install -y openjdk-8-jdk
    ant \
    maven \
    gradle > /dev/null 2>&1
}

# Install Apache Thrift
install_thrift() {
  sudo apt-get install -y thrift-compiler \
  ruby-thrift \
  python3-thrift > /dev/null 2>&1
}

# Remove unused software
clean_up() {
  sudo apt -y autoremove && sudo apt autoclean > /dev/null 2>&1
}

setup() {
  set_language
  install_ruby
  install_python
  install_go
  install_java
  install_thrift
  clean_up
}

setup "$@"