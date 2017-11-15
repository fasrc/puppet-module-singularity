# See README.md for more details.
class singularity (
  $package_ensure = 'present',
  $package_name = $singularity::params::package_name,
  $manage_epel = true,
  $config_path = $singularity::params::config_path,
  $config_template = 'singularity/singularity.conf.erb',
  $allow_setuid  = 'yes',
  $max_loop_devices = 256,
  $allow_pid_ns = 'yes',
  $config_passwd = 'yes',
  $config_group = 'yes',
  $config_resolv_conf = 'yes',
  $mount_proc = 'yes',
  $mount_sys = 'yes',
  $mount_dev = 'yes',
  $mount_devpts = 'yes',
  $mount_home = 'yes',
  $mount_tmp = 'yes',
  $mount_hostfs = 'no',
  $bind_paths = ['/etc/localtime', '/etc/hosts'],
  $user_bind_control = 'yes',
  $enable_overlay = $singularity::params::enable_overlay,
  $mount_slave = 'yes',
  $sessiondir_max_size = 16,
  $limit_container_owners = 'undef',
  $limit_container_paths = 'undef',
  $allow_containers = {
    'squashfs' => 'yes',
    'extfs' => 'yes',
    'dir' => 'yes',
  },
  $autofs_bug_paths = 'undef',
) inherits singularity::params {

  contain singularity::install
  contain singularity::config

  Class['singularity::install']
  ->Class['singularity::config']

}
