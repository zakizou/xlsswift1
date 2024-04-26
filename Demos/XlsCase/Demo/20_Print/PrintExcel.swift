// #
// #
// #import unittest
// #from spire.xls import *
// from TestUtil import *
// #from spire.xls.common import *
// #from Demos import *
// #from TestUtil import *
// #from Compare.Compare import Compare

// ##not support:print
// #class PrintExcel_(unittest.TestCase):
// #
// #    def testPrintExcel(self):

// #        TestUtil.LicenseKey()
// #        inputFile =  TestUtil.DataPath + "Demo/CreateTable.xlsx"
// #        outputFile=  TestUtil.OutputPath + "Demo/PrintExcel.xps"

// #        #Create a workbook
// #        workbook = Workbook()
// #        #Load the Excel document from disk
// #        workbook.LoadFromFile(inputFile)

// #        settings = workbook.PrintDocument.PrinterSettings
// #        settings.FromPage = 0
// #        settings.ToPage = 1
// #        #Use the default printer to print
// #        print = workbook.PrintDocument
// #        print.PrinterSettings.PrintToFile = True
// #        print.PrinterSettings.PrintFileName = (outputFile)
// #        print.Print()
// #        workbook.Dispose()

// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/PrintExcel.xps"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion

// #if __name__ == '__main__':
// #    unittest.main()
