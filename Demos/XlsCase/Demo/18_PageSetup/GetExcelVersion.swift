import XCTest
@testable import Spire_Xls

class GetExcelVersionTests: XCTestCase {

    func testGetExcelVersion() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetExcelVersion.txt"
        try File.delete(outputFile)

        var builder = [String]()

        // Create a workbook
        let workbook = try Workbook()

        // Load the document
        try workbook.LoadFromFile(inputFile)

        // Get the version
        let version = try workbook.get_Version()

        builder.append("\(version)")
        // Save to file
        try File.appendAllText(outputFile, builder)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetExcelVersion.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
