function install {
  echo installing $1
  shift
  apt-get -y install "$@" >/dev/null 2>&1
}

echo adding swap file
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Ruby ruby2.3 ruby2.3-dev
update-alternatives --set ruby /usr/bin/ruby2.3 >/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.3 >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

install Git git
install SQLite sqlite3 libsqlite3-dev
install memcached memcached
install Redis redis-server

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser ubuntu

debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
install MySQL mysql-server libmysqlclient-dev
mysql -uroot -proot <<SQL
CREATE USER 'myuser'@'localhost';
SQL

install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'Blade dependencies' libncurses5-dev
install 'ExecJS runtime' nodejs

update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo installing Rails and dependencies
gem install rails -N >/dev/null 2>&1
gem install byebug -N >/dev/null 2>&1
gem install pry-byebug -N >/dev/null 2>&1
gem install spring -N >/dev/null 2>&1
gem install turbolinks -N >/dev/null 2>&1
gem install redis -N >/dev/null 2>&1
gem install jquery-rails -N >/dev/null 2>&1
gem install sass-rails -N >/dev/null 2>&1
gem install coffee-rails -N >/dev/null 2>&1
gem install jbuilder -N >/dev/null 2>&1
gem install puma -N >/dev/null 2>&1
gem install debug_inspector -N >/dev/null 2>&1
gem install ffi -N >/dev/null 2>&1
gem install sqlite3 -N >/dev/null 2>&1
gem install listen -N >/dev/null 2>&1
gem install uglifier -N >/dev/null 2>&1
gem install web-console -N >/dev/null 2>&1
gem install sidekiq -N >/dev/null 2>&1
gem install veritrans -N >/dev/null 2>&1
gem install pry-byebug -N >/dev/null 2>&1
gem install activejob -N >/dev/null 2>&1
gem install activerecord -N >/dev/null 2>&1
gem install spring-watcher-listen -N >/dev/null 2>&1
gem install mysql2 -N >/dev/null 2>&1
gem install actionview -N >/dev/null 2>&1
gem install actionpack -N >/dev/null 2>&1
gem install actioncable -N >/dev/null 2>&1
gem install actionmailer -N >/dev/null 2>&1
gem install railties -N >/dev/null 2>&1

echo 'all is set up, you are ready to rock! bring em on!'
