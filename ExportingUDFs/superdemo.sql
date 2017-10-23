CREATE OR REPLACE FUNCTION mean(column INTEGER)
RETURNS DOUBLE LANGUAGE PYTHON {
    mean = 0
    for i in range (0, len(column)):
        mean += column[i]
    mean = mean / len(column)
    return mean;
};

CREATE OR REPLACE FUNCTION distance(column INTEGER, mean integer)
RETURNS DOUBLE LANGUAGE PYTHON {
    distance = 0
    for i in range (0, len(column)):
        distance += column[i] - mean
    return distance;
};

CREATE OR REPLACE FUNCTION mean_deviation(column INTEGER)
RETURNS DOUBLE LANGUAGE PYTHON {
	res = _conn.execute("SELECT mean(id) as mean from tables;")
	mean = res['mean'][0]
	res = _conn.execute("SELECT distance(id, %d ) as distance from tables;"%mean)
	distance = res['distance'][0]
	deviation = distance/len(column)
	return deviation;
};
