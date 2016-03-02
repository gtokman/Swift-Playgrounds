import Cocoa

// Optional Types
var errorCodeString: String?
errorCodeString = "404"
var errorDiscription: String?

//if errorCodeString != nil {
//    let theError = errorCodeString
//    print(theError)
//}

// Optional Binding
if let theError = errorCodeString, errorCodeInteger = Int(theError) where errorCodeInteger == 404 {
    
    errorDiscription = ("\(errorCodeInteger + 200): the requested resource was not found.")
    
    
    
}

// Optional chaining
var upCaseErrorDescription = errorDiscription?.uppercaseString
upCaseErrorDescription?.appendContentsOf(" PLEASE TRY AGAIN.")
upCaseErrorDescription

// Nil coalescing operator
errorDiscription = nil
let description = errorDiscription ?? "No error"

//if let error = errorDiscription {
//    description = error
//} else {
//    description = "No error"
//}

// Challenge error make runtime and explore error code