import XCTest
@testable import Spire_Xls

class RepeatItemLabelsTests: TestCaseBase {
    func testRepeatItemLabels() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/RepeatItemLabelsExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RepeatItemLabels.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let sheet2 = try workbook.CreateEmptySheet()
        try sheet2.set_Name("Pivot Table")
        let dataRange = try sheet.get_Range().get_Item("A1:D9")
        let cache = try workbook.get_PivotCaches().Add(dataRange as! CellRange)
        let pt = try sheet2.get_PivotTables().Add("Pivot Table", try sheet.get_Range().get_Item("A1") as! CellRange, cache)
        var r1 = try pt.get_PivotFields().get_Item("VendorNo")
        try r1.set_Axis(AxisTypes.Row)
        try pt.get_Options().set_RowHeaderCaption("VendorNo")
        try r1.set_Subtotals(SubtotalTypes.None)

        try r1.set_RepeatItemLabels(true)
        try pt.get_PivotFields().get_Item("OnHand").set_RepeatItemLabels(true)
        try pt.get_Options().set_RowLayout(PivotTableLayoutType.Tabular)
        var r2 = try pt.get_PivotFields().get_Item("Desc")
        try r2.set_Axis(AxisTypes.Row)
        try pt.get_DataFields().Add(try pt.get_PivotFields().get_Item("OnHand"), "Sum of onHand", SubtotalTypes.None)
        try pt.set_BuiltInStyle(PivotBuiltInStyles.PivotStyleMedium12)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RepeatItemLabels.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

