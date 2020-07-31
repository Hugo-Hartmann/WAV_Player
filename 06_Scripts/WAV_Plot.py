#############################
### Python code for handling Dynamic Plot
### Created     2020-07-24
### Last update 2020-07-31
### Author      Hugo HARTMANN
#############################

## Library imports
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure

class DualPlotCanvas(FigureCanvas):

    def __init__(self, parent=None, width=5, height=4, dpi=100):
        self.fig = Figure(figsize=(width, height), dpi=dpi, facecolor=(240/255, 240/255, 240/255))
        self.axes = self.fig.subplots(2)
        for ax in self.axes:
            ax.get_xaxis().set_visible(False)
            ax.get_yaxis().set_visible(False)
            ax.patch.set_facecolor((240/255, 240/255, 240/255))
        self.axes[0].set_ylim([0, 255])
        self.axes[1].set_ylim([0, 1000])
        super(DualPlotCanvas, self).__init__(self.fig)

        self.plot_top = self.axes[0].plot(np.arange(1280), [0]*1280, 'r')
        self.plot_bot = self.axes[1].plot(np.arange(1024), [0]*1024, 'r')
        self.show()

    def update_data(self, data_top, data_bot):
        self.plot_top[0].set_ydata(data_top)
        self.plot_bot[0].set_ydata(data_bot)

        self.draw()
        self.flush_events()

class BarCanvas(FigureCanvas):

    def __init__(self, parent=None, width=5, height=4, dpi=100):
        self.fig = Figure(figsize=(width, height), dpi=dpi, facecolor=(240/255, 240/255, 240/255))
        self.ax = self.fig.subplots()
        self.fig.subplots_adjust(bottom=0, top=1, left=-1, right=2)
        self.ax.patch.set_facecolor((240/255, 240/255, 240/255))
        self.ax.axis('off')
        self.ax.set_ylim([0, 31])
        self.bar = self.ax.bar([0], [4])[0]

        super(BarCanvas, self).__init__(self.fig)

        self.grad = [[99-i] for i in range(100)]
        self.lim = self.ax.get_xlim()+self.ax.get_ylim()
        self.bar.set_zorder(1)
        self.bar.set_visible(False)
        self.x, self.y = self.bar.get_xy()
        self.w, h = self.bar.get_width(), self.bar.get_height()
        self.im = self.ax.imshow(self.grad, extent=[self.x, self.x+self.w, self.y, self.y+h], aspect="auto", zorder=0, origin="lower", cmap="RdYlGn")
        self.ax.axis(self.lim)

        self.show()


    def update_data(self, data):
        self.bar.set_height(data)
        h = self.bar.get_height()
        self.im.set_extent([self.x, self.x+self.w, self.y, self.y+h])
        self.im.set_data(self.grad[:int((h+1)*100/32)][:][:])

        self.draw()
        self.flush_events()

class BarPatch():

    def __init__(self):
        self.canvas = []
        for i in range(8):
            self.canvas.append(BarCanvas())


    def update_data(self, data):
        for i in range(8):
            self.canvas[i].update_data(data[i])