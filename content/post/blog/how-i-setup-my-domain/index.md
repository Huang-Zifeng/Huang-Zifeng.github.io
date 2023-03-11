---
title: "拥有自己域名的路上碰到的魔幻事件"
date: 2023-02-07T01:04:44+08:00
draft: false
tags: ["trouble"]
categories: ["Blog"]
author: "Mitcher"
---

## 前言

搭建好博客之后，因为GitHub Pages在国内访问的速度问题，拥有自己的域名并配置CDN加速是一件很合情合理的事情。但是在拥有域名的路上也不总是那么一帆风顺。下面是对注册域名过程中的一些记录。

## 注册域名的导火线，umami

umami cloud作为当时朋友推荐的轻量化网站统计工具，不支持GitHub提供的默认域名，于是更加推动了我注册域名的决心

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/20230208175937.png)

## 腾讯云，心目中的优秀选择

在注册国内域名首先是我想到的，毕竟朋友FunCheong的域名也是在腾讯云注册的。但是备案所需漫长的三天等待以及必须租用云服务器才能备案的设定让我不得不望而却步。因为云服务器的价格可以去到300元一年，而域名的价格却只18元一年。离谱的是，这是我花了18元注册域名要备案时候才得知的事情。

于是，不用备案并且提供免费云服务器的Cloudflare显然是更好的选择。

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/rg2IV.png)

## 抛弃了支付宝的Cloudflare

在Cloudflare注册域名的时候只能选择VISA、万事达、PayPal这样的国际支付手段，对于一个大学生来说，这显然有点困难。因缘巧合之下，我之前注册了PayPal，但是在支付的时候却以支付失败作结。

并且这一画面还是多端尝试（iPad、iPhone），反复确认下出现的多次画面。

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/rgwyN.png)

## NameSilo · domain, cheap, easy and secure

重点表扬NameSilo，正如网站标语一样，它既支持支付宝，也不用备案，成为了上岸的最后一根稻草。

接下来的设置其实就是按照教程

[注册域名并使用cloudflare解析_cloudflare域名解析_一只小小程序猿~的博客-CSDN博客](http://t.csdn.cn/8ZOD5)

[Hugo + GitHub Action，搭建你的博客自动发布系统 · Pseudoyu](https://www.pseudoyu.com/zh/2022/05/29/deploy_your_blog_using_hugo_and_github_action/)

进行设置的。整体上没有太大困难。

## 魔幻的域名解析

什么是域名解析？域名解析就是国际域名或者国内域名以及中文域名等域名申请后做的到IP地址的转换过程。IP地址是网路上标识您站点的数字地址，为了简单好记，采用域名来代替IP地址标识站点地址。域名的解析工作由DNS服务器完成。

唯独最后一件奇怪的事情就是，当我去GitHub Pages设定的时候，DNS Check会给你提示出错的原因，第一次只添加了CNAME解析记录，那时候显示报错，网站登不上。后来添加了一条A记录，DNS Check的时候显示未解析到网址github.io，遂删除这条记录。这时候抱着绝望的心态，想着今晚先这样吧，然后点了一下以为打不开的网站。然后，它真的打开了！（这可能是最魔幻的一刻，但是也是宣告博客搭建告一段落的一刻）

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/rgXqv.png)

## 加速!

CDN加速是什么？ CDN全称Content Delivery Network，即**内容分发网络**。 其基本思路是尽可能避开互联网上有可能影响数据传输速度和稳定性的瓶颈和环节，使内容传输的更快、更稳定。 

Cloudflare的CDN加速，在概述中，完成提示你的优化设置，并且保存即可（一开始不知道还要点保存）。

![](https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/rg7Ey.png)

速度确实提升了，后面想到参照Pseudoyu的文章，还是加了一条A记录上去，速度确实肉眼可见的提升了不少。

## 告一段落

博客的搭建至此可能已经告一段落(~~后续可能会转用Picgo+腾讯云作为图床,已完成~~)

下面会更加重视内容的输出（毕竟这才是初心）

另外，因为比较喜欢简单的博客也是原因之一罢。
