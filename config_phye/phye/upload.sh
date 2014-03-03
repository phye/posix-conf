#!/bin/bash
FTPIP="10.74.61.154"
FTPBASEDIR="/pub2/phye"
user="ftp"
passwd="ftp"
filename=$1

if [ ! -f $filename ]; then
    echo "File not found,exiting"
    exit
fi

case $filename in 
    *.bin)
	FTPEXTDIR="private_image"
	;;
    *.diff)
	FTPEXTDIR="diffs"
	;;
    *.tar|*.bz2|*.gz|*.zip|*.rar)
	FTPEXTDIR="tars"
	;;
    *.iso)
	FTPEXTDIR="isos"
	;;
    *.pcap)
	FTPEXTDIR="pcaps"
	;;
    *.log)
	FTPEXTDIR="logs"
	;;
    *.sh)
	FTPEXTDIR="sh"
	;;
    *)
	FTPEXTDIR=""
	;;
esac
    
FTPDIR="$FTPBASEDIR/$FTPEXTDIR"
echo "Uploading $filename to $FTPDIR"

lftp -e "open $FTPIP; cd $FTPDIR; put $filename; exit"

echo "Uploading finished"

