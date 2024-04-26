import XCTest
@testable import Spire_Xls

class IndentationTests: TestCaseBase {

    func testIndentation() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/Indentation.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Add a new worksheet to the Excel object
        let sheet = try workbook.get_Worksheets().get_Item(0)

        // Access the "B5" cell from the worksheet
        let cell = try sheet.get_Range().get_Item("B5")

        // Add some value to the "B5" cell
        try cell.set_Text("Hello Spire!")

        // Set the indentation level of the text (inside the cell) to 2
        try cell.get_Style().set_IndentLevel(2)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/Indentation.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
