<center>
# Python基础教程#
</center>

## Chapter11 文件和流

FileObject = open('filename'[, mode[, buffering]])  
FileObject = file('filename'[, mode[, buffering]])  

| Mode | Description | Buffering | Description |
| :-: | :- | :-: | :- |
| 'r' | 读模式 | 0 | 无缓冲 |
| 'w' | 写模式 | 1 | 有缓冲 |
| 'a' | 追加模式 | >1 | 代表缓冲区大小 |
| 'b' | 二进制模式(可添加到其他模式) | -1 | 代表使用默认缓冲区大小 |
| '+' | 读/写模式(可添加到其他模式) |

    f = open(r'C:\text\file.txt')
    f.write()
    f.read(Bytes)  # Bytes为字节数，同时移动文件指针，read()将读取整个文件
    f.readline(MaxBytes)  # MaxBytes为读取的最大字节数
    f.readlines()  # 读取整个文件并返回列表
    f.close()  # 确保将数据从缓存中写回文件，虽然文件在退出程序后会自动关闭
    f.seek(offset[, whence])
    # offset为偏移量, whence={0:相对文件起始位置(默认),1:相对当前位置,2:相对结尾位置}
    f.tell()  # 返回当前文件指针位置，一般为长整数

    import fileinput
    for line in fileinput.input('filename'):  # 文件迭代器
        # process code

    f = open('filename')
    for line in f:  # 文件迭代器
        # process code
    f.close()



## Chapter12 图形用户界面

Python流行的GUI工具包

| 工具包| 描述 | 网站 |
| :- | :- | :-: |
| Tkinter    | 使用Tk平台。很容易得到。半标准 | [http://wiki.python.org/moin/TkInter](http://wiki.python.org/moin/TkInter) 
| wxpython   | 基于wxWindows。跨平台越来越流行 | [http://wxpython.org](http://wxpython.org)
| PythonWin  | 只能在Windows上使用 | 
| Java Swing | 只能用于Jython | 
| PyGTK      | 使用GTK平台，在Linux上很流行 |
| PyQt       | 使用Qt平台，跨平台 |

    #!/usr/bin/python
    # -*- coding: utf-8 -*-
    import wx
    
    if __name__ == '__main__':
        app = wx.App()
        win = wx.Frame(None, title="Simple Editor", size=(410, 335))
        win.Show()
        
        loadButton = wx.Button(win, label='Open', pos=(225, 5), size=(80, 25))
        saveButton = wx.Button(win, label='save', pos=(315, 5), size=(80, 25))
        filename = wx.TextCtrl(win, pos=(5, 5), size=(210, 25))
        contents = wx.TextCtrl(win, pos=(5, 35), size=(390, 260), style=wx.TE_MULTILINE | wx.HSCROLL)
        app.MainLoop()
        # 运行结果如下图
![](https://i.imgur.com/TacUYtF.png)

    #!/usr/bin/python
    # -*- coding: utf-8 -*-
    import wx

    def load(event):
        with open(filename.GetValue(), 'r') as file:
            contents.SetValue(file.read())
    
    def save(event):
        file = open(filename.GetValue(), 'w')
        file.write(contents.GetValue())
        file.close()
    
    if __name__ == '__main__':
        app = wx.App()
        win = wx.Frame(None, title="Simple Editor", size=(410, 335))
    
        bkg = wx.Panel(win)
        loadButton = wx.Button(bkg, label='Open')
        loadButton.Bind(wx.EVT_BUTTON, load)
        saveButton = wx.Button(bkg, label='save')
        saveButton.Bind(wx.EVT_BUTTON, save)
        filename = wx.TextCtrl(bkg)
        contents = wx.TextCtrl(bkg, style=wx.TE_MULTILINE | wx.HSCROLL)
    
        hbox = wx.BoxSizer(wx.HORIZONTAL)
        hbox.Add(filename, proportion=1, flag=wx.EXPAND)
        hbox.Add(loadButton, proportion=0, flag=wx.LEFT, border=5)
        hbox.Add(saveButton, proportion=0, flag=wx.LEFT, border=5)
        vbox = wx.BoxSizer(wx.VERTICAL)
        vbox.Add(hbox, proportion=0, flag=wx.EXPAND | wx.ALL, border=5)
        vbox.Add(contents, proportion=1, flag=wx.EXPAND | wx.LEFT | wx.BOTTOM | wx.RIGHT, border=5)
    
        bkg.SetSizer(vbox)
        win.Show()
        app.MainLoop()
</code>

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



## Chapter13 数据库支持(基于关系数据库SQL的DB API)

