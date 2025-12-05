import sys
from Backend import SettingsBackend
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

def main():
    app = QGuiApplication(sys.argv)
    app.setApplicationName("Settings App")
    app.setOrganizationName("Drs2001")
    
    engine = QQmlApplicationEngine()
    
    # Create backend instance
    backend = SettingsBackend()
    
    # Expose backend to QML
    engine.rootContext().setContextProperty("backend", backend)
    
    # Load QML file
    qml_file = Path(__file__).parent / "main.qml"
    engine.load(qml_file)
    
    if not engine.rootObjects():
        sys.exit(-1)
    
    sys.exit(app.exec())

if __name__ == "__main__":
    main()
