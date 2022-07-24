import glob
from pathlib import Path
from main.utils import load_plugins
import logging
from . import bot
from fastapi import FastAPI
import time
# from getdata import get_data
app = FastAPI()
import requests
import uvicorn
from os import environ

PORT = int(environ.get("PORT"))

logging.basicConfig(format='[%(levelname) 5s/%(asctime)s] %(name)s: %(message)s',
                    level=logging.WARNING)

@app.get("/")
def read_root():
    return {"Hello": "World"}



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
    uvicorn.run(app, host="0.0.0.0", port=PORT)  
    bot.run_until_disconnected()
    
    
