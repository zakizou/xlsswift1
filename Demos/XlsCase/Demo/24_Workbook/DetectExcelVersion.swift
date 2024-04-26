import XCTest
@testable import Spire_Xls

class DetectExcelVersionTests: TestCaseBase {
    func testDetectExcelVersion() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/DetectExcelVersion.txt"
        try File.delete(outputFile)

        let files = [
            TestUtil.DataPath + "Demo/ExcelSample97_N.xls",
            TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx",
            TestUtil.DataPath + "Demo/ExcelSample_N.xlsb"
        ]

        var builder = [String]()

        for file in files {
            let workbook = try Workbook()
            try workbook.LoadFromFile(file)
            let version = try workbook.get_Version()
            builder.append("\(version)")
        }

        try File.appendAllText(outputFile, [builder.joined(separator: "\n")])
    }
}

