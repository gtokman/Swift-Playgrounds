import Cocoa

// Protocols

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Any
}




func padding(amount: Int) -> String {
    var paddingString = ""
    if amount < 0 {
        
        return paddingString
    }
    for _ in 0 ..< amount { paddingString += " " }
    return paddingString
}

func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) {
    
    // Protocol inheristance
    print("Table: \(dataSource.description)")
    
    // Create arrays of the row and column labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map { dataSource.labelForRow($0) }
    let columnLabels = (0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn($0)
    }
    // Create an array of the width of each row label
    let rowlabelWidths = rowLabels.map { $0.characters.count }
    
    // Determine length of longest row label
    guard let maxRowLabelWidth = rowlabelWidths.maxElement() else {
        return
    }
    
    // Create first row containing column headers
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    
    // Also keep track of the width of each column
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // Pad the row label out so they are all the same length
        let paddingAmount = maxRowLabelWidth - rowlabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        
        // Append each item in this row to our string
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        
        // Done - print it!
        print(out)
    }
    
}

// Data
struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var description: String {
        return "Department (\(name))"
    }
    
    // Conform to Protocol
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Age"
        case 1: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Any {
        let person = people[row]
        
        switch column {
        case 0: return person.age
        case 1: return person.yearsOfExperience
        default: fatalError("Invalid column!")
        }
    }
    
    
    
    
}

var department = Department(name: "Engineering")
department.addPerson(Person(name: "Joe", age: 10, yearsOfExperience: 6))
department.addPerson(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(Person(name: "Fred", age: 50, yearsOfExperience: 20))
printTable(department)


/*
Protocol allows you to define the interface you want a type to satisfy
Conform - type that satisfies a protocol
*/


//// Challenge
struct Book {
    let title: String
    let author: String
    var averageReview: Int
   
}

struct BookCollection: TabularDataSource, CustomStringConvertible {
    var collections = [Book]()
    
    mutating func addBook(collection: Book) {
        collections.append(collection)
    }
    
    var description: String {
        return "Book collection"
    }
    
    // Conform to protocol
    var numberOfRows: Int {
        return collections.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return collections[row].author
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Title"
        case 1: return "Review"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Any {
        let book = collections[row]
        
        switch column {
        case 0: return book.title
        case 1: return book.averageReview
        default: fatalError("Invalid column!")
        
        }
    }
    
}

var bookCollection = BookCollection()
let book1 = bookCollection.addBook(Book(title: "Fault of Our Starts", author: "John Green", averageReview: 5))
let book2 = bookCollection.addBook(Book(title: "Mastery", author: "Robert Greene", averageReview: 4))
printTable(bookCollection)







































