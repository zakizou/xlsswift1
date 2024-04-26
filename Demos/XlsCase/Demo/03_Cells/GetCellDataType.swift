import XCTest
@testable import Spire_Xls

class GetCellDataTypeTests: TestCaseBase {
    func testGetCellDataType() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetCellDataType.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the cell types of the cells in range "H2:H7”
        for range in try sheet.get_Range().get_Item("H2:H7").get_Cells() {
            let cellType = try sheet.GetCellType(range.get_Row(), range.get_Column(), false)
            try sheet.get_Range().get_Item(range.get_Row(), range.get_Column() + 1).set_Text(cellType.stringValue())
            try sheet.get_Range().get_Item(range.get_Row(), range.get_Column() + 1).get_Style().get_Font().set_Color(Color.get_Red())
            try sheet.get_Range().get_Item(range.get_Row(), range.get_Column() + 1).get_Style().get_Font().set_IsBold(true)
        }

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetCellDataType.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
