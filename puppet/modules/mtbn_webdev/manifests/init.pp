class mtbn_webdev
{

    package { 'git-core':
        ensure => present,
    }

    exec { 'install composer':
        command => 'curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin',
        require => Package['php5-cli'],
    }

    exec { 'global composer':
        command => "sudo ln -s /usr/local/bin/composer.phar /usr/local/bin/composer",
        require => Exec['install composer'],
    }

    file { "/home/www/":
        ensure => "directory",
        owner  => "root",
        group  => "root",
        mode   => 775,
    }

    # exec { 'get laravel packages':
    #   command => "composer install'",
    #   cwd => '/var/www/',
    #   require => [Exec['global composer'], Package['git-core']],
    #   timeout => 900,
    # }

    #exec { 'get laravel packages':
    #    command => "/bin/sh -c 'cd /var/www/ && composer install'",
    #    require => [Exec['global composer'], Package['git-core']],
    #    timeout => 900,
    #}

    #file { '/var/www/app/storage':
    #    mode => 0777
    #}
}
