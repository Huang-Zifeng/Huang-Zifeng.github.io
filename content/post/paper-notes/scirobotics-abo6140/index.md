---
title: "Paper Notes | Morphological computation and decentralized learning
in a swarm of sterically interacting robots"
date: 2023-04-07T15:27:59+08:00
tags: [Paper Notes]
categories: [学习]
author: "Mitcher"
rss_ignore: false
draft: false
---

A review of [Morphological computation and decentralized learning in a swarm of sterically interacting robots | Science Robotics](https://www.science.org/doi/10.1126/scirobotics.abo6140).

<!--more-->

## Summary

这篇文章讲述了一种新型的机器人群体行为，即通过形态计算和分散学习来实现一群机器人的集体行为。文章介绍了一种名为Morphobots的机器人群体平台，它通过3D打印的外骨骼来实现通过身体计算来实现集体行为。这种外骨骼可以对外部力（如重力）或表面力（如碰撞）产生重新定位反应。文章还展示了这种力定向反应是通用的，可以增强现有的机器人群体平台（如Kilobots），并且可以用于定制机器人，甚至比现有机器人大10倍。在个体层面，外骨骼改善了运动能力和稳定性，并允许对外部力或碰撞（包括与墙壁或可移动障碍物的碰撞以及在动态倾斜平面上）进行两种对比鲜明的动态行为的编码。这种力定向反应为机器人在群体层面增加了一个机械层，利用空间相互作用来实现拥挤时的集体光趋性。允许碰撞还促进了信息流动，促进了在线分布式学习。每个机器人都运行一个嵌入式算法，最终优化集体性能。文章通过实验和模拟研究了物理群体（多达64个机器人）和模拟群体（多达8192个代理），发现随着群体规模的增长，形态计算的效果增加。

## K parameter

在文章中，κ参数是一个有效的对齐参数，用于描述机器人对外部力的重新定位。这个参数衡量了外部力对机器人方向的影响程度。当κ为正时，机器人与外部力保持一致；当κ为负时，机器人与外部力保持反向。κ是一个有效参数，它源自机器人的设计细节（材料性质、质量分布、驱动机制等），但它是经验性定义良好的，因为它可以通过实验测量并在不同的机器人平台之间进行定量比较。在文章中，研究人员发现κ是一个关键的设计参数，它可以控制机器人在遇到障碍物（如墙壁或另一个机器人）时的反应。使用正和负κ可以使两个原语定性地改变在拥挤的碰撞主导的环境中群体的动态。研究人员还发现κ可以用来指导集体运输的设计。

## Structure

<center><img src="https://mitcher-1316637614.cos.ap-nanjing.myqcloud.com/test/image-20230407164826663.png" alt="Augmenting Kilobots with exoskeletons makes Morphobots" /></center>

Morphobots是通过在Kilobots上增加一个三维打印的外骨骼来制造的。Kilobot是一种3.4厘米高、3.3厘米直径的单元，站在三个由细金属杆制成的刚性腿上。Kilobots能够通过两个振动器进行差动驱动运动。当其中一个振动器被激活时，Kilobot以大约45°/s的速度转弯；当两个振动器都被激活时，Kilobot向前移动。电源是可充电的锂离子电池，可以让Kilobot运行几个小时。Kilobots配备了红外发射器和接收器，因此它们可以相互通信。机器人的发射器向表面发射光，反射到另一个附近机器人的接收器上。

## Morphobots如何实现集体光趋性？

研究人员编程机器人以根据局部测量的光强改变速度，并发现机器人的形态可以在拥挤时改善它们的集体光趋性。当机器人到达静止机器人的墙壁时，它们表现出不同的动态特征：到达墙壁的对齐器（κ>0）倾向于沿着墙壁重新定位，直到最终离开；而前置Morphobot（κ<0）倾向于“挖入”，将已经停泊(taxied)的机器人推入亮区，直到自己被停泊。这些个体事件累加起来。

此外，文章还提到了群体可以通过分散强化学习算法来集体学习执行光趋性任务。研究人员发现，当允许碰撞时，群体流动化并有效地收敛到成功的光趋性策略，尽管通信网络稀疏且间歇。

## Inspiration

通过外骨骼(exoskeletons)实现对外部环境的对抗或者对准

## TODO

- [ ] 精读论文
