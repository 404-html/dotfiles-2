# Install a svn mirror repo in gitlab
name= ;sudo -u git subgit configure http://localhost:9000/svn/$name $name.git; sudo -u git cp -f passwd $name.git/subgit/passwd; sudo -u git subgit install $name.git
