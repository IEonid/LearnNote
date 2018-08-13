#!/usr/bin/python
# -*- coding: utf-8 -*-
import sqlite3
# SQLite: 小型的嵌入式SQL数据库， 速度快易于使用，并且不需要建立单独的服务器

def convert(value):
    if value.startswith('~'):
        return value.strip('~')
    if not value:
        value = None
        return value
    return float(value)


if __name__ == '__main__':
    conn = sqlite3.connect('food.db')
    curs = conn.cursor()

    curs.execute('''
    CREATE TABLE food (
        id      TEXT        PRIMARY KEY,
        desc    TEXT,
        water   FLOAT,
        kcal    FLOAT,
        protein FLOAT,
        fat     FLOAT,
        ash     FLOAT,
        carbs   FLOAT,
        fiber   FLOAT,
        sugar   FLOAT
    )
    ''')

    query = 'INSERT INTO food VALUES (?,?,?,?,?,?,?,?,?,?)'
    # 使用了paramstyle的问号版本，也就是会使用问号作为字段标记
    field_count = 10

    for line in open('ABBREV.txt'):
        fields = line.split('^')
        vals = [convert(f) for f in fields[:field_count]]
        curs.execute(query, vals)

    conn.commit()
    conn.close()
