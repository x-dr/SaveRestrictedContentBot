from fastapi import FastAPI
import time
# from getdata import get_data
app = FastAPI()
import requests
import uvicorn
from os import environ


PORT = int(environ.get("PORT"))


@app.get("/")
def read_root():
    return {"Hello": "World"}

def runweb():
    uvicorn.run(app, host="0.0.0.0", port=PORT)





runweb()

