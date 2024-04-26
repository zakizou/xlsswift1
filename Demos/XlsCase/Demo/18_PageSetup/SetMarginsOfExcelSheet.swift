import XCTest
@testable import Spire_Xls

class SetMarginsOfExcelSheetTests: TestCaseBase {
    func testSetMarginsOfExcelSheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetMarginsOfExcelSheet.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the PageSetup object of the first worksheet
        let pageSetup = try sheet.get_PageSetup()

        // Set bottom, left, right, and top page margins
        try pageSetup.set_BottomMargin(2)
        try pageSetup.set_LeftMargin(1)
        try pageSetup.set_RightMargin(1)
        try pageSetup.set_TopMargin(3)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetMarginsOfExcelSheet.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}