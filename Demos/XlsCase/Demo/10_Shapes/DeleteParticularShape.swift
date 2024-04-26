import XCTest
@testable import Spire_Xls

class DeleteParticularShapeTests: TestCaseBase {
    func testDeleteParticularShape() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_5.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DeleteParticularShape.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Delete the first shape in the worksheet
        try sheet.get_PrstGeomShapes().get_Item(0).Remove()

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DeleteParticularShape.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
