import XCTest
@testable import Spire_Xls

class ApplyStyleToWorksheetTests: TestCaseBase {
    func testApplyStyleToWorksheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ApplyStyleToWorksheet.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let style = try workbook.get_Styles().Add("newStyle")
        try style.set_Color(Color.get_LightBlue())
        try style.get_Font().set_Color(Color.get_White())
        try style.get_Font().set_Size(15)
        try style.get_Font().set_IsBold(true)
        try sheet.ApplyStyle(style)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ApplyStyleToWorksheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

