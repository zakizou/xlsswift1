import XCTest
@testable import Spire_Xls

class InsertWavFileOLEObjectTests: XCTestCase {

    func testInsertWavFileOLEObject() throws { // jira-2025
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WAVFileSample.wav"
        let inputimg = TestUtil.DataPath + "Demo/SpireXls.png"
        let outputFile = TestUtil.OutputPath + "Demo/InsertWavFileOLEObject.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add OLE object
        let fs = try Stream(inputimg)
        let oleObject = try sheet.get_OleObjects().Add(inputFile, fs, OleLinkType.Embed)

        // Set the object location
        try oleObject.set_Location(sheet.get_Range().get_Item("B4"))
        // Set the object type as package
        try oleObject.set_ObjectType(OleObjectType.Package)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/InsertWavFileOLEObject.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
