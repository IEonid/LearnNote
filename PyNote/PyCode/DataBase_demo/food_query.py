#!/usr/bin/python
# -*- coding: utf-8 -*-
import sqlite3
import sys


if __name__ == '__main__':
    conn = sqlite3.connect('food.db')
    curs = conn.cursor()

    query = 'SELECT * FROM food WHERE %s' % sys.argv[1]
    curs.execute(query)
    names = [f[0] for f in curs.description]
    for row in curs.fetchall():
        for pair in zip(names, row):
            print('%s: %s' % pair)

    # python food_query.py "kcal <= 100 AND fiber >= 10 ORDER BY sugar"
    # python food_query.py "kcal <= 100 AND fiber >= 10 AND sugar ORDER BY sugar"
