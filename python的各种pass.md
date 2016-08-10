#Python的各种Pass



有时候用的太熟，然后就对一些东西好像没有那么上心深刻，这里对于Python的还要理解加强。



感觉最近对于pass by reference 和 pass by value又有了一点/一些认识


看LinkedList如下：

```
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None
        
node1 = ListNode(1)
node2 = ListNode(2)
node3 = ListNode(3)
node4 = ListNode(4)
node5 = ListNode(5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5


def testWithPointers(head):
    head.next = None     
    
运行 testWithPointers(node1)
然后node1.next 就为None了


def testWithPointers(head):
    cur = head
    cur.next = None
    
运行 testWithPointers(node1)
然后node1.next 同样为None了   
````

Python的object，list都是pass by reference，都是改变的

 看二
 

```
a  = "abc"

def changeA(s):
    s = ""
    

changeA(a)

a
Out[28]: 'abc'
```


看三，同样的LinkedList


```
def printLinkedList(head):
    while head:
        print(head)
        print(head.val)
        head = head.next
 
 head 传入进去并没有改变本身啊
 
  printLinkedList(head)
<__main__.ListNode object at 0x1044c0e10>
1
<__main__.ListNode object at 0x1044c0fd0>
2
<__main__.ListNode object at 0x1044c0c88>
3
<__main__.ListNode object at 0x1044c0be0>
4
<__main__.ListNode object at 0x1044c0780>
5

head
Out[39]: <__main__.ListNode at 0x1044c0e10>
```

**python不允许程序员选择采用传值还是传引用。Python参数传递采用的肯定是“传对象引用”的方式。**


to be read & more clear


<http://www.cnblogs.com/yuyan/archive/2012/04/21/2461673.html>
