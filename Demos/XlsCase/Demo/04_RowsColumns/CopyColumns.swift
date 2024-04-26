import XCTest
@testable import Spire_Xls

class CopyColumnsTests: TestCaseBase {

    func testCopyColumns() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Copying.xls"
        let outputFile = TestUtil.OutputPath + "Demo/CopyColumns.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load an excel file including pivot table
        try workbook.LoadFromFile(inputFile)

        let sheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let sheet2 = try workbook.get_Worksheets().get_Item(1) as! Worksheet

        // Copy the first column to the third column in the same sheet
        try sheet1.Copy(sheet1.get_Columns().get_Item(0) as! CellRange, sheet1.get_Columns().get_Item(2) as! CellRange, true, true, true)

        // Copy the first column to the second column in the different sheet
        try sheet1.Copy(sheet1.get_Columns().get_Item(0) as! CellRange, sheet2.get_Columns().get_Item(1) as! CellRange, true, true, true)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        //region check data
        //baseLineFile = TestUtil.BaseLinePath + "Demo/CopyColumns.xlsx"
        //Compare.CompareFile(baseLineFile, outputFile)
        //endregion
    }

}
