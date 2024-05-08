#!/usr/bin/expect
proc configure_cde { hostname pint ip mask router } {
    set config_str "config)#"
    set config_if_str "config-if)#"
    set interface_str "gigabitEthernet"
    send "configure\r"
    expect "$config_str"
    send "hostname $hostname\r"
    expect "$config_str"
    sleep 1
    send "interface $interface_str $pint/0\r"
    expect "$config_if_str"
    send "ip addr $ip $mask\r"
    expect "$config_if_str"
    send "exit\r"
    sleep 1
    expect "$config_str"
    send "ip default-gateway $router\r"
    expect "$config_str"
    send "primary-interface $interface_str $pint/0\r"
    expect "$config_str"
    send "end\r"
    expect "$hostname#"
    send "write\r"
    sleep 1
}

proc exit_config_cde {} {
    send "exit\r"
    sleep 2
    expect "started!"
    send "\x1d\r"
    
    expect "telnet>"
    send "close\r"
    expect EOF
    puts "============================================"
    puts "Configuring finished,exiting..."
    puts "============================================"
}

for { set i 1 } { $i < 5 } { incr i 1 } {
    switch -exact $i {
	1 { #cdsm
    	    set cde_user "admin"
	    set cde_passwd "default"
    	    set cde_console_ip "10.74.7.251"
    	    set cde_console_port "2004"
    	    set cde_hostname "cdsm"
    	    set cde_pint "1"
    	    set cde_ip "10.74.7.111"
    	    set cde_mask "255.255.255.0"
    	    set cde_router "10.74.7.1"
    	}
	2 { #sr 
    	    set cde_user "admin"
    	    set cde_passwd "default"
    	    set cde_console_ip "10.74.7.251"
    	    set cde_console_port "2005"
    	    set cde_hostname "sr"
    	    set cde_pint "1"
    	    set cde_ip "10.74.7.112"
    	    set cde_mask "255.255.255.0"
    	    set cde_router "10.74.7.1"
    	}
	3 { #CA
	    set cde_user "admin"
	    set cde_passwd "default"
	    set cde_console_ip "10.74.7.251"
	    set cde_console_port "2007"
	    set cde_hostname "se1"
	    set cde_pint "1"
	    set cde_ip "10.74.7.113"
	    set cde_mask "255.255.255.0"
	    set cde_router "10.74.7.1"
	}
	4 { #Edge
	    set cde_user "admin"
	    set cde_passwd "default"
	    set cde_console_ip "10.74.7.251"
	    set cde_console_port "2008"
	    set cde_hostname "se2"
	    set cde_pint "1"
	    set cde_ip "10.74.7.114"
	    set cde_mask "255.255.255.0"
	    set cde_router "10.74.7.1"
	} 
    }
    puts "============================================"
    puts "Configuring $cde_hostname"
    puts "============================================"
    spawn telnet $cde_console_ip $cde_console_port
    expect "Escape character is '^]'"
    sleep 1
    send "\r"
    sleep 1
    expect {
	"Username:"
    	{
    	    send "$cde_user\r"
    	    expect "Password:"
    	    send "$cde_passwd\r"
    	    exp_continue
    	}
    	"NO-HOSTNAME#"
    	{
    	    configure_cde  $cde_hostname \
    		$cde_pint \
    		$cde_ip \
    		$cde_mask \
    		$cde_router
    	    exit_config_cde
    	}
	"$cde_hostname#"
	{
	    exit_config_cde
	}
    }
    sleep 2
}

exit
