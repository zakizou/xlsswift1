import XCTest
@testable import Spire_Xls

class ToImageWithoutWhiteSpaceTests: TestCaseBase {
    func testToImageWithoutWhiteSpace() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampleB_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/Image/ToImageWithoutWhiteSpace.png"
        
        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        print(try sheet.CalculateAndGetRowHeight(1))
        print(try workbook.get_DefaultFontName())
        
        
        // Set the margin as 0 to remove the white space around the image
        try sheet.get_PageSetup().set_LeftMargin(0)
        try sheet.get_PageSetup().set_BottomMargin(0)
        try sheet.get_PageSetup().set_TopMargin(0)
        try sheet.get_PageSetup().set_RightMargin(0)
        
        // Convert to image
        let image = try sheet.ToImage(sheet.get_FirstRow(), sheet.get_FirstColumn(), sheet.get_LastRow(), sheet.get_LastColumn())
        try image.Save(outputFile)
        
        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/Image/ToImageWithoutWhiteSpace.png"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
