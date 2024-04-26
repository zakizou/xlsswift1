import XCTest
@testable import Spire_Xls

class FormatCellsWithStyleTests: TestCaseBase {

    func testFormatCellsWithStyle() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampleB_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FormatCellsWithStyle.xlsx"

        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Create a style
        let style = try workbook.get_Styles().Add("newStyle")

        // Set the shading color
        try style.set_Color(Color.get_DarkGray())

        // Set the font color
        try style.get_Font().set_Color(Color.get_White())

        // Set font name
        try style.get_Font().set_FontName("Times New Roman")

        // Set font size
        try style.get_Font().set_Size(12)

        // Set bold for the font
        try style.get_Font().set_IsBold(true)

        // Set text rotation
        try style.set_Rotation(45)

        // Set alignment
        try style.set_HorizontalAlignment(HorizontalAlignType.Center)
        try style.set_VerticalAlignment(VerticalAlignType.Center)

        // Set the style for the specific range
        try workbook.get_Worksheets().get_Item(0).get_Range().get_Item("A1:J1").set_CellStyleName(style.get_Name())

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FormatCellsWithStyle.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
