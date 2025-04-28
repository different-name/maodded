#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash packwiz

directory="$(pwd)"

mkdir /tmp/maodded-lite
cp -r "$directory/." /tmp/maodded-lite

ls /tmp/maodded-lite

cd /tmp/maodded-lite

grep -rl 'side = "client"' "/tmp/maodded-lite/mods" | while read -r file; do
  rm "$file"
done

rm -r /tmp/maodded-lite/resourcepacks
rm -r /tmp/maodded-lite/shaderpacks

sed -i '1s/\(name = "\([^"]*\)\)"/\1 Lite"/' /tmp/maodded-lite/pack.toml

packwiz refresh
packwiz mr export

ls /tmp/maodded-lite

mv /tmp/maodded-lite/*\ Lite-*.mrpack $directory

cd "$directory"
rm -rf /tmp/maodded-lite