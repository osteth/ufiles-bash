#!/bin/bash
if [ "$1" != "" ]; then
    if [ "$2" != "" ]; then 
cat <<EOT > ~/ufiles.conf
#!/bin/bash
##This config file store user credentials for using the ufiles-tools bash aliase.
USER=$1 
KEY=$2 
EOT

cat alias.sh >> ~/.bash_aliases

    else
        echo "Positional arguemnt USER is empty"
        echo "Please re-run as follows:"
        echo "install.sh <USER> <KEY>"
    fi else
    echo "Positional argument KEY is empty"
    echo "Please re-run as follows:"
    echo "install.sh <USER> <KEY>"
fi
