import XCTest
@testable import Spire_Xls

class VerifyDataByValidationTests: TestCaseBase {
    func testVerifyDataByValidation() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Sample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/VerifyDataByValidation.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get first worksheet of the workbook
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Cell B4 has the Decimal Validation
        let cell = try worksheet.get_Range().get_Item("B4")

        // Get the validation of this cell
        let validation = try cell.get_DataValidation()

        // Get the specified data range
        let minimum = try Double(validation.get_Formula1())!
        let maximum = try Double(validation.get_Formula2())!

        // Create StringBuilder to save
        var content = [String]()

        // Set different numbers for the cell
        for i:Int32 in stride(from: 5, to: 100, by: 40) {
            try cell.set_NumberValue(Double(i))
            var result: String?
            // Verify
            if try cell.get_NumberValue() < minimum || cell.get_NumberValue() > maximum {
                // Set string format for displaying
                result = "Is input \(i) a valid value for this Cell: false"
            } else {
                // Set string format for displaying
                result = "Is input \(i) a valid value for this Cell: true"
            }
            // Add result string to StringBuilder
            content.append(result!)
        }
        // Save them to a txt file
        try File.appendAllText(outputFile, content)
    }
}
