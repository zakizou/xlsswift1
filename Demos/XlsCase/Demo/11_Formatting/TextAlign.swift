import XCTest
@testable import Spire_Xls

class TextAlignTests: TestCaseBase {

    func testTextAlign() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/TextAlign.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/TextAlign.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set the vertical alignment to Top
        try sheet.get_Range().get_Item("B1:C1").get_Style().set_VerticalAlignment(VerticalAlignType.Top)

        // Set the vertical alignment to Center
        try sheet.get_Range().get_Item("B2:C2").get_Style().set_VerticalAlignment(VerticalAlignType.Center)

        // Set the vertical alignment to Bottom
        try sheet.get_Range().get_Item("B3:C3").get_Style().set_VerticalAlignment(VerticalAlignType.Bottom)

        // Set the horizontal alignment to General
        try sheet.get_Range().get_Item("B4:C4").get_Style().set_HorizontalAlignment(HorizontalAlignType.General)

        // Set the horizontal alignment to Left
        try sheet.get_Range().get_Item("B5:C5").get_Style().set_HorizontalAlignment(HorizontalAlignType.Left)

        // Set the horizontal alignment to Center
        try sheet.get_Range().get_Item("B6:C6").get_Style().set_HorizontalAlignment(HorizontalAlignType.Center)

        // Set the horizontal alignment to Right
        try sheet.get_Range().get_Item("B7:C7").get_Style().set_HorizontalAlignment(HorizontalAlignType.Right)

        // Set the rotation degree
        try sheet.get_Range().get_Item("B8:C8").get_Style().set_Rotation(45)

        try sheet.get_Range().get_Item("B9:C9").get_Style().set_Rotation(90)

        // Set the row height of cell
        try sheet.get_Range().get_Item("B8:C9").set_RowHeight(60)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/TextAlign.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
