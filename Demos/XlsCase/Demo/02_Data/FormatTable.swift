import XCTest
@testable import Spire_Xls

class FormatTableTests: TestCaseBase {

    func testFormatTable() throws {

        try TestUtil.licenseKey()
        let inputFile =  TestUtil.DataPath + "Demo/FormatTable.xlsx"
        let outputFile =  TestUtil.OutputPath + "Demo/FormatTable.xlsx"
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        // Add Default Style to the table.
        try sheet.get_ListObjects().get_Item(0).set_BuiltInTableStyle(TableBuiltInStyles.TableStyleMedium9)
        // Show Total.
        try sheet.get_ListObjects().get_Item(0).set_DisplayTotalRow(true)
        // Set calculation type.
        try sheet.get_ListObjects().get_Item(0).get_Columns().get_Item(0).set_TotalsRowLabel("Total")
        try sheet.get_ListObjects().get_Item(0).get_Columns().get_Item(1).set_TotalsCalculation(ExcelTotalsCalculation.None)
        try sheet.get_ListObjects().get_Item(0).get_Columns().get_Item(2).set_TotalsCalculation(ExcelTotalsCalculation.None)
        try sheet.get_ListObjects().get_Item(0).get_Columns().get_Item(3).set_TotalsCalculation(ExcelTotalsCalculation.Sum)
        try sheet.get_ListObjects().get_Item(0).get_Columns().get_Item(4).set_TotalsCalculation(ExcelTotalsCalculation.Sum)

        try sheet.get_ListObjects().get_Item(0).set_ShowTableStyleRowStripes(true)

        try sheet.get_ListObjects().get_Item(0).set_ShowTableStyleColumnStripes(true)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data.

        // let baseLineFile = TestUtil.baseLinePath + "Demo/FormatTable.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }

}
