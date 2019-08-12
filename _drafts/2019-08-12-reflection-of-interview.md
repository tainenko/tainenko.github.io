---
layout: post
title:  "Sharing - self-reflection of job interview"
author: tony
categories: [interview]
image: assets/images/job-interview.jpg
tags: [interview]
---

# AI類題目

   1) 給input size和convolution kernel size，然後問output大小和參數量
   2) data augmentation的方法有什麼
   3) supervised、unsupervised、semi-supervised learning的差異
   4) 解釋 focal loss
   5) VGG、ResNet的差異？為何ResNet比較深參數量卻比較少？
   6) 解釋ReLU、Leaky ReLU，以及該如何選擇
   7) k-means和k-NN的差別及其各自應用在哪裡
   8) 高維的data用k-means會產生什麼問題
   9) 降維的方法有哪些
   10) auto encoder原理？
   11) CNN、RNN差別？
   12) 為什麼convolution和fully connected layer比起來更適合用在image上，其差
異為何
   13) 介紹AlexNet
   14) 為什麼分類問題要用cross entropy而非L1 loss
   15) 訓練模型時候模型參數是如何更新的(解釋back propagation)，是對x(input)還
是w(weight)作微分？
   16) L1、L2 loss各是什麼？差別又為何？
   17) 如何避免over-fitting?
   18) what is batch normalization?
   19) given a 300-d feature, how to select which dimensions are useful?
   20) How to combine results of different models?

# 邏輯or腦力激盪題
  1) given 100 coins, 20個朝上，80個朝下，關燈後(無法看到銅板的正反面)如何將這
100個銅板分堆，使得兩堆面朝上的銅板數量一樣多
  2) given a 天秤和五顆長得一模一樣的球，其中有一顆球特別輕，要使用天秤幾次才
找得出那顆比較輕的球
  3) 承上題，變成9顆球，其中一顆特別輕
  4) 承上上題，變成11顆球，只有一顆重量和其他球不同

# 程式題
  1) reverse string
  2) merge intervals (第一類)
     ex: [1,2], [2,3], [4,5], [5,7] => [1,2,3], [4,5,7]
  3) merge intervals (第二類)
     ex: [1,3], [5,9], [6,7], [10,13], [11,13] => [1,3], [5,9], [10,13]
  4) given a list, find all the intervals of consecutive integers
     ex: [1,3,2,11,10,12,1002,1000,1003] => [1,3], [10,12], [1000],
[1002,1003]
  5) 給定一串數字，每個數字重複3次，只有一個沒有，找出該數字
     ex: 1313134 => 4
  6) isomorphism
     ex: "abbac" <-> "effeg" => true
     ex: "abbac" <-> "effig" => false
  7) 1~n數字隨意排列，其中只少掉了一個數字，將其找出
     ex: 1342578 => 6
  8) 實作atoi
  9) reverse linked list (in-place)
  10) 交錯數字
     ex: [1,2,3,4,5,6,7,8] => [1,5,2,6,3,7,4,8]
  11) 1代表陸地，0代表水，4-connectivity，given a 2-d array with only 0s and
1s, find the max land area
     ex:
     0011
     1001  => max land area: 5
     0011
  12) 承上題，找出一共有多少塊陸地以及每個陸地的重心
  13) 實作doubly linked list (包含從頭insert、從尾端insert、找出目標value在
linked list中的位置等等)
  14) 實作candy crush (三個以上可以消掉，一次消一組)
      ex: [1,2,2,3,3,3,2,5,5] => [1,5,5]
  15) merge兩個binary search tree成一個
  16) 給一個已經sort過的array，build一個binary search tree且要考慮biased的問題
  17) 給一個singly linked list，找出middle value(延伸：是否能夠用one-path的方
法)
  18) given a binary search tree，判斷其是否對稱
  19) given two sorted array, merge the second one into the first one
      ex: [1,3,5,0,0] & [2,4] => [1,2,3,4,5]
  20) 用linked list實作queue
  21) given row and column number, return the corresponding Pascal's triangle
number
      ex: row 4, col 2 => 6
      因為巴斯卡三角形長這樣：
          1       (row 0)
         1 1      (row 1)
        1 2 1
       1 3 3 1
      1 4 6 4 1   (row 4)
  22) given an unsorted array, find the number that is closet to a given
target
      ex: {1,3,6,8,11,2,5}
      target: 6 => result: 6
      target:12 => result: 11
  23) check if two strings are anagram
      ex: "evil" v.s "viel" => true
  24) find the max depth of a tree


# 觀念題
  1) C++繼承分哪幾種，各自代表什麼意思，你在寫class的時候要怎麼決定用哪種繼承
  2) RISC、CISC差異及其各自優缺點為何？
  3) 優化 a = (b/1024)*10
  4) 優化 if(a/24 > b) return 1;
  5) 舉三個primitives in RTOS
  6) cache的好處？為什麼不用很大的cache?
  7) merge sort、quick sort等等各種sorting演算法的best、average、worst時間及空
間複雜度
  8) binary tree的搜尋時間複雜度
  9) Python中的tuple、list、dictionary誰不能改值
  10) MySQL用的是什麼data structure
  11) MySQL的index如何實現
  12) B-tree的好處？為什麼database要用B-tree
  13) hash tabel和red black tree各自的pros and cons?
  14) TCP各state代表的意義
  15) malloc是如何實現的，call的是哪個system call，那個system call又是如何實現
的？
  16) virtual memory要如何map到physical memory
  17) 如果程式遇到out of memory的error，要怎麼知道程式是執行到哪裡的時候造成的
  18) 列出並比較至少2種以上的interpolation method
  19) 列出並比較至少2種以上的noise reduction method及其所適用的noise type及
evaluation的方法

# General Questions
  1) 你預期三年後的自己在哪裡（想知道你的職涯規劃）
  2) 找公司看重的條件和priority
  3) 過去個人or團體做project的經驗
  4) 求學期間有沒有和人合作過的經驗，其中自己扮演的角色為何
  5) 1~10分，我對新事物的接受度為幾分？舉例說明
  6) 研究所做的研究是什麼
  7) 你的strength和weakness分別為何
  8) 目前面試過的公司有哪些，有拿到哪些公司的offer了
  9) 寫過最大的程式是什麼
  10) 修過最有興趣的課？
  11) 大學參加了什麼社團？
  12) 比較喜歡research or engineering？
  13) 如果成績單上有某學期成績比較差，可能就會被問那個學期發生了什麼事，或是問
你主要掉分的科目為何，為什麼之類的

心得總結
---
1) Leetcode一定要刷，然後不是刷過就好，解題的時候要試著想空間或時間上要怎麼去
優化，同時要練習分析自己演算法的時間複雜度，因為幾乎所有面試的程式考題不外乎都
是叫你先分析複雜度，然後優化，然後再分析XD
2) 要練習寫code的時候把心裡的想法講出來，這樣面試官才會知道你的思路，也比較好
給你提示
3) 英文聽力口說要練習，個人覺得全英的面試真的會比中文面試來得緊張不少，需要做
好心態上的調適XD
4) 要先準備好一些問題問面試官，很多面試最後的問題就是問你有沒有問題，所以要先
想好幾個備案
5) 遇到題目意思不清楚的時候就直接問面試官釐清，例如可以問說input array是有sort
過的嗎、input的數字都是int嗎...之類的，有時候問一問條件變多了題目就會好解多了
6) 永遠懷抱希望XD 有幾次我覺得自己表現得沒有很好，但還是通過了，我甚至遇過我在
寫程式題的時候面試官忽然跑走或是在邊傳訊息，我以為面試官大概不想理我了，不過我
還是繼續寫我的程式和講自己的想法，結果還是過關了，所以在真正結果出來前不要妄自
菲薄XD
7) 面試時間最好集中，太分散很容易遇到先拿到某家offer，但還在等後面的通知，有時
候公司會願意等你，但也不少時間是壓很緊的，這時候就會很尷尬
8) 最後的最後，不要認為自己一定沒機會就不去投大公司或知名企業，有試有機會，沒
試就絕對不可能了，就跟追男女朋友一樣的道理^.< (當然前提是要有做準備啦><)