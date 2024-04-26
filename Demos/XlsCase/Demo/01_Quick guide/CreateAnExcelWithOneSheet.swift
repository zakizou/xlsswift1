import XCTest
@testable import Spire_Xls

class CreateAnExcelWithOneSheetTests: TestCaseBase {

    func testCreateAnExcelWithOneSheet() throws {
        let outputPath = TestUtil.OutputPath
        try TestUtil.licenseKey()
        
        let outputFile_t = outputPath + "Demo/CreateAnExcelWithOneSheet.txt"
        let outputFile = outputPath + "Demo/CreateAnExcelWithOneSheet.xlsx"
        
        try File.delete(outputFile_t)
        let start = Date()
        let workbook = try Workbook()
        try workbook.CreateEmptySheets(1)
        let sheet = try workbook.get_Worksheets().get_Item(0)
        
        for row:Int32 in 1...10000 {
            for col:Int32 in 1...30 {
                try sheet.get_Range().get_Item(row, col).set_Text("\(row),\(col)")
            }
        }
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        let end = Date()
        let time = end.timeIntervalSince(start)
        
        try File.appendText(outputFile_t, "File has been created successfully! \n" + "Time consumed (Seconds): \(time)")
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CreateAnExcelWithOneSheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
