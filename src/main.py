import os
from fastapi import FastAPI
from src.env import config

MODE = config("MODE", default = "testing")

app = FastAPI()

@app.get("/")
def home_page():
    return{"Hello": "World", "mode": MODE}