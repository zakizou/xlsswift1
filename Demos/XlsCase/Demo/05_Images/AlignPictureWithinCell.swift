import XCTest
@testable import Spire_Xls

class AlignPictureWithinCellTests: TestCaseBase {

    func testAlignPictureWithinCell() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SpireXls.png"
        let outputFile = TestUtil.OutputPath + "Demo/AlignPictureWithinCell.xlsx"

        // Create a workbook.
        let workbook = try Workbook()

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("A1").set_Text("Align Picture Within A Cell:")
        try sheet.get_Range().get_Item("A1").get_Style().set_VerticalAlignment(VerticalAlignType.Top)
        let picture = try sheet.get_Pictures().Add(1, 1, inputFile) as! XlsShape 

        // Adjust the column width and row height so that the cell can contain the picture.
        try sheet.get_Columns().get_Item(0).set_ColumnWidth(40)
        try sheet.get_Rows().get_Item(0).set_RowHeight(200)

        // Vertically and horizontally align the image.
        try picture.set_LeftColumnOffset(100)
        try picture.set_TopRowOffset(25)
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/AlignPictureWithinCell.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
