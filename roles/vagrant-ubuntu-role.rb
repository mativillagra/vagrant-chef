# roles/vagrant-ubuntu-role.rb
name "vagrant-ubuntu-role"
description "Base role for Vagrant Ubuntu instances" 
run_list "recipe[vim]", 
         "recipe[curl]", 
         "recipe[apache2]",
         "recipe[git]",
         "recipe[motd]",
         "recipe[atri]",
         "recipe[ghost]",
         "recipe[apt]"
      
