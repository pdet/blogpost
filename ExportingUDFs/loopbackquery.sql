CREATE FUNCTION classify(id INTEGER, value INTEGER)
RETURNS TABLE(id INTEGER, prediction STRING)
LANGUAGE PYTHON
{
    import pickle
    res = _conn.execute("SELECT * FROM classifier WHERE name=’RFC’;")
    classifier = pickle.loads(res[’classifier’][0])
    return {’id’: id, ’prediction’: classifier.predict(value) }
};