import XCTest
@testable import Spire_Xls

class FindCellsWithStyleNameTests: TestCaseBase {
    func testFindCellsWithStyleName() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampleB_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FindCellsWithStyleName.xlsx"
        
        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Get the cell style name
        let styleName = try sheet.get_Range().get_Item("A1").get_CellStyleName()
        
        let ranges = try sheet.get_AllocatedRange()
        for cc in try ranges.get_Cells() {
            // Find the cells which have the same style name
            if try cc.get_CellStyleName() == styleName {
                // Set value
                try cc.set_Value("Same style")
            }
        }
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FindCellsWithStyleName.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
