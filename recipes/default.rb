package "git"
package "curl"

git node[:nvm][:install_path] do
  action           node[:nvm][:action]
  repository       node[:nvm][:repo_uri]
  revision         node[:nvm][:revision]
  depth            node[:nvm][:depth]            unless node[:nvm][:depth].nil?
  destination      node[:nvm][:destination]      unless node[:nvm][:destination].nil?
  enable_checkout  node[:nvm][:enable_checkout]  unless node[:nvm][:enable_checkout].nil?
  enable_submodule node[:nvm][:enable_submodule] unless node[:nvm][:enable_submodule].nil?
  user             node[:nvm][:user]             unless node[:nvm][:user].nil?
  group            node[:nvm][:group]            unless node[:nvm][:group].nil?
  provider         node[:nvm][:provider]         unless node[:nvm][:provider].nil?
  remote           node[:nvm][:remote]           unless node[:nvm][:remote].nil?
  ssh_wrapper      node[:nvm][:ssh_wrapper]      unless node[:nvm][:ssh_wrapper].nil?
  timeout          node[:nvm][:timeout]          unless node[:nvm][:timeout].nil?
end

bash "install nvm" do
  creates node[:nvm][:install_path]
  code    <<-EOC
curl -s -L #{node[:nvm][:installsh]} | NVM_DIR=#{node[:nvm][:install_path]} bash 
EOC
end

directory node[:nvm][:versions_path] do
  owner  node[:nvm][:user]
  group  node[:nvm][:user]
  mode   0755
end

node[:nvm][:install_versions].each do |nvm|
  source_option = nvm[:source] ? "-s" : ""
  bash "install nvm #{nvm[:version]}" do
    creates "#{node[:nvm][:versions_path]}/#{nvm[:version]}"

    code    <<-EOC
source #{node[:nvm][:install_path]}/nvm.sh
NVM_DIR=#{node[:nvm][:versions_path]} nvm install #{source_option} #{nvm[:version]}
EOC
  end
end
