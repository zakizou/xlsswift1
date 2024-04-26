import XCTest
@testable import Spire_Xls

class AddDataTableTests: TestCaseBase {
    func testAddDataTable() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AddDataTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddDataTable.xlsx"

        // Create a Workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first chart
        let chart = try sheet.get_Charts().get_Item(0)
        try chart.set_HasDataTable(true)

        // Save and Launch
        try workbook.SaveToFile(outputFile, FileFormat.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddDataTable.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
