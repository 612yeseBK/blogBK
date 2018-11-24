---
title: word2vec工具探索
categories: NLP
tags:
  - gensim
  - word2vec
date: 2018-11-09 16:01:34
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何使用genism去计算一个词的word embedding<!-- more -->
<The rest of contents | 余下全文>

# 初识

这是最简单的使用

```
import gensim

sentences = [['first', 'sentence'], ['second', 'sentence']]
# train word2vec on the two sentences
model = gensim.models.Word2Vec(sentences, size=5, min_count=1)
word_vec = model['first']
print(word_vec)
# [ 0.03712391 -0.01817003 -0.06288775 -0.04320185 -0.05464336]
```

# 模型参数介绍

```
class gensim.models.word2vec.Word2Vec(sentences=None, corpus_file=None, size=100, alpha=0.025, window=5, min_count=5, max_vocab_size=None, sample=0.001, seed=1, workers=3, min_alpha=0.0001, sg=0, hs=0, negative=5, ns_exponent=0.75, cbow_mean=1, hashfxn=<built-in function hash>, iter=5, null_word=0, trim_rule=None, sorted_vocab=1, batch_words=10000, compute_loss=False, callbacks=(), max_final_vocab=None)
```

sentence：用于训练的数据，The sentences iterable can be simply a list of lists of tokens ，意思是它是list of lists，最里层的list就是句子，sentences = [['first', 'sentence'], ['second', 'sentence']]就是表示第一个句子是first sentence，第二个句子是second sentence。但是他也可以表示为*iterable of iterables* ,iterable的一些介绍可以看我的另一篇博文，简单来说就是可以多次生成iterator的对象。

corpus_file: 这是一个用来加速的选项，需要用genism里面的一个处理函数，没见人用过

size：(*int,* *optional*)  - 是指特征向量的维度，默认为100 

window：(*int,* *optional*) —表示当前词与预测词在一个句子中的最大距离是多少 

alpha: (*float,* *optional*) - 是学习速率 

min_alpha：*(*float*,* *optional*) – 学习率会线性的下降到min_alpha的值

seed：(*int,* *optional*)  - 用于随机数发生器。与初始化词向量有关。 

sg： (*{0*, *1},* *optional*) –  1 表示使用skip-gram; 其他表示使用CBOW.

hs：(*{0,* *1},* *optional*) – 如果是1, 表示使用hierarchical softmax去训练. 如果是0, 并且negative参数非零,会使用负采样训练。

negative： (*int,* *optional*) – 这里说的是负采样会加入几个噪声进去，表示负的程度，一般取5到20个词作为负采样，如果设置成0，那么就不会有负样本

cbow_mean:  (*{0,* *1},* *optional*) - 如果为0，则采用上下文词向量的和，如果为1（defau·t）则采用均值。只有使用CBOW的时候才起作用。

min_count :  (*int,* *optional*) - 词频少于min_count次数的单词会被丢弃掉, 默认值为5

max_vocab_size: (*int,* *optional*) - 设置词向量构建期间的RAM限制。如果所有独立单词个数超过这个，则就消除掉其中最不频繁的一个。每一千万个单词需要大约1GB的RAM。设置成None则没有限制。

sample:  (*float,* *optional*) - 高频词汇的随机降采样的配置阈值，默认为1e-3，范围是(0,1e-5)

workers： (*int,* *optional*)  - 参数控制训练的并行数。

hashfxn： hash函数来初始化权重。默认使用python的hash函数

iter：(*int,* *optional*)  - 迭代次数，默认为5，一般会有默认的第一次，用来构建字典树

trim_rule： (*function,* *optional*)  用于设置词汇表的整理规则，指定那些单词要留下，哪些要被删除。可以设置为None（min_count会被使用）或者一个接受()并返回RU·E_DISCARD,uti·s.RU·E_KEEP或者uti·s.RU·E_DEFAU·T的函数。

sorted_vocab： (*{0,* *1},* *optional*) – 如果为1（default），则在分配word index 的时候会先对单词基于频率降序排序。

batch_words：(*int,* *optional*) - 每一批的传递给线程的单词的数量，默认为10000

# 使用iterable传入对象

```
class MySentences(object):
    def __init__(self, dirname):
        self.dirname = dirname
 
    def __iter__(self):
        for fname in os.listdir(self.dirname):
            for line in open(os.path.join(self.dirname, fname)):
                yield line.split()
 
sentences = MySentences('/some/directory') # a memory-friendly iterator
model = gensim.models.Word2Vec(sentences)
```

这里的sentence是一个可迭代对象，每次给模型的是一个list（文件夹里面文件的某一行的单词list），然后逐步把所有语料库都传入进去，这样可以不用一次加载全部语料库，节约了内存

# 输入流无法重复利用

有时候我们的输入流是无法重复使用的

```
model = gensim.models.Word2Vec(iter=1)  
# 建立一个空模型 an empty model, no training yet
model.build_vocab(some_sentences) 
# 先建立字典树 不要使用训练的数据，用别的已知的数据
# can be a non-repeatable, 1-pass generator
model.train(other_sentences)  
# 使用这次训练的语料库进行训练 
# can be a non-repeatable, 1-pass generator
```

# 存储模型

```
model.save('/tmp/mymodel')
new_model = gensim.models.Word2Vec.load('/tmp/mymodel')
```

# 载入模型并进一步训练

```
model = gensim.models.Word2Vec.load('/tmp/mymodel')
more_sentence = [["some","more","sentences"]]
model.train(more_sentences)
```

# 一些模型的用处

```
model.most_similar(positive=['woman', 'king'], negative=['man'], topn=1)
[('queen', 0.50882536)]
model.doesnt_match("breakfast cereal dinner lunch".split())
'cereal'
model.similarity('woman', 'man')
0.73723527
```

most_similar的用法：取最接近（positive向量和 - negative向量和）的前topn个词，并给出相似度

positive (*list of str*, *optional*) – List of words that contribute positively.

negative*(*list of str*,* *optional*) – List of words that contribute negatively.

topn (*int,* *optional*) – Number of top-N similar words to return.

similarity的用法：计算两个单词的余弦相似度

doesnt_match的用法：找到list里面与其他词最不一相似的那一个