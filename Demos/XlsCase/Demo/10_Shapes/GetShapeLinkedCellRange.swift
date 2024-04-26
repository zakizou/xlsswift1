import XCTest
@testable import Spire_Xls

class GetShapeLinkedCellRangeTests: TestCaseBase {
    func testGetShapeLinkedCellRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CellLinkedRangeLocal.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetShapeLinkedCellRange.txt"
        try File.delete(outputFile)

        // Load the document and perform necessary operations.
        let workbook = try Workbook()
        var sb = [String]()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let prstGeomShapeCollection = try sheet.get_PrstGeomShapes()
        
        // Extract linked cell ranges for specified shapes.
        var shape = try prstGeomShapeCollection.get_Item("Yesterday")
        var cellAddress = try shape.get_LinkedCell().get_RangeAddress()
        sb.append(cellAddress + "\n")
        
        shape = try prstGeomShapeCollection.get_Item("NewShapes")
        cellAddress = try shape.get_LinkedCell().get_RangeAddress()
        sb.append(cellAddress)
        
        // Append extracted cell addresses to output file.
        try File.appendAllText(outputFile, [sb.joined(separator: "\n")])
        try workbook.Dispose()

        // Check data in text file
        // let baseLineFile = "Demo/GetShapeLinkedCellRange.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
