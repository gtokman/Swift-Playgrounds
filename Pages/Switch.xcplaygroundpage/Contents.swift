
// Switch statement
var statusCode: Int = 418
var errorString: String = "The request failed with the error: "

//switch statusCode {
//case 400, 401, 403, 404:
//    errorString = "There was something wrong with the request."
//    fallthrough
//default:
//    errorString += " Please review the request and try again."
//}

switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)"
case 204:
    errorString += " Successful but no content, 204."
case 300...307:
    errorString += " Redirection,\(statusCode)"
case 400...417:
    errorString += " Client error, \(statusCode)"
case 500...505:
    errorString += " Server error, \(statusCode)"
case let unkownCode where (unkownCode >= 200 && unkownCode < 300) || unkownCode > 505:
    errorString = "\(unkownCode) is not a known error code."
default:
    errorString = "Unexpected error encountered."
}

// Tuple
let error = (code: statusCode, error: errorString)
error.error
error.code

let firstErrorCode = 304
let secondErrorCode = 404
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No items found.")
case (404, _): // _ = wild card matches anything
    print("First item not found.")
case (_, 404):
    print("Second item not found.")
default:
    print("All items found.")
}

// Switch vs If/Else
let age = 23
//switch age {
//case 18...35:
//    print("entitled millennials")
//default:
//    break
//}

// If-case
if case 18...35 = age where age >= 21 {
    print("entitled millennials ;) and can drink!")
}

// Challenge
let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant2")
case let q3 where (point.x < 0) && point.y < 0:
    print("\(q3) is in quadrant 3")
case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 3")
case (_, 0):
    print("\(point) sits on X")
case (0, _):
    print("\(point) sits on Y")
default:
    print("Case not covered!")
}


























