echo;
echo "* * * * * * * * * * *";
echo "* welcome to devbox *";
echo "* * * * * * * * * * *";
echo;
echo "user: $(whoami)";
echo "cwd: $(pwd)";
echo;

# source mounted bash profile if exists
if [ -f ~/.bash_profile ]; then source ~/.bash_profile; fi

/bin/bash