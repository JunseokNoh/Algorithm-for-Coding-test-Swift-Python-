import Foundation

func transform(_ str:String) -> [String:Int]{
    var dict = [String:Int]()
    
    for i in 0..<str.count-1{
        let start = str.index(str.startIndex, offsetBy: i)
        let end = str.index(str.startIndex, offsetBy: i+1)
        let temp = String(str[start...end]).uppercased()
        var flag = false
        for ch in temp{
            if !ch.isLetter{
                flag = true
            }
        }
        if flag{ continue }
        if dict[temp] == nil{
            dict[temp] = 1
        }else{ dict[temp]! += 1 }
    }
    
    return dict
}

func max(_ a: Int, _ b:Int)->Int{
    if a>b{ return a }
    else{ return b }
}

func min(_ a: Int, _ b:Int)->Int{
    if a>b{ return b }
    else{ return a }
}

func solution(_ str1:String, _ str2:String) -> Int {
    
    let result1 = transform(str1)
    let result2 = transform(str2)
    var set1 = Set<String>()
    var set2 = Set<String>()
    var insectCnt = 0
    var totalCnt = 0
    
    for item in result1.keys{
        set1.insert(item)
    }
    
    for item in result2.keys{
        set2.insert(item)
    }
    
    for item in set1.intersection(set2){
        insectCnt += min(result1[item]!, result2[item]!)
    }
    
    for item in set1.union(set2){
        if result1[item] != nil, result2[item] != nil{
            totalCnt += max(result1[item]!, result2[item]!)
        }else if result1[item] != nil{
            totalCnt += result1[item]!
        }else{
            totalCnt += result2[item]!
        }
    }
    
    return Int(Double(insectCnt) / Double(totalCnt) * Double(65536))
}

print(solution("FRANCE", "french"))
print(solution("aa1+aa2", "AAAA12"))
