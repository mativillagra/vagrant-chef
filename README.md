# vagrant-chef

This space is used to learn to write chef cookbooks using chef solo on a virtual box machine OS Ubuntu 12.04 i386. 

# Installation

Provide code examples and explanations of how to get the project.

# Notes

Chef uses Erubis as its template language. It allows embedding pure Ruby code inside special symbols inside your templates.

You use <%= %> if you want to print the value of a variable or Ruby expression into the generated file. 

You use <%- %> if you want to embed Ruby logic into your template file. We used it to loop our expression four times.

When you use the template resource, Chef makes all the variables you pass in available as instance variables 
when rendering the template. We used @hi , @world , and @from in our earlier example.




