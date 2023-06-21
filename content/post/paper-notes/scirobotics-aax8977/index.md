---
title: "Paper Notes | Magnetic Quadrupole Assemblies With Arbitrary Shapes and Magnetizations"
date: 2023-04-03T15:06:08+08:00
tags: ["Paper Notes"]
categories: [学习]
author: "Mitcher"
rss_ignore: false
draft: false

---

A review of [Magnetic quadrupole assemblies with arbitrary shapes and magnetizations](https://www.science.org/doi/10.1126/scirobotics.aax8977).

<!--more-->

## Summary


This article talks about magnetic quadrupole assemblies with arbitrary shapes and magnetizations. The authors propose a magnetic quadrupole module that is able to form stable and frustration-free magnetic assemblies with arbitrary 2D shapes. The quadrupole structure changes the magnetic particle-particle interaction in terms of both symmetry and strength. Each module has a tunable dipole moment that allows the magnetization of overall assemblies to be programmed at the single module level. They provide a simple combinatorial design method to reach both arbitrary shapes and arbitrary magnetizations concurrently. Last, by combining modules with soft segments, they demonstrate programmable actuation of magnetic metamaterials that could be used in applications for soft robots and electromagnetic metasurfaces.

## Experiments

四极矩模块由两个相同的 NdFeB 块状磁体组成，它们位于一个正方形外壳内，两个磁体之间的偶极矩具有相对角度。通过改变两个磁体之间的相对角度，可以调节**偶极**和**四极项**。四极项具有四重旋转对称性，这使得模块能够在二维正方晶格中与其他模块稳定地组装在一起，而**不会产生局部排斥**。这种四重旋转对称性使得模块能够形成稳定的复杂组件，具有任意的磁化。

> **偶极矩**(dipole moment)描述了一个物体的总磁矩，即物体内部所有磁偶极子的矢量和
>
> **四極子**(quadrupole)是指一種[電荷](https://zh.wikipedia.org/wiki/電荷)、[電流](https://zh.wikipedia.org/wiki/電流)或產生[引力](https://zh.wikipedia.org/wiki/引力)的[質點](https://zh.wikipedia.org/wiki/質點)等[場源](https://zh.wikipedia.org/wiki/場_(物理))在空間中分佈模式。四極子是一種特殊的空間分佈，對於一般分佈而言，四極子可以是其[多極展開](https://zh.wikipedia.org/wiki/多極展開)的一部分。

<center><img src="https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/image-20230403153927694.png" alt="Quadrupole module" /></center>

When two quadrupoles are brought close together, they will automatically assemble (movie S1). Quadrupole assemblies between the same type and different types are demonstrated. 

## Why 20° is chosen?

> an angle (q = 20°, type A) was chosen so that four alternating magnetic poles can be easily identified on each side of the module structure with a noticeable magnetic dipole moment. 

The presence of a noticeable magnetic dipole moment allows the module to respond to external magnetic fields and interact with other modules to form stable and frustration-free magnetic assemblies.

经过统计性研究和大量的仿真，当两个磁体之间的偶极矩具有相对角度20°时，模块四边的极性都可以被一个外加的磁偶极矩轻松地辨认出来，并且形成一个易于分离的结构。

<center><img src="https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/image-20230403163552293.png" alt="Theta angle" /></center>



## Type A and Type B

According to the article, the difference between type A and type B quadrupole modules lies in the relative angle between the two magnets inside the module. For type A quadrupole modules, both top and bottom poles are north poles. The magnetic flux from four north poles is equivalent to the flux coming back from two south poles, **making the south poles stronger than the north poles**. For type B quadrupole modules, **the north poles are stronger than the south poles**. The difference can be evaluated by the quadrupole-quadrupole interaction model based on their equation. During the experiments, **stronger poles are more likely to bond together than two weak poles between type A and type B quadrupole modules.**

## Frustration-free

“Frustration-free” refers to the ability of the magnetic quadrupole modules to form stable magnetic assemblies with arbitrary 2D shapes without internal frustration. Frustration in this context refers to conflicting magnetic interactions that can arise when trying to arrange magnetic particles in certain configurations. The quadrupole structure of the modules changes the magnetic particle-particle interaction in terms of both symmetry and strength, allowing for frustration-free assemblies.

Frustration-free does not necessarily mean that the modules can be separated easily. The ease of separation would depend on the strength of the magnetic attraction between the modules and the force required to overcome it.

## Conclusion

两个磁块通过一定相对角度的排列之后组成的模块，由于四极子的四重对称性(quadrupole’s fourfold symmetry)，可以形成自动组装、易于分离、可以组成任意形状的特性。这对于设计群体软体机器人有极大的帮助。

## Inspiration

坦诚而言，之前并没有很好地理解这篇文章就直接设计相似的实验了。

1. 易于分离不单止是因为有3D打印外壳的物理隔离，而更加是因为磁块之间形成了特定的偶极矩、四极矩。这是之前没有考虑到的。
2. 球型的结构相比起长方体结构来说，更加地不稳定，也更加地灵活。此外，因为磁性模块变成了立体的排列，也因此产生了更多的可能，而且文章当中采用了只采用了四极子，那么，采用八极子甚至十六极子会不会有更特殊的现象？比方说更容易吸引、或是更容易分离？与此同时，现有的结构还是在球上面“切”了一刀，好处是在平面上有更好的稳定性，但是这样会不会失去一部分的对称性(symmetry)？
3. 之前实验当中自动组装的效果不是很明显。
4. 还有一个很不同的方面，这篇文章的第一个实验是在没有外加干扰下进行的。而第二个实验是在外部动态磁场下进行的(比如从B = 0 → B = 15mT，相对稳定)。目前我是使用的外部动态磁场是由旋转永磁体组成的，旋转永磁体产生的磁场本来就是相对复杂的，实验的目的目前暂定变成：研究三维磁性四极子在旋转磁场下的运动规律。

## What's Next?

- [ ] 拍摄完整视频，参考`aax8977_movie_s1.mp4`，应当设置稳定的镜头，还有就是针对不同的type进行说明
