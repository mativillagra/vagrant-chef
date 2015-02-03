# vagrant-chef

This space is used to learn to write chef cookbooks using chef solo on a virtual box machine OS Ubuntu 12.04 i386. 

Please read https://docs.chef.io/chef_why.html

# Installation

Provide code examples and explanations of how to get the project.

1. Virtualbox Version: 4.3.20-96996~Debian~wheezy

2. Guest Additions Version: 4.2.0

3. vagrant --version 1.7.2

4. Chef solo 12.0.3

# Notes

Chef uses Erubis as its template language. It allows embedding pure Ruby code inside special symbols inside your templates.

You use <%= %> if you want to print the value of a variable or Ruby expression into the generated file. 

You use <%- %> if you want to embed Ruby logic into your template file. We used it to loop our expression four times.

When you use the template resource, Chef makes all the variables you pass in available as instance variables 
when rendering the template. We used @hi , @world , and @from in our earlier example.

Tip

Whenever possible, try using attributes instead of hardcoding values in your recipes.

Tip

It's usually a good idea to add a comment at the top of your configuration file, saying it is managed by Chef, to avoid accidental changes.

#Issues 

Guest Additions Version: 4.2.0
VirtualBox Version: 4.3

The guest additions on this VM do not match the installed version of VirtualBox! In most cases this is fine,
but in rare cases it can prevent things such as shared folders from working properly. If you see 
shared folder errors, please make sure the guest additions within the virtual machine match the
version of VirtualBox you have installed on your host and reload your VM.

Solution: From your project directory : rm .vagrant/machines/default/virtualbox/synced_folders 

vagrant reload --provision 

https://github.com/mitchellh/vagrant/issues/5199 


#Plugin Used 

$ vagrant plugin list

vagrant-aws (0.6.0)
vagrant-share (1.1.3, system)




