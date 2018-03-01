class ssh::params { 
#  if $facts['os']['family'] == 'Debian' {
#    $package_name = 'openssh-server'
#    $service_name = 'ssh'
# }
# elsif $facts['os']['family'] == 'RedHat' {
#   $package_name = 'openssh-server'
#   $service_name = 'sshd'
# }
# else {
#   fail("${facts['operatingsystem']} is not supported!!!")
# }
#  case $facts['os']['family'] {
   case $facts['operatingsystem'] {
 #  case $::osfamily {
    'Debian','Ubuntu': {
       $package_name = 'openssh-server'
       $service_name = 'ssh'
    }
    /^RedHat|CentOS/: {
       $package_name = 'openssh-server'
       $service_name = 'sshd'
       #notify{ "${0} is our operating system!": }
    }
    default: {
      fail("${facts['operatingsystem']} is not supported!!!")
    }
  }
}
