vi .bash_aliases
h
source .profile
h
pwd
h
FILE1="WEEK08-REPORT1.txt"
rm    -rf $HOME/RESULT/W08/
mkdir -pv $HOME/RESULT/W08/
cd        $HOME/RESULT/W08/
echo "ZCZC pwd"          > $FILE1
pwd                     >> $FILE1
echo "ZCZC date"        >> $FILE1
date                    >> $FILE1
echo "ZCZC df"          >> $FILE1
df                      >> $FILE1
echo "ZCZC hostnamectl" >> $FILE1
hostnamectl             >> $FILE1
echo "ZCZC chktoken"    >> $FILE1
chktoken hanifahaputriW08     >> $FILE1
cat  $FILE1
echo "Do verifyToken!"
ls -al
LFS=/mnt/lfs
FILE2="$HOME/RESULT/W08/WEEK08-REPORT2.txt"
FILE3="$HOME/RESULT/W08/WEEK08-md5sum.txt"
pushd $LFS/sources
echo "ZCZC md5sum"       > $FILE3
popd
echo "ZCZC df"           > $FILE2
df                      >> $FILE2
echo "ZCZC pwd"         >> $FILE2
pwd                     >> $FILE2
echo "ZCZC date"        >> $FILE2
date                    >> $FILE2
echo "ZCZC hostname"    >> $FILE2
hostname                >> $FILE2
echo "ZCZC chktoken"    >> $FILE2
chktoken hanifahaputriW08     >> $FILE2
ls -al
cat > ~/.bash_profile << "EOF"
# Files .bash_profile

alias cl='clear;echo "";'
alias h='history'
alias sss='. ~/.profile'
export EDITOR=/usr/bin/vi
export HISTSIZE=2000
export HISTFILESIZE=2000
export LFS=/mnt/lfs
export PS1='\u:\w\$ '
export MAKEFLAGS='-j6'
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
EOF

echo "syntax off" > .vimrc
source ~/.bash_profile
echo   "Checking LFS=$LFS"
ls -al $LFS/
su -
echo   "Checking LFS=$LFS"
ls -al $LFS/
cd /tmp
cat > version-check.sh << "EOF"
#!/bin/bash

# Simple script to list version numbers of critical development tools

export LC_ALL=C
bash --version | head -n1 | cut -d" " -f2-4
MYSH=$(readlink -f /bin/sh)
echo "/bin/sh -> $MYSH"
echo $MYSH | grep -q bash || echo "ERROR: /bin/sh does not point to bash"
unset MYSH

echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-
bison --version | head -n1

if [ -h /usr/bin/yacc ]; then
  echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
elif [ -x /usr/bin/yacc ]; then
  echo yacc is `/usr/bin/yacc --version | head -n1`
else
  echo "yacc not found" 
fi

bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2
diff --version | head -n1
find --version | head -n1
gawk --version | head -n1

if [ -h /usr/bin/awk ]; then
  echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";
elif [ -x /usr/bin/awk ]; then
  echo awk is `/usr/bin/awk --version | head -n1`
else 
  echo "awk not found" 
fi

gcc --version | head -n1
g++ --version | head -n1
ldd --version | head -n1 | cut -d" " -f2-  # glibc version

grep --version | head -n1
gzip --version | head -n1
cat /proc/version
m4 --version | head -n1
make --version | head -n1
patch --version | head -n1
echo Perl `perl -V:version`
python3 --version
sed --version | head -n1
tar --version | head -n1
makeinfo --version | head -n1  # texinfo version

xz --version | head -n1

echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ]
  then echo "g++ compilation OK";
  else echo "g++ compilation failed"; fi
rm -f dummy.c dummy
EOF

bash version-check.sh
cd
su -
su -
ls -al $LFS/
wget --continue http://www.linuxfromscratch.org/lfs/view/stable/wget-list
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources
pushd $LFS/sources
  wget --continue http://www.linuxfromscratch.org/lfs/view/stable/md5sums
  md5sum -c md5sums
popd
su -
su -
