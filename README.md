# GT7-AHK-Scripts
#1.15更新后调教失效,目前仅可用泛美PanAmerican 脚本,效率会低一些
## AFK Autohotkey Scripts GT赛车7自动挂机刷钱脚本
**先参看 https://www.bilibili.com/read/cv16191016 的基础设置\
其中汽车的调教参考 https://www.bilibili.com/read/cv16314940**

1. 有个PS4或5，有个电脑，有网络，有PSn账号，安装好PS Remote Play。有GT7游戏。并能在电脑上游玩GT7。
2. 尽量用有线连接，否则PS5内置的网卡可能会因为过热，无法稳定连到5G wifi频段上导致断连（2.4G可能会有更严重的操作延迟问题），而且断连也会导致脚本的画面监测判定出问题。如果使用5G wifi请确保距离路由器近并通风。
3. 请务必开启PS Store的「购买时需输入密码」功能，以避免因脚本误操作（比如购买课金点数）导致的财产损失。
4. 游戏内已经开启Clubman Cap Plus 550比赛，有 Tomahawk S VGT 车(最好为黑色车,涂装不能是纯白（银）的)，并按照图片调教。
5. 需要购买部分轮胎以及改装配件,修改齿轮比参数时需要保存后反复上拉,数据是相互关联的。最后三行参数有不能完全与图片一致的情况是正常的,最后PP差不多就行。
6. 设置游戏玩家1手柄为，方向键左右转向，方向上油门，方向下超车\氮气，X键改成空，要保持全程4档。
7. 游戏设置车牵引力5，MT手动挡，abs开启，asm稳定开启，反转辅助关，游戏内视角设置为驾驶舱。 
8. 安装 文件夹外的 AutoHotkey_1.1.33.10_setup.exe
9. 下载ahk脚本文件(有两张PNG图片文件也需要下载到相同文件夹内)打开运行。
10. 打开PS Remote Play进入游戏到Clubman Cap Plus 550游戏内，暂停游戏，光标停留在 重试 位置。
（在进入游戏界面保证一个回车能进去的那个位置也行）
8. 点GT7 EM..窗口内的 start ,会自动调整窗口,此时最好不要使用电脑了,至少不能挡住左上角PS Remote Play的窗口。
9. 等待第一局开局看一下无严重碰撞,等结束看看收益是否为105000,能否正常重开进入下一局。(比赛中反复撞墙是正常的)
11. 卡回放循环,不能进入下一场比赛的可能原因:
 - 串流画面码率较低,模糊有延迟:使用有线连接,使用5g wifi保证通风良好,调整ps5与路由器相对位置。
 - 本地的脚本在相同文件夹缺少png文件。
 - 分辨率,窗口大小或者缩放异常,有东西挡住了识别区域。
 - 电脑是否卡顿?清理一下其他程序或使用1000ms版
12. 平均圈速大于1:20，无法保证第一名的情况:
 - 确认X键改成空。比赛中保持全程4档。
 - 确认比赛开始后油门一直是满着的。
 - 车型确认Tomahawk S VGT ,PP值调教是否正常,轮胎等更换无误。
 - 车辆保养问题?。
13. 收益过低,次次都是70000:
 - 刷新AI,退出比赛后重新进入比赛试试看
 - 调整游戏难度为困难,看看套圈还追尾不
 - 调整游戏难度为简单,看看碰撞情况
14. 其他常见问题:
 - 注意视角切换成车内
 - 要是电脑总是弹窗什么的 切换窗口目标 下载文件名长的那个使用
 - 电脑有卡顿或者还卡循环的话可以尝试使用1000ms版
 - 图片menu2red.png point1.png也要下载 和脚本保存在一个文件夹下
***
## 能赚多少钱 How much script will earn?
首圈1:15\~1:16,之后每圈1:12\~1:13\
比赛完赛耗时6:10,单次循环时间6:40也就是400秒\
Basically one loop takes \~400s\
Race about 6:10 then rest is just menu clicking\
400s = 70k or 105k (clean race)\
1hr = 900k\
每小时收益保底90万cr,实际约为91w~92w\
如果明显低于这个数说明AI有问题经常追尾,建议重开比赛或更换游戏难度
 ***
## 不同赛道理论最高收益
泛美是60到70w,可以稳定挂\
东京clubman是90到100w,可以稳定挂\
东京WTC600是170到180w,不可以稳定挂,可以手动跑
## 新手建议
前期跑一跑咖啡馆任务,B级别驾照全金,解锁World Circuit >> Asia-Oceania>> Tokyo Expressway >> Clubman Cap Plus 550有仨红色辣椒的赛道\
然后要攒100w钱来购买Tomahawk S VGT,技术好的话可以跑赛道体验,有一些简单的赛道金牌比较容易拿\
技术不好的话建议继续玩主线打到咖啡馆全通,可以手动跑东京WTC600来赚钱
## 其他
还有国外也有同步开发的一键运行的脚本,增加了一些收益识别的功能,需要把界面改成英文来使用\
使用教程也是英文的https://discord.gg/djuBSTnk
 
