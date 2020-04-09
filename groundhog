#!/usr/bin/python3

import sys
import math
import statistics

def print_help():
    print("SYNOPSIS")
    print("    ./groundhog period")
    print("DESCRIPTION")
    print("    period        the number of days defining a period")

def error_handling(ac, av):
    if (ac != 2) :
        print_help()
        return (84)
    if ("-h" == av[1]):
        print_help()
        return (-1)
    if (int(av[1]) < 1):
        print_help()
        return (84)
    return (0)

def calculateTemperatureIncreaseAverage(period, queue):
    if (len(queue) <= period):
        return 0
    g = 0
    counter = len(queue) - period
    while (counter != len(queue)):
        tmp = queue[counter] - queue[counter - 1]
        if (tmp > 0):
            g += tmp
        counter += 1
    g /= period
    return (g)

def calculateRelativeTemperatureEvolution(period, queue, r):
    if (len(queue) <= period):
        return 0
    value1 = queue[len(queue) - period - 1]
    value2 = queue[-1]
    return ((int)(round((value2-value1)/value1*100)))

def calculateStandardDeviation(period, queue):
    value1 = 0
    value2 = 0
    iteration = []
    for i in range (0, period):
        if len(queue) - i > 0:
            iteration.insert(0, queue[-1 - i])
        else:
            iteration.insert(0, 0)
    for i in iteration:
        value1 += i
        value2 += i * i
    s = math.sqrt(value2 / period - (value1 / period) * (value1 / period))
    return (s)

def display(period, queue, g, r, s, lastr, switches):
    print("g=", end="")
    if (len(queue) <= period):
        print("nan", end="")
    else:
        print("%.2f" % g, end="")
    print("       r=", end="")
    if (len(queue) <= period):
        print("nan", end="")
    else:
        print(r, end="")
    print("%", end="")
    print("       ", end="")
    print("s=", end="")
    if (len(queue)< period):
        print("nan", end="")
    else:
        print("%.2f" % s, end="")
    if (((lastr < 0 and r >= 0) or (lastr >= 0 and r < 0)) and lastr):
        switches += 1
        print("        a switch occurs", end="")
    print("")
    return (switches)

def is_numeric(number):
    if (number[0] < '0' or number[0] > '9') or (number[-1] < '0' or number[-1] > '9'):
        return (False)
    for i in number:
        if (i < '0' or i > '9') and i != '.':
            return (False)
    return (True)

def sumInThePeriod(array, period) :
	res = 0
	for i in range (0, period) :
		res += array[i - period]
	return (res)

def getWeirdestValues(s, value, period, queue, weirdestValues):
    average = (1 / period) * sumInThePeriod(queue, period)
    bandHight = average + 2 * s
    bandLow = average - 2 * s
    weirdestValue = []
    tmp = 0
    weirdestValue.append(value)
    if (bandHight - bandLow > 0):
        tmp = (value - bandLow) / (bandHight - bandLow)
    else:
        exit(84)
    if (tmp > 0.5):
        weirdestValue.append(1 - tmp)
    else :
        weirdestValue.append(tmp)
    return (weirdestValue)

def printWeirdestValues(weirdestValues):
    resultWeirdestValues = []
    weirdestValues.sort(key=lambda x: x[1], reverse = False)
    if (len(weirdestValues) >= 5) :
        for x in range(0,5):
            resultWeirdestValues.append(weirdestValues[x][0])
        print("5 weirdest values are", resultWeirdestValues)
    else :
        exit (84)

def core(period):
    queue = []
    r = 0
    lastr = 0
    switches = 0
    i = 0
    weirdestValues = []
    while (True):
        inputRead = input("")
        if ("STOP" == inputRead):
            break
        elif (is_numeric(inputRead) == False):
            return (84)
        inputRead = (float)(inputRead)
        if (inputRead != 0):
            queue.append(inputRead)
            g = calculateTemperatureIncreaseAverage(period, queue)
            lastr = r
            r = calculateRelativeTemperatureEvolution(period, queue, r)
            s = calculateStandardDeviation(period, queue)
            switches = display(period, queue, g, r, s, lastr, switches)
            i += 1
            if i >= period :
                weirdestValues.append(getWeirdestValues(s, inputRead, period, queue, weirdestValues))
    print ("Global tendency switched", switches, "times")
    printWeirdestValues(weirdestValues)
    return (0)

def main(ac, av):
    ret = error_handling(ac, av)
    if (ret == 84) :
        return (84)
    elif (ret == -1):
        return (0)
    else:
        return (core(int(av[1])))

sys.exit(main(len(sys.argv), sys.argv))
