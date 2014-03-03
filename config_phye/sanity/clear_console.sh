#!/usr/bin/expect
proc clear_port {ip port passwd} {
    set cmd "clear line"

    spawn telnet $ip
    expect "Password:"
    send "$passwd\r"
    expect "#"
    sleep 1

    send "$cmd $port\r"
    expect "\[confirm\]"
    send "y\r"

    send "$cmd $port\r"
    expect "\[confirm\]"
    send "y\r"

    send "quit\r"
    expect eof
}

proc is_port_cleared {ip port} {
    spawn telnet $ip $port
    expect {
        "Connection refused" {
            return 0
        }
        "Escape character is '^]'" {
            sleep 2
            send "\r"
            expect {
                Username: {
                    puts "\nNormal IS logging prompt"
                    sleep 1
                }
                Password: {
                    puts "\nPassword prompt, send empty to restart logging"
                    send "\r"
                    expect "Login incorrect"
                    sleep 1
                    expect Username:
                }
                "Login incorrect" {
                    puts "\nPrevious loggin failed, restart logging"
                    sleep 1
                    expect Username:
                }
                -re {[-A-Za-z0-9]*#} {
                    puts "\nAlready logged in, log out"
                    send "exit\r"
                    expect "Press RETURN to get started!"
                    sleep 1
                }
            }
            send "\x1d\r"
            expect "telnet>"
            send "quit\r"
            expect EOF
            return 1
        }
    }
    return 0
}

proc free_port { ip port passwd dev_name} {   
    set base_port 2000
    set i 1
    set max_retry 5
    clear_port $ip [expr {$port - $base_port}] $passwd
    set cleared [is_port_cleared $ip $port]
    while {$cleared == 0} {
        clear_port $ip [expr {$port - $base_port}] $passwd
        set cleared [is_port_cleared $ip $port]
        set i [expr {$i + 1}]
        if {$i >= $max_retry} {
            break
        }
    }
    if {$cleared == 0} {
        puts "================================================================"
        puts "Failed to clear console port $ip:$port for $dev_name"
        puts "================================================================"
    }
    if {$cleared == 1} {
        puts "================================================================"
        puts "Succeeded in clearing console port $ip:$port for $dev_name"
        puts "================================================================"
    }
}

set tb [lindex $argv 0]
puts "################################################################"
puts "########  Start releasing console port for tb$tb...  #############"
puts "################################################################"
set start_time [ exec date -u ]
puts "\nStarting at $start_time "
if {$tb == "1"} {
    free_port "10.74.7.251" "2004" "crdc" "tb1.cdsm" 
    free_port "10.74.7.251" "2005" "crdc" "tb1.sr" 
    free_port "10.74.7.251" "2007" "crdc" "tb1.se1" 
    free_port "10.74.7.251" "2008" "crdc" "tb1.se2" 
}
if {$tb == "2"} {
    free_port "10.74.61.8" "2017" "crdc" "tb2.cdsm" 
    free_port "10.74.61.11" "2005" "crdc" "tb2.sr" 
    free_port "10.74.61.11" "2006" "crdc" "tb2.se1" 
    free_port "10.74.61.39" "2006" "crdc" "tb2.se2" 
}

set end_time [ exec date -u ]
puts "Ending at $end_time\n"
puts "################################################################"
puts "########  Finish releasing console port for tb$tb...  ############"
puts "################################################################"
