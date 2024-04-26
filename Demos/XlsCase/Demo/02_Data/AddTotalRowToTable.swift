import XCTest
@testable import Spire_Xls

class AddTotalRowToTableTests: TestCaseBase {
    func testAddTotalRowToTable() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AddATotalRowToTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddTotalRowToTable.xlsx"
        
        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        
        // Create a table with the data from the specific cell range.
        let table = try sheet.get_ListObjects().Create("Table", sheet.get_Range().get_Item("A1:D4"))
        
        // Display total row.
        try table.set_DisplayTotalRow(true)
        
        // Add a total row.
        let cols = try table.get_Columns()
        try cols.get_Item(0).set_TotalsRowLabel("Total")
        try cols.get_Item(1).set_TotalsCalculation(ExcelTotalsCalculation.Sum)
        try cols.get_Item(2).set_TotalsCalculation(ExcelTotalsCalculation.Sum)
        try cols.get_Item(3).set_TotalsCalculation(ExcelTotalsCalculation.Sum)
        
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddTotalRowToTable.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
