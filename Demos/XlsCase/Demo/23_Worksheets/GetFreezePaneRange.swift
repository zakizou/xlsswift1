import XCTest
@testable import Spire_Xls

class GetFreezePaneRangeTests: TestCaseBase {
    func testGetFreezePaneRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/GetFreezePaneRange.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetFreezePaneRange.txt"
        try File.delete(outputFile)

        // Create a workbook and load a file
        let wb = try Workbook()
        try wb.LoadFromFile(inputFile)
        let sheet = try wb.get_Worksheets().get_Item(0) as! Worksheet
        var rowIndex: Int32?
        var colIndex: Int32?

        // The row and column index of the frozen pane is passed through the out parameter.
        // If it returns to 0, it means that it is not frozen
        let indexs = try sheet.GetFreezePanes()
        colIndex = indexs[1]
        rowIndex = indexs[0]

        let r = "Row index: \(rowIndex ?? 0), column index: \(colIndex ?? 0)"

        // Save the document and launch it
        try File.appendText(outputFile, r)
        try wb.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/GetFreezePaneRange.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

