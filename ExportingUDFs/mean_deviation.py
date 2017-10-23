import cPickle 
 
 
def mean_deviation(column): 
	    mean = 0.0
	    for i in range (0, len(column)):
	        mean += column[i]
	    mean = mean / len(column)
	    distance = 0.0
	    for i in range (0, len(column)):
	        distance += column[i] - mean
	    deviation = distance/len(column)
	    return deviation;

input_parameters = cPickle.load(open('./input_data.bin','rb'))
mean_deviation(input_parameters['column'])