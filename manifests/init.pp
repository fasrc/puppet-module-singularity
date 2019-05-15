# @summary Manage Singularity
#
# @example
#   include ::singularity
#
# @param package_ensure
#   Package ensure property
# @param package_name
#   Singularity package name
# @param manage_epel
#   Determines if EPEL repo should be managed
# @param config_path
#   Path to singularity.conf
# @param config_template
#   Template used for singularity.conf
# @param max_loop_devices
#   See singularity.conf: `max loop devices`
# @param allow_pid_ns
#   See singularity.conf: `allow pid ns`
# @param config_passwd
#   See singularity.conf: `config passwd`
# @param config_group
#   See singularity.conf: `config group`
# @param config_resolv_conf
#   See singularity.conf: `config resolv conf`
# @param mount_proc
#   See singularity.conf: `mount proc`
# @param mount_sys
#   See singularity.conf: `mount sys`
# @param mount_dev
#   See singularity.conf: `mount dev`
# @param mount_devpts
#   See singularity.conf: `mount devpts`
# @param mount_home
#   See singularity.conf: `mount home`
# @param mount_tmp
#   See singularity.conf: `mount tmp`
# @param mount_hostfs
#   See singularity.conf: `mount hostfs`
# @param bind_paths
#   See singularity.conf: `bind paths`
# @param user_bind_control
#   See singularity.conf: `user bind control`
# @param enable_overlay
#   See singularity.conf: `enable overlay`
# @param enable_underlay
#   See singularity.conf: `enable underlay`
# @param mount_slave
#   See singularity.conf: `mount slave`
# @param sessiondir_max_size
#   See singularity.conf: `sessiondir max size`
# @param limit_container_owners
#   See singularity.conf: `limit container owners`
# @param limit_container_groups
#   See singularity.conf: `limit container groups`
# @param limit_container_paths
#   See singularity.conf: `limit container paths`
# @param allow_containers
#   See singularity.conf: `allow containers`
# @param autofs_bug_paths
#   See singularity.conf: `autofs bug paths`
# @param always_use_nv
#   See singularity.conf: `always use nv`
# @param root_default_capabilities
#   See singularity.conf: `root default capabilities`
# @param memory_fs_type
#   See singularity.conf: `memory fs type`
# @param cni_configuration_path
#   See singularity.conf: `cni configuration path`
# @param cni_plugin_path
#   See singularity.conf: `cni plugin path`
# @param mksquashfs_path
#   See singularity.conf: `mksquashfs path`
# @param shared_loop_devices
#   See singularity.conf: `shared loop devices`
#
class singularity (
  $package_ensure = 'present',
  $package_name = 'singularity',
  $manage_epel = true,
  $config_path = '/etc/singularity/singularity.conf',
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
  $enable_overlay = 'try',
  $enable_underlay = 'yes',
  $mount_slave = 'yes',
  $sessiondir_max_size = 16,
  $limit_container_owners = 'undef',
  $limit_container_groups = 'undef',
  $limit_container_paths = 'undef',
  $allow_containers = {
    'squashfs' => 'yes',
    'extfs' => 'yes',
    'dir' => 'yes',
  },
  $autofs_bug_paths = 'undef',
  $always_use_nv = 'no',
  $root_default_capabilities = 'full',
  $memory_fs_type = 'tmpfs',
  $cni_configuration_path = 'undef',
  $cni_plugin_path = 'undef',
  $mksquashfs_path = 'undef',
  $shared_loop_devices = 'no',
) {

  if $::osfamily != 'RedHat' {
    fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only support osfamily RedHat")
  }

  contain singularity::install
  contain singularity::config

  Class['singularity::install']
  ->Class['singularity::config']

}
