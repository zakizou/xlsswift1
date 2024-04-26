import XCTest
@testable import Spire_Xls

class AddTextBoxTests: TestCaseBase {
    func testAddTextBox() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AddTextBox.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddTextBox.xlsx"

        // Create a Workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first chart
        let chart = try sheet.get_Charts().get_Item(0) as! XlsChartShape

        // Add a Textbox
        let textbox = try chart.get_Shapes().AddTextBox()
        try textbox.set_Width(1200)
        try textbox.set_Height(320)
        try textbox.set_Left(1000)
        try textbox.set_Top(480)
        try textbox.set_Text("This is a textbox")

        // Save and Launch
        try workbook.SaveToFile(outputFile, FileFormat.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AddTextBox.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
