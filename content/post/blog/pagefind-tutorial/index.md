---
title: "为你的博客创建搜索引擎：Pagefind搭建指北"
date: 2023-03-12T22:47:34+08:00
tags: ["折腾"]
keywords: ["Pagefind"]
categories: ["博客"]
author: "Mitcher"
rss_ignore: false
draft: false
---

聊聊非CS选手是如何折腾前端的...

<!--more-->

## 写在前面

上周六闲着也是闲着，于是寻思顺便在原来的主题加入搜索引擎，以更好整理日后的内容。因为之前（直到昨天）还是在用[Pseudoyu](www.pseudoyu.com)的配置文件，看到yu介绍自己搭建过程的时候比较轻描淡写，加上之前有使用Cusdis的一些经验，于是产生了应该不是很难的错觉。本篇的省流版本可见于[为你的博客创建搜索引擎——谈谈我在搭建Pagefind时踩过的坑](https://www.huang-zifeng.com/p/为你的博客创建搜索引擎谈谈我在搭建pagefind时踩过的坑/)。
<!--more-->

## localhost

首先应该是在layouts/shortcodes中创建search.html，在其中放入来自[Getting Started with Pagefind](https://pagefind.app/docs/)的html代码：

```html
<link href="/_pagefind/pagefind-ui.css" rel="stylesheet">
<script src="/_pagefind/pagefind-ui.js" type="text/javascript"></script>
<div id="search"></div>
<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        new PagefindUI({ element: "#search" });
    });
</script>
```

以方便后面我们在写Markdown的时候通过关键字`search`快速嵌入页面版式。

然后就是在`Bash`对本地文件进行索引，查看效果：

```
npx -y pagefind --source public --serve
```

上面这行命令的意思是, 使用`npx`安装pagefind，-y表示如果本地没有安装默认同意安装，`--source public`表示对public文件夹中的文件进行索引, --serve表示索引完之后直接启动本地端调试。

其中遇到的困难是，安装的时候会显示`正在写入数据流`，写入完之后就不了了之了，这在GitHub上面有人提过issue，我当时还没有去看，只是通过询问New Bing知道了这种情况可能是终端不兼容的问题（当时用的是Bash）,后面换成命令行工具就好了。

执行索引的那条命令，如果按照教程加上--serve按理说应该会看到本地的显示效果才对，while它会重定向到你`baseurl`所指向的地址，所以你无法在本地端调试。

接下来笔者点了一个技能树，发现有一个Pseudoyu的仓库里有个Shell脚本文件`startpf.sh`可以直接一次性执行上面的三行代码，并且可以在本地显示效果。

内容是

```shell
hugo
npm_config_yes=true npx pagefind --source "public" --bundle-dir ../static/mysearch
hugo server
```

至此，你应该完成了本地端的调试。在本地端看见了效果：

![localhost](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/image-20230313001534638.png)

## CI

接下来是GitHub Action上自动执行工作流，原本想的很简单的，就和白汤四物[轻描淡写](https://www.fournoas.com/posts/adding-full-text-search-to-a-hugo-static-website/)般的一样。

> 编辑 .github/workflows/hugo.yml 文件，在 steps 小结中的 Build 和 Deploy 操作之间添加如下内容：
```yaml
   name: Install nodejs
    uses: actions/setup-node@v3
    with:
      node-version: 18
   run: npm i pagefind
   run: npx pagefind --source public --bundle-dir search
```
对于大多数人来说，部署Pagefind已经就此完成了。如果只是这样，作为一款静态网站搜索引擎工具，Pagefind确实足够优秀，轻量化。

## Troubleshoot

但是发现所有workflow都没有报错之后，在网站依然看不见搜索框UI。

接下来的三天没折腾什么，就是对着`deploy.yml`反复进行上百次的修改（此处是心碎的声音💔）

直接说结论，为什么Workflow没有报错，但是UI没有显示呢。

我在GitHub上面提问了作者[bglw](https://github.com/bglw)，得到的回复是DOMContentLoaded发生的时间太快，因此`window.addEventListener`根本来不及运行，呃呃呃呃，只能说对于作为非前端开发的笔者根本看不出来可以这样debug好吧。后面在markdown的search标签下加入了script。

```html
<script defer> new PagefindUI({ element: "#search" }) </script>
```

意思是强制执行这行代码，还是用了`defer`进行延后。

之后再看看开发者模式，果然跳出来了小丑（捣蛋鬼👻）

大概是"rocket-loader.css"加载错误。

这个恰恰是Cloudflare的一项加速服务。因而很容易想到为什么DOMContentLoaded发生的时间会太快。

于是关闭这项服务之后，等了四天的结果终于出现了。至此，踩的坑已经分享完成。

