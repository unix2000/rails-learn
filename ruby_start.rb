# ruby syntax start note
# 对象	类
# 数值	Numeric
# 字符串	String
# 数组	Array
# 散列	Hash
# 正则表达式	Regexp
# 文件	File
# 符合	Symbol

# 局部变量	以英文字母或者_开头
# 全局变量	$
# 实例变量	@
# 类变量		@@
# 常量			大写字母开头
# 预留关键字  \_\_LINE\_\_  \_\_ENCODING\_\_  \_\_FILE\_\_ 等20几个关键字

# && || !  and or not
# false nil	 false
# /zz/ === "xyzzy"	true
# String === "xyzzy"	true
# ((1..3) === 2)	2
# /zz/i =~ "xyZZy"	true

# times while each for until loop
# break next redo
# #{i} 值替换

# 实例方法
# "10,20,30".split(",")

# 类方法
# Array.new
# File.open("some_file")
# Time.now

# 函数式方法 没有接收者的方法
# print "hello"
# sleep(10)

# 参数个数不确定方法
# def foo(*args)
# 	args
# end

# **args来接收未定义的参数
# def meth(x: 0, y: 0, z: 0, **args)
# 	[x, y, z, args]
# end
# p meth(z: 4,y: 3,x: 2) #=> [2,3,4,{}]
# p meth(x: 2, z: 3, v: 4, w: 5) #=> [2,0,3,{:v=>4,:w=>5}]

# class
# BasicObject->Object
# ary = []
# str = "hello liner"
# p ary.instance_of?(Array)		#=> true
# p str.instance_of?(String)	#=> true
# p ary.instance_of?(String)	#=> false
# p str.instance_of?(Array)		#=> false
# is_a
# p str.is_a?(String)	#=>true
# p.str.is_a?(Object)	#=>true

# 存取器定义 外部
# attr_reader :name 只读,定义name 方法
# attr_writer :name 只写,定义name= 方法
# attr_accessor :name 读写,定义以上两个方法
# class HelloWorld
# 	def initialize
# 	end
	
# 	def name
# 		@name
# 	end
	
# 	def name=(value)
# 		@name = value
# 	end
# end

# 方法访问级别
# public private protected 
# public :pub
# private :priv
# public 不指定时,以下的方法都指定为public

# module
# module HelloModule
# 	Version = "1.0"
# 	def foo
# 		p self
# 	end
# 	def hello(name)
# 		puts "Hello,#{name}."
# 	end

# 	module_function :hello #指定hello方法为模块函数
# 	module_function :foo
# end
# p HelloModule::Version
# HelloModule.hello("Liner")
# HelloModule.foo #=>HelloModule
# include HelloModule #包含模块
# p Version
# hello("Liner")

# module M
# 	def meth
# 		"meth"
# 	end
# end
# class C
# 	include M
# end
# c = C.new
# p c.meth
# C.include?(M) #=> true
# p C.ancestors #=> [C,M,Object,Kernel,BasicObject]
# module M1
# end
# module M2
# end
# module M3
# 	include M2
# end
# class C
# 	include M1
# 	include M3
# end
# p C.ancestors #=>[C,M3,M2,M1,Object,Kernel]

# extend方法
# module Edition
# 	def edition(n)
# 		"#{self} 第#{n}版"
# 	end
# end
# str = "Ruby语法教程"
# str.extend(Edition) #=>将模块Mix-in进对象
# p str.edition(4) #=> "Ruby语法教程第4版"

# 类与Mix-in
# 接收者为类本身的方法就是类方法
# 类方法就是类对象的实例方法
# 	.class类的实例方法
# 	.类对象的单例方法
# module ClassMethods #定义类方法的模块
# 	def cmethod
# 		"class method"
# 	end
# end

# module InstanceMethods #定义实例方法的模块
# 	def imethod
# 		"instance method"
# 	end
# end

# class MyClass
# 	# 使用extend方法定义类方法
# 	extend ClassMethods
# 	# 使用include定义实例方法
# 	include InstanceMethods
# end

# p MyClass.cmethod #=> "class method"
# p MyClass.new.imethod #=> "instance method"

# Ruby多态简单理解: 各个对象都有自己独有的消息解释权 一个方法名属于多个对象[处理结果也不一样]
# obj = Object.new
# str = "liner"
# num = Math::PI
# p obj.to_s
# p str.to_s
# p num.to_s

# http_get.rb
# require "net/http"
# require "uri"
# url = URI.parse("http://www.ruby-lang.org/ja/")
# http = Net::HTTP.start(url.host,url.port)
# doc = http.get(url.path)
# puts doc

# 赋值运算符
# &&=
# ||=		var ||= 1		var = var || 1 只有在var为nil或false时,赋值1给它,这是给变量定义默认值的常用写法
# ^=
# &=
# |=
# <>
# >>=
# +=
# -=
# \*=
# /=
# %=
# \*\*=

# 不能重新定义的运算符
# :: && || .. ... ?: not = and or

# 一元运算符
# 可定义的一元运算符有+ - ~ ! 4个,它们分别以+@ -@ ~@ !@为方法名进行方法的定义
# 需要注意的是,一元运算符都是没有参数的
# class Point
# 	def +@
# 		dup #返回自己的副本
# 	end
# 	def -@
# 		self.class.new(-x,-y) #颠倒x,y各自的正负
# 	end
# 	def ~@
# 		self.class.new(-y,x) #使坐标翻转90度
# 	end
# end
# point = Point.new(3,6)
# p +point #=> (3,6)
# p -point #=> (-3,-6)
# p ~point #=> (-6,3)

# # 处理错误与异常
# begin
# 	可能会发生错误的处理
# rescue => 引用异常对象的变量
# 	发生异常时的处理
# rescue Exception1,Exception2=>变量
# 	对Exception1或者Exception2的处理
# rescue Exception3=>变量
# 	对Exception3的处理
# ensure
# 	不管是否发生异常都希望执行的处理
# end
# $! 最后发生的异常(异常对象)
# $@ 最后发生的异常的位置信息
# file1 = ARGV[0]
# file2 = ARGV[1]
# begin
# 	io = File.open(file1)
# rescue Errno::ENOENT,Errno::EACCES
# 	io = File.open(file2)
# end

# 异常对象的方法
# class 异常的种类
# message 异常信息
# backtrace 异常发生的位置信息($@与$!.backtrace)
# 异常类
# Exception
# 	-SystemExit
# 	-NoMemoryError
# 	-SignalException
# 	-ScriptError
# 		-LoadError
# 		-SyntaxError
# 		-NotImplementedError
# 	-StandardError
# 		-RuntimeError
# 		-SecurityError
# 		-NameError
# 			-NoMethodError
# 		-IOError
# 			-EOFError
# 		SystemCallError
# 			-Errno::EPERM
# 			-Errno::ENOENT
# 		...
# 	...
# 自定义异常
# MyError = Class.new(StandardError)
# MyError1 = Class.new(MyError)
# class MyError < StandardError
# end
# 主动抛出异常
# raise方法有以下4中调用方式
# 	raise message
# 	raise 异常类
# 	raise 异常类,message
# 	raise

# Ruby块 block
# 对象.方法名(参数列表) do |块变量|
# 	希望循环的处理
# end
# 对象.方法名(参数列表) {|块变量|
# 	希望循环的处理
# }

# 将块封装成对象
# hello = Proc.new do |name|
# 	puts "Hello,#{name}."
# end
# hello.call("world") #=> Hello,World
# hello.call("Ruby") #=> Hello,Ruby

# def total2(from,to,&block)
# 	result = 0 #合计值
# 	from.upto(to) do |num| #处理从from到to的值
# 		if block #如果有块的话
# 			result += block.call(num) #累加经过块处理的值
# 		else
# 			result += num #直接累加
# 		end
# 	end
# 	return result #返回方法的结果
# end
# p total2(1,10)
# p total2(1,10) {|num| num **2 }

# def call_each(ary,&block)
# 	ary.each(&block)
# end
# call_each [1,2,3] do |item|
# 	p item
# end

# 计数
# n.times 
# from.upto(to)
# from.downto(to)
# from.step(to,step)

# 数组
# a = Array.new
# a = Array.new(5,0)
# 创建不包含空白的字符串数组时,可以使用%w
# lang = %w(Ruby Perl Python Scheme Pike REBOL)
# ["Ruby","Perl","Python","Scheme","Pike","REBOL"]
# 创建符号(Symbol)数组的%i
# lang = %i(Ruby Perl Python Scheme Pike REBOL)
# [:Ruby,:Perl,:Python,:Scheme,:Pike,:REBOL]
# num = [1,2,3]
# even = [2,4,6]
# p (num + even) #=>[1,2,3,2,4,6]
# num.concat(even)
# num<<even
# p (num | even) #=>[1,2,3,4,6]
# 追加元素 unshift push
# 删除元素 shift pop
# a.compact
# a.compact! 删除所有nil元素
# a.delete
# a.delete_at
# a.slice!(n)
# a.slice(n..m)
# a.slice(n,len)
# a.uniq a.uniq!
# 引用元素 first last
# 替换数组元素
# a.collect
# a.collect!{|item|...}
# a.map 
# a.map!{|item|...}
# a = [1,2,3,4,5]
# a.collect!{|item| item*2 }
# a.fill(0,2..3)
# a.reverse
# a.reverse!

# 字符
# 转义 
# %Q \" 
# %q \'
# <<"EOB"
# 字符串内容
# EOB
# 删除最后一个字符
# chop chop!(破坏性的)
# 删除换行符
# chomp chomp!

# hash散列
# h = Hash.new
# h.store("R","Ruby")
# p h.fetch("R") #=> "Ruby"
# p h.fetch("N") #=>IndexError
# p h.keys #所有键以数组返回
# p h.values
# p h.to_a
# h.key?
# h.has_key?
# h.include?("z")
# h.member?("z")
# h.value?(value)
# h.has_value?(value)
# h.clear

# 正则表达式
# re = Regexp.new("Ruby")
# /^...$/ 匹配字符数为3的行
# /abc/i =~ "ABCdef" 不包括大小写匹配

# IO
# $stdin
# $stdout
# $stderr
# $stdin.tty?
# io = File.open(file,mode)
# io = open(file,mode)
# ary = io.readlines
# ary.each_line do |line|
# 	line.chomp!
# 	#对line进行的操作
# end
# IO.popen(command,mode)
# filename = ARGV[0]
# open("|gunzip -c #{filename}") do |io|
# 	io.each_line do |line|
# 		print line
# 	end
# end
# open-uri库
# rquire "open-uri"
# #通过HTTP读取数据
# open("http://www.ruby-lang.org") do |io|
# 	puts io.read #将Ruby的官方网页输出到控制台
# end

#通过FTP读取数据
# url = "ftp://www.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz"
# open(url) do |io|
# 	open("ruby-2.3.1.tar.gz","w") do |f| #打开本地文件
# 		f.write(io.read)
# 	end
# end

# Dir File 目录与文件类

# FileTest模块
# FileTest.exist?("c:\\windows-version.txts")
# file?(path)
# directory?(path)
# owned?(path)
# readable?(path)
# writable?(path)
# executable?(path)
# size(path)
# size?(path)
# zero?(path)

# find库
# require 'find'
# IGNORES = [ /^\./, /^CVS$/, /^RCS$/ ]
# def listdir(top)
# 	Find.find(top) do |path|
# 		if FileTest.directory?(path) #如果path是目录
# 			dir, base = File.split(path)
# 			IGNORES.each do |re|
# 				if re =~ base #需要忽略的目录
# 					Find.prune #忽略该目录下的内容的查找
# 				end
# 			end
# 			puts path #输出结果
# 		end
# 	end
# end

#fileutils库
# FileUtils.cp(from,to)
# FileUtils.cp_r(from,to)
# FileUtils.mv(from,to)
# FileUtils.rm(path)
# FileUtils.rm_f(path)
# FileUtils.compare(from,to)
# FileUtils.mkdir("foo/bar")

# 编码encoding
# puts a.encoding

# Time Date
# Time.now

# Proc类
# Proc就是使块对象化的类
# Proc.new Proc等有另外一种写法叫lambda
# prc1 = Proc.new do |a,b,c|
# 	p [a, b, c]
# end
# prc1.call(1,2) #=>[1, 2, nil]
# prc2 = lambda do |a, b, c|
# 	p [a, b, c]
# end
# prc2.call(1,2) #=> 错误(ArgumentError)

# 块注释
# (=begin =end)

=begin
for x in 1..10
	for y in 1..x 
		if x==y
			print y,"X",x,"=",x*y,""
			puts ""
		else
			print y,"X",x,"="," "
		end
	end
end
=end

#next
=begin
for x in 1..10 
	if x==8
		#next
		#break
	end
	puts x
end
=end

#redo
=begin
i=1
while (i<=10) do
	if (i==5)
		i+=1
		redo
	end
	puts i.to_s
	i+=1
end

=end

=begin
def search(name)
	arrs = ['xie','xiao','lin','xiexiaolin']
	for n in arrs do 
		puts n
		if (n==name) then
			return true
		else
			return false
		end
	end
end

if search("xiaolin") then
	puts 'is xie'
else
	puts 'not xie'
end
=end

#arr = Array.new
#ha = Hash.new

class Goods
	class Goods_in
		def f
			puts "this is a method in good_in class - f"
		end
	end
end

class Animal
	def f
		puts "this is Animal method f"
	end
end
class Animal::Body
	def f
		puts "this Animal::Body method f"
	end
end
a = Goods::Goods_in.new
a.f

b = Animal::Body.new
b.f

class Birds
	#empty class
end
#特殊类被追加到特定对象上
bir = Birds.new
class << bir
	def put
		puts "this is bir puts"
	end
end
bir.put

class Roadster
	def initialize
		
	end
	def init
		@brand = "BYD"
		@color = "yellow"
		@weight = "1800kg"
		@F_zero = "210km/h"
	end	

	attr :brand,false #true 为可读写的属性
	attr_accessor :color,:some_read #read write
	attr_reader :weight, :F_zero
	#attr_writer 
end

def showCar(car)
	puts "============="
	puts "the car brand is:" +car.brand
	puts "the car color is:" +car.color
	puts "the car F_zero is:" +car.F_zero
	puts "the car weight is:" +car.weight
end

r = Roadster.new
r.init
showCar(r)

r.color = "red"
showCar(r)

#code block
#{} 
#do end 
#yield关键字调用传入的代码块
def say
	puts "hello"
	yield
	puts "bye"
end

say do 
	puts "what you say?"
end

#examples code block
class Student
	def initialize(number,name)
		@number = number
		@name = name
	end
	
	attr_accessor :number, :name
end

def each(stus)
	for stu in stus
		yield(stu)
		puts stu.number + "\t" +stu.name
	end
end

students = Array.new
students[0] = Student.new("001","xie")
students[1] = Student.new("001","xiao")
students[2] = Student.new("001","lin")

each(students) do 
	|stu| stu.number = "stu" + stu.number
end


#class extend
class Bird
	def initialize(wing,leg)
		@wing = wing
		@leg = leg
	end
end

class Chick < Bird
	def initialize(color)
		super(2,2)
		@color = color
	end
	def show
		puts "this chick color is #@color,have #@wing wing,also have #@leg legs"
	end
end

chick = Chick.new("yellow")
chick.show

#private protected public
class Objs
	def fly
		
	end
	def eat
		
	end
	def run
		
	end
	def jump
		
	end

	public(:fly)
	private(:eat)
	protected(:run,:jump)
end

obj = Objs.new
obj.fly
#obj.eat #NoMethodError
#obj.jump #NoMethodError

class MyMap
	def []=(key,value)
		@status ||= [] # ||= ?
		@status << { key => value }
	end
	def [](key)
		item = @status.find { |s| s.keys.first ==key }
		item[key]
	end
end

m = MyMap.new
m["key"] = 12345
puts m["key"]

#advanced ruby
module ModuleName
	def moduleInfo
		puts "我是模块里面的方法成员"
	end

	def self.showInfo
		puts "我是模块里面的类方法成员"
	end
end
ModuleName.showInfo

module ModulePlace
	class FirstPlace
		def moduleInfo
			puts "我是模块定义的ModulePlace命名空间中的moduleInfo方法"
		end
	end
end

module SmodulePlace
	class SecondPlace
		def moduleInfo
			puts "我是模块定义的SmodulePlace命名空间中的moduleInfo方法"
		end
	end
end

firstPlace = ModulePlace::FirstPlace.new
firstPlace.moduleInfo
secondPlace = SmodulePlace::SecondPlace.new
secondPlace.moduleInfo

module FatherEyes
	def fEyes
		puts "Father的眼睛是双眼皮"
	end
end
module SonEyes
	def SonEyes.fEyes
		puts "巧了,儿子的眼睛也是双眼皮啊,当然了有其父必有其子嘛!"
	end
end
class Eyes
	include FatherEyes
end
eyes = Eyes.new
eyes.fEyes
puts SonEyes.fEyes

#BEGIN END
BEGIN {
  puts "one begin"
}
BEGIN {
  puts "two begin"
}
BEGIN {
	puts "three begin"
}

# at_exit{
# 	puts 'one at_exit'
# }
# at_exit{
# 	puts 'two at_exit'
# }
# at_exit{
# 	puts 'three at_exit'
# }

END {
  puts "one end"
}
END {
	puts "two end"
}
END {
	puts "three end"
}
END {
	puts "four end"
}

#extend
module Mood
	def say
		p "hello,everyone!"
	end
end

class Person
	#extend Mood
end

person = Person.new
person.extend(Mood)
person.say

#defined?
class Return
	def Replay
		puts "are you know?"
		puts defined? "real good"
	end
end

ret = Return.new
puts defined?ret.Replay # ?return bool
ret.Replay

#miss
class Missing
	def miss
		puts "我没有丢失miss的方法"
	end
	def const_missing(name)
		puts "常数#{name}没有定义"
	end
	def method_missing pd
		puts "不好意思,在Missing类中不存在#{pd.to_s}的实例方法"
	end
	def self.method_missing pd
		puts "不好意思,在Missing类中不存在#{pd.to_s}类方法"
	end
end

miss = Missing.new
miss.miss
miss.nihao
Missing.Mynihao

class Find
	def self.post
		puts "使用的地址是:http://www.baidu.com"
	end
	def self.method_missing pd
		puts "地址出错,请检查...出错地址是http://www.xxx.com"
	end
end
puts Find.post
puts Find.show

#Proc object 过程对象
def call_proc(pr)
	a = "===我是在call_some_proc中声明的变量==="
	puts a
	pr.call
end
b = "=====我是在外部声明的变量====="
pr = Proc.new{puts b}
pr.call
call_proc(pr)

def grab_blc(&blc)
	blc.call
end
grab_blc{ puts "==知道我是谁吗,郑重告诉你,我是Proc对象"}

#class class
#ruby 2.3.1
# MyClass <= Class <= Module <= Object <= BasicObject
class MyClass
	#定义类方法
	def self.method1
		puts "method 1"
	end
	#另外一种定义类方法
	def MyClass.method2
		puts "method 2"
	end
	#实例方法
	def method3
		puts "method 3"		
	end
end
my_class = MyClass.new
my_class.method3

MyClass.method1
MyClass.method2
#MyClass.method3 #报错 undefined method 'method3'

puts MyClass.class #Class
puts MyClass.class.superclass #Module
puts MyClass.class.superclass.superclass #Object
puts MyClass.class.superclass.superclass.superclass #BasicObject
puts MyClass.class.superclass.superclass.superclass.superclass #nil

#eval 效率差莫大量使用
def eval_run
	puts "下面的这段代码是使用eval动态执行的代码"
	count = Array.new
	startTime = Time.now
	puts "使用eval动态执行的代码的开始时间是:" + startTime.to_s
	str = "abcdefghijklmnopqrstuvwxyz"
	for a in 1..10000
		eval("count<<str")
	end
	endTime=Time.now
	puts "使用eval动态执行的代码的结束时间是:" +endTime.to_s
	puts "使用eval动态执行的代码的时间间隔是:" +(endTime - startTime).to_s
end

def common_run
	puts "下面的这段代码是使用正常执行的代码"
	count = Array.new
	startTime = Time.now
	puts "使用正常执行的代码的开始时间是:" + startTime.to_s
	str = "abcdefghijklmnopqrstuvwxyz"
	for a in 1..10000
		count<<str
	end
	endTime=Time.now
	puts "使用正常执行的代码的结束时间是:" +endTime.to_s
	puts "使用正常执行的代码的时间间隔是:" +(endTime - startTime).to_s
end

eval_run
common_run

#error
# RuntimeError NoMethodError NameError IOError TypeError ArgumentError NoMemoryError RangeError RegexpError
puts "=====不同的异常采用不同的异常处理块====="
begin
  class Fly
		def flying(speed)
			@speed = speed
			puts "飞机正以#{@speed}的速度向前飞行"
		end
	end

	fly = Fly.new
	fly.show
	#fly.flying
rescue NoMethodError
  puts "没有此方法,因此抛出异常"
rescue ArgumentError
  puts "程序传的参数不一致,因此会抛出这一句"
rescue Exception => e
  puts "程序出现异常"
  puts "#{e.backtrace}"
  puts "#{e.to_s}"
  puts "#{e.message}"
end

#reg match
str = "liner.xie@qq.com"
reg = /^([a-z0-9A-Z]+[-|\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-z0-9A-Z]{2,}$/
if reg.match(str) #str.match(reg)
	puts "email is valid"
else
	puts "email is not valid"
end

#Thread
i=1
Thread.new 10 do |value|
	while i < value
		puts "#{i}"
		i += 1
	end
end
Thread.new do 
	10.times do |a|
		puts "第#{a+1}次输出"
		if a > 6
			Thread.exit
			#Thread.kill
		end
	end
end
thread = Thread.start "hello" do |value|
	puts "我是使用start方法来创建的线程+#{value}\n"
end
thread = Thread.fork "world" do |value|
	puts "我是使用fork方法来创建的线程+ #{value}\n"
end
Thread.fork do 
	currentThread = Thread.current
	puts "使用start创建一个新的线程,当前的线程是:"+currentThread.to_s
end
mainThread = Thread.current
puts "主线程是" + mainThread.to_s

#ticket thread Mutex
@num = 200
@mutex = Mutex.new
def ticketNum(num)
	@mutex.lock
	Thread.pass
	if (@num >= num)
		@num -= num
		puts "你已经成功购买#{num}张火车票"
	else
		puts "对不起,您购买的#{num}张火车票失败,已经没有了"
	end
	@mutex.unlock
end
ticketsuccess = Thread.new(199) {|num| ticketNum(num)}
ticketsuccess = Thread.new(2) {|num| ticketNum(num)}
ticketsuccess.join
ticketsuccess.join

mutex = Mutex.new
thread = Thread.new do 
	mutex.lock
	sleep 30
end
thread1 = Thread.new do 
	if mutex.try_lock
		puts "其他线程没有占用,你老可以使用"
	else
		puts "它是我的哈哈,不能被锁定"
	end
end

#File FileTest
fp = "d:/ruby/rails_learn/ruby_start.rb"
#fp = "/home/liner/Develop/windows_mount/ruby/rails_learn/ruby_start.rb"
mode = File.stat(fp).mode
puts "the file mode is #{mode}"
exist = FileTest.exist?(fp)
exists = FileTest.exists?(fp)
if(exist)
	puts "exist:文件#{fp}存在"
else
	puts "exist:文件#{fp}不存在"
end

if(exists)
	puts "exists:文件#{fp}存在"
else
	puts "exists:文件#{fp}不存在"
end

#ruby mysql
#dbh = Mysql.real_connect("localhost","root","root","rails_learn_development","3306")
#sql = "select name from events"
#res = dbh.query(sql)

#ruby meta programing
10.times do
  class C
		puts "hello"
	end
end

class D
	def x; 'x'; end
end

class D
	def y; 'y'; end
end

d = D.new
puts d.x
puts d.y

#测试注入是否会污染标准库
class String
	def to_alphanumeric
		gsub /[^\w\s]/, ''
	end
end

puts "liner".reverse
puts "...liner,....,;   ".to_alphanumeric

#method_missing例子
class Students
	attr_accessor :name, :sex, :age, :grade
	def initialize(_name, _sex, _age, _grade)
		self.name = _name
		self.sex = _sex
		self.age = _age
		self.grade = _grade
	end
	#定义to_s方法后,使用puts会直接输出学生的姓名
	def to_s
		self.name
	end
end

class School < Array
	#查找学生
	def find_student(by, value)
		#使用了Array类的find_all方法,并使用send方法动态获得属性值
		self.find_all{|s| s.send(by)==value}
	end
	#添加学生
	def add_student(student)
		self << student
	end

	def method_missing(name, argument)
		#使用正则表达式对没有定义的方法名进行匹配
		match = /^find_student_by_([a-z]+)$/.match(name.to_s)
		if match
			#如果符合find_by_name等形式则调用find_student进行查找
			find_student match[1], argument
		else
			raise NoMethodError
		end
	end
	#undef_method :method1
	#remove_method :method2
	#remove_const
	def test_function
		puts "test_function"
	end
	#undef test_function
end

school = School.new
school.add_student(Students.new("张三","男","16","初三"))
school.add_student(Students.new("李四","男","12","初一"))
school.add_student(Students.new("张燕","女","16","初三"))
school.add_student(Students.new("王强","男","16","初二"))

puts "名叫张三的学生有："
puts school.find_student_by_name("张三")
puts "性别为男的学生有："
puts school.find_student_by_sex("男")
puts "年龄为13岁的学生有："
puts school.find_student_by_age("13")
puts "级别为初三的学生有："
puts school.find_student_by_grade("初三")