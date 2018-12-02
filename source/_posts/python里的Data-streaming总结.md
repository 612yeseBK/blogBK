---
title: python里的Data streaming总结
categories: python技巧
tags:
  - data streaming
date: 2018-11-10 16:17:37
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍python里的data streaming的文章，关于generators, iterators, iterables都有涉及到<!-- more -->
<The rest of contents | 余下全文>

原文链接：[Data streaming in Python: generators, iterators, iterables](https://rare-technologies.com/data-streaming-in-python-generators-iterators-iterables/)

# 最重要的是节约了内存

```
numbers = range(100000)
 
sum([n**2 for n in numbers])
333328333350000
 
# Generator: square and sum one value after another
# No extra array created = lazily evaluated stream of numbers!
sum(n**2 for n in numbers)
333328333350000
```

第一种方法没有使用streaming的方式，他首先创造了一个list，然后对它求和，是很浪费的。

第二种方法则是对一个元平方求和之后再处理下一个元素，没有创建一个list

这两种方法也许在时间效率上有所区别，但是在任何一个严格的数据处理过程中，语言的开销远远小于数据生成和计算的开销，迭代序列的真正力量在于**节约内存**！

# Generators, iterators, iterables的区别

iterator是我们最终关心的，它是实际管理一个序列里的单个元素的对象。而iterables和generators则是可以提供一个iterator的机制。这两者也是也是有区别的。

generator只能提供一次iterator，也就是你遍历一遍generator，那数据就已经消耗完了，在运行它也不会有更多的数据。

```
generator = (word + '!' for word in 'baby let me iterate ya'.split())
# 一个generator对象创建好了，等待被迭代
# 在这个点，惊叹号还没有添加进去
 
for val in generator: # 在迭代过程中，真正的处理过程在这里，这时候惊叹号才产生
    print val,
# baby! let! me! iterate! ya!
 
for val in generator:
    print val,
# 什么都不会打印出来，没有数据了，generator数据流之前已经消耗完了
```

iterable则不一样，只要当每次循环完成，就可以产生一个新的iterator（具体的说，是*iterable._ iter_ ()*被调用，例如python里面每次调用for循环）

```
class BeyonceIterable(object):
    def __iter__(self):
        """
        The iterable interface: return an iterator from __iter__().
        Every generator is an iterator implicitly (but not vice versa!),
        so implementing `__iter__` as a generator is the easiest way to create streamed iterables.
        iterable的接口，会通过__iter__()返回一个iterator
        每个generator都可以看做一个隐含的iterator，所以实现一个generator是创建一个可迭代对象的最简单的方式
        """
        for word in 'baby let me iterate ya'.split():
            yield word + '!'  # 这里使用的是yield去创建generator，和之前的本质是一样的。uses yield => __iter__ is a generator
 
iterable = BeyonceIterable()
 
for val in iterable:  # 创造了一个iterator
    print val,
# baby! let! me! iterate! ya!
 
for val in iterable:  # 创造了另一个iterator
    print val,
# baby! let! me! iterate! ya!
```

一般而言，iterables是一个更有用的机制，他可以允许你多次读取某一个序列。当然，如果你的数据只能被读取一次的话，那就只能使用generator。