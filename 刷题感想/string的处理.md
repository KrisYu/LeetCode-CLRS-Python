### String


Swift 的 String不同于别的语言中的String，因为包含了emoji更多，所以是UTF?

所以并不能期望于直接找到它的length，然后来写

reverse要么用for in来更改character的位置

要么可以直接用一个reverse 函数, Swift真是python化了啊，居然自带reverse这么棒

```
//way 1
var result  = ""
for character in str.characters{
    result = String(character) + result
}


// way 2 
return String(str.characters.reverse())
```




#####345. Reverse Vowels of a String

首先找出ovwel的位置，然后把他们reverse，之后回去iterate string，如果是ovwel就换成reverse之后的ovwal，否则保持辅音。

	let ovals : [Character] = ["a","e","i","o","u","A","E","I","O","U"]
	var ovalsInStr : [Character] = []
	
	for character in s.characters{
	    if ovals.contains(character){
	        ovalsInStr.append(character)
	    }
	}
	
	ovalsInStr = ovalsInStr.reverse()
	
	var result = ""
	var i = 0
	for charater in s.characters{
	    if !ovals.contains(charater){
	        result += String(charater)
	    } else {
	        result += String(ovalsInStr[i])
	        i += 1
	    }
	}
	

