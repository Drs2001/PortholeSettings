class DisplayModel():
    """
        A class used to represent the display settings avaliable in hyprland

        ...

        Attributes
        ----------
        monitors : list(Monitors)
            List of monitors in the hyprland settings
    """
    def __init__(self):
        self.monitors = []
    
    def add_monitor(self, monitor):
        """Adds a monitor to the array

        Parameters
        -------
        monitor: str
            String from hyprland config of a monitor ex: monitor=DP-1,1920x1080@144,0x0,1
        """

        if not (len(monitor) > 8):
            return
        trimmed = monitor[8:]
        values = trimmed.split(",")
        if len(values) != 4:
            return
        
        id = values[0]
        res_split = values[1].split("@")
        if len(res_split) != 2:
            return
        resolution = res_split[0]
        refresh_rate = res_split[1]
        position = values[2]
        scale = values[3]

        self.monitors.append(Monitor(id, resolution, refresh_rate, position, scale))

class Monitor():
    """
        A class used to represent a monitor from the hyprland settings config file

        ...

        Attributes
        ----------
        id : string
            The identifier for the monitor, i.e DP-1
        resolution : str
            The resolution of the monitor, i.e 1920x1080
        refresh_rate : str
            The monitors refreshrate
        position : str
            The monitors position relative to the other monitors
        scale : str
            The set scale of the monitor
    """

    def __init__(self, id, resolution, refresh_rate, position, scale):
        self.id = id
        self.resolution = resolution
        self.refresh_rate = refresh_rate
        self.position = position
        self.scale = scale