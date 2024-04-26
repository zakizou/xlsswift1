import XCTest
@testable import Spire_Xls

class CellStyleNameTests: TestCaseBase {
    func testCellStyleName() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampleB_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CellStyleName.xlsx"
        
        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Get the cell style name
        let styleName = try sheet.get_Range().get_Item("A1").get_CellStyleName()
        
        let ranges = try sheet.get_AllocatedRange()
        for cell in try ranges.get_Cells() {
            // Find the cells which have the same style name
            if try cell.get_CellStyleName() == styleName {
                // Set value
                try cell.set_Value("Same style")
            }
        }
        
        // Save and launch result file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CellStyleName.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
