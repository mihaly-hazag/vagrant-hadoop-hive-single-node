### JAVA ###
$java_home = "/usr/lib/jvm/java-7-openjdk-amd64"

exec {'apt-get update':
  command => 'apt-get update',
  path => '/usr/bin/'
} ->

package { 'openjdk-7-jdk':
  ensure => present,
} ->

file{"/etc/profile.d/java.sh":
  content => "export JAVA_HOME=${java_home}
              export PATH=\$PATH:\$JAVA_HOME/bin",
} ->

### HADOOP ###
# If you do not want to download the Hadoop again and again when you start the Vagrant, download it to directory where your Vagrant file is located
# Then change the path of hadoop-2.7.1.tar.gz in "unpack_hadoop" command from "/home/vagrant" to "/vagrant" 

exec{"download_hadoop":
  command => "wget -O /home/vagrant/hadoop-2.7.1.tar.gz http://apache.cs.utah.edu/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz --no-check-certificate",
  path => $path,
  unless => "ls /home/vagrant |grep hadoop-2.7.1",
  timeout => 1800
} ->

exec {"unpack_hadoop":
  command => "tar -zxf /home/vagrant/hadoop-2.7.1.tar.gz && sudo mv hadoop-2.7.1 /usr/local/hadoop",
  path => $path,
} ->

file{"/etc/profile.d/hadoop.sh":
  content => "export HADOOP_HOME=/usr/local/hadoop
              export PATH=\$PATH:\$HADOOP_HOME/bin",
  require => Exec["unpack_hadoop"]  
} ->

### HIVE ###
# If you do not want to download the Hive again and again when you start the Vagrant, download it to directory where your Vagrant file is located
# Then change the path of apache-hive-1.2.1-bin.tar.gz in "unpack_hive" command from "/home/vagrant" to "/vagrant" 

exec{"download_hive":
  command => "wget -O /home/vagrant/apache-hive-1.2.1-bin.tar.gz http://apache.cs.utah.edu/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz --no-check-certificate",
  path => $path,
  timeout => 1800
} ->


exec {"unpack_hive":
  command => "tar -zxf /home/vagrant/apache-hive-1.2.1-bin.tar.gz && sudo mv apache-hive-1.2.1-bin /usr/local/hive",
  path => $path,
} ->

exec {"copy_hive-site.xml":
  command => "cp /vagrant/config_files/hive/hive-site.xml /usr/local/hive/conf",
  path => $path,
} ->

file{"/etc/profile.d/hive.sh":
  content => "export HIVE_HOME=/usr/local/hive
              export PATH=\$PATH:\$HIVE_HOME/bin",
}
