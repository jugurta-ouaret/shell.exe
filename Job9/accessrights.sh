fichier="/home/colo/Musique/Shell_Userlist.csv"

log_file="$(dirname "$csv_file")/user_creation.log"

last_modification=$(stat -c %Y "$csv_file")
previous_modification=$(cat "$log_file" 2>/dev/null)

if [ -z "$previous_modification" ] || [ "$last_modification" -gt "$previous_modification" ]; then
    rm -f "$log_file"

while IFS=',' read -r Role Prenom Nom Mdp; do

Role=$(echo "$Role" | tr -d '[:space:]')
Prenom=$(echo "$Prenom" | tr -d '[:space:]')
Nom=$(echo "$Nom" | tr -d '[:space:]')
Mdp=$(echo "$Mdp" | tr -d '[:space:]')
if [ -n "$Role" ] && [ -n "$Prenom" ] && [ -n "$Nom" ] && [ -n "$Mdp" ]; then
    if [ "$Role" = "Admin" ]; then
      sudo useradd -m -s /bin/bash -G sudo "$Prenom$Nom" && echo "$Prenom$Nom:$Mdp" | sudo chpasswd
    else
      sudo useradd -c "$Prenom$Nom" -m -s /bin/bash "$Prenom$Nom"
      echo "$Prenom$Nom:$Mdp" | sudo chpasswd
    fi
  fi
done < "$fichier"

echo "$last_modification" > "$log_file"
