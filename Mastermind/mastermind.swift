//Kata from: https://codingdojo.org/kata/Mastermind/

/*
Problem Description
The idea of this Kata is to code an algorithm capable of playing this boring role: answering the number of well placed and misplaced colors.

Therefore, your function should return, for a secret and a guessing combination:

the number of well placed colors
the number of correct but misplaced colors
A combination can contain any number of pegs but you’d better give the same number for the secret and the guessing. You can use any number of colors.

Clues
It’s better to start by detecting well placed colors.
Detecting misplaced colors is about counting them…
*/
enum Color{
    case Red
    case Blue
    case Yellow
    case Purple
    case Green
}

func evaluate(_ secret:[Color], _ guess:[Color])->[Int]{
    //Prepare answer
    var solution :[Int] = [0,0]

    for i in 0..<guess.count{
        
        if secret[i] == guess[i]{
            solution[0] += 1
        }
        else
        {
            if secret.contains(guess[i]){
                solution[1] += 1
            }
        }
    }

    return solution
}

var result = evaluate([.Purple,.Red,.Yellow,.Green], [.Red,.Blue,.Green,.Yellow])
print(result)