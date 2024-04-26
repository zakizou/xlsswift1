import XCTest
@testable import Spire_Xls

class SpecifyFontDirectoryTests: TestCaseBase {
    func testSpecifyFontDirectory() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToPDFSample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SpecifyFontDirectory.pdf"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.set_CustomFontFileDirectory([TestUtil.DataPath + "Demo/DengXian/"])
        try workbook.SaveToFile(outputFile, FileFormat.PDF)
        try workbook.Dispose()
        
        // Check Data
        // let baseLineFile = "Demo/SpecifyFontDirectory.pdf"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
