---
title: "通过Hugo+GitHub Pages搭建你的第一个博客"
date: 2023-02-02
draft: false
tags: ["blog"]
categories: ["博客"]
author: "Mitcher"
---

今天在这里给大家分享如何用Hugo搭建自己的个人博客。

<!--more-->

## 前言

搭建博客这个想法最早受到[ZheWana](https://zhewana.cn/)和朋友[Fun_Cheong](https://funcheong.cn/)的启发，想通过博客作为知识的输出工具和分享平台。后面看到[Pseudoyu](https://www.pseudoyu.com/zh/)的博客之后才知道原来博客可以这样记录生活，于是更加坚定了搭建博客这件事。其中笔者踩了不少的坑才得以呈现此文。当然，这篇文章和任何其他技术类的文章一样，受限于技术日新月异地发展，其中一些细节可能会有出错或者不再适用的情况（笔者踩的另一个坑）。所以也请读者不吝指正文章需要更正的地方，并且带眼识文，不要只执着与此文，更可参考更多的其他文章。

## 一、环境搭建

如果你有能力完成[Quick Start | Hugo (gohugo.io)](https://gohugo.io/getting-started/quick-start/)中的内容，那么你可以跳过本部分内容。

本文面对对Git有一定基础知识的读者（搭建仓库、Push和Pull操作）

安装程序的时候最好勾选添加到环境变量选项，如果忘记添加也可以按照Step4手动添加

### 1. Git安装

[Git - Downloads (git-scm.com)](https://git-scm.com/downloads)

### 2. Hugo安装

[Windows | Hugo (gohugo.io)](https://gohugo.io/installation/windows/)

[macOS | Hugo (gohugo.io)](https://gohugo.io/installation/macos/)

### 3. Go安装

[Download and install - The Go Programming Language](https://go.dev/doc/install)

Hugo是用Go语言编写的静态网站生成工具。

### 4. 添加环境变量

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/8Pt6z.png)

## 二、创建 Hugo 网站

### 1. 创建网站

```bash
hugo new site site-name(网站名字)
```

### 2. 安装主题

Hugo支持广泛的主题，你可以在[Themes](https://themes.gohugo.io/)当中选取你想要的主题，每个主题的配置方式有些许不同，应该参考主题对应仓库下的说明，但是以下步骤是每个主题搭建都会遵循的步骤。

你可以下载主题的最新版本 .zip 文件 并且解压放到 `themes` 目录.

另外, 也可以直接把这个主题克隆到 `themes` 目录:

```bash
git clone https://github.com/luizdepra/hugo-coder.git themes/hugo-coder
```

或者, 初始化你的项目目录为 git 仓库, 并且把主题仓库作为你的网站目录的子模块

```bash
git init
git submodule add https://github.com/pseudoyu/hugo-theme-den themes/hugo-theme-den
```

（PS: `Coder`主题笔者直接用`git clone`可以成功，但是`den`主题只有使用第三种方式的时候才成功，采用前两种方式的时候不会创建`.gitmodule`文件，后续`GitHub Pages`在网站时会报错，den默认使用了`gitmodule`?  未知QAQ）

下面以den这款主题为例子讲述如何搭建

### 3. 修改配置文件`.toml`

根目录下的`config.toml`是我们网站的配置文件，一般可以在`theme\(主题名字)\exampleSite`里面直接找到作者推荐的配置文件。

```bash
# ------------------------------------- #
# ---- General Settings --------------- #
# ------------------------------------- #
baseURL = "https://example.com"
title = "Den"
theme = "hugo-theme-den"
#enableRobotsTXT = true       # generate robots.txt
enableEmoji = true           # use emoji support
hasCJKLanguage = true        # detect CJK languages for word count etc.
preserveTaxonomyNames = true # do not make tag names lowercase
# uglyURLs = true            # more info: https://gohugo.io/content-management/urls/#ugly-urls
rssLimit = 20                # limit number of entries in RSS feeds
ignoreErrors = ["error-remote-getjson"]

# Copyright, appears in the footer
# copyright = ""             # default: author.name

# Pagination
# number of entries per page for archives, tags and categories
# since we don't have list view, recommend a large value
paginate = 20
paginatePath = "page"

# Syntax Hightlight
PygmentsCodeFences = true
PygmentsUseClasses = true    # required for shhighlight shortcode

# service plugins
disqusShortname = ""         # disqus_shortname
googleAnalytics = ""         # UA-XXXXXXXX-X

# language support # en / zh-tw / other... translations present in i18n/
defaultContentLanguage = "en"           # Default language to use
defaultContentLanguageInSubdir = true

# Links format
[permalinks]
  posts = "/:year/:month/:day/:slug/"
  categories = "/category/:slug/"      # required
  tags = "/tag/:slug/"                 # required
  pages = "/:slug/"

[author]                     # required
  name = "Jane Doe"

[sitemap]                    # required
  changefreq = "weekly"
  priority = 0.5
  filename = "sitemap.xml"

# ------------------------------------- #
# ---- Other Params ------------------- #
# ------------------------------------- #

[params]
  since = "2017"             # Site creation time
  rssFullContent = true      # set true to use full content instead of summary

  # site info (optional)
  keywords = ["Hugo", "theme","den"]
  description = "A simple theme for Hugo"
  logoTitle = "Den" # shown on top-left, default: title
  siteLogoImage = "images/globe.svg"     # shown besides logoTitle
  # headerTitle = "Den"                   # default: title
  headerImage = "images/background.jpg"
  showAuthorCard = true # Whether to show author information below the article

  showMenuLanguages = true

  autoLoadComments = false # auto load comment when scrolling down

  # paginate style, default use numbered pagination links
  # if true, use original "Previous" and "Next" links.
  # paginateOriginalStyle = true

  # The date format to use; for a list of valid formats, see https://gohugo.io/functions/format/
  dateFormatToUse = "2006-01-02"

  google_verification = ""  # Google_Verification

  # Link custom CSS and JS assets
  #   (relative to /static/css and /static/js respectively)
  customCSS = []             # if ['custom.css'], load '/static/css/custom.css' file
  customJS = []              # if ['custom.js'], load '/static/js/custom.js' file

# ------------------------------------- #
# ---- Related Articles --------------- #
# ------------------------------------- #
[related]
  # Only include matches with rank >= threshold. This is a normalized rank between 0 and 100.
  threshold = 50

  # To get stable "See also" sections we, by default, exclude newer related pages.
  includeNewer = true

  # Will lower case keywords in both queries and in the indexes.
  toLower = false

[[related.indices]]
  name = "categories"
  weight = 200

[[related.indices]]
  name = "keywords"
  weight = 150

[[related.indices]]
  name = "tags"
  weight = 100


[languages.en]
  languageCode = "en"
  languageName = "English"
  contentDir = "content/en"
  weight = 1

  [[languages.en.menu.main]]
    name = "Notes"
    weight = 10
    identifier = "notes"
    url = "category/notes/"
  [[languages.en.menu.main]]
    name = "Demos"
    weight = 20
    identifier = "demos"
    url = "category/demos/"

  [[languages.en.menu.social]]
    name = "GitHub"
    weight = 10
    identifier = "github"
    url = "https://github.com/shaform/hugo-theme-den/"

  [[languages.en.menu.links]]
    name = "About Me"
    weight = 10
    identifier = "about-me"
    url = "https://github.com/shaform/hugo-theme-den/"

[languages.zh-tw]
  languageCode = "zh-tw"
  languageName = "繁體中文"
  contentDir = "content/zh-tw"
  weight = 2

  [languages.zh-tw.params]
    description = "一個簡單的佈景。"

  [[languages.zh-tw.menu.main]]
    name = "筆記"
    weight = 10
    identifier = "notes"
    url = "category/notes/"
  [[languages.zh-tw.menu.main]]
    name = "展示"
    weight = 20
    identifier = "demos"
    url = "category/demos/"

  [[languages.zh-tw.menu.social]]
    name = "GitHub"
    weight = 10
    identifier = "github"
    url = "https://github.com/shaform/hugo-theme-den/"

  [[languages.zh-tw.menu.links]]
    name = "關於我"
    weight = 10
    identifier = "about-me"
    url = "https://github.com/shaform/hugo-theme-den/"

```

一般来说可以直接将`theme\(主题名字)\exampleSite`里面的所有文件都复制到根目录，快速查看网站的效果。

### 4. 发布文章

使用命令

```bash
hugo new posts\first-post.md
```

来发布你的第一篇文章吧。

注意文章开头的draft要设置成false才可以渲染文章。

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/ID885.png)

### 5. 在本地启动你的网站

使用以下命令启动网站:

```bash
hugo serve
```

或者

```bash
hugo server
```

去查看 `http://localhost:1313`.

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/8Tiqy.png)

## 三、在GitHub Pages上面发布你的网站

### 1. 新建仓库

首先，我们新建一个仓库

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/rDZMH.png)

除了仓库名字格式为username.github.io外，不要进行其他设置，因为这样会建立分支，而我们想要的是push代码的时候直接创建分支，避免引起冲突。

### 2.生成静态网站

在根目录下使用命令

```bash
hugo
```

为博客生成静态文件，文件默认会保存在目录public\下，GitHub Pages部署的静态网站正是里面的内容。

### 3. 修改仓库设置和配置文件

上传之前，我们先到GitHub的仓库中进行GitHub Pages的相关设定。进入仓库，打开`Setting-Pages`,按照下图进行设定，

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/rAFob.png)

可以看到，GitHub Pages将通过branch分支的`docs\`目录构建我们的网站。

但是我们的发布目录是在`publish`目录中，所以我们要在`config.toml`中添加下列语句

```toml
publishDir = "docs"
```

这样，我们使用`hugo`命令生成的网站就会生成在`docs\`目录下

重新执行命令`hugo`

接着在根目录下将代码上传

```bash
git init # 初始化仓库
git remote add origin https://github.com/Huang-Zifeng/Huang-Zifeng.github.io.git # 修改为自己仓库的路径
git add .
git commit -m "update"
git push origin master # 直接用git push会失败，以后还是尽量要指定分支
```

接着，经过大概5分钟左右的等待之后，你就可以通过访问`xxx.github.io`（这个网址第一次最好还是在上图所示中的`Visit Site`来获得，毕竟有时候你可能不知道自己设置的网址是否和你期待的一样）来查看你的网站。

这时候其实还没有完成，你会发现点开其中任何一个链接都会超链接失败，显示`404 Page Not Found`，因此我们需要复制最开始的网址，将它替换掉`config.toml`中`baseURL = "https://example.com"`这一句里面的网址，重新执行`hugo`生成静态文件，推送代码上去才可以看到我们网站完整的效果。

## 参考资料

[浅谈我为什么从 HEXO 迁移到 HUGO - 少数派 (sspai.com)](https://sspai.com/post/59904)（当时碰的坑是GitHub Pages没有设置对，没有弄清楚GitHub Pages的原理，看到这篇文章解决了，发布了第一个以coder为主题的网站）

[Hugo + GitHub Action，搭建你的博客自动发布系统 · Pseudoyu](https://www.pseudoyu.com/zh/2022/05/29/deploy_your_blog_using_hugo_and_github_action/)（现在用的主题den和这篇文章的作者一样，Pseudoyu是一位热爱博客的博主，你可以在他的网站里面学习更多自定义博客的知识，以及发掘博客的乐趣，后面笔者很多问题都是Pseudoyu帮我解决的。这篇文章主要参考的是主题的配置以及GitHub Action自动部署）

