import XCTest
@testable import Spire_Xls

class LoadAndSaveFileWithMacroTests: TestCaseBase {
    func testLoadAndSaveFileWithMacro() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/MacroSample.xls"
        let outputFile = TestUtil.OutputPath + "Demo/LoadAndSaveFileWithMacro.xls"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.get_Range().get_Item("A5").set_Text("This is a simple test!")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version97to2003)
        try workbook.Dispose()
    }
}