import XCTest
@testable import Spire_Xls

class AddLabelControlTests: TestCaseBase {

    func testAddLabelControl() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddLabelControl.xlsx"

        // Load the document and perform necessary operations.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        //Add a label control
        let label = try sheet.get_LabelShapes().AddLabel(10, 2, 30, 200)
        try label.set_Text("This is a Label Control")
        // Save the changes and validate the result.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddLabelControl.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}