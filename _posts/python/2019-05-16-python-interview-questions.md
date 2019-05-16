---
layout: post
title:  " 110 Python interview questions "
author: tony
categories: [ Python, Interview ]
image: assets/images/pythonfeatured.jpg
tags: [ python, interview]
---

這是給Python開發者準備的110道筆試面試題，建議每道題都要認真刷一遍，有些題可以嘗試用多種方式來解答，甚至做延伸學習，   

1. 一行代碼實現1—100之和

2. 如何在一個函數內部修改全局變量

3. 列出5個python標準庫

4. 字典如何刪除鍵和合並兩個字典

5. 談下python的GIL

6. python實現列表去重的方法

7. fun(*args,**kwargs)中的*args,**kwargs什麽意思？

8. python2和python3的range（100）的區別

9. 一句話解釋什麽樣的語言能夠用裝飾器?

10. python內建數據類型有哪些

11. 簡述面向對象中__new__和__init__區別

12. 簡述with方法打開處理文件幫我我們做了什麽？

13. 列表[1,2,3,4,5],請使用map()函數輸出[1,4,9,16,25]，並使用列表推導式提取出大於10的數，最終輸出[16,25]

14. python中生成隨機整數. 隨機小數. 0—1之間小數方法

15. 避免轉義給字符串加哪個字母表示原始字符串？

16. 

中國
，用正則匹配出標簽里面的內容（“中國”），其中class的類名是不確定的
17. python中斷言方法舉例

18. 數據表student有id,name,score,city字段，其中name中的名字可有重複，需要消除重複行,請寫sql語句

19. 10個Linux常用命令

20. python2和python3區別？列舉5個

21. 列出python中可變數據類型和不可變數據類型，並簡述原理

22. s = “ajldjlajfdljfddd”，去重並從小到大排序輸出”adfjl”

23. 用lambda函數實現兩個數相乘

24. 字典根據鍵從小到大排序dict={“name”:”zs”,”age”:18,”city”:”深圳”,”tel”:”1362626627”}

25. 利用collections庫的Counter方法統計字符串每個單詞出現的次數”kjalfj;ldsjafl;hdsllfdhg;lahfbl;hl;ahlf;h”

26. 字符串a = “not 404 found 張三 99 深圳”，每個詞中間是空格，用正則過濾掉英文和數字，最終輸出”張三 深圳”

27. filter方法求出列表所有奇數並構造新列表，a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

28. 列表推導式求列表所有奇數並構造新列表，a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

29. 正則re.complie作用

30. a=（1，）b=(1)，c=(“1”) 分別是什麽類型的數據？

31. 兩個列表[1,5,7,9]和[2,2,6,8]合並為[1,2,2,3,6,7,8,9]

32. 用python刪除文件和用linux命令刪除文件方法

33. log日誌中，我們需要用時間戳記錄error,warning等的發生時間，請用datetime模塊打印當前時間戳 “2018-04-01 11:38:54”

34. 數據庫優化查詢方法

35. 請列出你會的任意一種統計圖（條形圖. 折線圖等）繪制的開源庫，第三方也行

36. 寫一段自定義異常代碼

37. 正則表達式匹配中，（.）和（.?）匹配區別？

38. 簡述Django的orm

39. [[1,2],[3,4],[5,6]]一行代碼展開該列表，得出[1,2,3,4,5,6]

40. x=”abc”,y=”def”,z=[“d”,”e”,”f”],分別求出x.join(y)和x.join(z)返回的結果

41. 舉例說明異常模塊中try except else finally的相關意義

42. python中交換兩個數值

43. 舉例說明zip（）函數用法

44. a=”張明 98分”，用re.sub，將98替換為100

45. 寫5條常用sql語句

46. a=”hello”和b=”你好”編碼成bytes類型

47. [1,2,3]+[4,5,6]的結果是多少？

48. 提高python運行效率的方法

49. 簡述mysql和redis區別

50. 遇到bug如何處理

51. 1. 正則匹配，匹配日期2018-03-20 url=’https://sycm.taobao.com/bda/tradinganaly/overview/get_summary.json?dateRange=2018-03-20%7C2018-03-20&dateType=recent1&device=1&token=ff25b109b&_=1521595613462‘

52. list=[2,3,5,4,9,6]，從小到大排序，不許用sort，輸出[2,3,4,5,6,9]

53. 寫一個單列模式

54. 保留兩位小數 題目本身只有a=”%.03f”%1.3335,讓計算a的結果，為了擴充保留小數的思路，提供round方法（數值，保留位數）

55. 求三個方法打印結果

56. 列出常見的狀態碼和意義

57. 分別從前端. 後端. 數據庫闡述web項目的性能優化

58. 使用pop和del刪除字典中的”name”字段，dic={“name”:”zs”,”age”:18}

59. 列出常見MYSQL數據存儲引擎

60. 計算代碼運行結果，zip函數歷史文章已經說了，得出[(“a”,1),(“b”,2)，(“c”,3),(“d”,4),(“e”,5)]

61. 簡述同源策略

62. 簡述cookie和session的區別

63. 簡述多線程. 多進程

64. 簡述any()和all()方法

65. IOError. AttributeError. ImportError. IndentationError. IndexError. KeyError. SyntaxError. NameError分別代表什麽異常

66. python中copy和deepcopy區別

67. 列出幾種魔法方法並簡要介紹用途

68. C:\Users\ry-wu.junya\Desktop>python 1.py 22 33命令行啟動程序並傳參，print(sys.argv)會輸出什麽數據？

69. 請將[i for i in range(3)]改成生成器

70. a = “ hehheh “,去除收尾空格

71. 舉例sort和sorted對列表排序，list=[0,-1,3,-10,5,9]

72. 對list排序foo = [-5,8,0,4,9,-4,-20,-2,8,2,-4],使用lambda函數從小到大排序

73. 使用lambda函數對list排序foo = [-5,8,0,4,9,-4,-20,-2,8,2,-4]，輸出結果為 [0,2,4,8,8,9,-2,-4,-4,-5,-20]，正數從小到大，負數從大到小

74. 列表嵌套字典的排序，分別根據年齡和姓名排序

75. 列表嵌套元組，分別按字母和數字排序

76. 列表嵌套列表排序，年齡數字相同怎麽辦？

77. 根據鍵對字典排序（方法一，zip函數）

78. 根據鍵對字典排序（方法二,不用zip)

79. 列表推導式. 字典推導式. 生成器

80. 最後出一道檢驗題目，根據字符串長度排序，看排序是否靈活運用

81. 舉例說明SQL註入和解決辦法

82. s=”info:xiaoZhang 33 shandong”,用正則切分字符串輸出[‘info’, ‘xiaoZhang’, ‘33’, ‘shandong’]

83. 正則匹配以163.com結尾的郵箱

84. 遞歸求和

85. python字典和json字符串相互轉化方法

86. MyISAM 與 InnoDB 區別：

87. 統計字符串中某字符出現次數

88. 字符串轉化大小寫

89. 用兩種方法去空格

90. 正則匹配不是以4和7結尾的手機號

91. 簡述python引用計數機制

92. int(“1.4”),int(1.4)輸出結果？

93. 列舉3條以上PEP8編碼規範

94. 正則表達式匹配第一個URL

95. 正則匹配中文

96. 簡述樂觀鎖和悲觀鎖

97. r、 r+、 rb、 rb+文件打開模式區別

98. Linux命令重定向 > 和 >>

99. 正則表達式匹配出

100. python傳參數是傳值還是傳址？

101. 求兩個列表的交集. 差集. 並集

102. 生成0-100的隨機數

103. lambda匿名函數好處

104. 常見的網絡傳輸協議

105. 單引號. 雙引號. 三引號用法

106. python垃圾回收機制

107. HTTP請求中get和post區別

108. python中讀取Excel文件的方法

109. 簡述多線程. 多進程

110. python正則中search和match