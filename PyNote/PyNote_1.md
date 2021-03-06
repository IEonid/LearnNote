<center>
# Python基础教程#
</center>

## Chapter1 基础知识

    #!/usr/bin/python2.7
    print 'Hello, world!'
    name = raw_input("What is your name? ")
    print 'Hello,' + name + '!'

    round(1.0/2.0)
    import math
    math.floor(32.9); math.ceil(32.9)

    foo = math.sqrt
    foo(4)
    import cmath  # 复数运算
    cmath.sqrt(-1)

#### input() 与 raw_input()

| :-: | :-: |
| input()     | 假设用户输入的是合法的Python表达式 |
| raw_input() | 把所有的输入当做原始数据并放入字符串中 |
python3.0中，raw_input被重命名为input

| :-: | :- |
|  /  | 除法操作符，当操作符两边都为整数数实现整除 |
|  // | 整除操作符 |
|  \  | 转义符 |

#### str、repr和反引号是将Python值转成字符串的3种方法

    print "Hello"
    print str("Hello")
    print repr("Hello")
    print 10000L
    print str(10000L)
    print repr(10000L)
    # 在python2中,repr(x)也可以写作`x`,可打印一个包含数字的句子
    temp = 42
    print "this is " + `temp`

长字符串''' ~ ''' or """ ~ """  
原始字符串r' ~ ' or r" ~ "  

    print r'Let\'s go'  # Let\'s go



## Chapter2 列表与元组(序列类型)

Python中最基本的数据结构是**序列**： **列表、元组**、字符串、Unicode字符串、buffer对象、xrang对象。  
序列第一个元素索引为0，最后一个元素标记为-1  
列表可以修改,元组则不能（能在映射中作为键）  

    edward = ['Edward', 42]  # 序列,序列可以包含序列
    edward = 'Edward'; edward[0]  # 索引
    fourth = raw_input('Year: ')[3]  # 数调用序列第四个元素
    fourth = raw_input('Year: ')[0:4]  # 分片
    fourth = raw_input('Year: ')[0:]
    fourth = raw_input('Year: ')[:-1]
    [:]全取;[::-2]

两种相同类型的序列才能相加 (+拼接)  
序列的乘法：'python'*5; []空列表; sequence = [None] * 10 初始化  
len(序列), max( ), min( )  

    # 成员资格运算符in
    users = ['mln', 'foo']
    raw_input('Enter your user name: ') in users  # 布尔运算

    # 列表的拼接和删除
    a = list ('hello')
    b=''.join(a)
    del a[1]  

    # 分片赋值可以用不等长序列将分片替换,也可作插入和删除
    sequence[1:1] = [2, 3, 4]  #在第一个元素插入

#### 列表方法:对象.方法(参数)

    seq.append()  # 追加值  
    seq.count()  # 统计某元素  
    seq.extend()  # 追加列表  
    seq.index()  # 找第一个匹配项  
    seq.insert(num, seq)  # 插入
    seq.pop(); seq.pop(0) #移除列表中的某个值并返回该值
    seq.remove()  # 移除第一个匹配项
    seq.reverse()  # reversed函数返回迭代器，不修改序列
    seq.sort()由小到大 sorted()函数 sort(cmp) sort(key=len) sort(reverse = true)
</code>

| :-: | :- |
| seq1 = seq2    | 两个对象将指向同一个列表 |
| seq1 = seq2[:] | 将列表2拷贝给列表1 |

创建单元素元组(42,) 空元组()  
tuple(seq) 将序列转换成元组  



## Chapter3 使用字符串
字符串是不可变的,不能分片赋值  
字符串格式化操作符: %  

    format = "Hello, %s. %s enough for ya?"  
    values = ('world', 'Hot')  # 只用元组和字典格式化  
    print format % values
    from math import pi
    format = "Pi: %.4f"
    print format % pi
    # 模板字符串:
    from string import Template
    s = Template("It's ${x}e")
    s.substitute(x = 'm')
    
    print '%.3s%.3s' % ('Pyt', 'hon')
    print '%10.2f' % pi  # 字段宽带+精度
    print '%*.*s' % (10, 6, 'Python shell')

符号+，对齐-，0填充或空格填充  
chr(97) == 'a'  
ord('a') == 97

#### 字符串方法:

    str.count(str)
    str.find(str,startnum,endnum)  # 查找第一个子串,没有找到返回-1
    str.split(str), str.split()  # 按空格分割
    str.join(seq)
    str.lower()
    str.replace(str1, str2)  # 替换所有匹配项
    str.strip()  # 去除两侧空格,str.strip(' *!)指定去除
    str.translate()  # 只进行单字符转换



## Chapter4 字典:当索引不好用时

dictory = {k1:v1, k2:v2, ...} {}创建字典,字典可以相互嵌套  

    # dict(seq) 函数创建字典
    item = [('name', 'Gumby'), ('age',42)]
    dictory = dict(item)
    dictory = dict(name = 'Gumby', age = 42)
    len(dictory)
    dictory[k]  # 字典访问
    dictory[k] = v  # 将值v关联到键k上,若键不存在则自动创建
    del dictory[k]
    k in dictory  # 检查dictory中是否有含有键为k的项
    # 字典的格式化字符串(只以字符串作为键的)
    phonebook = {'Beth': '9102', 'Alice': '2341'}
    "Alice's phone is %(Alice)s." %phonebook

#### 字典方法:

    d.clear()  # 清空原始字典  
    d.copy();  from copy import deepcopy;  deepcopy(d)
    ().fromkeys(seq);
    dict.fromkeys(['k1', 'k2'])  # 创建空值字典
    dict.fromkeys(['k1', 'k2'], 'unknown')  # 设置默认值
    
    d.get(k, str默认值)  # 访问不存在的键不报错,返回None(可被str替换)
    d.has_key(k)  # equal:k in d
    d.items()  # 将字典的项(key:value对)以列表方式返回
    d.iteritems()  # 返回迭代器对象
    d.keys()  # 将键以列表方式返回
    d.iterkeys()  # 返回键的迭代器
    d.pop(k)
    d.popitem()  # 随机出栈
    d.setdefault(k, v_set)  # 类似于get,能给不存在的键设键值
    d2.update(d1)  #以字典d1更新d2
    d.values()  # 将值以列表方式返回
    d.itervalues()  # 返回值的迭代器



## Chapter5 条件,循环和其他语句
False = 0 None "" () [] {}  
k, v = d.popitem()  
x, y, *z = 1, 2, 3, 4  # Python3.0 残项赋值  
x = y = somefunction()  # 链式赋值  
增量赋值: += -= *= /= %=  
if --: elif --: else --:  

#### 比较运算符: (除基本的)
    x is y  # x和y是同一个对象(避免比较数值和字符串)
    x is not y  # x和y是不同对象(列表,元组,字典)
    x in y
    x not in y
    
    1 <= number <=10  # 连接比较  
    and or not  # 布尔运算符  
a if b else c  # 如果b为真,返回a,否则,返回c  
assert 0 < age < 100, 'The age must be realistic'  # 断言  
a = ' '; a.isspace()  
range(num1, num2)  range(99,0,-1)  

    d = {'x':1,'y':2,'z':3}  
    for key, value in d.items():  
    print key,'corresponds to',value  

    ##### 并行迭代 #####
    #!/usr/bin/python2.7
    names = ['anne','beth','george','damon']
    ages = [12,45,32,102]
    for i in range(len(names)):
       print names[i],'is',ages[i],'years old'
    for name, age in zip(names, ages):  # 并行迭代
       print name,'is',age,'years old'


zip()可以作用于任意多的序列,处理不等长序列时用完最短序列则停止  
zip(range(5),xrange(100000000))  

    for index, string in enumerate(sqe):  # 提供索引-值对  
        if 'xxx' in string:
            sqe[index] = 'censored'
跳出循环: break continue  

    [x*x for x in range(10)]  # 列表推导式[]  
    [x*x for x in range(10) if x%3 == 0]  
    [(x,y) for x in range(3) for y in range(3)]  

    ##### 字典高效匹配 #####
    #!/usr/bin/python2.7
    girls = ['alice','bernice','clarice','bonie']
    boys = ['chris','arnold','bob','chari']
    dic_girls = {}
    for girl in girls:
       dic_girls.setdefault(girl[0],[]).append(girl)
    print [b+'+'+g for b in boys for g in dic_girls[b[0]]]

pass; del;  
exec "Python语句" in scope;  
eval('Python表达式', scope)  



## Chapter6 抽象(参数,作用域,递归)
def function(para): ...return 创建函数  
help(functionname)  
位置参数; 关键字参数:functionname(形参=值),定义函数时可提供默认值  
当参数具有默认值时,调用函数时可以不提供,提供一些或提供全部参数  
**收集参数** *para收集其余的位置参数,返回元组; **para收集其余的关键字参数,返回字典  

    ##### 用收集参数同时储存多个名字到字典data #####
    #!/usr/bin/python2.7
    def init(data):
        data['first'] = {}
        data['middle'] = {}
        data['last'] = {}
    
    def lookup(data, label, name):
    	return data[label].get(name)
    
    def store(data, *full_names):
    	for full_name in full_names:
    		names = full_name.split() 
    		if len(names) == 2: names.insert(1, '')
    		labels = ('first', 'middle', 'last')
    		for label, name in zip(labels, names):
    			people = lookup(data, label, name)
    			if people:
    				people.append(full_name)
    			else:
    				data[label][name] = [full_name]

    storage = {}
    init(storage)
    store(storage, 'Luke Skywalker', 'Anakin Skywalker')

位置参数收集的逆过程(元组)

    def add(x, y): return x + y
    para = (1, 2)
    add(*para)
关键字参数收集的逆过程(字典)  

    def hello(P1 = 'hello', P2 = 'world' ): print "%s, %s" % (P1, P2)
    Params = {'P1':'Well met', 'P2':'Robin'}
    hello(**Params)
vars() globals() 返回全局变量的字典 locals()返回局部变量的字典  
重绑全局变量:在函数内声明 global para  
#### 函数式编程:
    map(func, seq) 对序列中的每个元素应用函数
    filter(func, seq) 返回其函数为真的元素的列表



## Chapter7 更加抽象(类的对象,多态,封装,方法,特性,超类,继承)
from random import choice  
x = choice([1,'b',...])  # 多态函数，从非空序列随机选择元素  
repr() 函数是多态特征的代表,可以对多种对象进行处理  

    def length_message(x):
        print "The length of", repr(x), "is", len(x)

    ##### 创建类 #####
    #!/usr/bin/python2.7
    _metaclass_ = type #确定使用新式类(直接或间接继承object也是新类)
    class Person:
    	def setName(self,name):
    		self.name = name
    	def getName(self):
    		return self.name
    	def greet(self):
    		print "Hello, world! I'm %s" % self.name

    foo = Person()  
    foo.setName('Luke Skywalker') #也可以从外部访问对象的特性  
    foo.greet()  

    ##### 类的私有化特性 #####
    class Bird:
        __song = 'So'
        def sing(self):
            print self.__song #私有特征，类外无法访问

    class MemberCounter():
        members = 0  # 类的定义其实就是执行代码块
        def init(self):
            MemberCounter.members += 1  # 类作用域,可被所有成员和实例访问

    m1 = MemberCounter()
    m1.init()  # MemberCounter.members = 1
    m2 = MemberCounter()
    m2.init()  # MemberCounter.members = 2
    print m1.members  # m1.members = 2
    print m2.members  # m2.members = 2
    m1.members = 'Two'  # 重绑定members特性
    print m1.members  # m1.members = 'Two'
    print m2.members  # m2.members = 2

多重继承: class Subclass(Superclass,...)  
检查继承: issubclass(subclass,superclass)  

    isinstance(object, tuple)  # 类型检查:tuple, str, dict
    subclass.__bases__; instance.__class__
    hasattr(class, 'attr')  # Python3.0
    callable(getattr(class, 'attr', default))  # Python2.0, 检查能否调用
    setattr(class, 'attr', value)
    class.__dict__  # 查看对象所储存的值



## Chapter8 异常(创建,引发自定义异常,处理异常)
import exceptions; dir(exceptions)  # 列出异常类列表  
raise Exception('hyperdrive overload')  # 引发内建异常  
创建异常类: class SomeCustomException(Exception): pass  

    ##### CatchError #####
    while True:
    	try:
    		x = input('Enter the first number: ')
    		y = input('Enter the second number: ')
    		print x/y
    	except ZeroDivisionError:
    		print "The second number can't be zero!"
    		# raise ZeroDivisionError 重新引发已捕捉的异常
    	except ...
    	else:
    		break

用一个块捕捉多个异常: except (ZeroDivisionError, TypeError):  
异常类全捕捉：except: -- or except Exception, e: -- (有危险，同样会捕捉到用户终止执行的Ctrl+C企图)

    # 捕捉对象:只打印异常，但是程序会继续运行
    except (ZeroDivisionError,TypeError), e:
        print e

    # 循环只有在没有发生异常才退出
    while True：
        try:
            x = input('Enter the first number: ')
            y = input('Enter the second number: ')
            value = x/y
            print 'x/y is', value
        except Exception, e:
            print 'Invalid input:', e, 'Please try again.'
        else:
            break

引发异常处理try: -- finally: -- (不管是否异常都要执行,比如清理代码)  



## Chapter9 __ 魔法方法 __,属性和迭代器

在类中实现魔方方法，那么python会根据名字在特殊情况下调用该方法，而几乎没有直接调用它们的必要。  
构造方法 __ init __ :用来初始化新建对象的状态  
析构方法 __ del __

    class FooBar:
    	def __init__(self, value = 42):
    		self.somevar = value  # 可以传递参数
    f = FooBar('This is a constructor argument')

#### 两种方法调用超类的构造方法拥有超类的初始化代码:  
(1): 调用未绑定的超类构造方法

    class Bird:
    	def __init__(self):
    		self.hungry = True
    	def eat(self):
    		if self.hungry:
    			print 'Aaaah'
    			self.hungry = False
    		else:
    			print 'No, thanks!'
    class SongBird(Bird):
    	def __init__(self):
    		Bird.__init__(self)
    		self.sound = 'Squawk!'
    	def sing(self):
    		print self.sound
(2): 使用super()函数

    __metaclass__ = type  # super函数只在新式类中起作用
    # class Bird: omit...
    class SongBird(Bird):
    	def __init__(self):
    		super(SongBird, self).__init__()
    		self.sound = 'Squawk!'
    	def sing(self):
    		print self.sound

序列和映射是对象的集合。为了实现新序列或集合类的基本行为，如果对象是不可变的，那么就需要使用2个魔方方法，如果是可变的则需要使用4个魔方方法:

| :- | :- |
| __ *len* __ (self)                 | 返回集合中所含项目的数量 |
| __ *getitem* __ (self, key)        | 返回所给键对应的值 |
| __ *setitem* __ (self, key, value) | 按一定方式存储和key相关的值 |
| __ *delitem* __ (self, key)        | 按给定键删除键 |
    
为了让自己的列表和映射具有多态性，而不需要重定义所有的魔方方法，可以子类化列表,字典和字符串(list, dict, string)  

    class CounterList(list):
        def __init__(self, *args):
            super(CounterList, self).__init__(*args)
            self.counter = 0
        def __getitem__(self, index):
            self.counter += 1  # 每次列表访问元素时自增
            return super(CounterList, self).__getitem__(index)

property (fget, fset, fdel可选, doc可选) 函数:只在新式类中使用

    __metaclass__ = type
    class Rectangle:
    	def __init__(self):
    		self.width = 0
    		self.height = 0
    	def setSize(self, size):
    		self.width, self.height = size
    	def getSize(self):
    		return self.width, self.height
    	size = property(getSize, setSize)  # 构造新属性

    r.size = 150, 100

**静态方法**和**类成员方法**分别在创建时被装入staticmethod类型和classmethod类型的对象中  

| :-: | :- |
| 静态方法   | 定义时没有self参数,只能被类本身调用 |
| 类成员方法 | 定义时需要cls参数,可以用类和其对象调用 |

    __metaclass__ = type
    class MyClass:
    	@staticmethod  # Python2.4装饰器,可不加
    	def smesh():
    		print 'This is a static method'
    	@classmethod
    	def cmeth(cls):
    		print 'This is a class method of', cls

    MyClass.smeth()  # This is a static method
    MyClass.cmeth()  # This is a class method of <class '__main__.MyClass'>

为了在访问对象特性的时候可以执行自定义代码，必须使用一些魔方方法

| :- | :- |
| __ *getattribute* __ (self, name)   | 当特性name被访问时被自动调用(只能在新式类中使用) |
| __ *getattr* __ (self, name)        | 当特性name被访问且对象没有相应特性时被自动调用 |
| __ *setattr* __ (self, name, value) | 当试图给特性name赋值时会被自动调用 |
| __ *delattr* __ (self, name)        | 当试图删除特性name时被自动调用 |

    ##### __getattr__, __setattr__ #####
    class Rectangle:
    	def __init__(self):
    		self.width = 0
    		self.height = 0
    	def __setattr__(self, name, value):
    		if name == 'size': self.width, self.height = value
    		else: self.__dict__[name] = value
    	def __getattr__(self, name):
    		if name == 'size': return self.width, self.height
    		else: raise AttributeError

__ iter __ 方法会返回一个**迭代器**，迭代器就是具有next方法(该方法只需要self参数)的对象  # Python3.0为 __ next __ 方法

    class Fibs:  # 斐波那契数列
    	def __init__(self):
    		self.a = 0
    		self.b = 1
    	def next(self):
    		self.a, self.b = self.b, self.a+self.b
    		if self.a > 200: raise StopIteration
    		return self.a
    	def __iter__(self):
    		return self

    fibs = Fibs()  # print list(fibs) 将迭代器转成列表  
    for f in fibs:
        if f > 100:
            print f
            break

**生成器**是一种用普通的函数语法定义的迭代器  
任何包含**yield语句**的函数称为生成器，每次用yield语句产生一个值，函数就会被冻结：即函数停在那个点等待被重新唤醒。
当生成器函数被调用时，函数体的代码不会被执行，而会返回一个迭代器。每次请求一个值时，就会执行生成器中的代码，直到遇到一个yield或者return语句。yield语句意味着应该生成一个值。return语句意味着生成器要停止执行，不再生成任何东西。

    def flatten(nested):  # 生成器函数
    	for sublist in nested:  
    		for element in sublist:  
    			yield element  

    nested = [[1,2],[3,4],[5]]  
    for num in flatten(nested):  
    	print num  
    list(flatten(nested))  

**递归生成器**: 对于字符串嵌套会引发无穷递归  

    def flatten(nested):  # 处理任意层嵌套
    	try:
    		for sublist in nested:
    			for element in flatten(sublist):
    				yield element
    	except TypeError:
    		yield nested

加入检查语句的生成器:

    def flatten(nested):
    	try:
    		try: nested + ' '  # 检查是否为字符串
    		except TypeError: pass
    		else: raise TypeError
    		for sublist in nested:
    			for element in flatten(sublist):
    				yield element
    	except TypeError:
    		yield nested
    $ list(flatten(['foo', ['bar', ['baz']]]))
生成器方法: .send()开始运行后为生成器提供新值  

    def repeater(value):
        while True:
            new = (yield value)
            if new is not None: value = new

    r = repeater(42)
    r.next()  # 42
    r.send("Hello, world!")  # "Hello, world!"



## Chapter10 自带电池

sys.path.append('/home/ieonid/Python')  # 应包含用户模块的全路径  
import usermodulename  # 第一次导入自定义模块时执行代码，并产生.pyc文件

    ##### 自定义模块中增加测试代码 #####
    #!/usr/bin/env python2.7
    def hello():
       print 'Hello, world!'
    def test():
       hello()  
    if __name__ == 'main': test()  

import sys, pprint  
pprint.pprint(sys.path)  
import copy; dir(copy)  # 列出模块包含的内容,包含copy.__all__  
__ all __ 变量定义了模块的公有接口，即 "from modulename import *"所导入的函数  
help(module.func)  
print module.func.__doc__  # 打印说明文档  
print copy.__file__  # 打印源码路径  
os.system('/usr/bin/firefox')  # 启动可执行程序  
import webbrowser; webbrowser.open('http://www.python.org')  

    ##### numberline #####
    #!/usr/bin/env python2.7                           #  1
    import fileinput                                   #  2
    for line in fileinput.input(inplace = True):       #  3
       line = line.rstrip()                            #  4
       num = fileinput.lineno()                        #  5
       print '%-50s # %2i' % (line, num)               #  6

    python numberline.py numberline.py  

集合运算set(): omited  
堆操作函数模块: from heapq import *  
双端队列模块: from collections import deque  
time模块, random模块  
**正则表达式模块re**:可以匹配文本片段的模式  

| :-: | :-: | :- |
| .    | 单字符通配符 | 
| \    | 转义字符     | 'python\\\\.org' 匹配 python.org(需要经过解释器和re模块转义两次)
| [ ]  | 字符集       | '[abc]' 或 '[a-zA-Z0-9]' 多范围联合匹配
| [^ ] | 反转字符集   | '[^abc]' 匹配任何除了a、b、c之外的字符
| ( l )| 选择符       | 'p(ython l erl)' 匹配python或perl
| ( )? | 可选项符     | r'(http://)?(www\\.)?python\\.org' 原始字符串中仍需对特殊符号进行一次转义
| ( )*      |     | 允许模式重复0次或多次
| ( )+      |     | 允许模式重复1次或多次
| ( ){m, n} |     | 允许模式重复m~n次

**re模块中一些重要的函数**  

| :- | :- |
|compile(pattern[, flags]) | 根据包含正则表达式的字符串创建模式对象，以实现更有效率的匹配  
|search(pattern, string[, flags]) | 寻找第一个匹配的子字符串,返回布尔值  
|match(pattern, string[, falgs]) | 仅在开头匹配正则表达式,返回布尔值  
|split(pattern, string[, maxsplit=0]) | 返回列表  
|findall(pattern, string) | 返回列表  
|sub(pat, repl, string[, count=0]) | 将pat替换为repl,pat是用compile创建的模式对象  
|escape(string) | 将字符串中所有特殊正则表达式 re.escape('www.python.org')  

	re.search(pat, string) equal pat.search(string)  

    some_text = 'alpha, beta,,,gamma delta'  
	re.split('[, ]+', some_text)  # 中括号;若为小括号,列表包含小括号内的字符组合
	re.findall('[a-z]+',some_text)  

    # re匹配对象的方法:(匹配对象和组)  
	group([group1, ...])  
	start([group]) #return start index  
	end([group]) #return end index  
	span([group])  

    pat = r'www\.(.*)\..{3}'  
	m = re.match(pat, 'www.python.org') # m is a MatchObject  
	m.group(1)  

    emphasis_pattern = r'\*([^\*]+)\*'   #贪婪模式  
	re.sub(emphasis_pattern, r'<em>\1</em>', 'Hello, *world*!')  

