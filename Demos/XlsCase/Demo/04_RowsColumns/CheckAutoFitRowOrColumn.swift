import XCTest
@testable import Spire_Xls

class CheckAutoFitRowOrColumnTests: XCTestCase {
    func testCheckAutoFitRowOrColumn() throws {
        // let licensePath = TestUtil.DataPath + "Demo/license.elic-python.xml"
        // License.setLicenseFileFullPath(licensePath)

        let inputFile = TestUtil.DataPath + "Demo/CheckAutoFitRowsAndColumns.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CheckAutoFitRowOrColumn.txt"

        try File.delete(outputFile)

        let workbook = try Workbook()
        var result = [String]()
        try workbook.LoadFromFile(inputFile)

        // Gets whether the cell has an adaptive row height set
        let isRowAutofit = try (workbook.get_Worksheets().get_Item(0) as XlsWorksheet).GetRowIsAutoFit(2)
        if isRowAutofit {
            result.append("The second row is auto fit row height.")
        } else {
            result.append("The second row is not auto fit row height.")
        }

        // Gets whether the cell has an adaptive column width set
        let isColAutofit = try (workbook.get_Worksheets().get_Item(0) as XlsWorksheet).GetColumnIsAutoFit(2)
        if isColAutofit {
            result.append("The second column is auto fit column width.")
        } else {
            result.append("The second column is not auto fit column width.")
        }
        try File.appendAllText(outputFile, result)
        try workbook.Dispose()

        // Check Data
        // let baseLineFile = "Demo/CheckAutoFitRowOrColumn.txt"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
