import XCTest
@testable import Spire_Xls

class ConditionallyFormatDateTests: TestCaseBase {
    func testConditionallyFormatDate() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_6.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ConditionallyFormatDate.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_AllocatedRange())
        let conditionalFormat = try xcfs.AddTimePeriodCondition(TimePeriodType.Last7Days)
        try conditionalFormat.set_BackColor(Color.get_Orange())

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ConditionallyFormatDate.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
