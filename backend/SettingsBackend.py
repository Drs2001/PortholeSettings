from PySide6.QtCore import QObject, Signal, Slot, Property
from SettingsManager import SettingsManager

class SettingsBackend(QObject):
    """Backend class to handle settings logic"""
    
    def __init__(self):
        super().__init__()