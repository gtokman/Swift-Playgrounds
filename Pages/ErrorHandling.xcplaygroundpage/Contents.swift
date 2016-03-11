import Cocoa

/*
2 broad error catagories
Recoverable - events that can occur that you must be ready for and handle ex: pulling data, no wifi
Nonrecoverable - special bug, upwrap optionals, array out of limit
Lexing (tokenizing) is the process of turning some input into a sequence of tokens
*/

// Error Handling

enum Token {
    case Number(Int)
    case Plus
}

class Lexer {
    
    // Handle error
    enum Error: ErrorType {
        case InvalidCharacter(Character)
    }
    
    // Stored properties
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    // Init
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    // Instance method
    func peek() -> Character? {
        
        // Guard to ensure not reach end of input
        guard position < input.endIndex else {
            return nil
        }
        
        // Return Char in current position
        return input[position]
    }
    
    // Advance to next Char
    func advance() {
        
        // Check for nonrecoverable error // // Check argument, condition is true continue, if false provide mess
        assert(position < input.endIndex, "Cannot advance past the end!")
        ++position
    }
    
    // Extract Ints from the input
    func getNumber() -> Int {
        
        var value = 0
        
        while let nextCharacter = peek() {
            
            switch nextCharacter {
                
            case "0" ... "9":
                // Another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
                
            default:
                // A non-digit - go back to regular lexing
                return value
            }
        }
        return value
    }
    
    // Array of Tokens as output // could emmit error "throws"
    func lex() throws -> [Token] {
        
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            
            switch nextCharacter {
                
            case "0" ... "9":
                // Start of a number - need to grab the reast
                let value = getNumber()
                tokens.append(.Number(value))
            case "+":
                tokens.append(.Plus)
                advance()
            case " ":
                // Just advance to ignore spaces
                advance()
            default:
                // Something unexpected - need to sed back an error
                throw Error.InvalidCharacter(nextCharacter)
            }
            
        }
        return tokens
    }
    
}


class Parser {
    
    // Handle errors
    enum Error: ErrorType {
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    // Stored properties
    let tokens: [Token]
    var position = 0
    
    // Init
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    // Instance method
    func getNextToken() -> Token? {
        
        // Check if tokens are available
        guard position < tokens.count else {
            return nil
        }
        
        return tokens[position++]
    }
    
    func getNumber () throws -> Int {
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        
        switch token {
        case .Number(let value):
            return value
        case .Plus:
            throw Error.InvalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            
            switch token {
                
                // Getting a Plus after a Number is legal
            case .Plus:
                // After a plus, we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
                
                // Getting a Number after a Number is not legal
            case .Number:
                throw Error.InvalidToken(token)
            }
        }
        return value
    }
}


func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
//    guard let tokens = try? lexer.lex() else {
//        print("Lexing failed, but I don't know why.")
//        return
    
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
        
    } catch Lexer.Error.InvalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.InvalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        print("An error occurred: \(error)")
    }
    
}

evaluate("10 + 10 + 5")
evaluate("1 + 2 + abc")

/*
Any function that could fail must be marked with "throws"
All calls to functions that may fail with "try"
*/


































