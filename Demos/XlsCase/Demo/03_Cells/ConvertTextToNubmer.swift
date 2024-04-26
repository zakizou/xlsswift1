import XCTest
@testable import Spire_Xls

class ConvertTextToNumberTests: TestCaseBase {
    func testConvertTextToNumber() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Sample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ConvertTextToNubmer.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the Excel document from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Convert text string format to number format
        try (worksheet.get_Range().get_Item("D2:D8") as! XlsRange).ConvertToNumber()
        
        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ConvertTextToNubmer.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
