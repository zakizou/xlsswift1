import XCTest
@testable import Spire_Xls

class TillPicAsTextureInShapeTests: TestCaseBase {
    func testTillPicAsTextureInShape() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/TillPicAsTextureInShape.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/TillPicAsTextureInShape.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first shape
        let shape = try sheet.get_PrstGeomShapes().get_Item(0)

        // Fill shape with texture
        try shape.get_Fill().set_FillType(ShapeFillType.Texture)

        // Custom texture with picture
        try shape.get_Fill().CustomTexture(TestUtil.DataPath + "Demo/Logo.png")

        // Tile picture as texture
        try shape.get_Fill().set_Tile(true)

        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/TillPicAsTextureInShape.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
