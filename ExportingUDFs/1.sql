CREATE OR REPLACE FUNCTION mean_deviation(column INTEGER)
RETURNS DOUBLE LANGUAGE PYTHON {
    mean = 0.0
    for i in range (0, len(column)):
        mean += column[i]
    mean = mean / len(column)
    distance = 0.0
    for i in range (0, len(column)):
        distance += column[i] - mean
    deviation = distance/len(column)
    return deviation;
};