import sys
from Backend import SettingsBackend
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

def main():
    app = QGuiApplication(sys.argv)
    app.setApplicationName("Settings App")
    
    engine = QQmlApplicationEngine()
    engine.addImportPath("qml")
    
    # Create backend instance
    backend = SettingsBackend()
    
    # Expose backend to QML
    engine.rootContext().setContextProperty('backend', backend)

    engine.quit.connect(app.quit)
    engine.load("qml/main.qml")
    
    sys.exit(app.exec())

if __name__ == "__main__":
    main()
