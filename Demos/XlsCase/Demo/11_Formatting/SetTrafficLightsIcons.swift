import XCTest
@testable import Spire_Xls

class SetTrafficLightsIconsTests: TestCaseBase {
    func testSetTrafficLightsIcons() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/SetTrafficLightsIcons.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Add a worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add some data to the Excel sheet cell range and set the format for them
        try sheet.get_Range().get_Item("A1").set_Text("Traffic Lights")
        try sheet.get_Range().get_Item("A2").set_NumberValue(0.95)
        try sheet.get_Range().get_Item("A2").set_NumberFormat("0%")
        try sheet.get_Range().get_Item("A3").set_NumberValue(0.5)
        try sheet.get_Range().get_Item("A3").set_NumberFormat("0%")
        try sheet.get_Range().get_Item("A4").set_NumberValue(0.1)
        try sheet.get_Range().get_Item("A4").set_NumberFormat("0%")
        try sheet.get_Range().get_Item("A5").set_NumberValue(0.9)
        try sheet.get_Range().get_Item("A5").set_NumberFormat("0%")
        try sheet.get_Range().get_Item("A6").set_NumberValue(0.7)
        try sheet.get_Range().get_Item("A6").set_NumberFormat("0%")
        try sheet.get_Range().get_Item("A7").set_NumberValue(0.6)
        try sheet.get_Range().get_Item("A7").set_NumberFormat("0%")

        // Set the height of row and width of column for Excel cell range
        try sheet.get_AllocatedRange().set_RowHeight(20)
        try sheet.get_AllocatedRange().set_ColumnWidth(25)

        // Add a conditional formatting
        let conditional = try sheet.get_ConditionalFormats().Add()
        try conditional.AddRange(sheet.get_AllocatedRange())
        let format1 = try conditional.AddCondition()

        // Add a conditional formatting of cell range and set its type to CellValue
        try format1.set_FormatType(ConditionalFormatType.CellValue)
        try format1.set_FirstFormula("300")
        try format1.set_Operator(ComparisonOperatorType.Less)
        try format1.set_FontColor(Color.get_Black())
        try format1.set_BackColor(Color.get_LightSkyBlue())

        // Add a conditional formatting of cell range and set its type to IconSet
        try conditional.AddRange(sheet.get_AllocatedRange())
        let format = try conditional.AddCondition()
        try format.set_FormatType(ConditionalFormatType.IconSet)
        try format.get_IconSet().set_IconSetType(IconSetType.ThreeTrafficLights1)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetTrafficLightsIcons.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
