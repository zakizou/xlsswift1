// #
// #import unittest
// #from spire.xls import *
// from TestUtil import *
// #from spire.xls.common import *
// #from Demos import *
// #from TestUtil import *
// #from Compare.Compare import Compare

// ##not support:Graphics
// #class AddWatermark_(unittest.TestCase):
// #
// #    def testAddWatermark(self):

// #        TestUtil.LicenseKey()
// #        inputFile =  TestUtil.DataPath + "Demo/AddWatermark.xlsx"
// #        outputFile=  TestUtil.OutputPath + "Demo/AddWatermark.xlsx"

// #        #initialize a new instance of workbook and load the test file
// #        workbook = Workbook()
// #        workbook.LoadFromFile(inputFile)

// #        #Insert image in a header to mimic a watermark
// #        font = Font("Arial", 40)
// #        watermark = "Confidential"

// #        for sheet in workbook.Worksheets:
// #            #Call DrawText() to create an image
// #            imgWtrmrk = Demo._13_HeaderFooter.AddWatermark_._DrawText(watermark, font, Color.LightCoral, System.Drawing.Color.White, sheet.PageSetup.PageHeight, sheet.PageSetup.PageWidth)
// #            #Set image as left header image
// #            sheet.PageSetup.LeftHeaderImage = imgWtrmrk
// #            sheet.PageSetup.LeftHeader = "&G"

// #            #The watermark will only appear in this mode, it will disappear if the mode is normal
// #            sheet.ViewMode = ViewMode.Layout
// #        #Save to file
// #        workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
// #        workbook.Dispose()
// #
// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/AddWatermark.xlsx"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion


// #    @staticmethod
// #    def _DrawText(text, font, textColor, backColor, height, width):
// #        img = Bitmap(int(width), int(height))

// #        #Create a bitmap image with specified width and height
// #        drawing = Graphics.FromImage(img)

// #        #Get the size of text
// #        textSize = drawing.MeasureString(text, font)

// #        #Set rotation point
// #        drawing.TranslateTransform((int(width) - textSize.Width) / 2, (int(height) - textSize.Height) / 2)

// #        #Rotate text
// #        drawing.RotateTransform(-45)

// #        #Reset translate transform    
// #        drawing.TranslateTransform(-(int(width) - textSize.Width) / 2, -(int(height) - textSize.Height) / 2)

// #        #Paint the background
// #        drawing.Clear(backColor)

// #        #Create a brush for the text
// #        textBrush = SolidBrush(textColor)

// #        #Draw text on the image at center position
// #        drawing.DrawString(text, font, textBrush, (int(width) - textSize.Width) / 2, (int(height) - textSize.Height) / 2)
// #        drawing.Save()
// #        return img


// #if __name__ == '__main__':
// #    unittest.main()
