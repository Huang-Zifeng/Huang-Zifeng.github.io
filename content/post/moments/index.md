---
title: 随想
date: 2023-02-02
rss_ignore: true
comments: false
---

这里是随想，记录一些个人的murmur。

<!--more-->

## 2023

#### June

换做以前我真的会把群里的匿名怼回去，但是觉得还是不要把风气弄丑吧。

今天真是多事，因为看不见Apple Watch解锁iPhone的选项，于是把iPhone的设定重设了一遍

之后今晚发现iCloud剪切板失效，试了网上很多办法，最后成功的办法是把iPad和iPhone的账号登出，然后再重新登录即可。好在总算解决了，心累。

哀莫大过于心死

> Jun 5 7:25 PM

好想当女生，男女老师都喜欢，长得好看不愁舔狗，结婚前腿一张就来钱，结婚后还能有人供养着

> unknown time

#### May

**cv2.pointPolyTest()**

就在几个月没碰opencv，因为RA工作的要接触一个叫pointPolyTest的函数，结果一直报错（第一个参数是无法解析的索引）。以下是正确的解决思路：

先找出pointPolyTest接受的参数类型：

![parameter](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/blog/image-20230527110624513.png)

python语法基础知识

``` python
my_list = [1, 2, 'three', [4, 5]] #列表
my_tuple = (1, 2, 3) #元祖，相当于数据不可被的列表
tinydict = {'a': 1, 'b': 2, 'b': '3'} #字典
tinydict['b'] #字典的访问方式
```

现在我们知道了pointPolyTest接受的参数类型，又知道每种数据类型长的样子之后，我们看看错误的调用代码：

```python
random_point = tuple(contour[np.random.randint(0, len(contour))][0])

while True:
  	offset = np.random.randint(-10, 10, size=2)
		# 更新点的位置
    new_point = (random_point[0] + offset[0], random_point[1] + offset[1])

    #pointPolyTest
    if cv2.pointPolygonTest(contour, new_point, False) >= 0:
        random_point = new_point
```

这里面numpy数组默认的整数类型是int64，所以原本数据是int类型的random_point被强制转换为了int64类型，包括其创建的时候被转换为了int64，但是pointPolyTest接受的参数是“tuple of 2 ints”，由此出错。

正确的解决思路是创建的时候和更新的时候使用类型强制转换

```python
random_point = tuple(int(x) for x in contour[np.random.randint(0, len(contour))][0])

new_point = (random_point[0] + int(offset[0]), random_point[1] + int(offset[1]))
```

**cv2.findContours()**

我们来看看findcontour返回的contour

**一般用法**

```python
contours, hierarchy = cv.findContours(thresh, cv.RETR_TREE, cv.CHAIN_APPROX_SIMPLE)
```

**参数的含义**

• contours：返回一个列表，其中每个元素表示检测到的轮廓（由一组点组成的形状）。

• hierarchy：表示层次结构，是一个Numpy数组，每个元素包含四个值：[next, previous, first_child, parent]

一般来说我们只用第一个返回值即可

关于contours,

例如，我要用第一个轮廓，那么就是contours[0]

大概长这样`[[[437 220]] ... [[438 220]]]`

我要找第一个轮廓的第一个点，那么就是`[[437 220]]`,长得很奇怪，是一个列表，列表里面唯一的元素是一个列表

**One More Thing**

然而，写博客最大的动力居然是想记录一下巧合事，

就在昨天上网看opencv的官方文档，被pointPolyTest弄得焦头烂额时，大洋彼岸的opencv course客服居然打了个电话过来，那个course的账号我其实几个月之前就注册了，甚至还退订了他们发的营销邮件，所以说非常的巧合，非常的无缘无故。但是客服很礼貌也很热情的向我推销他们的课。而我贫瘠的英语甚至不敢用来问它我为什么会报错哈哈哈哈。

> May 27 10:54 AM

Pspice当需要交流源的时候还是尽量用VSIN，VAC不能调节频率。

> May 25

生了一次病（感冒）

总算把健康的生活方式找回来

牙好痛

才知道不生病是这么爽

还我寂寞健康

> May 23 11:21 PM

在上晚自习，现在身心俱疲

听着AW的新单曲Hero

“leave me in the dark, please

who's gonna save me now?

some kind of hero.

I can't breathe, hoping you to rescue

me” 

> May 19 7:55 PM 

今晚在mac上搭建开发环境，不用像Windows一样设置复杂的环境变量好评。jetbrain toolbox安装的pycharm是intel版的差评。

然后比较麻烦的是之前的一个shell脚本出问题了。Windows的编辑器保存的时候会默认加上特有的换行符（看不见）。所以在Mac这样的基于unix的系统上运行会出错。后来用dos2unix解决。

后来就是push的时候要通过GitHub认证。GitHub不允许用密码来认证。只可以用token或者git-credential-manager来认证，除了下载慢之外还好。token因为要涉及复杂的scope被我放弃了。

最后折腾的是没想到的ssh密钥。我的博客repo比较特殊，需要密钥才能远程推送（一种安全机制罢）。可以参考[Generating a new SSH key and adding it to the ssh-agent - GitHub Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

其中gpt给出的

```shell
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

有点过时了。

建议使用Ed25519算法，即

```
$ ssh-keygen -t ed25519 -C "your_email@example.com"
```

添加密钥之后依旧报错

> kex_exchange_identification: Connection closed by remote host
>
> Connection closed by 20.205.243.166 port 22
>
> fatal: Could not read from remote repository.
>
> 
>
> Please make sure you have the correct access rights
>
> and the repository exists.
>
> kex_exchange_identification: Connection closed by remote host
>
> Connection closed by 20.205.243.166 port 22
>
> fatal: Could not read from remote repository.
>
> 
>
> Please make sure you have the correct access rights
>
> and the repository exists.

非常玄学。

执行以下指令查看是否可以通过ssh访问GitHub

```shell
ssh -vT git@github.com
```

出现报错

后来自己做了几个玄学的操作：

- 想关闭防火墙，发现防火墙一直没有打开，于是打开了防火墙。执行上面命令的时候没有报错，但也没有好。

- 下载GitHub CLI，顺便克隆了自己的仓库

- 在新的仓库上再次执行时没有报错。回到旧的仓库成功。

  这就是还有5个小时考雅思的人吗:(

  

> May 14 3:23

已经分手

第一次用Mac

iPad莫名坏了

买了个降级的iPad Air(穷)

嘉年华看到了多年后成为社畜的自己

社团都是老人在支撑捏

彩六协会团建 见到了素未谋面的网友

You can't break my mind cause I'm unusual

以及

逝去的 錯愛變成鼓舞

就算鑽進了冤枉路

無負你 行錯路

原來是一加一的結局捏

> May 7 1:22 AM

#### April

五一回家和对象奔现。弟弟率先实现了我想当便利店店员的梦想。而我因为处对象第一次有机会去花店买花，等一下送花的时候要说些什么好呢！花20朵45元，包装45元（程序极为复杂），花店里有各色的玫瑰，小孩子画的话，剪花的人，养花的人——开一家花店的人是有多浪漫。彩六校园赛结束，仿佛告别了一个时代。不过这次，没有遗憾。（上次的遗憾是威海那边的兄弟）。

> Apr 29 12:19 PM

这几天折腾电路仿真(multisim，PSpice， LTspice)，安装PSpice之后Git不能正常提交，解决方案如下：[安装Candence后在VS Code中使用SSH上传GitHub出现“Error:Permission Denied(publickey)”错误解决过程 ](https://zhuanlan.zhihu.com/p/468408224)

> Apr 21 8:10 PM

今天回家拜山，主要是想家里人了以及回家蹭一下新房子(嘿嘿)。

转发一下朋友圈

> 顺手记录一下奇妙的巧合：小学旁边的7仔重新装修了，去的时候店员说明天开业。三年级的时候第一次去这家7仔，刚好也是在开业前一天。
>
> 如果你看见一个人在采蝶轩买4件面包当中饭，那他说不定是从很远的地方回来的吧

今晚去了中海龙湾的7仔，买抹茶系列的时候店员会可爱地和我推销：“抹茶泡芙这么好吃都不买吗？”，虽然一开始真的对两件8折不太在意，后来还是下单了。

让我想起了学校旁边的全家也在处于抹茶季。店员和顾客（不是我，也可能是自言自语）说：”虽然我在这里上班，但是我是真心喜欢这里的东西（两件八折我觉得真的好划算）“（原话忘差不多了，自己的讲故事能力一直很差qaq）

果然发现自己是一个喜欢便利店文化的人了，以后也想有机会能当便利店店员（伍六七的“便利店一夜”也有这种意味欸，兴许便利店文化真的有信仰者）

> Apr 14 7:58 PM

今晚体育课周毅老师教我们网络上很火的运球步法，虽然没学太会，但是觉得老师很用心。在这位教师官网上查不到名字的老师身上，我看见了哈工大老师应该有的样子。除此之外还有几位很喜欢(敬佩)的老师：电子设计实践课的[王立欣老师](http://homepage.hit.edu.cn/wanglixin)，高等数学的殷锡鸣老师，概率论的王勇老师，复变函数的凌怡老师——只要是本部的老师都很喜欢，也应了那句话“如果是本部过来的老师，这门课就有救了”。

> Apr 11 8:30 AM 

写完作业洗完澡，终于可以开始做自己想做的事情了。希望下周效率高一点，思路清晰一点。先从做好下周的To-do开始吧。

4月12日更新：拖延症已然成为可怕的问题🤦

> Apr 2 1:42 AM

#### March

四食堂門口的提拉米蘇，最上面一層餅乾屑裹滿了奶油，卻一點都不膩。吃到底層的餅乾時，覺得雖然要9.8但是也很值。

> Mar 29 18:13

每天都有做不完的事情让我沮丧

朋友说：即使这样我也很快乐因为我知道我要去做什么

我希望自己也是

方才偶遇[风清云淡](https://wind.ink/article)的博客

决定以后把博客写成自己的一首诗

> Mar 29 12:07

刚刚9点重新整理blog的时候推送发现失败，还以为又是自己的手贱操作，在社群`Linux User Group`问了才知道GitHub原来一般9点的时候都push不了，赶上了996程序员们的下班潮了。

> Mar 27 21:58

这几天在补模电~~和数电~~落下的进度，模电有一点小小的心流，之后的学习方式大致会变成：

1. 开新课之前先看书预习，书本目前为止还是蛮好懂的，不行就辅之以网课，网课最多当作预习（因为网课不一定会讲到老师的重点）
2. 线下课认真上，不懂就问同学或者看回放，没预习看回放太受罪了
3. 做作业之前先总结

> Mar 26 14:44

工程经验+1

话说单片机debug的时候，总会卡在下面的这三行汇编当中反复循环

```
0x1FFFF3B2 F8D01808 LDR   r1,[r0,#0x808]
0x1FFFF3B6 0549   LSLS   r1,r1,#21
0x1FFFF3B8 D4FB   BMI   0x1FFFF3B2
```
换了正点原子给的例程后排除了程序的问题，之后在正点原子技术客服的建议下将3.3V供电换成了5V供电，问题解决

搞单片机这种东西还是很吃工程经验的——遇到问题得向老师傅多请教一下。

> Mar 18 4:44

> 一粒沙滲進浪漫恆河
>
> 一枝花很希望結果
>
> 每個渴望與伴侶一夥
>
> 一粒星要撲向浩瀚銀河
>
> 一絲煙都奢望愛火
>
> 美麗的結局卻沒有幾多
>
> 最希冀的那一個	心儀這一個
>
> ......
>
> 合意的	永遠最難擁抱
>
> 未見到答案的傾慕
>
> ......
>
> 一盞燈盼照寂寞行人	一間屋都思念某君
>
> 過客盼望會遇上關心
>
> ......
>
> 誰又會榮幸到	逃離荒島
>
> ......
>
> 逝去的	錯愛變成鼓舞
>
> 就算鑽進了冤枉路
>
> 無負你 行錯路
>
> ——AGA《一》

> Mar 17 2:27

> 你尚未出现时
>
> 我的生命平静
>
> 轩昂阔步行走
>
> 动辄料事如神
>
> 如今惶乱，怯弱
>
> 像冰融的春水
>
> 一流就流向你
>
> 又不知你在何处
>
> ——木心《五岛晚邮》

> Mar 14 2:05

今日模电听的不是很懂，

其余不错，忍不住折腾了一下pagefind，但是发现问题好像已经不是CI的问题了（用pseudoyu的网站文件试了一下，非常谢谢@[pseudoyu](www.pseudoyu.com)）

争取早睡，继续加油

Plus, 智能车的学长真的蛮友好，希望和他们在一起有所成长吧

> Mar 7 23:12

这几天发生了许多事。

明天要好好努力！😴

> Mar 7 2:27

#### February

今天晚上篮球课老师说要去帮忙补上学期的期末考试，遂有了一次打比赛的千载难逢的机会。高考之后很少碰过篮球了，因此今天很开心。

> Feb 28 0:41

今天晚上吃完晚饭，躺在床上一点干劲也没有的时候，比利突然发微信说散步散到了我们学校。庆幸自己的一个晚上就此被拯救。顺便，我们一起去银茶喝的丢酸油挺好喝的，油柑好像是以前小时候经常会吃的水果，不知怎么淡忘了。

> Feb 27 21:03

OpenAI(确切来说是ChatGPT)应该是我用过最难登录的东西，从禁用虚拟手机号到检查IP地址，没有比它更disgusting的了。

> Feb 26 20:51

刚刚在四食堂试了一下新开的汉堡店，味道一般般，价格也一般般。每次进四食堂的时候都会默默替门口右手边的档口感到忧伤。

> Feb 26 18:13

以前小学时经常喜欢在QQ空间分享自己无厘头的想法，现在大学了在朋友圈还是做一样的事情或许不太适宜，担心他们看过之后会想：“原来他是这样一个人！”。我也并非对自己不满，只是不想每次发圈都要承想别人的评论。但是来这里的人，也许都是有意了解我的人。Welcome!

>Feb 26 10:14  
