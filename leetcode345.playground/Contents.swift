class Solution {
    func reverseVowels(s: String) -> String {
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
        return result
    }
}
