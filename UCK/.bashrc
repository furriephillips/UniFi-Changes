#
## Persistent and helpful history
#
HISTFILE=~/.bash_history
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F_%T '
shopt -s cmdhist
shopt -s histappend
PROMPT_COMMAND='history -a'

#
## Where Is My F'ing Prompt
#
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    UserColour="\e[0;34m"
    SeperatorColour="\e[0;35m"
    HostColour="\e[0;32m"
    PWDColour="\e[0;37m"
    TimeColour="\e[0;33m"
    UptimeColour="\e[0;36m"
    ResetColour="\e[0m"
    PS1="
\[${ResetColour}\][\[${TimeColour}\]\D{%A %d %B %Y @ %T %Z}\[${ResetColour}\]]
\[${ResetColour}\][\[${UptimeColour}\]`uptime | cut -c11- | sed -e 's/  / /g'`\[${ResetColour}\]]
${debian_chroot:+($debian_chroot)}\[${UserColour}\]\u\[${SeperatorColour}\]@\[${HostColour}\]\h\[${SeperatorColour}\]:\[${PWDColour}\]\w\[${ResetColour}\]
\[${SeperatorColour}\]\$\[${ResetColour}\] "
    PS2="\[${SeperatorColour}\]>\[${ResetColour}\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#
## Personal aliases
#
alias e=exit
alias c=clear
alias h=history
alias ll='ls -lah'
alias sho=show
alias grep='grep --color=auto'alias upgrade='echo -e "\nFrom: https://help.ubnt.com/hc/en-us/articles/216655518-UniFi-How-to-Manually-Change-the-Cloud-Key-s-Controller-Version-via-SSH\n\ncd /tmp\nwget https://www.ubnt.com/downloads/unifi/__VERSION__/unifi_sysvinit_all.deb\ndpkg -i unifi_sysvinit_all.deb\nrm unifi_sysvinit_all.deb\ncd"'
alias validatejson='python -m json.tool /srv/unifi/data/sites/SolarCentral/config.gateway.json'

