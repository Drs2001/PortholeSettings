from PySide6.QtCore import QObject, Signal, Slot, Property

class SettingsBackend(QObject):
    """Backend class to handle settings logic"""

    themeChanged = Signal(str)
    
    def __init__(self):
        super().__init__()
        self._theme = "THEME"

    # Getter for the Property
    def get_theme(self):
        return self._theme
    
    # Setter for the Property
    def set_theme(self, value):
        if self._theme != value:
            self._theme = value
            self.themeChanged.emit(value)  # Emit signal when changed
    
    # Qt Property definition
    theme = Property(str, get_theme, set_theme, notify=themeChanged)