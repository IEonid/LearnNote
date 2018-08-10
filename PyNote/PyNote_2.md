<center>
# Python基础教程#
</center>

## Chapter11 文件和流

FileObject = open('filename'[, mode[, buffering]])  

| Mode | Description | Buffering | Description |
| :-: | :- | :-: | :- |
| 'r' | 读模式 | 0 | 无缓冲 |
| 'w' | 写模式 | 1 | 有缓冲 |
| 'a' | 追加模式 | >1 | 代表缓冲区大小 |
| 'b' | 二进制模式(可添加到其他模式) | -1 | 代表使用默认缓冲区大小 |
| '+' | 读/写模式(可添加到其他模式) |

    f = open(r'C:\text\file.txt')
    f.write()
    f.read(num)  # num为字节数，同时移动文件指针
    f.close()
    f.seek(offset[, whence])
    # offset为偏移量, whence={0:相对文件起始位置,1:相对当前位置,2:相对结尾位置}
    f.tell()  # 返回当前文件指针位置，一般为长整数