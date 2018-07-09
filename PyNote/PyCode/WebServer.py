#!/usr/bin/python
# -*- coding: utf-8 -*-
from wsgiref.simple_server import make_server


def response(environ, start_response):
    status = '200 OK'
    # headers = [('Content-type', 'text/html')]
    headers = [('Content-type', 'application/json;charset=UTF-8')]
    start_response(status, headers)
    if len(environ['PATH_INFO']) == 1:
        return "Hello World!"
    else:
        # return "Hello {name}!".format(name=environ['PATH_INFO'][1:])
        return '{{"name":"Hello {name}!"}}'.format(name=environ['PATH_INFO'][1:])


if __name__ == '__main__':
    httpd = make_server('', 8000, response)
    print "Serving HTTP on port 8000..."
    httpd.serve_forever()


# Test wed address
# http://localhost:8000
# http://localhost:8000/cglin
