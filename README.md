<h1 align="center">Basic Alert SSH Connection</h1>
<em><h5 align="center">(Programming Language - Shell)</h5></em>

<p align="center">
  <img src="https://img.shields.io/github/stars/Kurama250/Alert_ssh">
  <img src="https://img.shields.io/github/license/Kurama250/Alert_ssh">
  <img src="https://img.shields.io/github/repo-size/Kurama250/Alert_ssh">
  <img src="https://img.shields.io/badge/stability-stable-green">
</p>


# Tutorial to setup this code ! For LINUX (VPS or Dedicated Server)

## 1 - on Terminal

<h5>Manual installer</h5>

```shell script
apt update && apt upgrade -y
apt install curl jq -y
```

```shell script
git clone https://github.com/Kurama250/Alert_ssh.git
cd Alert_ssh/
```
## 2 - on Terminal

```shell script
nano alert.sh
```

- And you also change this line :

```bash
ALLOWED_IPS=("127.0.0.1" "192.168.1.1") # Add your IP WH
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1265070339566600233/YOUR _DISCORD_EMBED"
```

- After doing this, press CTRL + X and you press Y and ENTER then you do the following commands !

## 3 - on Terminal

- Edit this file in 
> (/root/.bashrc) or
> (/root/.zshrc) It all depends on your shell
 - If you do not use root then put it in the base directory in order to add this line in the files that your shell uses !

```shell script
bash /root/alert.sh # If you put it elsewhere then put the access path
```

<h3 align="center">If you like this repository don't hesitate to give it a star ⭐ !</h3>

Licence : [Creative commons](https://creativecommons.org/licenses/by-nc-nd/4.0/deed.en) - CC BY-NC-ND 4.0 by [Kurama250](https://github.com/Kurama250)
