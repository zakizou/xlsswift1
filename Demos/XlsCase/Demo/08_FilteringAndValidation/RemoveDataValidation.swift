import XCTest
@testable import Spire_Xls

class RemoveDataValidationTests: TestCaseBase {
    func testRemoveDataValidation() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/RemoveDataValidation.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveDataValidation.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Create an array of rectangles, which is used to locate the ranges in worksheet
        var rectangles = [Rectangle]()
        
        // Assign value to the first element of the array. This rectangle specifies the cells from A1 to B3
        try rectangles.append(Rectangle.FromLTRB(0, 0, 1, 2))
        
        // Remove validations in the ranges represented by rectangles
        try (workbook.get_Worksheets().get_Item(0).get_DVTable()as! XlsDataValidationTable).Remove(rectangles)
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/RemoveDataValidation.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
