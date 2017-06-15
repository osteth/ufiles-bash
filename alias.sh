
####### Begin Uploadfiles.io api aliases #######

ufile() {
    source ~/ufiles.conf
    if [ "$1" != "" ]; then
        if [ "$1" == "put" ]; then
            if [ "$KEY" != "" ]; then
                if [ "$USER" != "" ]; then
                    if [ "$2" != "" ]; then
                        curl -X POST -F "file=@$2" -F "user_id=$USER" -F "auth_key=$KEY" https://up.uploadfiles.io/upload
                    else
                        echo "No Files was specified for upload"
                        echo "please retry as follows:"
                        echo "ufile put <file to upload>"
                    fi
                else
                    echo "No User was Specified in ~/ufiles.conf"
                    echo "Please Check your configuration and try again."
		fi
            else
                echo "No KEY was Specified in ~/ufiles.conf"
                echo "Please Check your configuration and try again."
            fi
        elif [ "$1" == "get" ]; then
            if [ "$KEY" != "" ]; then
                if [ "$USER" != "" ]; then
                    if [ "$2" != "" ]; then
                         if [ "$3" != "" ]; then
                            curl -u $USER:$KEY -o $3 https://down.uploadfiles.io/get/$2
                        else
                            curl -u $USER:$KEY -o $2 https://down.uploadfiles.io/get/$2
                        fi
                    else
                        echo "No save path was specified."
                        echo "please retry as follows:"
			echo "ufile get SLUG OPTIONAL SAVE PATH"
                    fi
                else
                    echo "No User was Specified in ~/ufiles.conf"
                    echo "Please Check your configuration and try again."
                fi
            else
                echo "No KEY was Specified in ~/ufiles.conf"
                echo "Please Check your configuration and try again."
            fi
        elif [ "$1" == "auth" ]; then
	    if [ "$2" != "" ]; then
                if [ "$3" != "" ]; then
                   cat <<EOT > ~/ufiles.conf #!/bin/bash
                   ##This config file store user credentials for using the ufiles-tools bash aliase.

                   USER=$2
                   KEY=$3
EOT
                else
                    echo "Positional arguemnt USER is empty"
                    echo "Please re-try as follows:"
                    echo "ufile auth USER_ID AUTH_KEY"
                fi
            else
                echo "Positional argument KEY is empty"
                echo "Please re-try as follows:"
                echo "ufile auth USER_ID AUTH_KEY"
            fi
        elif [ "$1" == "--help" ]; then
            echo "Usage: ufile [OPTIONS] COMMAND [ARGS]..."
            echo ""
            echo "This is a command line utility to aid in handling file transfers to and"
            echo "from Uploadfiles.io. Additional information is avilable at"
            echo "https://github.com/osteth/ufile-tools/"
            echo ""
            echo "Options:"
            echo "--help  Show this message and exit."
            echo ""
            echo "Commands:"
            echo "put    Upload a file to Uploadfiles.io"
            echo "get    Download a file from Uploadfiles.io"
            echo "auth   Change your user credentials."
        fi
    else
        echo "fail"
    fi
}

####### End Uploadfiles.io api aliases #######

