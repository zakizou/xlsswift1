import XCTest
@testable import Spire_Xls

class OpenExistingFileTests: XCTestCase {

    func testOpenExistingFileTest() throws {
        let inputFile = TestUtil.DataPath + "Demo/templateAz2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/OpenExistingFile.xlsx"
        
        try TestUtil.licenseKey()
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        let sheets:XlsWorksheetsCollection = try workbook.get_Worksheets()
        let sheet = try sheets.Add("MySheet")
        
        try sheet.get_Range().get_Item("A1").set_Text("Hello World")
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/OpenExistingFile.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
