#############################
### Python code for handling Dynamic Plot
### Created     2020-07-24
### Last update 2020-07-30
### Author      Hugo HARTMANN
#############################

## Library imports
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure

class DualPlotCanvas(FigureCanvas):

    def __init__(self, parent=None, width=5, height=4, dpi=100):
        fig = Figure(figsize=(width, height), dpi=dpi)
        self.axes = fig.subplots(2)
        for ax in self.axes:
            ax.get_xaxis().set_visible(False)
            ax.get_yaxis().set_visible(False)
        self.axes[0].set_ylim([0, 255])
        self.axes[1].set_ylim([0, 1000])
        super(DualPlotCanvas, self).__init__(fig)

        self.plot_top = self.axes[0].plot(np.arange(1280), [0]*1280, 'r')
        self.plot_bot = self.axes[1].plot(np.arange(1024), [0]*1024, 'r')
        self.show()

    def update_data(self, data_top, data_bot):
        self.plot_top[0].set_ydata(data_top)
        self.plot_bot[0].set_ydata(data_bot)

        self.draw()

class BarCanvas(FigureCanvas):

    def __init__(self, parent=None, width=5, height=4, dpi=100):
        fig = Figure(figsize=(width, height), dpi=dpi)
        self.ax = fig.subplots(1)
        self.ax.get_xaxis().set_visible(False)
        self.ax.get_yaxis().set_visible(False)
        self.ax.set_ylim([0, 31])
        super(BarCanvas, self).__init__(fig)

        self.plot_Bar = self.ax.bar(np.arange(8), [4]*8)
        self.show()

    def update_data(self, data):
        for i in range(len(data)):
            self.plot_Bar[i].set_height(data[i])

        self.draw()