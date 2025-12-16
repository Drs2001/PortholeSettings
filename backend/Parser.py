from pathlib import Path
from .settingsmodels.DisplayModel import DisplayModel

class Parser():
    def parse_file(settingsPath):
        filepath = Path(settingsPath).expanduser()
        # TODO: If the file isn't found(which shouldn't happen if hyprland is running but whatever) then we create the directory and a default settings file
        if not filepath.exists():
            raise FileNotFoundError(f"Config file not found: {filepath}")
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        display = DisplayModel()
        section = ""
        for line in content.split("\n"):
            if line[:1] == "#":
                section = line.strip()
            else:
                match section:
                    case "#DISPLAY":
                        display.add_monitor(line)
                    case "#WALLPAPER":
                        print("WALLPAPER")
                    case "#INPUT":
                        print("INPUT")
                    case _:
                        print("NONE")
        
        for monitor in display.monitors:
            print(monitor.id)