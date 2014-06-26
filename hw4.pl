#coding=utf-8
# F74006315 蕭博元 計理作業HW4
#程式功能 讀入json然後以大道 路等來區分
#但是由於搞錯功能 因此我用"整條路"(XX路XX巷 XX路YY巷應該視作同條路 但我把他當兩條)
#所以程式執行結果有些側資不正確。
import json
import sys
import urllib



count = 0
input = urllib.urlopen(sys.argv[1])
out =  json.load(input)

if len(sys.argv) > 2:
	print "err input"
	
	

road = ["0"]

list = []#用來儲存交易年月
list1 = []#用來儲存有幾個相異的交易年月
key = 1
#print road
for data in out:
	if road[0] == "0":#第一圈
		road[0] = data [u"土地區段位置或建物區門牌"]
		
	elif road[0] == data[u"土地區段位置或建物區門牌"]:#same
		j = len(list)
		while j > 0 :#判斷是否該交易年月已經有了
			if list[j-1] == int(data[u"交易年月"]):
				key=0
			j-=1
		if key==1:#若沒有 加進去
			list.append(data[u"交易年月"])
		key=1	
			
	elif road[0] != data[u"土地區段位置或建物區門牌"] :#路不同 換路
		list1.append(len(list))
		#print list
		leng=len(list)
		
		while leng > 0:#清空List
			list.pop(leng-1)
			leng-=1
                road[0] = data[u"土地區段位置或建物區門牌"]
		list.append(data[u"交易年月"])
	
list1.sort()
list1.reverse()
#print list1
num=int( list1[0])


list2 = ["1"]#存最大
for data in out:
        if round ==0:
		road[0] = data[u"土地區段位置或建物區門牌"]
	
        else:
		if road[0] == data[u"土地區段位置或建物區門牌"]:#same
                	j = len(list)
                	while j > 0 :
                        	if list[j-1] == int(data[u"交易年月"]):
                                	key=0
                        	j-=1
                	if key==1:
                        	list.append(data[u"交易年月"])
				list2.append(data[u"總價元"])
                	key=1

        	elif road[0] != data[u"土地區段位置或建物區門牌"] :
                	list1.append(len(list))
                #print l`ist
                	if num==len(list):
				print road[0]
				list2.sort()
				list2.reverse()
				print "最高成交價"
				print list2[0]
				print "最低成交價"
				print list2[num-1]
		
               		leng=len(list)
			while leng > 0:
				 list.pop(leng-1)
				 list2.pop(leng-1)
				 leng-=1
                	road[0] = data[u"土地區段位置或建物區門牌"]
			list.append(data[u"交易年月"])
			list2.append(data[u"總價元"])
