import XCTest
@testable import Spire_Xls

class AutoFitBasedOnCellValueTests: TestCaseBase {
    func testAutoFitBasedOnCellValue() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadImages.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AutoFitBasedOnCellValue.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the Excel document from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get first worksheet of the workbook
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Set value for B8
        let cell = try worksheet.get_Range().get_Item("B8")
        try cell.set_Text("Welcome to Spire.XLS!")
        
        // Set the cell style
        let style = try cell.get_Style()
        try style.get_Font().set_Size(16)
        try style.get_Font().set_IsBold(true)
        
        // Autofit column width and row height based on cell value
        try cell.AutoFitColumns()
        try cell.AutoFitRows()
        
        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AutoFitBasedOnCellValue.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
