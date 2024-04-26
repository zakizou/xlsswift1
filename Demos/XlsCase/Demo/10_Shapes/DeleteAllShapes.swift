import XCTest
@testable import Spire_Xls

class DeleteAllShapesTests: TestCaseBase {
    func testDeleteAllShapes() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_5.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DeleteAllShapes.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Delete all shapes in the worksheet
        for i in (try 0..<sheet.get_PrstGeomShapes().get_Count()).reversed() {
            try sheet.get_PrstGeomShapes().get_Item(i).Remove()
        }

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DeleteAllShapes.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
