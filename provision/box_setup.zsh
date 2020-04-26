#!/usr/bin/env zsh

# Set missing language configuration
set_language() {
  echo "Setting ´vagrant´ user language configuration"
  echo -e "\n# Set locale configuration" >> ~/.profile
  echo 'export LC_ALL=en_US.UTF-8' >> ~/.profile
  echo 'export LANG=en_US.UTF-8' >> ~/.profile
  echo "export LANGUAGE=en_US.UTF-8\n" >> ~/.profile
}

# Install RVM
install_rvm() {
  echo 'Installing RVM'
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash
  source $HOME/.rvm/scripts/rvm
  rvm get head
}

# Install Matz Ruby Interpreter and common gems
install_ruby() {
  echo 'Installing Ruby 2.6'
  sudo apt-get install -y libxml2 libxml2-dev libxslt1-dev libpq-dev > /dev/null 2>&1
  rvm install 2.6
  rvm use 2.6@global
  gem update --system --no-document
  gem update --no-document
  gem install bundler rails rspec-rails cucumber-rails pg redis-rails webpacker mailcatcher pry-byebug --no-document
  rvm use 2.6 --default
  rvm cleanup all
}

# Install Python 3
install_python() {
  echo 'Installing Python 3'
  sudo apt-get install -y python-all \
    python-all-dbg \
    python-all-dev \
    python-setuptools \
    python3-pip > /dev/null 2>&1
}

# Install Java 8
install_java() {
  echo 'Installing Java 8'
  sudo apt-get install -y openjdk-8-jdk \
    ant \
    maven \
    gradle > /dev/null 2>&1
}

# Install Apache Thrift
install_thrift() {
  sudo apt-get install -y thrift-compiler > /dev/null 2>&1
}

# Remove unused software
clean_up() {
  sudo apt -y autoremove && sudo apt autoclean > /dev/null 2>&1
}

setup() {
  set_language
  install_rvm
  install_ruby
  install_python
  install_java
  install_thrift
  clean_up
}

setup "$@"