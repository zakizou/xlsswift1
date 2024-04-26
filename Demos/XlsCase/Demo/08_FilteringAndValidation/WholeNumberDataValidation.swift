import XCTest
@testable import Spire_Xls

class WholeNumberDataValidationTests: TestCaseBase {
    func testWholeNumberDataValidation() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DataValidation.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/WholeNumberDataValidation.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("C12").set_Text("Please enter number between 10 and 100:")
        try sheet.get_Range().get_Item("C12").AutoFitColumns()

        // Set Whole Number data validation for cell "D12"
        let range = try sheet.get_Range().get_Item("D12")
        try range.get_DataValidation().set_AllowType(CellDataType.Integer)
        try range.get_DataValidation().set_CompareOperator(ValidationComparisonOperator.Between)
        try range.get_DataValidation().set_Formula1("10")
        try range.get_DataValidation().set_Formula2("100")
        try range.get_DataValidation().set_AlertStyle(AlertStyleType.Info)
        try range.get_DataValidation().set_ShowError(true)
        try range.get_DataValidation().set_ErrorTitle("Error")
        try range.get_DataValidation().set_ErrorMessage("Please enter a valid number")
        try range.get_DataValidation().set_InputMessage("Whole Number Validation Type")
        try range.get_DataValidation().set_IgnoreBlank(true)
        try range.get_DataValidation().set_ShowInput(true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/WholeNumberDataValidation.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
