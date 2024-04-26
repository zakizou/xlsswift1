import XCTest
@testable import Spire_Xls

class CopyCellFormatTests: TestCaseBase {
    func testCopyCellFormat() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CopyCellFormat.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the file from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Copy the cell format from column 2 and apply to cells of column 5
        let count = try sheet.get_Rows().get_Count()
        var i = 1
        while i < count + 1 {
            try sheet.get_Range().get_Item("E\(i)").set_Style(sheet.get_Range().get_Item("B\(i)").get_Style())
            i += 1
        }
        
        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CopyCellFormat.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
