import XCTest
@testable import Spire_Xls

class OfficeOpenXMLToExcelTests: TestCaseBase {
    func testOfficeOpenXMLToExcel() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/OfficeOpenXMLToExcel.xml"
        let outputFile = TestUtil.OutputPath + "Demo/OfficeOpenXMLToExcel.xlsx"

        let workbook = try Workbook()

        // Initialize worksheet
        let fileStream = try Stream(inputFile)
        try workbook.LoadFromXml(fileStream)
        // fileStream.Close()
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/OfficeOpenXMLToExcel.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
