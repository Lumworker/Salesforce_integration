using NPOI.SS.UserModel;
using NPOI.SS.Util;
using NPOI.XSSF.UserModel;
using NPOI.HSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace Salesforce_integration
{
    public partial class Price_List_Price_Book_Entry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStep3_DowloadTemplate_Click(object sender, EventArgs e)
        {
            XSSFWorkbook  workbook = new XSSFWorkbook();//for xslx


            ISheet sheet1 = workbook.CreateSheet("Sheet 1");
            IRow row1 = sheet1.CreateRow(0);
            ICell cell = row1.CreateCell(0);
            ICell cell2 = row1.CreateCell(1);

            ICellStyle styleRight = workbook.CreateCellStyle();
            styleRight.BorderRight = NPOI.SS.UserModel.BorderStyle.Medium;
            cell.CellStyle = styleRight;

            ICellStyle styleBottomRight = workbook.CreateCellStyle();

            styleBottomRight.BorderRight = NPOI.SS.UserModel.BorderStyle.Medium;
            styleBottomRight.BorderBottom = NPOI.SS.UserModel.BorderStyle.Medium;
            cell.CellStyle = styleBottomRight;
            cell2.CellStyle = styleBottomRight;

            for (int i = 0; i < 1000; i++)
            {
                var j = i + 1;
                IRow row_xx = sheet1.CreateRow(j);
                ICell cell_x0 = row_xx.CreateCell(0);
                ICell cell_x1 = row_xx.CreateCell(1);
                styleBottomRight.BorderRight = NPOI.SS.UserModel.BorderStyle.Thin;
                styleBottomRight.BorderBottom = NPOI.SS.UserModel.BorderStyle.Thin;
                cell_x0.CellStyle = styleBottomRight;
                cell_x1.CellStyle = styleBottomRight;
            }

            cell.SetCellValue("Product_ID");
            cell2.SetCellValue("Price");
            



            using (var exportData = new MemoryStream())
            {
                Response.Clear();
                workbook.Write(exportData);
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "Price_List_Book_Entry_Template.xlsx"));
                Response.BinaryWrite(exportData.ToArray());
                Response.End();
            }
        }
    
    }
}