import XCTest
@testable import Spire_Xls

class ToSVGTests: TestCaseBase {

    func testToSVG() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToSVG.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToSVG/"
        if !FileManager.default.fileExists(atPath: outputFile) {
            try FileManager.default.createDirectory(atPath: outputFile, withIntermediateDirectories: true, attributes: nil)
        }

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        var count = try workbook.get_Worksheets().get_Count()
        for i:Int32 in 0..<count {
            let worksheet = try workbook.get_Worksheets().get_Item(i) as! Worksheet
            print(try worksheet.get_Name())
            let fs = try Stream(outputFile + "sheet-\(i).svg")
            try worksheet.ToSVGStream(fs, 0, 0, 0, 0)
            try fs.Flush()
            try fs.Close()
        }
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ToSVG/"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
