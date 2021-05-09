# REV01 Tue 23 Feb 2021 17:23:19 WIB (RMS)
alias cl='clear;echo ""'
alias h='history'  
alias gac='git add -A && git commit'
alias ggg='git pull; git add -A; git commit -m "OS211 cbkadal"; git push;'
alias glog='git log --all --decorate --oneline --graph'
alias mv='mv -i'  
alias rm='rm -i'  
alias sss='. ~/.profile'
# REV01 Mon 05 Oct 2020 09:14:50 AM WIB (RMS)
# START Sat 19 Sep 2020 00:00:00 (RMS)
gitstat() {
   git rev-parse --is-inside-work-tree &> /dev/null
   [ "$?" == "0" ] && git status
   ls -aF
   printf "ZCZC $USER ==== %s ===== PWD:%s\n" "$(date)" $(pwd)
}
# REV02 Mon 05 Oct 2020 07:34:14 AM WIB (RMS)
# REV01 (2020-10-04 07:43 PM UTC+7) Muhamad Yoga Mahendra (aceyoga) 
# START (2020-10-04 03:51 PM UTC+7) Muhamad Yoga Mahendra (aceyoga) 
chktoken() {
    [ -z $1 ] && { 
        echo "Usage: chktoken <token>"
        echo "Example 1) chktoken 0"
        echo "           $(chktoken 0)"
        echo "Example 2) chktoken 1"
        echo "           $(chktoken 1)"
        echo "Example 3) chktoken XXXX"
        echo "           $(chktoken XXXX)"
        echo "Is $USER your GitHub Account?"
        echo "If not, please create a new user name!"
        return 0
    } || [ $1 == 0 ] && {
        echo "0"
        return 0
    } || [ $1 == 1 ] && {
        echo "$USER"
        return 0
    } || {
        STAMP=$(date +%M%S)
        echo "$USER $STAMP-$(echo $STAMP$USER$1 | sha1sum  | cut -c1-4 | tr '[:lower:]' '[:upper:]'  )"
        return 0
    }
}
# REV04 Mon 12 Oct 2020 11:39:44 PM WIB (RMS)
# REV03 Mon Oct  5 09:25:23 WIB 2020 (RMS)
# REV01 (2020-10-04 07:43 PM UTC+7) Muhamad Yoga Mahendra (aceyoga)
# START (2020-10-04 03:51 PM UTC+7) Muhamad Yoga Mahendra (aceyoga)
verifyToken() {
    [ -z $3 ] && {
        echo "verifyToken()"
        echo "Usage: verifyToken TOKEN USER RESULT"
        echo "Or:    verifyToken TOKEN USER RESULT trueFalseMode"
        return 0
    }
    DATE="$(echo $3 | cut -d' ' -f2 | cut -d'-' -f1)"
    SHA="$(echo  $3 | cut -d' ' -f2 | cut -d'-' -f2 )"
    RESULT="$(echo $DATE$2$1 | sha1sum  | cut -c1-4 | tr '[:lower:]' '[:upper:]' )"
    [ $SHA == $RESULT ] && RETURN="1" || RETURN="0"
    [ -z $4 ] && {
        [ "$RETURN" == "1" ] && echo "Verified"  || echo "Error"
    } || {
        echo $RETURN
    }
}
export EDITOR=/usr/bin/vi
export HISTSIZE=2000
export HISTFILESIZE=2000 

