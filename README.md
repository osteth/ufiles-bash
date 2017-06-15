# BASH aliases for Uploadfiles.io

[![Uploadfiles.io](https://i.imgur.com/7mRrOkc.png)](https://uploadfiles.io)

ufiles-bash is an install script that will add fuctions to your .bash_aliases file that allow for easy command line use of the Uploadfiles.io API.

# Features:
  - Pure Bash solution 
  - Requires only Curl to work making it a great solution for ultra light weight servers.
  - Easy Install
  - Easy Interactions with Uploadfiles.io
  - POSIX compliant
  - Uses a config file for managing user credentials

##  Installation

ufiles-bash requires libCURL to run.
```
apt-get install curl
```
### Install instructions

```sh
$ git clone https://github.com/osteth/ufiles-bash.git
$ cd ufiles-bash
$ chmod +x install.sh
$ install.sh <USER ID> <AUTH KEY>
$ source ~/.bahsrc
```
Uploadfiles.io Business plan users can find their USER ID and AUTH KEY in their Uploadfiles.io dashboard.

### Usage
The ufile put command is used to upload a file you your Uploadfiles.io account. 
```sh
$ ufile put <file to upload>
```
The ufile get command is used to download a file from you Uploadfiles.io account. 
```sh
$ ufile get <SLUG> <OPTIONAL SAVE PATH>
```
ufile get can be used with or without a save pathe specified. if no save path is specified,the file will be save to the current directory using the slug as the filename. 


The ufile auth command is used to change your credentials. 
```sh
$ ufile auth <USER ID> <AUTH KEY>
```
Additionally this allows you the freedom to set up the credential config without running the install script.  This is included to ensure mobility of the ~/.bash_aliases file for users that regularly transfer their aliases from machine to machine. 
License
----

MIT


