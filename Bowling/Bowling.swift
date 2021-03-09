import Foundation

public class Frame{
    var firstRoll:Int = 0
    var secondRoll:Int = 0
    
    init(_ first: Int, _ second: Int) {
        firstRoll = first
        secondRoll = second
    }

    func total()->Int{
        return firstRoll + secondRoll
    }
    
}
public class Line{
    var frames:[Frame] = []
}

//EASY NO STRIKES NO SPARES -> Expect = 50
var line01:Line = Line()
line01.frames.append(contentsOf: [Frame(5,0), Frame(5,0), Frame(5,0), Frame(5,0), Frame(5,0), Frame(5,0), Frame(5,0), Frame(5,0), Frame(5,0), Frame(5,0)])
//FULL STRIKES -> Expect = 10 * 30 = 300
var line02:Line = Line()
line02.frames.append(contentsOf: [Frame(10,0), Frame(10,0), Frame(10,0), Frame(10,0), Frame(10,0), Frame(10,0), Frame(10,0), Frame(10,0), Frame(10,0), Frame(10,0), Frame(10,0), Frame(10,0)])
//FULL SPARE -> Expect = 10 * 15 = 150
var line03:Line = Line()
line03.frames.append(contentsOf: [Frame(5,5), Frame(5,5), Frame(5,5), Frame(5,5), Frame(5,5), Frame(5,5), Frame(5,5), Frame(5,5), Frame(5,5), Frame(5,5), Frame(5,0)])
//MIX -> Expect = 12 + 9 + 8 + 28 + 14 + 8 + 8 + 20 + 15 + 5 = 127
var line04:Line = Line()
line04.frames.append(contentsOf: [Frame(5,5), Frame(2,7), Frame(0,8), Frame(10,0), Frame(2,8), Frame(4,4), Frame(3,5), Frame(5,5), Frame(10,0), Frame(5,0)])

func calculateScore(_ line:Line)-> Int{
    var score = 0

    for (index,frame) in line.frames.enumerated() {
        
        if(index == 10){
            break
        }
        
        if(frame.total() < 10)
        {    
            score += frame.total()
        }
        else if (frame.total() == 10 && frame.firstRoll < 10)
        {
            score += frame.total()

            if((index + 1) <= (line.frames.count-1))
            {
                score += line.frames[index+1].firstRoll
            }
        }
        else if (frame.firstRoll == 10)
        {
            score += frame.total()

            for i in 1...2 {
                if((index + i) <= (line.frames.count-1))
                {
                    score += line.frames[index+i].total()
                }
            }

        }
    }

    return score
}

print(calculateScore(line02))