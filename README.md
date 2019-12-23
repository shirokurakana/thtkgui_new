# 介绍

Touhou Toolkit（简称thtk）是一个解包和修改东方游戏资源文件的工具。它允许提取和修改游戏脚本，材质和GUI元素; 游戏内文字; 指定敌人移动，攻击等的级别脚本; demo rep和游戏内声音。它不能解包并保存BGM（红妖永的midi音乐除外，因为mid文件存储在`thxx.dat`中而非`thbgm.dat`中）(xx为一个数字，下同）。

Touhou Toolkit由四个控制台应用程序组成（现在有五个程序，新增了thstd.exe用于处理std文件，但thtkgui尚未支持。std文件中包含3D背景相关的文件）
**thdat**处理主dat文件（`thxx.dat`），**thanm**处理贴图，**thmsg** - 对话，**thecl** - 脚本。当前版本完全支持从红魔乡到天空璋的所有弹幕作，以及绯想天和非想天则。thdat也能够处理旧作（PC-98平台）游戏的dat文件，但是生成的文件（除了普通txt）不能由thtk处理。如果有同人游戏的文件格式与东方格式之一兼容，thtk也可以处理该游戏的文件。但是，如果dat文件名与东方dat文件名不同，则会发出警告。

Touhou Toolkit是一个控制台应用程序，thtkgui为它提供了一个图形用户界面。您应该做的第一件事是指定thtk文件夹的路径。您还可以提供所有东方游戏所在文件夹的路径。

## 初次使用

初次使用时（或者`thtkgui.ini`文件中未指定thtk路径时），会有弹窗要求填写【thtk路径】。

【游戏文件夹】可以不用填写。

#### 强烈建议在开始之前先阅览一遍[THBWiki上的相关资料](https://thwiki.cc/-/19kb)，并在需要时自行查阅。

## THDAT

使用thtk的第一步是解压缩游戏的主dat文件。在左上角选择游戏。在“文件夹”字段中指定目标文件夹。指定主dat文件（其名称通常遵循模式`thxx.dat`。文件如`thbgm.dat`和`score.dat`则不能由thdat处理）。在红魔乡中，游戏内容分布在六个dat文件中，其中包含：

- `紅魔郷CM.DAT` - 弹幕脚本和可玩角色图片和迷你脚本

- `紅魔郷ED.DAT` - ED和结算界面中的文本和图像

- `紅魔郷IN.DAT` - 声音和界面元素

- `紅魔郷MD.DAT` - midi-music

- `紅魔郷ST.DAT` - 攻击脚本，关卡和符卡的背景，敌人和Boss的脚本和图片，对话文本

- `紅魔郷TL.DAT` - 菜单图像和文本

#### 按钮功能

- 【解包】 - 将dat文件提取到目标文件夹中。

- 【获取文件列表】 - 生成一个txt格式的文件列表，并将其放在程序目录的\lists子目录中。此列表在存档创建期间使用，更改其内容会使dat文件无法使用。在文件提取期间也会自动创建该列表。

- 【打包】 - 将目标文件夹中的内容打包到dat文件中。如果目标dat文件已经存在，并且开启了“设置-自动保存”，它将在处理之前重命名原来的dat文件（将获得额外的扩展名`.bkpxx`）。否则，它将被替换。

dat文件中包含的所有文件都将放在目标目录中。其中如demo rep，图片和声音等可以直接访问。`*.anm`，`*.msg`和`*.ecl`文件应该由thtk进一步处理。

#### 支持的游戏（基于Touhou Toolkit release 9）

编号 | 游戏名 | 是否支持 |备注
:-: | :-: | :-: | :-:
| 1 |东方灵异传 ～ Highly Responsive to Prayers. | 是 | 仅解包 |
| 2 |东方封魔录 ～ the Story of Eastern Wonderland. | 是 | 仅解包 |
| 3 |东方梦时空 ～ Phantasmagoria of Dim. Dream. | 是 | 仅解包 |
| 4 |东方幻想乡 ～ Lotus Land Story. | 是 | 仅解包 |
| 5 |东方怪绮谈 ～ Mystic Square. | 是 | 仅解包 |
| 6 |东方红魔乡 ～ the Embodiment of Scarlet Devil. | 是 | 有六个dat文件 |
| 7 |东方妖妖梦 ～ Perfect Cherry Blossom. | 是 |  |
| 8 |东方永夜抄 ～ Imperishable Night. | 是 |  |
| 9 |东方花映塚 ～ Phantasmagoria of Flower View. | 是 |  |
| 95 |东方文花帖 ～ Shoot the Bullet. | 是 |  |
| 10 |东方风神录 ～ Mountain of Faith. | 是 |  |
| 105 |东方绯想天 ～ Scarlet Weather Rhapsody. | 是 |  |
| 11 |东方地灵殿 ～ Subterranean Animism. | 是 |  |
| 12 |东方星莲船 ～ Undefined Fantastic Object. | 是 |  |
| 123 |东方非想天则 ～ 追寻特大型人偶之谜. | 是 |  |
| 125 |东方文花帖DS ～ Double Spoiler. | 是 |  |
| 128 |妖精大战争 ～ 东方三月精. | 是 |  |
| 13 |东方神灵庙 ～ Ten Desires. | 是 |  |
| 14 |东方辉针城 ～ Double Dealing Character. | 是 |  |
| 143 |弹幕天邪鬼 ～ Impossible Spell Card. | 是 |  |
| 15 |东方绀珠传 ～ Legacy of Lunatic Kingdom. | 是 |  |
| 16 |东方天空璋 ～ Hidden Star in Four Seasons. | 是 |  |
| 17 |东方鬼形兽　～ Wily Beast and Weakest Creature.| 是 |  |

对汉化版游戏的支持尚不明确，若有需要请自行测试。

得益于注入式汉化补丁的使用，辉针城以后不再有汉化版dat文件。

## THANM

anm文件中包含PNG格式的图形，以及描述其行为的脚本。这些文件的解包和打包过程与dat文件类似，但有两点不同：

- 程序自动生成与anm文件名匹配的建议目标文件夹。anm存档内的文件以文件夹结构组织，在解包过程中在目标文件夹中重现。更改文件夹的名称或结构将使anm文件无法使用。

- 文件创建过程不使用简单的文件列表，而是使用称为“描述文件”的特殊txt文件。它是在解包anm文件时创建的，但也可以使用【获取描述文件】按钮生成。将自动生成描述文件的建议名称。

thanm还提供了一种方法来替换存档中的单个图片而无需重新打包。在【内容】字段中指定要替换的图片（使用【...】按钮；您需要先生成一个描述文件），然后在【文件】字段中指定替换文件并按【替换文件的内容】。

## THMSG

msg文件中包含对话。这些文件可能被命名为* .msg（对于较新的游戏）或msg * .dat（对于较旧的）。它们中的每一个都打包成一个txt文件（用日文版的Shift JIS和英文的ASCII编码）。【解包】将指定的【文件】解压缩到指定的【文件】，【打包】则执行相反的操作。程序自动生成与msg文件匹配的建议目标文件名。

注：这里有两个【文件】，上面的【文件】是txt文件，下面的【文件】是ecl文件。

## THECL

ecl文件中包含描述敌人移动，攻击等的脚本。它们的结构和处理类似于msg文件。GoogleCode上的thtk页面对 这些文件中使用的脚本语言的[描述](https://code.google.com/archive/p/thtk/wikis)不完整。

或者可以参阅[THBWiki上的脚本对照表](https://thwiki.cc/-/198r)

## 已知的问题

这些错误是由thtk本身引起的，而不是本项目（thtkgui）：

- 英文版的花映冢存在问题。解压缩后，控制台会显示一些错误，并且某些文件未正确解压缩。从这些文件创建的dat文件无法使用。此问题不影响日文版。

- 有一个已知的错误会影响ecl文件的创建。它会导致应用程序抛出语法错误并不可逆转地破坏目标ecl文件。该错误是由于应用程序不正确地处理在符卡名称中使用的转义双引号`\"`引起的。
要修复此错误，您需要将源文件中的所有`\"`实例替换为任何其他符号或组合符号
（“除`"`外”）

## 兼容性相关

原来的项目已经多年没有更新，而thtk在第10版（Touhou Toolkit release 10）以后改变了语法，导致thtkgui理论兼容的最高thtk版本为release 9。

本项目针对新语法进行了更新，因此只支持thtk release 10及以上版本。

## 原版README

我将原版中的帮助文件以Markdown重写，并用README.md替换原来的README.txt，故在此备份一遍原版README.txt中的内容。

>﻿Графический интерфейс для программы Touhou Toolkit от xarnonymous.<br>
>Позволяет пропустить рутинные операции с командной строкой и перейти прямо к моддингу.<br>
>Для подробной информации обратитесь к файлам помощи в папке Help.<br>
Разработка: доброанон с dobrochan.com/to<br>
>Почта: fake.dobrochan@gmail.com<br>
>Автор идеи и главный тестер: sybgamer<br>
>Репозиторий на Гитхабе: github.com/fakedobro/thtkgui<br>
><br>
>A graphical interface for Touhou Toolkit made by xarnonymous.<br>
>Allows to skip routine command line operations and move on straight to >modding.<br>
>For more information refer to help files in Help folder.<br>
>Developer: dobroanon from dobrochan.com/to<br>
>Mail: fake.dobrochan@gmail.com<br>
>Author of idea and main tester: sybgamer<br>
>Repository on GitHub: github.com/fakedobro/thtkgui<br>
><br>
>由xarnonymous制作的Touhou Toolkit的图形界面。<br>
>允许跳过例行命令行操作并继续直接进行修改。<br>
>有关更多信息，请参阅帮助文件夹中的帮助文件。<br>
>开发人员：dobrochan.com/to的dobroanon<br>
>邮箱：fake.dobrochan@gmail.com<br>
>想法和主要测试者的作者：sybgamer<br>
>GitHub仓库：github.com/fakedobro/thtkgui<br>


