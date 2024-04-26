import XCTest
@testable import Spire_Xls

class CopyRowsTests: TestCaseBase {

    func testCopyRows() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Copying.xls"
        let outputFile = TestUtil.OutputPath + "Demo/CopyRows.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load an excel file including pivot table
        try workbook.LoadFromFile(inputFile)

        let sheet1 = try workbook.get_Worksheets().get_Item(1) as! Worksheet
        let sheet2 = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Copy the first row to the third row in the same sheet
        try sheet1.Copy(sheet1.get_Rows().get_Item(0), sheet1.get_Rows().get_Item(2), true, true, true)

        // Copy the first row to the second row in the different sheet
        try sheet1.Copy(sheet1.get_Rows().get_Item(0), sheet2.get_Rows().get_Item(1), true, true, true)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        //region check data
        //baseLineFile = TestUtil.BaseLinePath + "Demo/CopyRows.xlsx"
        //Compare.CompareFile(baseLineFile, outputFile)
        //endregion
    }

}
