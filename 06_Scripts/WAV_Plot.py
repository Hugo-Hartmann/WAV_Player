#############################
### Python code for handling Dynamic Plot
### Created     2020-07-24
### Last update 2020-08-04
### Author      Hugo HARTMANN
#############################

## Library imports
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure

class DualPlotCanvas(FigureCanvas):

    def __init__(self, parent=None, width=5, height=4, dpi=100, style="magma_r"):
        self.fig = Figure(figsize=(width, height), dpi=dpi, facecolor=(240/255, 240/255, 240/255))
        self.fig.subplots_adjust(bottom=0, top=1, left=0, right=1, hspace=0.1)
        self.axes = self.fig.subplots(2)
        for ax in self.axes:
            ax.axis('off')
            ax.patch.set_facecolor((240/255, 240/255, 240/255))
        self.axes[0].set_ylim([0, 255])
        self.axes[0].set_xlim([0, 1280])
        #self.axes[1].set_yscale('log')
        self.plot_bot_ymax = 1024
        self.axes[1].set_ylim([0, self.plot_bot_ymax])
        self.axes[1].set_xlim([0, 1024])

        self.nb_points = 1024

        super(DualPlotCanvas, self).__init__(self.fig)

        self.plot_top = self.axes[0].plot(np.arange(1280), [0]*1280, 'k')
        log_cmap = [i for i in np.linspace(np.log(4), 3*np.log(65536), 1024)]
        self.plot_bot = self.axes[1].scatter([i+0.5 for i in range(self.nb_points)], [0]*1024, cmap=style, c=log_cmap, marker='.', s=5)

        self.show()

    def update_nb_points(self, N):
        self.nb_points = N
        self.axes[1].set_xlim([0, N])

    def update_data(self, data_top, data_bot):
        self.plot_top[0].set_ydata(data_top)
        self.plot_bot.set_offsets(np.c_[[i+0.5 for i in range(self.nb_points)], data_bot[:self.nb_points]])
        data_bot = [min(data, self.plot_bot_ymax-1) for data in data_bot]
        self.plot_bot.set_array(np.array(data_bot))

        self.draw()
        #self.flush_events()

class LegendPlotCanvas(FigureCanvas):

    def __init__(self, parent=None, width=5, height=4, dpi=100):
        self.fig = Figure(figsize=(width, height), dpi=dpi, facecolor=(240/255, 240/255, 240/255))
        self.fig.subplots_adjust(bottom=0.99, top=1, left=0.02, right=0.98)
        self.fig.patch.set_facecolor('none')
        self.fig.patch.set_alpha(0.0)
        self.ax = self.fig.subplots(1)

        self.ax.tick_params(which='both', labelbottom=True, bottom=True, direction='out')
        self.ax.tick_params(which='minor', length=4, width=2, labelsize=8)
        self.ax.tick_params(which='major', length=13)
        self.ax.patch.set_facecolor('none')
        self.ax.patch.set_alpha(0.0)
        self.ax.get_yaxis().set_visible(False)

        self.Fband = [31.5, 63, 125, 250, 500, 1000, 2000, 4000, 8000, 16000]
        self.N = len(self.Fband)

        super(LegendPlotCanvas, self).__init__(self.fig)

        self.setStyleSheet("background-color:transparent;")

        self.show()

    def update_scale(self, Fmax):

        self.ax.set_xticks(self.Fband, minor=True)
        self.ax.set_xticks([i*Fmax/5 for i in range(6)], minor=False)

        FbandLabels = []

        for i in range(self.N):
            if(i<self.N-1):
                if((self.Fband[i+1]-self.Fband[i])/Fmax<0.0144):
                    FbandLabels.append("")
                else:
                    FbandLabels.append(str(self.Fband[i]))
        FbandLabels.append(str(self.Fband[self.N-1]))

        self.ax.set_xticklabels(FbandLabels, minor=True)

        self.ax.set_xlim([0, Fmax])

        self.draw()

class BarCanvas(FigureCanvas):

    def __init__(self, parent=None, width=5, height=4, dpi=100):
        self.fig = Figure(figsize=(width, height), dpi=dpi, facecolor=(240/255, 240/255, 240/255))
        self.axes = self.fig.subplots(1, 11)
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

        for i in range(11):
            self.imgs.append(self.axes[i].imshow(self.grad, extent=[self.x, self.x+self.w, self.y, self.y+32], aspect='auto', zorder=0, origin="lower", cmap="RdPu"))

        self.show()


    def update_data(self, data):
        for i in range(11):
            self.imgs[i].set_extent([self.x, self.x+self.w, self.y, self.y+data[i]])
            self.imgs[i].set_data(self.grad[:int((data[i]+1)*100/32)][:][:])

        self.draw()
        self.flush_events()
