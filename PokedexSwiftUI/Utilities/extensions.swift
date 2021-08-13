import Foundation

extension Data {
    
    /// remove the "null," string from the json data we got from the api
    ///
    func parseData(removeString string: String) -> Data? {
        // convert the data into a string
        //
        let dataAsString = String(data: self, encoding: .utf8)
        // remove the null string from the converted data string
        //
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        // convert the data string back into a data again and return it
        //
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
    
}
