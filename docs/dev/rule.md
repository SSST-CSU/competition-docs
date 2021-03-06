# 游戏规则

!!! 注意
    本分类下的内容是 Botzone Wiki 相关页面的镜像，请参考原始站点以获得最新信息。
    原始站点：[FightTheLandlord](https://wiki.botzone.org.cn/index.php?title=FightTheLandlord#.E6.B8.B8.E6.88.8F.E8.A7.84.E5.88.99)

## 简介

**斗地主**是一种中国人发明的扑克游戏。游戏用一副54张牌（有两只Joker），一般由3个玩家进行，一人为地主，另外两人为农民。双方出牌对战，地主先出牌，任何一方有一人出完牌时，该方获胜。该扑克游戏起源于华中，现在流行于中国全国。

[点击这里查看起源](https://zh.wikipedia.org/wiki/%E9%AC%A5%E5%9C%B0%E4%B8%BB)

本游戏为三人游戏，但是在比赛中设定为双人对抗。

### 正式比赛时的对战方式

对抗双方分别扮演地主和农民，特别的，由于有两个农民，在三人游戏可以是两个不同的bot，但在比赛中为相同的两个bot。

正式比赛中，bot无法向用户存储空间中写入数据。

每次对抗中，对抗双方会进行角色互换，也就是说，每次对抗由两局游戏组成。第二局的地主和农民分别是第一局的农民和地主，同时分配给各个玩家的牌保持不变。

### 人类玩家操作说明

在自己的回合，可以点击牌来选牌，也可以拖动来选择或不选择连续的一组牌。

带有红边的牌是地主被明示的牌。

### 作者

播放器、C++样例程序：zhouhy

裁判程序、Python样例程序：black

## 游戏规则

### 发牌与明牌

每人先发17张牌，留三张牌作为底牌，牌面朝下放在桌上。这三张牌在地主确定后被亮明，所有人都知道这三张牌是什么。然后这三张牌归地主所有。即出牌前地主拥有20张牌，两农民各17张牌。

### 确定地主和农民

0号玩家为地主，1号玩家为农民甲，2号玩家为农民乙。

### 出牌

游戏开始时由地主先出，可出任一牌型的牌，接着地主的下家农民甲出牌，然后农民甲的下家农民乙先后出牌，之后一直重复地主、农民甲、农民乙的出牌顺序，直到某一方出完手中所有牌。

下家需要出比上家更大的牌，而且除了火箭和炸弹，牌的类型也要与上家相同。如果不出牌则选择“过”，由下一位玩家出牌。如果一玩家出牌后没有其他玩家打出更大的牌，则该玩家获得又一次任意出牌的机会。当一位玩家的手牌数为零时该方获胜，游戏结束。

### 牌型和大小

牌型有单张、一对、大于等于5张的连牌（顺子）、连对（至少三对）、三张、三张带一张、三张相同牌带一对牌、四张相同牌带任二张单牌或两对，炸弹（四张点数相同的牌），火箭（一对王，也就是一对Joker）。

牌型大小为：

火箭 ＞ 炸弹 ＞ 其他牌型

火箭最大，可以打任何的牌

炸弹按数值比大小，2最大，3最小

单张，一对，三带，单顺，双顺，飞机，四带二等等，全部同等级，但不同牌型之间互相不能混打

### 分数计算

出现非法操作（崩溃、超时等），则己方分数为-1，对方分数为2.5。

最终每个人的分数除了输赢（赢2、输0），还要加上 自己所出过的所有牌型的数目 的 加权求和分数 的 百分之一：

`总分 = 赢 ? 2 : 0 + (出过的单张数目 * 单张权重 + 出过的一对数目 * 一对权重 + ... + 航天飞机（三连及以上）数目 * 其权重) / 100.0`

两个农民的得分需要相同，因此实际分数是两人得分的平均分。

| 牌型 | 权重 |
| :--- | :-- |
| 单张 | 1 |
| 一对 | 2 |
| 三带 | 4 |
| 单顺 | 6 |
| 双顺 | 6 |
| 飞机 | 8 |
| 四带二 | 8 |
| 炸弹 | 10 |
| 航天飞机（二连）| 10 |
| 火箭 | 16 |
| 航天飞机（三连及以上） | 20 |

## 牌型

### 单张

大王（彩色Joker）>小王（黑白Joker）>2>A>K>Q>J>10>9>8...>3，不计花色，上家出3，下家必须出4或以上。

### 一对

22>AA>...>33，不计花色，上家出33，必须出44或以上。一对王称为火箭，下详解。

### 单顺

最少5张牌，不能有2，不计花色。

例如：345678，78910JQ，345678910JQKA

上家出6只，必须跟6只；上家出10只，必须跟10只，如此类推。

### 双顺

最少3对，不能有2，不计花色。

例如：778899，445566，334455667788991010JJQQ

上家出6对，必须跟6对；上家出3对，必须跟3对，如此类推。

### 三带

三带分3种，但大前提都是2>A>...>3，并只以三条的部分比大小。

三不带（三带零），即三条，例如222，AAA，666，888等。  
三带一，即三条+一只，例如2223，AAAJ，6669等，带的牌不能和三条部分的牌重复，否则会被判为炸弹。  
三带二，即三条+一对，例如22233，AAAJJ等。  

上家出三带一，必须跟三带一；上家出三不带，必须出三不带。

提醒：所带的单张牌也可以是大王、小王，但是大小王放在一起不算对子。下同。

### 四带二

四带分为两种，但大前提都是2>A>...>3，并只以四条的部分比大小。  
四条加两只（两只不可重复），或四条加两对（两对不可重复），即888857，2222QQAA

如上家出四条加两只必须跟四条加两只，上家出四条加两对必须跟四条加两对。

四带二效果不等同炸弹，只当作普通牌型使用。

### 飞机

飞机是两个或多个连续数字的三条，只以三条的部分比大小。

飞机分三种，飞机不带翼，飞机带小翼，飞机带大翼。  
例如：333444，777888999101010JJJQQQ  
飞机不带翼，即纯粹飞机，例如：444555  
飞机带小翼，即连续多于一个三带一，所带的单牌不能出现重复，单牌不能和三条部分牌重复，否则会被判为其余牌型，或违规牌型  
飞机带大翼，即连续多于一个三带二，所带的对子不能出现重复  
例如：33344456，77788834，101010JJJQQQ335577，6667778883399JJ是合法牌型  
例如：33344455（违规），33344434（航天飞机），33344435（违规），3334446666（违规）是其余或违规牌型  

如上家出飞机不带翼必须跟飞机不带翼，如上家出飞机带翼必须跟飞机带翼  

任何情况下，其三条部分都不能有2

### 航天飞机

此种牌型极少出现，但仍有理论上的可能性。

航天飞机是两个或多个连续数字的四条，只以四条的部分比大小  
航天飞机分三种，不带翼，带小翼（各两只），带大翼（各两对）。 同样，所有的只和对均不可重复。

如：

- 不带翼: 33334444
- 带小翼: 44445555 37 JQ，333344445555 67 89 10J（18张牌，仅地主）  
- 带大翼: 44445555 3377 JJQQ，33334444 6677 8899  

任何情况下，其四条部分都不能有2  

### 炸弹

即四条，如：9999，QQQQ  
炸弹大于除火箭外的一切牌型。点数大的炸弹大于点数小的炸弹，如:4444>3333，最大的炸弹是2222

### 火箭

即大王+小王  
火箭大于所有牌型  