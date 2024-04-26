import XCTest
@testable import Spire_Xls

class DataValidationTests: TestCaseBase {
    func testDataValidation() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DataValidation.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DataValidation.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet

        // Decimal DataValidation
        try sheet.get_Range().get_Item("B11").set_Text("Input Number(3-6):")
        let rangeNumber = try sheet.get_Range().get_Item("B12")
        try rangeNumber.get_DataValidation().set_CompareOperator(ValidationComparisonOperator.Between)
        try rangeNumber.get_DataValidation().set_Formula1("3")
        try rangeNumber.get_DataValidation().set_Formula2("6")
        try rangeNumber.get_DataValidation().set_AllowType(CellDataType.Decimal)
        try rangeNumber.get_DataValidation().set_ErrorMessage("Please input correct number!")
        try rangeNumber.get_DataValidation().set_ShowError(true)
        try rangeNumber.get_Style().set_KnownColor(ExcelColors.Gray25Percent)

        // Date DataValidation
        try sheet.get_Range().get_Item("B14").set_Text("Input Date:")
        let rangeDate = try sheet.get_Range().get_Item("B15")
        try rangeDate.get_DataValidation().set_AllowType(CellDataType.Date)
        try rangeDate.get_DataValidation().set_CompareOperator(ValidationComparisonOperator.Between)
        try rangeDate.get_DataValidation().set_Formula1("1/1/1970")
        try rangeDate.get_DataValidation().set_Formula2("12/31/1970")
        try rangeDate.get_DataValidation().set_ErrorMessage("Please input correct date!")
        try rangeDate.get_DataValidation().set_ShowError(true)
        try rangeDate.get_Style().set_KnownColor(ExcelColors.Gray25Percent)

        // TextLength DataValidation
        try sheet.get_Range().get_Item("B17").set_Text("Input Text:")
        let rangeTextLength = try sheet.get_Range().get_Item("B18")
        try rangeTextLength.get_DataValidation().set_AllowType(CellDataType.TextLength)
        try rangeTextLength.get_DataValidation().set_CompareOperator(ValidationComparisonOperator.LessOrEqual)
        try rangeTextLength.get_DataValidation().set_Formula1("5")
        try rangeTextLength.get_DataValidation().set_ErrorMessage("Enter a Valid String!")
        try rangeTextLength.get_DataValidation().set_ShowError(true)
        try rangeTextLength.get_Style().set_KnownColor(ExcelColors.Gray25Percent)

        try sheet.AutoFitColumn(2)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DataValidation.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
