import XCTest
@testable import Spire_Xls

class GetSettingsOfDataValidationTests: TestCaseBase {
    func testGetSettingsOfDataValidation() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Sample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetSettingsOfDataValidation.txt"
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

        // Get the settings
        let allowType = try validation.get_AllowType().stringValue()
        let data = try validation.get_CompareOperator().stringValue()
        let minimum = try validation.get_Formula1()
        let maximum = try validation.get_Formula2()
        let ignoreBlank = try String(validation.get_IgnoreBlank())

        // Create StringBuilder to save
        var content = [String]()

        // Set string format for displaying
        let result = "Settings of Validation: \r\nAllow Type: " + allowType + "\r\nData: " + data + "\r\nMinimum: " + minimum + "\r\nMaximum: " + maximum + "\r\nIgnoreBlank: " + ignoreBlank

        // Add result string to StringBuilder
        content.append(result)

        // Save them to a txt file
        try File.appendAllText(outputFile, content)
        
        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/GetSettingsOfDataValidation.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
