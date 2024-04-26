// #
// #import unittest
// #from spire.xls import *
// from TestUtil import *
// #from spire.xls.common import *
// #from Demos import *
// #from TestUtil import *
// #from Compare.Compare import Compare

// ##not support:print
// #class PageSetupForPrinting_(unittest.TestCase):
// #
// #    def testPageSetupForPrinting(self):

// #        TestUtil.LicenseKey()
// #        inputFile =  TestUtil.DataPath + "Demo/CreateTable.xlsx"
// #        outputFile=  TestUtil.OutputPath + "Demo/PageSetupForPrinting.xps"

// #        #Create a workbook
// #        workbook = Workbook()

// #        #Load the Excel document from disk
// #        workbook.LoadFromFile(inputFile)

// #        #Get the first worksheet
// #        worksheet = workbook.Worksheets[0]

// #        #Specifying the print area
// #        pageSetup = worksheet.PageSetup
// #        pageSetup.PrintArea = "A1:E19"

// #        #Define column A & E as title columns
// #        pageSetup.PrintTitleColumns = "$A:$E"

// #        #Define row numbers 1 as title rows
// #        pageSetup.PrintTitleRows = "$1:$2"

// #        #Allow to print with gridlines
// #        pageSetup.IsPrintGridlines = True

// #        #Allow to print with row/column headings
// #        pageSetup.IsPrintHeadings = True

// #        #Allow to print worksheet in black & white mode
// #        pageSetup.BlackAndWhite = True

// #        #Allow to print comments as displayed on worksheet
// #        pageSetup.PrintComments = PrintCommentType.InPlace

// #        #Set printing quality
// #        pageSetup.PrintQuality = 150

// #        #Allow to print cell errors as N/A
// #        pageSetup.PrintErrors = PrintErrorsType.NA

// #        #Set the printing order 
// #        pageSetup.Order = OrderType.OverThenDown

// #        print = workbook.PrintDocument
// #        print.PrinterSettings.PrintToFile = True
// #        print.PrinterSettings.PrintFileName = (outputFile)
// #        print.Print()
// #        workbook.Dispose()

// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/PageSetupForPrinting.xps"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion

// #if __name__ == '__main__':
// #    unittest.main()
