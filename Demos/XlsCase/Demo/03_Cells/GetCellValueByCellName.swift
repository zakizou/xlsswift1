import XCTest
@testable import Spire_Xls

class GetCellValueByCellNameTests: TestCaseBase {
    func testGetCellValueByCellName() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetCellValueByCellName.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Specify a cell by its name
        let cell = try sheet.get_Range().get_Item("A2")

        var content = [String]()

        // Get value of cell "A2"
        content.append("The value of cell A2 is: \(try cell.get_Value())")

        // Save to file
        try File.appendAllText(outputFile, [content.joined(separator: "\n")])

        // region check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetCellValueByCellName.txt"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }
}
