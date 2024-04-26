import XCTest
@testable import Spire_Xls

class GetCellDisplayedTextTests: TestCaseBase {
    func testGetCellDisplayedText() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadImages.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetCellDisplayedText.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet of the workbook
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set value for B8
        let cell = try worksheet.get_Range().get_Item("B8") as! XlsRange
        try cell.set_NumberValue(0.012345)

        // Set the cell style
        let style = try cell.get_Style()
        try style.set_NumberFormat("0.00")

        // Get the cell value
        let cellValue = try cell.get_Value()

        // Get the displayed text of the cell
        let displayedText = try cell.get_DisplayedText()

        // Create StringBuilder to save
        var content = [String]()

        // Set string format for displaying
        let result = "B8 Value: \(cellValue)\r\nB8 displayed text: \(displayedText)"

        // Add result string to StringBuilder
        content.append(result)
        // Save them to a txt file
        try File.appendAllText(outputFile, [content.joined(separator: "\n")])

        // region check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetCellDisplayedText.txt"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }
}
