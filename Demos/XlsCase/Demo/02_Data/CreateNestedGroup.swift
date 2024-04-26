import XCTest
@testable import Spire_Xls

class CreateNestedGroupTests: TestCaseBase {

    func testCreateNestedGroup() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CreateNestedGroup.xlsx"
        
        // Create a workbook.
        let workbook = try Workbook()
        
        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Set the style.
        let style = try workbook.get_Styles().Add("style")
        try style.get_Font().set_Color(Color.get_CadetBlue())
        try style.get_Font().set_IsBold(true)
        
        // Set the summary rows appear above detail rows.
        try sheet.get_PageSetup().set_IsSummaryRowBelow(false)
        
        // Insert sample data to cells.
        try sheet.get_Range().get_Item("A1").set_Value("Project plan for project X")
        try sheet.get_Range().get_Item("A1").set_CellStyleName(style.get_Name())
        
        try sheet.get_Range().get_Item("A3").set_Value("Set up")
        try sheet.get_Range().get_Item("A3").set_CellStyleName(style.get_Name())
        try sheet.get_Range().get_Item("A4").set_Value("Task 1")
        try sheet.get_Range().get_Item("A5").set_Value("Task 2")
        try sheet.get_Range().get_Item("A4:A5").BorderAround(LineStyleType.Thin)
        try sheet.get_Range().get_Item("A4:A5").BorderInside(LineStyleType.Thin)
        
        try sheet.get_Range().get_Item("A7").set_Value("Launch")
        try sheet.get_Range().get_Item("A7").set_CellStyleName(style.get_Name())
        try sheet.get_Range().get_Item("A8").set_Value("Task 1")
        try sheet.get_Range().get_Item("A9").set_Value("Task 2")
        try sheet.get_Range().get_Item("A8:A9").BorderAround(LineStyleType.Thin)
        try sheet.get_Range().get_Item("A8:A9").BorderInside(LineStyleType.Thin)
        
        // Group the rows that you want to group.
        try sheet.GroupByRows(2, 9, false)
        try sheet.GroupByRows(4, 5, false)
        try sheet.GroupByRows(8, 9, false)
        
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CreateNestedGroup.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
