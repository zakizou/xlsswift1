import XCTest
@testable import Spire_Xls

class SparkLineTests: TestCaseBase {

    func testSparkLine() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SparkLine.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SparkLine.xlsx"

        // Load a Workbook from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add sparkline
        let sparklineGroup = try sheet.get_SparklineGroups().AddGroup(.Line)
        let sparklines = try sparklineGroup.Add()
        try sparklines.Add(sheet.get_Item("A2:D2"), sheet.get_Item("E2"))
        try sparklines.Add(sheet.get_Item("A3:D3"), sheet.get_Item("E3"))
        try sparklines.Add(sheet.get_Item("A4:D4"), sheet.get_Item("E4"))
        try sparklines.Add(sheet.get_Item("A5:D5"), sheet.get_Item("E5"))
        try sparklines.Add(sheet.get_Item("A6:D6"), sheet.get_Item("E6"))
        try sparklines.Add(sheet.get_Item("A7:D7"), sheet.get_Item("E7"))
        try sparklines.Add(sheet.get_Item("A8:D8"), sheet.get_Item("E8"))
        try sparklines.Add(sheet.get_Item("A9:D9"), sheet.get_Item("E9"))
        try sparklines.Add(sheet.get_Item("A10:D10"), sheet.get_Item("E10"))
        try sparklines.Add(sheet.get_Item("A11:D11"), sheet.get_Item("E11"))

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SparkLine.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }

}
