import Foundation

// Define a function to parse the JSON file and generate a Swift protocol
func generateSwiftProtocol(_ jsonFilePath: String, _ protocolName: String, _ outputFilePath: String) {
    // Read the JSON file
    guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else {
        print("Failed to read JSON file.")
        return
    }
    
    // Parse the JSON data
    guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
          let jsonDict = jsonObject as? [String: Any] else {
        print("Failed to parse JSON data.")
        return
    }
    
    // Generate the Swift protocol
    var protocolString = "protocol \(protocolName) {\n"
    
    for (key, value) in jsonDict {
        let typeString: String
        
        switch value {
        case is Int:
            typeString = "Int"
        case is String:
            typeString = "String"
        case is Bool:
            typeString = "Bool"
        case is Double:
            typeString = "Double"
        case is Float:
            typeString = "Float"
        default:
            typeString = "Any"
        }
        
        protocolString += "    var \(key): \(typeString) { get }\n"
    }
    
    protocolString += "}"
    
    // Write the generated protocol to a file
//    do {
//        try protocolString.write(to: URL(fileURLWithPath: outputFilePath), atomically: true, encoding: .utf8)
//        print("Protocol written to \(outputFilePath)")
//    } catch {
//        print("Failed to write protocol to file: \(error)")
//    }
    
    print(protocolString)
}


// Example usage
//locations needs to be hard coded because playgrounds are sanboxed
//let input = "<Your File Structure>/MigakuTest/MigakuTest/Theme/theme.json"

let input = Bundle.main.url(forResource: "input", withExtension: "json")!.absoluteString
let protocolName = "ThemeProtocol"
//locations needs to be hard coded because playgrounds are sanboxed
let output = "<Your File Structure>/MigakuTest/Utilities/GeneratedProtocols/ThemeProtocol.swift"
generateSwiftProtocol(input,protocolName,output)
