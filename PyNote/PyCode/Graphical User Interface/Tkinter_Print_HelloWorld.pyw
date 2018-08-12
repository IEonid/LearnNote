#!/usr/bin/python
# -*- coding: utf-8 -*-
from Tkinter import *

def hello():
    print 'Hello, world'

if __name__ == '__main__':
    win = Tk()  # Tkinter的主窗口
    win.title('Hello, Tkinter!')
    win.geometry('400x300')

    btn = Button(win, text='Hello ', command=hello)
    btn.pack(expand=YES, fill=BOTH)
    mainloop()
