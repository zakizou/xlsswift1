// #import unittest
// #from spire.xls import *
// from TestUtil import *
// #from spire.xls.common import *
// #from Demos import *
// #from TestUtil import *
// #from Compare.Compare import Compare

// ##not support:DataSet
// #class DetectIsBlank_(unittest.TestCase):
// #
// #    def testDetectIsBlank(self):

// #        TestUtil.LicenseKey()
// #        inputFile =  TestUtil.DataPath + "Demo/MarkerDesigner2.xlsx"
// #        outputFile=  TestUtil.OutputPath + "Demo/DetectIsBlank.xlsx"

// #        #Create a workbook
// #        workbook = Workbook()

// #        #Load the document from disk
// #        workbook.LoadFromFile(inputFile)

// #        ds = DataSet()
// #        #Fill dataset from XML file
// #        ds.ReadXml(TestUtil.DataPath + "Demo/Data.xml")

// #        sheet = workbook.Worksheets[0]
// #        #Fill DataTable
// #        workbook.MarkerDesigner.AddDataTable("data", ds.Tables["data"])
// #        workbook.MarkerDesigner.Apply()

// #        #Calculate formulas
// #        workbook.CalculateAllValue()

// #        #Save to file
// #        workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
// #        workbook.Dispose()
// #
// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/DetectIsBlank.xlsx"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion

// #if __name__ == '__main__':
// #    unittest.main()
