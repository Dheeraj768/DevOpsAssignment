class apache {

package { 'httpd' :
ensure => present,
name => "httpd.x86_64"
}

define welcome() {
$string = "<html>
           <head><title>Hello World</title></head>
           <body><h1>Hello World</h1></body>
           </html>"
}

file { '/var/www/html/index.html' :
ensure => file,
path => '/var/www/html/index.html',
owner => root,
group => root,
content => $string
}

service { 'httpd' :
ensure => running,
enable => true
}

}
