import XCTest
@testable import Spire_Xls

class ColorsAndPaletteTests: TestCaseBase {
    func testColorsAndPalette() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ColorsAndPalette.xlsx"

        let workbook = try Workbook()
        try workbook.ChangePaletteColor(Color.get_Orchid(), 60)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let cell = try sheet.get_Range().get_Item("B2")
        try cell.set_Text("Welcome to use Spire.XLS")
        try cell.get_Style().get_Font().set_Color(Color.get_Orchid())
        try cell.get_Style().get_Font().set_Size(20)
        try cell.AutoFitColumns()
        try cell.AutoFitRows()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ColorsAndPalette.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
