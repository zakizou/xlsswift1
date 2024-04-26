import XCTest
@testable import Spire_Xls

class CreateFiftyExcelFilesTests: XCTestCase {

    func testCreateFiftyExcelFiles() throws {
        let outputPath = TestUtil.OutputPath
        try TestUtil.licenseKey()
        
        let outputFile = outputPath + "Demo/CreateFiftyExcelFiles/"
        let outputFile_t = outputPath + "Demo/CreateFiftyExcelFiles.txt"
        try File.delete(outputFile_t)
        
        let start = Date()
        for n in 0..<50 {
            let workbook = try Workbook()
            try workbook.CreateEmptySheets(5)
            for i:Int32 in 0..<5 {
                let sheet = try workbook.get_Worksheets().get_Item(i)
                try sheet.set_Name("Sheet\(i)")
                for row:Int32 in 1...151 {
                    for col:Int32 in 1...51 {
                        try sheet.get_Range().get_Item(row, col).set_Text("row\(row) col\(col)")
                    }
                }
            }
            let filename = "Workbook\(n).xlsx"
            try workbook.SaveToFile(outputFile + filename, ExcelVersion.Version2010)
            try workbook.Dispose()
        }
        let end = Date()
        let time = end.timeIntervalSince(start)
        try File.appendText(outputFile_t, "50 File(s) have been created successfully! \n" + "Time consumed (Seconds): \(time)")
    }
}
