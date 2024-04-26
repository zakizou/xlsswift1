// #import unittest
// #from spire.xls import *
// from TestUtil import *
// #from spire.xls.common import *
// #from Demos import *
// #from TestUtil import *
// #from Compare.Compare import Compare

// ##not support:AddDataTable
// #class MarkerDesigner_(unittest.TestCase):
// #
// #    def testMarkerDesigner(self):

// #        TestUtil.LicenseKey()
// #        dataPath = TestUtil.DataPath + "Demo/DataImport.xls"
// #        inputFile =  TestUtil.DataPath + "Demo/MarkerDesigner.xls"
// #        outputFile=  TestUtil.OutputPath + "Demo/MarkerDesigner.xlsx"

// #        source = Workbook()
// #        source.LoadFromFile(dataPath)
// #        sheet = source.Worksheets[0]
// #        dt = sheet.ExportDataTable()

// #        workbook = Workbook()
// #        workbook.LoadFromFile(inputFile)
// #        #Fill parameter
// #        workbook.MarkerDesigner.AddParameter("Variable1", 1234.5678)
// #        #Fill DataTable
// #        workbook.MarkerDesigner.AddDataTable("Country", dt)
// #        workbook.MarkerDesigner.Apply()
// #        #AutoFit
// #        sheet.AllocatedRange.AutoFitRows()
// #        sheet.AllocatedRange.AutoFitColumns()
// #        pass

// #        #Save to file
// #        workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
// #        source.Dispose()
// #        workbook.Dispose()
// #
// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/MarkerDesigner.xlsx"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion

// #if __name__ == '__main__':
// #    unittest.main()
