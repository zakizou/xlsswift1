import XCTest
@testable import Spire_Xls

class VariousConditionalFormattingTests: TestCaseBase {

    func testVariousConditionalFormatting() throws {

        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/VariousConditionalFormatting.xlsx"

        // Create a new workbook and worksheet
        let workbook = try Workbook()
        try workbook.CreateEmptySheets(1)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add various types of conditional formatting to the worksheet
        try _AddConditionalFormattingForNewSheet(sheet)

        // Save the workbook to a file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/VariousConditionalFormatting.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }

    private func _AddConditionalFormattingForNewSheet(_ sheet: Worksheet) throws {
        try _AddDefaultIconSet(sheet)
        try _AddIconSet2(sheet)
        try _AddIconSet3(sheet)
        try _AddIconSet4(sheet)
        try _AddIconSet5(sheet)
        try _AddIconSet6(sheet)
        try _AddIconSet7(sheet)
        try _AddIconSet8(sheet)
        try _AddIconSet9(sheet)
        try _AddIconSet10(sheet)
        try _AddIconSet11(sheet)
        try _AddIconSet12(sheet)
        try _AddIconSet13(sheet)
        try _AddIconSet14(sheet)
        try _AddIconSet15(sheet)
        try _AddIconSet16(sheet)
        try _AddIconSet17(sheet)
        try _AddIconSet18(sheet)
        try _AddDefaultColorScale(sheet)
        try _Add3ColorScale(sheet)
        try _Add2ColorScale(sheet)
        try _AddAboveAverage(sheet)
        try _AddAboveAverage2(sheet)
        try _AddAboveAverage3(sheet)
        try _AddTop10_1(sheet)
        try _AddTop10_2(sheet)
        try _AddTop10_3(sheet)
        try _AddTop10_4(sheet)
        try _AddDataBar1(sheet)
        try _AddDataBar2(sheet)
        try _AddContainsText(sheet)
        try _AddNotContainsText(sheet)
        try _AddContainsBlank(sheet)
        try _AddNotContainsBlank(sheet)
        try _AddBeginWith(sheet)
        try _AddEndWith(sheet)
        try _AddContainsError(sheet)
        try _AddNotContainsError(sheet)
        try _AddDuplicate(sheet)
        try _AddUnique(sheet)
        try _AddTimePeriod_1(sheet)
        try _AddTimePeriod_2(sheet)
        try _AddTimePeriod_3(sheet)
        try _AddTimePeriod_4(sheet)
        try _AddTimePeriod_5(sheet)
        try _AddTimePeriod_6(sheet)
        try _AddTimePeriod_7(sheet)
        try _AddTimePeriod_8(sheet)
        try _AddTimePeriod_9(sheet)
        try _AddTimePeriod_10(sheet)
        try sheet.get_AllocatedRange().set_ColumnWidth(15)
        try sheet.get_AllocatedRange().AutoFitRows()
    }

    // This method implements the IconSet conditional formatting type with ThreeArrows colored attribute.
    private func _AddIconSet2(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M1:O2"))
        try sheet.get_Range().get_Item("M1:O2").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M1:O2").get_Style().set_Color(Color.get_AliceBlue())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.ThreeArrows)
        try sheet.get_Range().get_Item("M1").set_Text("ThreeArrows")
        try sheet.get_Range().get_Item("N1").set_NumberValue(15)
        try sheet.get_Range().get_Item("O1").set_NumberValue(18)
        try sheet.get_Range().get_Item("M2").set_NumberValue(14)
        try sheet.get_Range().get_Item("N2").set_NumberValue(17)
        try sheet.get_Range().get_Item("O2").set_NumberValue(20)
    }

    // This method implements the IconSet conditional formatting type with FourArrows colored attribute.
    private func _AddIconSet3(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M3:O4"))
        try sheet.get_Range().get_Item("M3:O4").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M3:O4").get_Style().set_Color(Color.get_AntiqueWhite())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.FourArrows)
        try sheet.get_Range().get_Item("M3").set_Text("FourArrows")
        try sheet.get_Range().get_Item("N3").set_NumberValue(17)
        try sheet.get_Range().get_Item("O3").set_NumberValue(20)
        try sheet.get_Range().get_Item("M4").set_NumberValue(16)
        try sheet.get_Range().get_Item("N4").set_NumberValue(19)
        try sheet.get_Range().get_Item("O4").set_NumberValue(22)
    }

    // This method implements the IconSet conditional formatting type with FiveArrows colored attribute.
    private func _AddIconSet4(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M5:O6"))
        try sheet.get_Range().get_Item("M5:O6").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M5:O6").get_Style().set_Color(Color.get_Aqua())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.FiveArrows)
        try sheet.get_Range().get_Item("M5").set_Text("FiveArrows")
        try sheet.get_Range().get_Item("N5").set_NumberValue(17)
        try sheet.get_Range().get_Item("O5").set_NumberValue(20)
        try sheet.get_Range().get_Item("M6").set_NumberValue(16)
        try sheet.get_Range().get_Item("N6").set_NumberValue(19)
        try sheet.get_Range().get_Item("O6").set_NumberValue(22)
    }

    // This method implements the IconSet conditional formatting type with ThreeArrowsGray colored attribute.
    private func _AddIconSet5(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M7:O8"))
        try sheet.get_Range().get_Item("M7:O8").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M7:O8").get_Style().set_Color(Color.get_Aquamarine())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.ThreeArrowsGray)
        try sheet.get_Range().get_Item("M7").set_Text("ThreeArrowsGray")
        try sheet.get_Range().get_Item("N7").set_NumberValue(21)
        try sheet.get_Range().get_Item("O7").set_NumberValue(24)
        try sheet.get_Range().get_Item("M8").set_NumberValue(20)
        try sheet.get_Range().get_Item("N8").set_NumberValue(23)
        try sheet.get_Range().get_Item("O8").set_NumberValue(26)
    }

    // This method implements the IconSet conditional formatting type with FourArrowsGray colored attribute.
    private func _AddIconSet6(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M9:O10"))
        try sheet.get_Range().get_Item("M9:O10").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M9:O10").get_Style().set_Color(Color.get_Azure())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.FourArrowsGray)
        try sheet.get_Range().get_Item("M9").set_Text("FourArrowsGray")
        try sheet.get_Range().get_Item("N9").set_NumberValue(23)
        try sheet.get_Range().get_Item("O9").set_NumberValue(26)
        try sheet.get_Range().get_Item("M10").set_NumberValue(22)
        try sheet.get_Range().get_Item("N10").set_NumberValue(25)
        try sheet.get_Range().get_Item("O10").set_NumberValue(28)
    }

    // This method implements the IconSet conditional formatting type with FiveArrowsGray colored attribute.
    private func _AddIconSet7(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M11:O12"))
        try sheet.get_Range().get_Item("M11:O12").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M11:O12").get_Style().set_Color(Color.get_Beige())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.FiveArrowsGray)
        try sheet.get_Range().get_Item("M11").set_Text("FiveArrowsGray")
        try sheet.get_Range().get_Item("N11").set_NumberValue(25)
        try sheet.get_Range().get_Item("O11").set_NumberValue(28)
        try sheet.get_Range().get_Item("M12").set_NumberValue(24)
        try sheet.get_Range().get_Item("N12").set_NumberValue(27)
        try sheet.get_Range().get_Item("O12").set_NumberValue(30)
    }

    // This method implements the IconSet conditional formatting type with ThreeFlags attribute.
    private func _AddIconSet8(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M13:O14"))
        try sheet.get_Range().get_Item("M13:O14").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M13:O14").get_Style().set_Color(Color.get_Bisque())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.ThreeFlags)
        try sheet.get_Range().get_Item("M13").set_Text("ThreeFlags")
        try sheet.get_Range().get_Item("N13").set_NumberValue(27)
        try sheet.get_Range().get_Item("O13").set_NumberValue(30)
        try sheet.get_Range().get_Item("M14").set_NumberValue(26)
        try sheet.get_Range().get_Item("N14").set_NumberValue(29)
        try sheet.get_Range().get_Item("O14").set_NumberValue(32)
    }

    // This method implements the IconSet conditional formatting type with FiveQuarters attribute.
    private func _AddIconSet9(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M15:O16"))
        try sheet.get_Range().get_Item("M15:O16").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M15:O16").get_Style().set_Color(Color.get_BlanchedAlmond())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.FiveQuarters)
        try sheet.get_Range().get_Item("M15").set_Text("FiveQuarters")
        try sheet.get_Range().get_Item("N15").set_NumberValue(29)
        try sheet.get_Range().get_Item("O15").set_NumberValue(32)
        try sheet.get_Range().get_Item("M16").set_NumberValue(28)
        try sheet.get_Range().get_Item("N16").set_NumberValue(31)
        try sheet.get_Range().get_Item("O16").set_NumberValue(34)
    }

    // This method implements the IconSet conditional formatting type with FourRating attribute.
    private func _AddIconSet10(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M17:O18"))
        try sheet.get_Range().get_Item("M17:O18").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M17:O18").get_Style().set_Color(Color.get_LightBlue())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.FourRating)
        try sheet.get_Range().get_Item("M17").set_Text("FourRating")
        try sheet.get_Range().get_Item("N17").set_NumberValue(31)
        try sheet.get_Range().get_Item("O17").set_NumberValue(34)
        try sheet.get_Range().get_Item("M18").set_NumberValue(30)
        try sheet.get_Range().get_Item("N18").set_NumberValue(33)
        try sheet.get_Range().get_Item("O18").set_NumberValue(36)
    }

    // This method implements the IconSet conditional formatting type with FiveRating attribute.
    private func _AddIconSet11(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M19:O20"))
        try sheet.get_Range().get_Item("M19:O20").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M19:O20").get_Style().set_Color(Color.get_BlueViolet())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.FiveRating)
        try sheet.get_Range().get_Item("M19").set_Text("FiveRating")
        try sheet.get_Range().get_Item("N19").set_NumberValue(33)
        try sheet.get_Range().get_Item("O19").set_NumberValue(36)
        try sheet.get_Range().get_Item("M20").set_NumberValue(32)
        try sheet.get_Range().get_Item("N20").set_NumberValue(35)
        try sheet.get_Range().get_Item("O20").set_NumberValue(38)
    }

    // This method implements the IconSet conditional formatting type with FourRedToBlack attribute.
    private func _AddIconSet12(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M21:O22"))
        try sheet.get_Range().get_Item("M21:O22").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M21:O22").get_Style().set_Color(Color.get_Brown())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.FourRedToBlack)
        try sheet.get_Range().get_Item("M21").set_Text("FourRedToBlack")
        try sheet.get_Range().get_Item("N21").set_NumberValue(35)
        try sheet.get_Range().get_Item("O21").set_NumberValue(38)
        try sheet.get_Range().get_Item("M22").set_NumberValue(34)
        try sheet.get_Range().get_Item("N22").set_NumberValue(37)
        try sheet.get_Range().get_Item("O22").set_NumberValue(40)
    }

    // This method implements the IconSet conditional formatting type with ThreeSigns attribute.
    private func _AddIconSet13(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M23:O24"))
        try sheet.get_Range().get_Item("M23:O24").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M23:O24").get_Style().set_Color(Color.get_BurlyWood())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.ThreeSigns)
        try sheet.get_Range().get_Item("M23").set_Text("ThreeSigns")
        try sheet.get_Range().get_Item("N23").set_NumberValue(37)
        try sheet.get_Range().get_Item("O23").set_NumberValue(40)
        try sheet.get_Range().get_Item("M24").set_NumberValue(36)
        try sheet.get_Range().get_Item("N24").set_NumberValue(39)
        try sheet.get_Range().get_Item("O24").set_NumberValue(42)
    }

    // This method implements the IconSet conditional formatting type with ThreeSymbols attribute.
    private func _AddIconSet14(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M25:O26"))
        try sheet.get_Range().get_Item("M25:O26").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M25:O26").get_Style().set_Color(Color.get_CadetBlue())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.ThreeSymbols)
        try sheet.get_Range().get_Item("M25").set_Text("ThreeSymbols")
        try sheet.get_Range().get_Item("N25").set_NumberValue(39)
        try sheet.get_Range().get_Item("O25").set_NumberValue(42)
        try sheet.get_Range().get_Item("M26").set_NumberValue(38)
        try sheet.get_Range().get_Item("N26").set_NumberValue(41)
        try sheet.get_Range().get_Item("O26").set_NumberValue(44)
    }

    // This method implements the IconSet conditional formatting type with ThreeSymbols2 attribute.
    private func _AddIconSet15(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M27:O28"))
        try sheet.get_Range().get_Item("M27:O28").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M27:O28").get_Style().set_Color(Color.get_Chartreuse())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.ThreeSymbols2)
        try sheet.get_Range().get_Item("M27").set_Text("ThreeSymbols2")
        try sheet.get_Range().get_Item("N27").set_NumberValue(41)
        try sheet.get_Range().get_Item("O27").set_NumberValue(44)
        try sheet.get_Range().get_Item("M28").set_NumberValue(40)
        try sheet.get_Range().get_Item("N28").set_NumberValue(43)
        try sheet.get_Range().get_Item("O28").set_NumberValue(46)
    }

    // This method implements the IconSet conditional formatting type with ThreeTrafficLights1 attribute.
    private func _AddIconSet16(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M29:O30"))
        try sheet.get_Range().get_Item("M29:O30").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M29:O30").get_Style().set_Color(Color.get_Chocolate())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.ThreeTrafficLights1)
        try sheet.get_Range().get_Item("M29").set_Text("ThreeTrafficLights1")
        try sheet.get_Range().get_Item("N29").set_NumberValue(43)
        try sheet.get_Range().get_Item("O29").set_NumberValue(46)
        try sheet.get_Range().get_Item("M30").set_NumberValue(42)
        try sheet.get_Range().get_Item("N30").set_NumberValue(45)
        try sheet.get_Range().get_Item("O30").set_NumberValue(48)
    }

    // This method implements the IconSet conditional formatting type with ThreeTrafficLights2 attribute.
    private func _AddIconSet17(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M31:O32"))
        try sheet.get_Range().get_Item("M31:O32").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M31:O32").get_Style().set_Color(Color.get_Coral())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.ThreeTrafficLights2)
        try sheet.get_Range().get_Item("M31").set_Text("ThreeTrafficLights2")
        try sheet.get_Range().get_Item("N31").set_NumberValue(45)
        try sheet.get_Range().get_Item("O31").set_NumberValue(48)
        try sheet.get_Range().get_Item("M32").set_NumberValue(44)
        try sheet.get_Range().get_Item("N32").set_NumberValue(47)
        try sheet.get_Range().get_Item("O32").set_NumberValue(50)
    }

    // This method implements the IconSet conditional formatting type with FourTrafficLights attribute.
    private func _AddIconSet18(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("M33:O35"))
        try sheet.get_Range().get_Item("M33:O35").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("M33:O35").get_Style().set_Color(Color.get_CornflowerBlue())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try cf.get_IconSet().set_IconSetType(IconSetType.FourTrafficLights)
        try sheet.get_Range().get_Item("M33").set_Text("FourTrafficLights")
        try sheet.get_Range().get_Item("N33").set_NumberValue(48)
        try sheet.get_Range().get_Item("O33").set_NumberValue(52)
        try sheet.get_Range().get_Item("M34").set_NumberValue(46)
        try sheet.get_Range().get_Item("N34").set_NumberValue(50)
        try sheet.get_Range().get_Item("O34").set_NumberValue(54)
        try sheet.get_Range().get_Item("M35").set_NumberValue(48)
        try sheet.get_Range().get_Item("N35").set_NumberValue(52)
        try sheet.get_Range().get_Item("O35").set_NumberValue(56)
    }

    // This method implements the TimePeriod conditional formatting type with Yesterday attribute.
    private func _AddTimePeriod_10(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I19:K20"))
        try sheet.get_Range().get_Item("I19:K20").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I19:K20").get_Style().set_Color(Color.get_MediumSeaGreen())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.Yesterday)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        
        var c = try sheet.get_Range().get_Item("I19")
        try c.set_Value2(DateTime.get_Now().AddDays(-2))

        c = try sheet.get_Range().get_Item("J19")
        try c.set_Value2(DateTime.get_Now().AddDays(-1))

        c = try sheet.get_Range().get_Item("K19")
        try c.set_Value2(DateTime.get_Now())

        c = try sheet.get_Range().get_Item("I20")
        try c.set_Text("Yesterday")

        c = try sheet.get_Range().get_Item("J20")
        try c.set_Value2(DateTime.get_Now().AddDays(1))

        c = try sheet.get_Range().get_Item("K20")
        try c.set_Value2(DateTime.get_Now().AddDays(2))
    }
    // This method implements the TimePeriod conditional formatting type with Tomorrow attribute.
    private func _AddTimePeriod_9(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I17:K18"))
        try sheet.get_Range().get_Item("I17:K18").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I17:K18").get_Style().set_Color(Color.get_MediumPurple())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.Tomorrow)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        
        var c = try sheet.get_Range().get_Item("I17")
        try c.set_Value2(DateTime.get_Now().AddDays(-2))

        c = try sheet.get_Range().get_Item("J17")
        try c.set_Value2(DateTime.get_Now().AddDays(-1))

        c = try sheet.get_Range().get_Item("K17")
        try c.set_Value2(DateTime.get_Now())

        c = try sheet.get_Range().get_Item("I18")
        try c.set_Text("Tomorrow")

        c = try sheet.get_Range().get_Item("J18")
        try c.set_Value2(DateTime.get_Now().AddDays(1))

        c = try sheet.get_Range().get_Item("K18")
        try c.set_Value2(DateTime.get_Now().AddDays(2))
    }

    // This method implements the TimePeriod conditional formatting type with ThisWeek attribute.
    private func _AddTimePeriod_8(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I15:K16"))
        try sheet.get_Range().get_Item("I15:K16").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I15:K16").get_Style().set_Color(Color.get_MediumOrchid())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.ThisWeek)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        
        var c = try sheet.get_Range().get_Item("I15")
        try c.set_Value2(DateTime.get_Now().AddDays(-2))

        c = try sheet.get_Range().get_Item("J15")
        try c.set_Value2(DateTime.get_Now().AddDays(-1))

        c = try sheet.get_Range().get_Item("K15")
        try c.set_Value2(DateTime.get_Now())

        c = try sheet.get_Range().get_Item("I16")
        try c.set_Text("ThisWeek")

        c = try sheet.get_Range().get_Item("J16")
        try c.set_Value2(DateTime.get_Now().AddDays(2))

        c = try sheet.get_Range().get_Item("K16")
        try c.set_Value2(DateTime.get_Now().AddDays(3))
    }

    // This method implements the TimePeriod conditional formatting type with ThisMonth attribute.
    private func _AddTimePeriod_7(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I13:K14"))
        try sheet.get_Range().get_Item("I13:K14").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I13:K14").get_Style().set_Color(Color.get_MediumBlue())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.ThisMonth)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        
        var c = try sheet.get_Range().get_Item("I13")
        try c.set_Value2(DateTime.get_Now().AddDays(-1))

        c = try sheet.get_Range().get_Item("J13")
        try c.set_Value2(DateTime.get_Now().AddDays(-1))

        c = try sheet.get_Range().get_Item("K13")
        try c.set_Value2(DateTime.get_Now())

        c = try sheet.get_Range().get_Item("I14")
        try c.set_Text("ThisMonth")

        c = try sheet.get_Range().get_Item("J14")
        try c.set_Value2(DateTime.get_Now().AddDays(1))

        c = try sheet.get_Range().get_Item("K14")
        try c.set_Value2(DateTime.get_Now().AddDays(2))
    }

    // This method implements the TimePeriod conditional formatting type with NextWeek attribute.
    private func _AddTimePeriod_6(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I11:K12"))
        try sheet.get_Range().get_Item("I11:K12").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I11:K12").get_Style().set_Color(Color.get_MediumAquamarine())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.NextWeek)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        
        var c = try sheet.get_Range().get_Item("I11")
        try c.set_Value2(DateTime.get_Now().AddDays(-3))

        c = try sheet.get_Range().get_Item("J11")
        try c.set_Value2(DateTime.get_Now().AddDays(-2))

        c = try sheet.get_Range().get_Item("K11")
        try c.set_Value2(DateTime.get_Now())

        c = try sheet.get_Range().get_Item("I12")
        try c.set_Text("NextWeek")

        c = try sheet.get_Range().get_Item("J12")
        try c.set_Value2(DateTime.get_Now().AddDays(3))

        c = try sheet.get_Range().get_Item("K12")
        try c.set_Value2(DateTime.get_Now().AddDays(4))
    }

    // This method implements the TimePeriod conditional formatting type with NextMonth attribute.
    private func _AddTimePeriod_5(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I9:K10"))
        try sheet.get_Range().get_Item("I9:K10").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I9:K10").get_Style().set_Color(Color.get_Maroon())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.NextMonth)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        
        var c = try sheet.get_Range().get_Item("I9")
        try c.set_Value2(DateTime.get_Now().AddDays(-3))

        c = try sheet.get_Range().get_Item("J9")
        try c.set_Value2(DateTime.get_Now().AddDays(-1))

        c = try sheet.get_Range().get_Item("K9")
        try c.set_Value2(DateTime.get_Now())

        c = try sheet.get_Range().get_Item("I10")
        try c.set_Text("NextMonth")

        c = try sheet.get_Range().get_Item("J10")
        try c.set_Value2(DateTime.get_Now().AddDays(1))

        c = try sheet.get_Range().get_Item("K10")
        try c.set_Value2(DateTime.get_Now().AddDays(2))
    }

    // This method implements the TimePeriod conditional formatting type with LastWeek attribute.
    private func _AddTimePeriod_4(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I7:K8"))
        try sheet.get_Range().get_Item("I7:K8").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I7:K8").get_Style().set_Color(Color.get_Linen())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.LastWeek)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        
        var c = try sheet.get_Range().get_Item("I7")
        try c.set_Value2(DateTime.get_Now().AddDays(-6))

        c = try sheet.get_Range().get_Item("J7")
        try c.set_Value2(DateTime.get_Now().AddDays(-5))

        c = try sheet.get_Range().get_Item("K7")
        try c.set_Value2(DateTime.get_Now())

        c = try sheet.get_Range().get_Item("I8")
        try c.set_Text("LastWeek")

        c = try sheet.get_Range().get_Item("J8")
        try c.set_Value2(DateTime.get_Now().AddDays(3))

        c = try sheet.get_Range().get_Item("K8")
        try c.set_Value2(DateTime.get_Now().AddDays(4))
    }

    // This method implements the TimePeriod conditional formatting type with LastMonth attribute.
    private func _AddTimePeriod_3(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I5:K6"))
        try sheet.get_Range().get_Item("I5:K6").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I5:K6").get_Style().set_Color(Color.get_Linen())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.LastMonth)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        
        var c = try sheet.get_Range().get_Item("I5")
        try c.set_Value2(DateTime.get_Now().AddDays(-6))

        c = try sheet.get_Range().get_Item("J5")
        try c.set_Value2(DateTime.get_Now().AddDays(-1))

        c = try sheet.get_Range().get_Item("K5")
        try c.set_Value2(DateTime.get_Now())

        c = try sheet.get_Range().get_Item("I6")
        try c.set_Text("LastMonth")

        c = try sheet.get_Range().get_Item("J6")
        try c.set_Value2(DateTime.get_Now().AddDays(3))

        c = try sheet.get_Range().get_Item("K6")
        try c.set_Value2(DateTime.get_Now().AddDays(1))
    }

    // This method implements the TimePeriod conditional formatting type with Last7Days attribute.
    private func _AddTimePeriod_2(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I3:K4"))
        try sheet.get_Range().get_Item("I3:K4").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I3:K4").get_Style().set_Color(Color.get_LightSkyBlue())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.Last7Days)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        
        var c = try sheet.get_Range().get_Item("I3")
        try c.set_Value2(DateTime.get_Now().AddDays(-8))

        c = try sheet.get_Range().get_Item("J3")
        try c.set_Value2(DateTime.get_Now().AddDays(-7))

        c = try sheet.get_Range().get_Item("K3")
        try c.set_Value2(DateTime.get_Now())

        c = try sheet.get_Range().get_Item("I4")
        try c.set_Text("Last7Days")

        c = try sheet.get_Range().get_Item("J4")
        try c.set_Value2(DateTime.get_Now().AddDays(3))

        c = try sheet.get_Range().get_Item("K4")
        try c.set_Value2(DateTime.get_Now().AddDays(2))
    }
    func _AddTimePeriod_1(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("I1:K2"))
        try sheet.get_Range().get_Item("I1:K2").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("I1:K2").get_Style().set_Color(Color.get_LightSlateGray())
        let cf = try conds.AddTimePeriodCondition(TimePeriodType.Today)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        let c = try sheet.get_Range().get_Item("I1")
        try c.set_Value2(DateTime.get_Now().AddDays(-8))

        let c1 = try sheet.get_Range().get_Item("J1")
        try c1.set_Value2(DateTime.get_Now().AddDays(-7))

        let c2 = try sheet.get_Range().get_Item("K1")
        try c2.set_Value2(DateTime.get_Now())

        let c3 = try sheet.get_Range().get_Item("I2")
        try c3.set_Text("Today")

        let c4 = try sheet.get_Range().get_Item("J2")
        try c4.set_Value2(DateTime.get_Now().AddDays(3))

        let c5 = try sheet.get_Range().get_Item("K2")
        try c5.set_Value2(DateTime.get_Now().AddDays(2))
    }

    func _AddDuplicate(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E23:G24"))
        try sheet.get_Range().get_Item("E23:G24").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E23:G24").get_Style().set_Color(Color.get_LightSlateGray())
        let cf = try conds.AddDuplicateValuesCondition()
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())
        let c = try sheet.get_Range().get_Item("E23")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F23")
        try c1.set_Text("bb")
        let c2 = try sheet.get_Range().get_Item("G23")
        try c2.set_Text("aa")
        let c3 = try sheet.get_Range().get_Item("E24")
        try c3.set_Text("bbb")
        let c4 = try sheet.get_Range().get_Item("F24")
        try c4.set_Text("bb")
        let c5 = try sheet.get_Range().get_Item("G24")
        try c5.set_Text("ccc")
    }

    func _AddUnique(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E21:G22"))
        try sheet.get_Range().get_Item("E21:G22").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E21:G22").get_Style().set_Color(Color.get_LightSalmon())
        let cf = try conds.AddUniqueValuesCondition()
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Yellow())
        let c = try sheet.get_Range().get_Item("E21")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F21")
        try c1.set_Text("bb")
        let c2 = try sheet.get_Range().get_Item("G21")
        try c2.set_Text("aa")
        let c3 = try sheet.get_Range().get_Item("E22")
        try c3.set_Text("bbb")
        let c4 = try sheet.get_Range().get_Item("F22")
        try c4.set_Text("bb")
        let c5 = try sheet.get_Range().get_Item("G22")
        try c5.set_Text("ccc")
    }

    func _AddNotContainsError(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E19:G20"))
        try sheet.get_Range().get_Item("E19:G20").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E19:G20").get_Style().set_Color(Color.get_LightSeaGreen())
        let cf = try conds.AddNotContainsErrorsCondition()
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Yellow())
        let c = try sheet.get_Range().get_Item("E19")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F19")
        try c1.set_Text("=Sum")
        let c2 = try sheet.get_Range().get_Item("G19")
        try c2.set_Text("aa")
        let c3 = try sheet.get_Range().get_Item("E20")
        try c3.set_Text("bbb")
        let c4 = try sheet.get_Range().get_Item("F20")
        try c4.set_Text("sss")
        let c5 = try sheet.get_Range().get_Item("G20")
        try c5.set_Text("=Max")
    }

    func _AddContainsError(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E17:G18"))
        try sheet.get_Range().get_Item("E17:G18").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E17:G18").get_Style().set_Color(Color.get_LightSkyBlue())
        let cf = try conds.AddContainsErrorsCondition()
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Yellow())
        let c = try sheet.get_Range().get_Item("E17")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F17")
        try c1.set_Text("=Sum")
        let c2 = try sheet.get_Range().get_Item("G17")
        try c2.set_Text("aa")
        let c3 = try sheet.get_Range().get_Item("E18")
        try c3.set_Text("bbb")
        let c4 = try sheet.get_Range().get_Item("F18")
        try c4.set_Text("sss")
        let c5 = try sheet.get_Range().get_Item("G18")
        try c5.set_Text("=Max")
    }

    func _AddBeginWith(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E15:G16"))
        try sheet.get_Range().get_Item("E15:G16").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E15:G16").get_Style().set_Color(Color.get_LightGoldenrodYellow())
        let cf = try conds.AddBeginsWithCondition("ab")
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())

        let c = try sheet.get_Range().get_Item("E15")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F15")
        try c1.set_Text("abc")
        let c2 = try sheet.get_Range().get_Item("G15")
        try c2.set_Text("aa")
        let c3 = try sheet.get_Range().get_Item("E16")
        try c3.set_Text("bbb")
        let c4 = try sheet.get_Range().get_Item("F16")
        try c4.set_Text("sss")
        let c5 = try sheet.get_Range().get_Item("G16")
        try c5.set_Text("abcd")
    }

    func _AddEndWith(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E13:G14"))
        try sheet.get_Range().get_Item("E13:G14").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E13:G14").get_Style().set_Color(Color.get_LightGray())
        let cf = try conds.AddEndsWithCondition("ab")
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Yellow())

        let c = try sheet.get_Range().get_Item("E13")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F13")
        try c1.set_Text("abc")
        let c2 = try sheet.get_Range().get_Item("G13")
        try c2.set_Text("aab")
        let c3 = try sheet.get_Range().get_Item("E14")
        try c3.set_Text("bbbc")
        let c4 = try sheet.get_Range().get_Item("F14")
        try c4.set_Text("sab")
        let c5 = try sheet.get_Range().get_Item("G14")
        try c5.set_Text("abcd")
    }

    func _AddNotContainsBlank(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E11:G12"))
        try sheet.get_Range().get_Item("E11:G12").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E11:G12").get_Style().set_Color(Color.get_LightCoral())
        let cf = try conds.AddNotContainsBlanksCondition()
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())

        let c = try sheet.get_Range().get_Item("E11")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F11")
        try c1.set_Text("  ")
        let c2 = try sheet.get_Range().get_Item("G11")
        try c2.set_Text("aab")
        let c3 = try sheet.get_Range().get_Item("E12")
        try c3.set_Text("abc")
        let c4 = try sheet.get_Range().get_Item("F12")
        try c4.set_Text("  ")
        let c5 = try sheet.get_Range().get_Item("G12")
        try c5.set_Text("abcd")
    }

    func _AddContainsBlank(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E9:G10"))
        try sheet.get_Range().get_Item("E9:G10").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E9:G10").get_Style().set_Color(Color.get_LightCyan())
        let cf = try conds.AddContainsBlanksCondition()
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Yellow())

        let c = try sheet.get_Range().get_Item("E9")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F9")
        try c1.set_Text("  ")
        let c2 = try sheet.get_Range().get_Item("G9")
        try c2.set_Text("aab")
        let c3 = try sheet.get_Range().get_Item("E10")
        try c3.set_Text("abc")
        let c4 = try sheet.get_Range().get_Item("F10")
        try c4.set_Text("dvdf")
        let c5 = try sheet.get_Range().get_Item("G10")
        try c5.set_Text("abcd")
    }
    func _AddNotContainsText(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E7:G8"))
        try sheet.get_Range().get_Item("E7:G8").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E7:G8").get_Style().set_Color(Color.get_LightGreen())
        let cf = try conds.AddNotContainsTextCondition("abc")
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())

        let c = try sheet.get_Range().get_Item("E7")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F7")
        try c1.set_Text("abfd")
        let c2 = try sheet.get_Range().get_Item("G7")
        try c2.set_Text("aab")
        let c3 = try sheet.get_Range().get_Item("E8")
        try c3.set_Text("abc")
        let c4 = try sheet.get_Range().get_Item("F8")
        try c4.set_Text("cedf")
        let c5 = try sheet.get_Range().get_Item("G8")
        try c5.set_Text("abcd")
    }

    func _AddContainsText(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("E5:G6"))
        try sheet.get_Range().get_Item("E5:G6").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E5:G6").get_Style().set_Color(Color.get_LightBlue())
        let cf = try conds.AddContainsTextCondition("abc")
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Yellow())

        let c = try sheet.get_Range().get_Item("E5")
        try c.set_Text("aa")
        let c1 = try sheet.get_Range().get_Item("F5")
        try c1.set_Text("abfd")
        let c2 = try sheet.get_Range().get_Item("G5")
        try c2.set_Text("aab")
        let c3 = try sheet.get_Range().get_Item("E6")
        try c3.set_Text("abc")
        let c4 = try sheet.get_Range().get_Item("F6")
        try c4.set_Text("cedf")
        let c5 = try sheet.get_Range().get_Item("G6")
        try c5.set_Text("abcd")
    }

    func _AddDataBar2(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("E3:G4"))
        try sheet.get_Range().get_Item("E3:G4").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E3:G4").get_Style().set_Color(Color.get_LightGreen())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.DataBar)
        try cf.get_DataBar().set_BarColor(Color.get_Orange())
        try cf.get_DataBar().get_MinPoint().set_Type(ConditionValueType.Percentile)
        try cf.get_DataBar().get_MinPoint().set_Value(SpireDouble(30.78))
        try cf.get_DataBar().set_ShowValue(false)

        let c = try sheet.get_Range().get_Item("E3")
        try c.set_NumberValue(6)
        let c1 = try sheet.get_Range().get_Item("F3")
        try c1.set_NumberValue(9)
        let c2 = try sheet.get_Range().get_Item("G3")
        try c2.set_NumberValue(12)
        let c3 = try sheet.get_Range().get_Item("E4")
        try c3.set_NumberValue(8)
        let c4 = try sheet.get_Range().get_Item("F4")
        try c4.set_NumberValue(11)
        let c5 = try sheet.get_Range().get_Item("G4")
        try c5.set_NumberValue(14)
    }

    func _AddDataBar1(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("E1:G2"))
        try sheet.get_Range().get_Item("E1:G2").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("E1:G2").get_Style().set_Color(Color.get_YellowGreen())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.DataBar)
        try cf.get_DataBar().set_BarColor(Color.get_Blue())
        try cf.get_DataBar().get_MinPoint().set_Type(ConditionValueType.Percent)
        try cf.get_DataBar().set_ShowValue(true)

        let c = try sheet.get_Range().get_Item("E1")
        try c.set_NumberValue(4)
        let c1 = try sheet.get_Range().get_Item("F1")
        try c1.set_NumberValue(7)
        let c2 = try sheet.get_Range().get_Item("G1")
        try c2.set_NumberValue(10)
        let c3 = try sheet.get_Range().get_Item("E2")
        try c3.set_NumberValue(6)
        let c4 = try sheet.get_Range().get_Item("F2")
        try c4.set_NumberValue(9)
        let c5 = try sheet.get_Range().get_Item("G2")
        try c5.set_NumberValue(14)
    }

    func _AddDefaultIconSet(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("A1:C2"))
        try sheet.get_Range().get_Item("A1:C2").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A1:C2").get_Style().set_Color(Color.get_Yellow())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.IconSet)
        try sheet.get_Range().get_Item("A1").set_NumberValue(0)
        try sheet.get_Range().get_Item("B1").set_NumberValue(3)
        try sheet.get_Range().get_Item("C1").set_NumberValue(6)
        try sheet.get_Range().get_Item("A2").set_NumberValue(2)
        try sheet.get_Range().get_Item("B2").set_NumberValue(5)
        try sheet.get_Range().get_Item("C2").set_NumberValue(8)
    }

    func _AddDefaultColorScale(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("A5:C6"))
        try sheet.get_Range().get_Item("A5:C6").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A5:C6").get_Style().set_Color(Color.get_Pink())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.ColorScale)

        try sheet.get_Range().get_Item("A5").set_NumberValue(4)
        try sheet.get_Range().get_Item("B5").set_NumberValue(7)
        try sheet.get_Range().get_Item("C5").set_NumberValue(10)
        try sheet.get_Range().get_Item("A6").set_NumberValue(6)
        try sheet.get_Range().get_Item("B6").set_NumberValue(9)
        try sheet.get_Range().get_Item("C6").set_NumberValue(12)
    }

    func _Add3ColorScale(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("A7:C8"))
        try sheet.get_Range().get_Item("A7:C8").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A7:C8").get_Style().set_Color(Color.get_Green())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.ColorScale)
        try cf.get_ColorScale().get_MinValue().set_Type(ConditionValueType.Number)
        try cf.get_ColorScale().get_MinValue().set_Value(SpireInt32(9))
        try cf.get_ColorScale().set_MinColor(Color.get_Purple())

        try sheet.get_Range().get_Item("A7").set_NumberValue(6)
        try sheet.get_Range().get_Item("B7").set_NumberValue(9)
        try sheet.get_Range().get_Item("C7").set_NumberValue(12)
        try sheet.get_Range().get_Item("A8").set_NumberValue(8)
        try sheet.get_Range().get_Item("B8").set_NumberValue(11)
        try sheet.get_Range().get_Item("C8").set_NumberValue(14)
    }

    func _Add2ColorScale(_ sheet: Worksheet) throws {
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_Range().get_Item("A9:C10"))
        try sheet.get_Range().get_Item("A9:C10").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A9:C10").get_Style().set_Color(Color.get_White())
        let cf = try xcfs.AddCondition()
        try cf.set_FormatType(ConditionalFormatType.ColorScale)
        try cf.get_ColorScale().set_MinColor(Color.get_Gold())
        try cf.get_ColorScale().set_MaxColor(Color.get_SkyBlue())

        try sheet.get_Range().get_Item("A9").set_NumberValue(8)
        try sheet.get_Range().get_Item("B9").set_NumberValue(12)
        try sheet.get_Range().get_Item("C9").set_NumberValue(13)
        try sheet.get_Range().get_Item("A10").set_NumberValue(10)
        try sheet.get_Range().get_Item("B10").set_NumberValue(13)
        try sheet.get_Range().get_Item("C10").set_NumberValue(16)
    }

    func _AddAboveAverage(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("A11:C12"))
        try sheet.get_Range().get_Item("A11:C12").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A11:C12").get_Style().set_Color(Color.get_Tomato())
        let cf = try conds.AddAverageCondition(AverageType.Above)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())

        try sheet.get_Range().get_Item("A11").set_NumberValue(10)
        try sheet.get_Range().get_Item("B11").set_NumberValue(13)
        try sheet.get_Range().get_Item("C11").set_NumberValue(16)
        try sheet.get_Range().get_Item("A12").set_NumberValue(12)
        try sheet.get_Range().get_Item("B12").set_NumberValue(15)
        try sheet.get_Range().get_Item("C12").set_NumberValue(18)
    }

    func _AddAboveAverage2(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("A13:C14"))
        try sheet.get_Range().get_Item("A13:C14").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A13:C14").get_Style().set_Color(Color.get_LightPink())
        let cf = try conds.AddAverageCondition(AverageType.BelowEqual)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_LightSkyBlue())

        try sheet.get_Range().get_Item("A13").set_NumberValue(12)
        try sheet.get_Range().get_Item("B13").set_NumberValue(15)
        try sheet.get_Range().get_Item("C13").set_NumberValue(18)
        try sheet.get_Range().get_Item("A14").set_NumberValue(14)
        try sheet.get_Range().get_Item("B14").set_NumberValue(17)
        try sheet.get_Range().get_Item("C14").set_NumberValue(20)
    }
    func _AddAboveAverage3(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("A15:C16"))
        try sheet.get_Range().get_Item("A15:C16").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A15:C16").get_Style().set_Color(Color.get_LightPink())
        let cf = try conds.AddAverageCondition(AverageType.AboveStdDev3)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_LightSkyBlue())

        try sheet.get_Range().get_Item("A15").set_NumberValue(12)
        try sheet.get_Range().get_Item("B15").set_NumberValue(15)
        try sheet.get_Range().get_Item("C15").set_NumberValue(18)
        try sheet.get_Range().get_Item("A16").set_NumberValue(14)
        try sheet.get_Range().get_Item("B16").set_NumberValue(17)
        try sheet.get_Range().get_Item("C16").set_NumberValue(20)
    }

    func _AddTop10_1(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("A17:C20"))
        try sheet.get_Range().get_Item("A17:C20").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A17:C20").get_Style().set_Color(Color.get_Gray())
        let cf = try conds.AddTopBottomCondition(TopBottomType.Top, 10)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Yellow())

        try sheet.get_Range().get_Item("A17").set_NumberValue(16)
        try sheet.get_Range().get_Item("B17").set_NumberValue(21)
        try sheet.get_Range().get_Item("C17").set_NumberValue(26)
        try sheet.get_Range().get_Item("A18").set_NumberValue(18)
        try sheet.get_Range().get_Item("B18").set_NumberValue(23)
        try sheet.get_Range().get_Item("C18").set_NumberValue(28)
        try sheet.get_Range().get_Item("A19").set_NumberValue(20)
        try sheet.get_Range().get_Item("B19").set_NumberValue(25)
        try sheet.get_Range().get_Item("C19").set_NumberValue(30)
        try sheet.get_Range().get_Item("A20").set_NumberValue(22)
        try sheet.get_Range().get_Item("B20").set_NumberValue(27)
        try sheet.get_Range().get_Item("C20").set_NumberValue(32)
    }

    func _AddTop10_2(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("A21:C24"))
        try sheet.get_Range().get_Item("A21:C24").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A21:C24").get_Style().set_Color(Color.get_Green())
        let cf = try conds.AddTopBottomCondition(TopBottomType.Bottom, 10)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Pink())

        try sheet.get_Range().get_Item("A21").set_NumberValue(20)
        try sheet.get_Range().get_Item("B21").set_NumberValue(25)
        try sheet.get_Range().get_Item("C21").set_NumberValue(30)
        try sheet.get_Range().get_Item("A22").set_NumberValue(22)
        try sheet.get_Range().get_Item("B22").set_NumberValue(27)
        try sheet.get_Range().get_Item("C22").set_NumberValue(32)
        try sheet.get_Range().get_Item("A23").set_NumberValue(24)
        try sheet.get_Range().get_Item("B23").set_NumberValue(29)
        try sheet.get_Range().get_Item("C23").set_NumberValue(34)
        try sheet.get_Range().get_Item("A24").set_NumberValue(24)
        try sheet.get_Range().get_Item("B24").set_NumberValue(31)
        try sheet.get_Range().get_Item("C24").set_NumberValue(36)
    }

    func _AddTop10_3(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("A25:C28"))
        try sheet.get_Range().get_Item("A25:C28").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A25:C28").get_Style().set_Color(Color.get_Orange())
        let cf = try conds.AddTopBottomCondition(TopBottomType.TopPercent, 10)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Blue())

        try sheet.get_Range().get_Item("A25").set_NumberValue(24)
        try sheet.get_Range().get_Item("B25").set_NumberValue(29)
        try sheet.get_Range().get_Item("C25").set_NumberValue(34)
        try sheet.get_Range().get_Item("A26").set_NumberValue(25)
        try sheet.get_Range().get_Item("B26").set_NumberValue(36)
        try sheet.get_Range().get_Item("C26").set_NumberValue(32)
        try sheet.get_Range().get_Item("A27").set_NumberValue(24)
        try sheet.get_Range().get_Item("B27").set_NumberValue(28)
        try sheet.get_Range().get_Item("C27").set_NumberValue(31)
        try sheet.get_Range().get_Item("A28").set_NumberValue(34)
        try sheet.get_Range().get_Item("B28").set_NumberValue(26)
        try sheet.get_Range().get_Item("C28").set_NumberValue(32)
    }

    func _AddTop10_4(_ sheet: Worksheet) throws {
        let conds = try sheet.get_ConditionalFormats().Add()
        try conds.AddRange(sheet.get_Range().get_Item("A29:C32"))
        try sheet.get_Range().get_Item("A29:C32").get_Style().set_FillPattern(ExcelPatternType.Solid)
        try sheet.get_Range().get_Item("A29:C32").get_Style().set_Color(Color.get_Gold())
        let cf = try conds.AddTopBottomCondition(TopBottomType.BottomPercent, 10)
        try cf.set_FillPattern(ExcelPatternType.Solid)
        try cf.set_BackColor(Color.get_Green())

        try sheet.get_Range().get_Item("A29").set_NumberValue(22)
        try sheet.get_Range().get_Item("B29").set_NumberValue(33)
        try sheet.get_Range().get_Item("C29").set_NumberValue(38)
        try sheet.get_Range().get_Item("A30").set_NumberValue(30)
        try sheet.get_Range().get_Item("B30").set_NumberValue(35)
        try sheet.get_Range().get_Item("C30").set_NumberValue(39)
        try sheet.get_Range().get_Item("A31").set_NumberValue(32)
        try sheet.get_Range().get_Item("B31").set_NumberValue(37)
        try sheet.get_Range().get_Item("C31").set_NumberValue(43)
        try sheet.get_Range().get_Item("A32").set_NumberValue(34)
        try sheet.get_Range().get_Item("B32").set_NumberValue(28)
        try sheet.get_Range().get_Item("C32").set_NumberValue(32)
    }

}
