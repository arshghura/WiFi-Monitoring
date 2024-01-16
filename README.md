# WiFi-Monitoring
Monitor your Wifi to see if there's unauthorized connection has been set up.
The idea behind this project is to do an ARP-SCAN on your network and create a list of MAC addresses that are returned, whenever there is a new Mac address found (which is not there in the list) a push notification is sent out.

Requirements:
- Any Linux device (I am using Kali Linux on a Raspberry Pi) [you can apply the same logic to write a shell script]
- ARP-SCAN package
- NTFY server

Follow the following simple steps.
- first, create a notification mechanism, go to [ https://ntfy.sh/ ] and create an account.
- log in to your account and create a topic which you want to subscribe to
- Alternatively, download ntfy app from Android or Apple app store
- open the app and you may find a '+' icon to add a subscription topic. give any name and create a topic.

- now, configure your device
- Boot your device and create a bash file, copy arp.sh into your home directory.
- check if you have the ARP-SCAN package run [arp-scan -h] if nothing is returned run [sudo apt-get install arp-scan] to install the package.
- create a text file (give it any name and copy the file path)
- edit the arp.sh file and change the file path with the file path that you have created in the previous step.
- change the interface with the interface yo9u are connected to.
- edit line 17, change the subscribed topic ( ntfy.sh/New_Device ) with your topic.
- to run and see this working remove the # from line 16 and save the file (remember to put # back when you are running this script when the device boots up).
- give execution permission by [chmod +x arp.sh]
- execute the shell script by ./arp.sh in the terminal and see the results. these are the current MAC address of the devices in your network.

 that's it, you are pretty much ready to test this.
 when you run the script, you will get a push notification on your phone with all the MAC addresses that are present in the network

 ** The best practice is to reset your access point/router or change the password, and Raspberry-pi (or any device where you are running the scan) being the first and only device in the network/interface.

 now you are ready to monitor, when you share your WiFi with someone you know you will get notified so you can ignore that but if you have not shared your password and you are getting notified that is a red light. change your password as soon as possible.

 **NOTE** in case your wifi is hacked and you been notified and you have changed the password, do not forget to refresh the list of MAC address, otherwise you will not get notified is same device breaks your wifi again.

 Thank you
