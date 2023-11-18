# 100-puppet_ssh_config.pp

# Disable password authentication
file_line { 'Turn off passwd auth':
  path   => '/etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no',
  match  => '^#PasswordAuthentication',
  notify => Service['ssh'],
}

# Configure SSH client to use the private key
file_line { 'Declare identity file':
  path   => '/etc/ssh/ssh_config',
  line   => '    IdentityFile ~/.ssh/school',
  match  => '^#?\s*IdentityFile',
  notify => Service['ssh'],
}

service { 'ssh':
  ensure => running,
  enable => true,
}

