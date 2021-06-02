#horizon fitting based on Ariani et al 2021 (doi: 10.1523/ENEURO.0085-21.2021) which used MATLAB nlfit with Levenberg-Marquardt least-squares fitting

import numpy as np
import scipy as sp
from scipy.optimize import curve_fit

#load data from text file
IRIs = np.loadtxt('IRIs.txt')

#coefficient w is window size; arranged such that y at w=1 is a+c
def horizfit(w, a, b, c):
    return a * np.exp(-b * (w-1)) + c

wstar = []
nlfits = np.zeros(100)                                                  #evaluate the fitted curve at 100 points to get a nice curve

for i in range(0,13): #for all 13 participants

    xdata = np.linspace(0,3,4)

    ydata = IRIs[i,:]

    popt, pcov = curve_fit(horizfit,xdata,ydata, method = 'lm')

    nlfits = np.vstack((nlfits,horizfit(np.linspace(0,3,100), *popt)))  #building an array of the fits in case we want to visualize
    wstar += [-np.log(0.01)/(popt[1] + 1)]                              #this where we hit 99% saturation per Ariani et al.


np.savetxt('horizons.txt',wstar,fmt = '%.3f', delimiter = '\t')
np.savetxt('curves.txt',nlfits[1:len(nlfits),:],fmt = '%.3f', delimiter = '\t')