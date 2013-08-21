# Clean

Simple Bash theme for a clean prompt.

### Features

#### Terse 

People put lots of things in your prompt. By default, clean only shows you the
hostname, the name of the present working directory, and whether or not youre in
a git repository. 

![Screenshot 1](/img/screenshot1.png)

Clean uses the default `$` character when you are a non-root user.

#### Git Prompt

When you switch into a git repository, clean will change your prompt.
It displays a `+` character if you're on the master branch.
By default it displays a `*` character if youre *not* on the master branch.

![Screenshot 2](/img/screenshot2.png)

### Installing

Just copy bash\_profile.sh to ~/.bash\_profile

    $ mv ~/.bash_profile ~/.bash_profile.old 
    $ cp bash_profile.sh ~/.bash_profile
