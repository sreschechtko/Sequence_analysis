# Sequence_analysis

MATLAB functions to take KINARM output and identify various trial features. Writes out tab delimited text for futher analysis outside of MATLAB.

Components:

time_intargetcont -- function to find amount of time the hand was in a given target

intarg_loop -- example use of time_interagetcont to extract all dwell times 

get_times -- function to read relevant event codes


In addition to MATLAB functions:

get_horizon -- Python code to find the "effective visual horizon" as described in Ariani et al. 2021 (doi: 10.1523/ENEURO.0085-21.2021)
