#!/bin/bash
# Create by Kurama250 - github.com/Kurama250 - Licence : CREATIVE COMMONS LICENSE (CC BY-NC-ND 4.0)

ALLOWED_IPS=("127.0.0.1" "192.168.1.1")
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1265070339566600233/YOUR _DISCORD_EMBED"
IPINFO_API_URL="https://ipinfo.io"

get_ip_info() {
  local ip=$1
  curl -s "${IPINFO_API_URL}/${ip}/json"
}

send_discord_alert() {
  local ip=$1
  local time=$2
  local ip_info=$3
  
  local city=$(echo "$ip_info" | jq -r '.city')
  local region=$(echo "$ip_info" | jq -r '.region')
  local country=$(echo "$ip_info" | jq -r '.country')
  local org=$(echo "$ip_info" | jq -r '.org')

  curl -H "Content-Type: application/json" \
       -X POST \
       -d "{\"embeds\": [{\"title\": \"Alert SSH Connection\", \"description\": \"**An unauthorized SSH connection was detected !**\", \"fields\": [{\"name\": \"**IP Address**\", \"value\": \"$ip\", \"inline\": true}, {\"name\": \"**Connection time**\", \"value\": \"$time\", \"inline\": true}, {\"name\": \"**City**\", \"value\": \"$city\", \"inline\": true}, {\"name\": \"**Region**\", \"value\": \"$region\", \"inline\": true}, {\"name\": \"**Country**\", \"value\": \"$country\", \"inline\": true}, {\"name\": \"**Operator**\", \"value\": \"$org\", \"inline\": true}], \"color\": 15158332}]}" \
       "$DISCORD_WEBHOOK_URL"
}

if [[ -n "$SSH_CONNECTION" ]]; then
  USER_IP=$(echo "$SSH_CONNECTION" | awk '{print $1}')
  CONNECTION_TIME=$(date +"%Y-%m-%d %H:%M:%S")

  IP_AUTHORIZED=false
  for allowed_ip in "${ALLOWED_IPS[@]}"; do
    if [[ "$USER_IP" == "$allowed_ip" ]]; then
      IP_AUTHORIZED=true
      break
    fi
  done

  if [ "$IP_AUTHORIZED" = false ]; then
    IP_INFO=$(get_ip_info "$USER_IP")
    send_discord_alert "$USER_IP" "$CONNECTION_TIME" "$IP_INFO"
  fi
fi
