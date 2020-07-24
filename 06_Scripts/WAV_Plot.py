#############################
### Python code for handling Dynamic Plot
### Created     2020-07-24
### Last update 2020-07-24
### Author      Hugo HARTMANN
#############################

## Library imports
import matplotlib.pyplot as plt
import numpy as np

class DynamicPlot():

    def start(self):
        #Set up plot
        self.figure, self.ax = plt.subplots()
        self.lines, = self.ax.plot(np.arange(1280), np.arange(1280), 'o')
        self.update(np.arange(1280), np.arange(1024))
        plt.show()

    def update(self, WAV_tab, FFT_tab):
        #Update data 
        self.lines.set_ydata(WAV_tab)
        #Need both of these in order to rescale
        self.ax.relim()
        self.ax.autoscale_view()
        #We need to draw *and* flush
        self.figure.canvas.draw()
        self.figure.canvas.flush_events()
