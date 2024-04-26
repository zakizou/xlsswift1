import XCTest
@testable import Spire_Xls

class ExtractTextImageFromShapeTests: TestCaseBase {
    func testExtractTextImageFromShape() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_5.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ExtractTextImageFromShape.txt"

        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Extract text from the first shape and save to a txt file
        let shape1 = try sheet.get_PrstGeomShapes().get_Item(2)
        let s = try shape1.get_Text()
        var sb = [String]()
        sb.append("The text in the third shape is: " + s)
        try File.appendAllText(outputFile, sb)

        try workbook.Dispose()

        // Check data in txt file
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ExtractTextImageFromShape.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }

    func testExtractTextImageFromShape_ToImg() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_5.xlsx"
        let outputFile_i = TestUtil.OutputPath + "Demo/Image/"

        if !Directory.exists(outputFile_i) {
            try Directory.createDirectory(outputFile_i)
        }

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Extract image from the second shape and save to a local folder
        let shape2 = try sheet.get_PrstGeomShapes().get_Item(1)

        let image = try (shape2.get_Fill() as! XlsShapeFill).get_Picture()
        let filename = outputFile_i + "ExtractTextImageFromShape.png"
        try image.Save(filename, ImageFormat.get_Png())
        try image.Dispose()
        try workbook.Dispose()

        // Check data in image file
        // let baseLineFile = TestUtil.baseLinePath + "Demo/Image/ExtractTextImageFromShape.png"
        // Compare.compareFile(baseLineFile, filename)
    }
}
