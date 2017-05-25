#!/bin/bash
#
###################
#-----------------#
# Made by NullDev #
#-----------------#
###################

###################
#-----------------#
#   NGROK  PATH   #
#-----------------#
###################
NG=/your/path/to/ngrok
#-----------------#
###################

###################
#-----------------#
#  PORT TO OPEN   #
#-----------------#
###################
PT=80
#-----------------#
###################

RAW=null
API=null
FST=null
LNK_HTTP=.
LNK_HTTPS=.
sq='"'
lnpref=public_url
prefix="${lnpref}:"
tnl='localhost:4040/api/tunnels'
#COL
C_RED=$(tput setaf 1)
C_GRN=$(tput setaf 2)
C_YLW=$(tput setaf 3)
C_BLE=$(tput setaf 4)
C_RST=$(tput sgr0)
function cls {
	printf "\033c" 
	printf "\e[5t" 
}
function logo {
	printf "\n\n\n"
	printf "    ${C_YLW}╔╗╔╔═╗╦═╗╔═╗╦╔═  ${C_BLE}┌─┐┌┬┐┌─┐┬─┐┌┬┐┌─┐┬─┐${C_RST}\n"
	printf "    ${C_YLW}║║║║ ╦╠╦╝║ ║╠╩╗  ${C_BLE}└─┐ │ ├─┤├┬┘ │ ├┤ ├┬┘${C_RST}\n"
	printf "    ${C_YLW}╝╚╝╚═╝╩╚═╚═╝╩ ╩  ${C_BLE}└─┘ ┴ ┴ ┴┴└─ ┴ └─┘┴└─${C_RST}\n"
	printf "    By ${C_RED}NullDev${C_RST}"
	printf "\n\n\n"
	printf " Loading...\n\n\n"
}
cls
logo
pkill -f ngrok
EXEC=$($NG http $PT >> /dev/null &)
sleep 5s
if ! [ -x "$(command -v curl)" ]; then
	unset API
	API=$(wget -qO - $tnl | awk -F"," -v k=$lnpref '{
		gsub(/{|}/,"")
		for(i=1;i<=NF;i++){
			if ( $i ~ k ){ printf "${i}" }
		}
	}')
else
	unset API
	API=$(curl -s $tnl | awk -F"," -v k=$lnpref '{
		gsub(/{|}/,"")
		for(i=1;i<=NF;i++){
			if ( $i ~ k ){ print $i }
		}
	}')
fi
API=${API//$sq}
API=${API//$prefix}
IFS=$'\n' read -rd '' -a FST <<<"$API"
FST=${FST//http\:\/\/}
sleep 1s
LNK_HTTP="http://${FST}"
LNK_HTTPS="https://${FST}"
printf " ${C_BLE}Status: ${C_GRN}ONLINE${C_RST}\n\n"
printf " ${C_BLE}Link (HTTP):  ${C_YLW}${LNK_HTTP}${C_RST}\n"
printf " ${C_BLE}Link (HTTPS): ${C_YLW}${LNK_HTTPS}${C_RST}\n"
printf "\n Press [ENTER] to leave..."
printf "\n\n\n"
read -p " "
exit 0
