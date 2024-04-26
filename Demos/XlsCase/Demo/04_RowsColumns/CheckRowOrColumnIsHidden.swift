import XCTest
@testable import Spire_Xls

class CheckRowOrColumnIsHiddenTests: TestCaseBase {

    func testCheckRowOrColumnIsHidden() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CheckRowOrColumnIsHidden.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CheckRowOrColumnIsHidden.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        var result = [String]()
        let rowIndex: Int32 = 2
        let columnIndex: Int32 = 2
        let rowIsHide = try sheet.GetRowIsHide(rowIndex)
        if rowIsHide {
            result.append("The second row is hidden.")
        } else {
            result.append("The second row is not hidden.")
        }
        let columnIsHide = try sheet.GetColumnIsHide(columnIndex)

        if columnIsHide {
            result.append("The second column is hidden.")
        } else {
            result.append("The second column is not hidden.")
        }
        try File.appendAllText(outputFile, result)
        try workbook.Dispose()

        //region Check Data
        //baseLineFile = "Demo/CheckAutoFitRowOrColumn.txt"
        //Compare.CompareFile(baseLineFile, outputFile)
        //endregion
    }

}
