// #using System
// #using System.Drawing.Printing
// #using Microsoft.VisualStudio.TestTools.UnitTesting
// #using Spire.Xls
// #using XlsTest
// ##notsupport:print
// #namespace TestCase_VS2010.Demo._20_Print
// #{
// #    [TestClass]
// #    public class CustomPaperSizeForPrinting_
// #    {
// #        [TestMethod]
// #        public void CustomPaperSizeForPrinting() //弹框，需要在Adobbe打印机上设置纸张为customPaper，高宽为100
// #        {
// #            string inputFile = TestUtil.DataPath + "Demo/CustomPaperSizeForPrinting.xlsx"
// #            string outputFile=  TestUtil.OutputPath + "Demo/Demo/CustomPaperSizeForPrinting.pdf"

// #            //Create a workbook
// #            Workbook workbook = new Workbook()
// #            //Load the Excel document from disk
// #            workbook.LoadFromFile(inputFile)
// #            Worksheet worksheet = workbook.Worksheets[0]
// #            worksheet.PageSetup.CustomPaperSizeName = "customPaper"
// #            workbook.PrintDocument.Print()
// #            workbook.Dispose()

// #            #region check data
// #            string baseLineFile = @TestUtil.BaseLinePath + "Demo/CustomPaperSizeForPrinting.pdf"
// #            #Compare.CompareFile(baseLineFile, outputFile)
// #            #endregion
// #        }
// #    }
// #}