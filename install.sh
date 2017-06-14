#!/bin/bash

if [ "$1" != "" ]; then
    if [ "$2" != "" ]; then
cat <<EOT > ~/ufiles.conf
#!/bin/bash
##This config file store user credentials for using the ufiles-tools bash aliase.

USER=$1
KEY=$2
EOT

cat <<EOT >>~/.bash_aliases

####### Begin Uploadfiles.io api aliases #######
ufilesup() {
    source ~/ufiles.conf
    if [ "\$KEY" != "" ]; then
        if [ "\$USER" != "" ]; then
            if [ "\$1" != "" ]; then
                curl -X POST -F "file=@\$1" -F "user_id=\$USER" -F "auth_key=\$KEY" https://up.uploadfiles.io/upload
            else
                echo "No Files was specified for upload"
                echo "please retry as follows:"
                echo "ufilesup <file to upload>"
            fi
        else
            echo "No User was Specified in ~/ufiles.conf"
            echo "Please Check your configuration and try again."
        fi
    else
        echo "No KEY was Specified in ~/ufiles.conf"
        echo "Please Check your configuration and try again."
    fi
}

ufilesdown() {
    source ~/ufiles.conf
    if [ "\$KEY" != "" ]; then
        if [ "\$USER" != "" ]; then
            if [ "\$1" != "" ]; then
                 if [ "\$2" != "" ]; then
                    curl -u \$USER:\$KEY -o \$2 https://down.uploadfiles.io/get/\$1
                else
                    curl -u \$USER:\$KEY -o \$1 https://down.uploadfiles.io/get/\$1
                fi
            else
                echo "No save path was specified."
                echo "please retry as follows:"
                echo "ufilesdown <SAVE PATH> <SLUG>"
            fi
        else
            echo "No User was Specified in ~/ufiles.conf"
            echo "Please Check your configuration and try again."
        fi
    else
        echo "No KEY was Specified in ~/ufiles.conf"
        echo "Please Check your configuration and try again."
    fi
}
EOT

####### End Uploadfiles.io api aliases #######

    else
        echo "Positional arguemnt USER is empty"
        echo "Please re-run as follows:"
        echo "install.sh <USER> <KEY>"
    fi

else
    echo "Positional argument KEY is empty"
    echo "Please re-run as follows:"
    echo "install.sh <USER> <KEY>"
fi

