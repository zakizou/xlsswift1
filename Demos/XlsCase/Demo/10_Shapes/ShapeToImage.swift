import XCTest
import Foundation
@testable import Spire_Xls

class ShapeToImageTests: XCTestCase {
    func testShapeToImage() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ShapeToImage.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/Image/ShapeToImage.png"

        let wb = try Workbook()
        // Load an excel file
        try wb.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet1 = try wb.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first shape from the first worksheet
        let shape = try sheet1.get_PrstGeomShapes().get_Item(0) as! XlsShape
        // Save the shape to an image
        let img = try shape.SaveToImage()
        try img.Save(outputFile, ImageFormat.get_Png())

        try wb.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/Image/ShapeToImage.png"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
