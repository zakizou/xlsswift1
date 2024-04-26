import XCTest
@testable import Spire_Xls

class CreateTableTests: TestCaseBase {

    func testCreateTable() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CreateTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateTable.xlsx"
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        
        // Add a new List Object to the worksheet
        try sheet.get_ListObjects().Create("table", sheet.get_Range().get_Item(1, 1, 19, 5))
        
        // Add Default Style to the table
        try sheet.get_ListObjects().get_Item(0).set_BuiltInTableStyle(TableBuiltInStyles.TableStyleLight9)
        
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CreateTable.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
