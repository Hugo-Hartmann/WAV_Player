#############################
### Python code for handling Dynamic Plot
### Created     2020-07-24
### Last update 2020-07-24
### Author      Hugo HARTMANN
#############################

## Library imports
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure

class MplCanvas(FigureCanvas):

    def __init__(self, parent=None, width=5, height=4, dpi=100):
        fig = Figure(figsize=(width, height), dpi=dpi)
        self.axes = fig.subplots(2)
        for ax in self.axes:
            ax.get_xaxis().set_visible(False)
            ax.get_yaxis().set_visible(False)
        self.axes[0].set_ylim([0, 255])
        self.axes[1].set_ylim([0, 1000])
        super(MplCanvas, self).__init__(fig)

