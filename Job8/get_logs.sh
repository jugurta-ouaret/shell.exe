backup='Backup'
mkdir -p "$backup"
nbrco=$(last)
date=$(date +'%d-%m-%Y-%H:%M')
nomdufile="number_connection-$date"
echo "$nbrco" > "$backup/$nomdufile"
tar -cvf "$backup/$nomdufile.tar" "$backup/$nomdufile"
