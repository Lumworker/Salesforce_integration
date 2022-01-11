using Ionic.Zip;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Salesforce_integration
{
    public partial class Price_List_Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnExport_Click(object sender, EventArgs e)
        //{
        //    string site_ref = snssite_ref.Text;
        //    DataTable dt = new ClassBrowseNew().Export_SP_SFPriceList_Product("Step2", site_ref);
        //    GridView GV = new GridView();
        //    GV.AllowPaging = false;
        //    GV.DataSource = dt;
        //    GV.DataBind();
        //    var time = DateTime.Now.ToString("yyyyMMdd");
        //    var times = DateTime.Now.ToString("yyyy-MM-dd");
        //    string txt = string.Empty;
        //    txt += "";

        //    foreach (DataColumn column in dt.Columns)
        //    {
        //        // Add the header to the text file
        //        txt += column.ColumnName + "\t";
        //    }
        //    // Insert a new line.
        //    txt += "\r\n";
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        foreach (DataColumn column in dt.Columns)
        //        {
        //            // Insert the Data rows.
        //            txt += row[column.ColumnName].ToString() + "\t";
        //        }
        //        // Insert a  new line.
        //        txt += "\r\n";
        //    }

        //    //string path = @"D:\\deploy\\Salesforce_integration\\Salesforce_integration_Files\\IcashExport\\";
        //    //Test


        //    string path = Server.MapPath("./Temp/Price_List_Product/");
        //    //string path = @"D:\\Salesforce_integration\\Temp\\IcashExport\\";
        //    //string path = @"\\\\PORTALAPP01\\Salesforce_integration\\Temp\\IcashExport\\";
        //    //On Go live
        //    string txtpath = path + "Price_List_Product" + time + ".txt";
        //    string excelpath = path + times + ".xls";

        //    //--------------PK site----------
        //    if (GV.Rows.Count > 0)
        //    {
        //        StreamWriter Strwriter = new StreamWriter(txtpath);
        //        Strwriter.Write(txt);
        //        Strwriter.Flush();
        //        Strwriter.Close();

        //        StringWriter sw = new StringWriter();
        //        HtmlTextWriter hw = new HtmlTextWriter(sw);
        //        for (int i = 0; i > GV.Rows.Count; i++)
        //        {
        //            GV.Rows[i].Attributes.Add("class", "textmode");
        //        }
        //        GV.RenderControl(hw);
        //        string renderedGridView = sw.ToString();
        //        System.IO.File.WriteAllText(excelpath, renderedGridView);
        //        //Text Path
        //    }


        //    //--------------zip---------------
        //    using (ZipFile zip = new ZipFile())
        //    {
        //        Response.Clear();
        //        Response.BufferOutput = false;
        //        string zipName = "Price_List_Product" + times + ".zip";
        //        Response.ContentType = "application/zip";
        //        Response.AddHeader("content-disposition", "attachment; filename=" + zipName);

        //        zip.AddDirectory(path, "files");
        //        zip.Save(Response.OutputStream);
        //        //------------Delete all files------------
        //        System.IO.DirectoryInfo di = new DirectoryInfo(path);

        //        foreach (FileInfo file in di.GetFiles())
        //        {
        //            file.Delete();
        //        }
        //        foreach (DirectoryInfo dir in di.GetDirectories())
        //        {
        //            dir.Delete(true);
        //        }
        //        Response.End();
        //    }


        //}
    }
}