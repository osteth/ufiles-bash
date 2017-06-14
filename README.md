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
The ufilesup command is used to upload a file you your Uploadfiles.io account. 
```sh
$ ufilesup <file to upload>
```
The ufilesdown command is used to download a file from you Uploadfiles.io account. 
```sh
$ ufilesdown <SLUG> <SAVE PATH>
```
ufiles down can be used with or without a save pathe specified. if no save path is specified,the file will be save to the current directory using the slug as the filename. 

License
----

MIT


