import glob
from pathlib import Path
from main.utils import load_plugins
import logging
from . import bot
import os
from telegram.ext import Updater, CommandHandler, MessageHandler, Filters
PORT = int(os.environ.get('PORT'))



logging.basicConfig(format='[%(levelname) 5s/%(asctime)s] %(name)s: %(message)s',
                    level=logging.WARNING)





path = "main/plugins/*.py"
files = glob.glob(path)
for name in files:
    with open(name) as a:
        patt = Path(a.name)
        plugin_name = patt.stem
        load_plugins(plugin_name.replace(".py", ""))

#Don't be a thief 
print("Successfully deployed!")
print("By MaheshChauhan • DroneBots")


if __name__ == "__main__":
        # Start the Bot
    updater.start_webhook(
        listen="0.0.0.0",
        port=int(PORT),
        url_path=TOKEN,
        webhook_url='https://yourherokuappname.herokuapp.com/' + TOKEN
    )
    bot.run_until_disconnected()
    
    
