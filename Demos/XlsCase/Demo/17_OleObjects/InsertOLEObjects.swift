import XCTest
@testable import Spire_Xls

class InsertOLEObjectsTests: TestCaseBase {
    func testInsertOLEObjects() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/InsertOLEObjects.xls"
        let outputFile = TestUtil.OutputPath + "Demo/InsertOLEObjects.xlsx"

        let workbook = try Workbook()
        let ws = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try ws.get_Range().get_Item("A1").set_Text("Here is an OLE Object.")

        // Insert OLE object
        let image = try self._GenerateImage(inputFile)
        let stream = try Spire_Xls.Stream()
        try image.Save(stream, ImageFormat.get_Png())
        let oleObject = try ws.get_OleObjects().Add(inputFile, stream, OleLinkType.Embed)

        try oleObject.set_Location(ws.get_Range().get_Item("B4"))
        try oleObject.set_ObjectType(OleObjectType.ExcelWorksheet)

        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/InsertOLEObjects.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }

    func _GenerateImage(_ fileName: String) throws -> Image {
        let book = try Workbook()
        try book.LoadFromFile(fileName)
        try book.get_Worksheets().get_Item(0).get_PageSetup().set_LeftMargin(0)
        try book.get_Worksheets().get_Item(0).get_PageSetup().set_RightMargin(0)
        try book.get_Worksheets().get_Item(0).get_PageSetup().set_TopMargin(0)
        try book.get_Worksheets().get_Item(0).get_PageSetup().set_BottomMargin(0)
        return try book.get_Worksheets().get_Item(0).ToImage(1, 1, 19, 5)
    }
}
