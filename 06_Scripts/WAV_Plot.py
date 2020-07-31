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
        self.fig.subplots_adjust(bottom=0, top=1, left=0, right=1, hspace=0.1)
        self.axes = self.fig.subplots(2)
        for ax in self.axes:
            ax.axis('off')
            ax.patch.set_facecolor((240/255, 240/255, 240/255))
        self.axes[0].set_ylim([0, 255])
        self.axes[0].set_xlim([0, 1280])
        self.axes[1].set_ylim([0, 1000])
        self.axes[1].set_xlim([0, 1024])
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
        self.axes = self.fig.subplots(1, 8)
        self.imgs = []
        self.fig.subplots_adjust(bottom=0, top=1, left=0, right=1)
        for ax in self.axes:
            #ax.patch.set_facecolor((240/255, 240/255, 240/255))
            ax.axis('off')
            ax.set_ylim([0, 31])
            ax.set_xlim([0, 1])

        self.x = 0
        self.y = 0
        self.w = 1

        super(BarCanvas, self).__init__(self.fig)

        self.grad = [[i] for i in range(100)]
        
        for i in range(8):
            self.imgs.append(self.axes[i].imshow(self.grad, extent=[self.x, self.x+self.w, self.y, self.y+32], aspect='auto', zorder=0, origin="lower", cmap="RdPu"))

        self.show()


    def update_data(self, data):
        for i in range(8):
            self.imgs[i].set_extent([self.x, self.x+self.w, self.y, self.y+data[i]])
            self.imgs[i].set_data(self.grad[:int((data[i]+1)*100/32)][:][:])

        self.draw()
        self.flush_events()
