import XCTest
@testable import Spire_Xls

class ApplyMultipleFontsInSingleCellTests: TestCaseBase {
    func testApplyMultipleFontsInSingleCell() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ApplyMultipleFontsInSingleCell.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the file from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Create a font object in workbook, setting the font color, size, and type
        let font1 = try workbook.CreateFont()
        try font1.set_KnownColor(ExcelColors.LightBlue)
        try font1.set_IsBold(true)
        try font1.set_Size(10)
        
        // Create another font object specifying its properties
        let font2 = try workbook.CreateFont()
        try font2.set_KnownColor(ExcelColors.Red)
        try font2.set_IsBold(true)
        try font2.set_IsItalic(true)
        try font2.set_FontName("Times New Roman")
        try font2.set_Size(11)
        
        // Write a RichText string to the cell 'H5' and set the font for it
        let richText = try sheet.get_Range().get_Item("H5").get_RichText()
        try richText.set_Text("This document was created with Spire.XLS for .NET.")
        try richText.SetFont(0, 29, font1)
        try richText.SetFont(31, 48, font2)
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ApplyMultipleFontsInSingleCell.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
