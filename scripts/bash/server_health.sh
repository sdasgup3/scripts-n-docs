URL=$1
echo $URL

if ping -c 5 $URL; then
    echo "$URL:server live"
else
    echo "$URL:server down"
fi
