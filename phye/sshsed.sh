echo "Removing $1"
echo "Before Removing..."
sed -n "/$1/p" ~/.ssh/known_hosts

echo "Removing..."
sed "/$1/d" -i ~/.ssh/known_hosts

echo "After Removing..."
sed -n "/$1/p" ~/.ssh/known_hosts
