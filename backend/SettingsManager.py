from .settingsmodels.DisplayModel import DisplayModel
from .Parser import Parser

class SettingsManager():
    def __init__(self):
        Parser.parse_file("~/.config/hypr/Settings.conf")