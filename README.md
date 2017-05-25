# Ngrok Starter
Bash script to start ngrok on a given port and display the URL's to it
<br><br>
This script is able to start NGROK (https://ngrok.com/) and display the URL's to the Public Tunnels

## How to use:

Clone this repository:

&nbsp;&nbsp;&nbsp;&nbsp;$ `git clone https://github.com/NLDev/ngrok-starter.git && cd ngrok-starter` 

Make the script executable:

&nbsp;&nbsp;&nbsp;&nbsp;$ `chmod +x ngrok.sh` 

Edit the script in your favourite editor (for example **nano** or **gedit**)

&nbsp;&nbsp;&nbsp;&nbsp;$ `nano ngrok.sh` 

Then set the path where the ngrok binary is located, at:

&nbsp;&nbsp;&nbsp;&nbsp;`NG=/your/path/to/ngrok`

If you want to open another port other than 80, set it here:

&nbsp;&nbsp;&nbsp;&nbsp;`PT=80`

Run it:

&nbsp;&nbsp;&nbsp;&nbsp;$ `./ngrok.sh` 

Thats it!
