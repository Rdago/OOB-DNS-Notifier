# OOB-DNS-Notifier
Sends Telegram Message if the targeted DNS Query is made. 

This Tool is very useful as it replaces the Excel-Sheets and manual grepping of the named.log file on your Bind-Server. You can inject payloads with IDs and describe the payload-place in a single file. If the Payload is ever executed you get an telegram message on your Telegram. I Hope no one ever misses a XXE or SSRF Bug anymore. :)  


**File for Grepping**

```
133701-xxe yahoo.com/upload#01.01.2020
133742-ssrf foo.bar/upload#01.02.2020
```

## Installation 

1. git clone [repo-url.git]
1. Set up your own Telegram bot with the help of @Botfather 
1. Fill in the Chat-ID, Bot ID and where the File for Grepping is place 
1. put this skript into your crontab like so: 
```
@reboot /bin/bash /path/to/skript/monitor.sh
```

## How to Setup Telegram-Bot?

[This](https://www.freecodecamp.org/news/telegram-push-notifications-58477e71b2c2/) Tutorial is very good at explaining it. 

## How to Setup Own OOB-Server?

Look at this automated Skript on [GitHub](https://github.com/JuxhinDB/OOB-Server)
