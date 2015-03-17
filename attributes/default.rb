default[:nvm] = {
  :action           => :sync,
  :installsh        => "https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh",
  :install_path     => "/usr/local/nvm",
  :repo_uri         => "https://github.com/creationix/nvm",
  :revision         => "master",
  :user             => "root",
  :group            => "root",
  :depth            => nil,
  :destination      => nil,
  :enable_checkout  => nil,
  :enable_submodule => nil,
  :provider         => nil,
  :remote           => nil,
  :ssh_wrapper      => nil,
  :timeout          => nil,
  :install_versions => [],
}

default[:nvm][:versions_path]     = "#{node[:nvm][:install_path]}/versions"
