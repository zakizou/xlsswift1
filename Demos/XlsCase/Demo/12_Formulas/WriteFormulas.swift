import XCTest
@testable import Spire_Xls

class WriteFormulasTests: TestCaseBase {
    func testWriteFormulas() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/WriteFormulas.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        var currentRow: Int32 = 1
        var currentFormula = ""

        try sheet.SetColumnWidth(1, 32)
        try sheet.SetColumnWidth(2, 16)
        try sheet.SetColumnWidth(3, 16)

        try sheet.get_Range().get_Item(currentRow, 1).set_Value("Examples of formulas :")
        currentRow += 1
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Value("Test data:")

        let range = try sheet.get_Range().get_Item("A1")
        try range.get_Style().get_Font().set_IsBold(true)
        try range.get_Style().set_FillPattern(ExcelPatternType.Solid)
        try range.get_Style().set_KnownColor(ExcelColors.LightGreen1)
        try range.get_Style().get_Borders().get_Item(BordersLineType.EdgeBottom).set_LineStyle(LineStyleType.Medium)

        // Test data
        try sheet.get_Range().get_Item(currentRow, 2).set_NumberValue(7.3)
        try sheet.get_Range().get_Item(currentRow, 3).set_NumberValue(5)
        try sheet.get_Range().get_Item(currentRow, 4).set_NumberValue(8.2)
        try sheet.get_Range().get_Item(currentRow, 5).set_NumberValue(4)
        try sheet.get_Range().get_Item(currentRow, 6).set_NumberValue(3)
        try sheet.get_Range().get_Item(currentRow, 7).set_NumberValue(11.3)

        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Value("Formulas")
        try sheet.get_Range().get_Item(currentRow, 2).set_Value("Results")
        let headerRange = try sheet.get_Range().get_Item(currentRow, 1, currentRow, 2)
        try headerRange.get_Style().get_Font().set_IsBold(true)
        try headerRange.get_Style().set_KnownColor(ExcelColors.LightGreen1)
        try headerRange.get_Style().set_FillPattern(ExcelPatternType.Solid)
        try headerRange.get_Style().get_Borders().get_Item(BordersLineType.EdgeBottom).set_LineStyle(LineStyleType.Medium)

        // String formula
        currentFormula = "=\"hello\""
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 3).set_Formula("=\"\u{4f60}\u{597d}\"")

        // Integer formula
        currentFormula = "=300"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)

        // Float formula
        currentFormula = "=3389.639421"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)

        // Boolean formula
        currentFormula = "=false"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)

        currentFormula = "=1+2+3+4+5-6-7+8-9"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)

        currentFormula = "=33*3/4-2+10"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)

        // Sheet reference formula
        currentFormula = "=Sheet1!$B$3"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)

        // Sheet area reference formula
        currentFormula = "=AVERAGE(Sheet1!$D$3:G$3)"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)

        // Function formula
        currentFormula = "=Count(3,5,8,10,2,34)"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)

        currentFormula = "=NOW()"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).get_Style().set_NumberFormat("yyyy-MM-DD")

        currentFormula = "=SECOND(11)"
        currentRow += 1

        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=MINUTE(12)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=MONTH(9)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=DAY(10)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=TIME(4,5,7)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1


        currentFormula = "=DATE(6,4,2)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=RAND()"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=HOUR(12)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=MOD(5,3)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=WEEKDAY(3)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=YEAR(23)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=NOT(TRUE)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=OR(TRUE)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=AND(true)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=VALUE(30)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=LEN(\"world\")"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=MID(\"world\",4,2)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=ROUND(7,3)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=SIGN(4)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=INT(200)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=ABS(-1.21)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=LN(15)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=EXP(20)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=SQRT(40)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=PI()"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=COS(9)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=SIN(45)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=MAX(10,30)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=MIN(5,7)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=AVERAGE(12,45)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=SUM(18,29)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=IF(4,2,2)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        currentFormula = "=SUBTOTAL(3,Sheet1!B2:E3)"
        try sheet.get_Range().get_Item(currentRow, 1).set_Text(currentFormula)
        try sheet.get_Range().get_Item(currentRow, 2).set_Formula(currentFormula)
        currentRow += 1

        // Save the changes and validate the result.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/WriteFormulas.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }

}
