using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;
using System.Globalization;
using System.Text;
using System.Collections.Generic;
using System.Collections;
using System.Web.UI;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

namespace Salesforce_integration
{
    public class ClassBrowseNew
    {
        public static String con_PKS = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_PKS_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";

        //เอาComment ออก เมื่อ Go-live
        //public static String con_PKM = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_PKMS_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        //public static String con_SPanel = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_SPanel_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        //ใส่Comment เมื่อ Go-live
        public static String con_PKM = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=CRP2_PKMS_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String con_SPanel = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=CRP2_SPanel_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";

        public static String con_HA = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_HA_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String con_TG = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_TG_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conHrPotal = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=HRPortal;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";

        public static String con_CRP2_PKMS = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=CRP2_PKMS_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";


        public string SeletSite_ref(string site_ref)
        {
            string connDB = "";
            //Database 
            if (site_ref == "ERP_PKS")
            {
                connDB = con_PKS;
            }

            else if (site_ref == "ERP_PKM")
            {
                connDB = con_PKM;
            }

            else if (site_ref == "CRP2_PKMS")
            {
                connDB = con_CRP2_PKMS;
            }

            else if (site_ref == "ERP_TG")
            {
                connDB = con_TG;
            }

            else if (site_ref == "ERP_HA")
            {
                connDB = con_HA;
            }

            else if (site_ref == "ERP_SPN")
            {
                connDB = con_SPanel;
            }

            return connDB;
        }

        public List<ArrayList> VW_Salesforce_site_ref(string Page)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT [site_ref],[Type_page],[Corp_NameTH],[Corp_NameEN] FROM [dbo].[VW_Salesforce_site_ref]" +
                    " Where [Type_page] = '"+ Page + "' ";
                using ( SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public List<ArrayList> CheckVW_Salesforce_site_ref(string Page,string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHrPotal))
            {
                string sql = "SELECT [site_ref],[Type_page],[Corp_NameTH],[Corp_NameEN] FROM [dbo].[VW_Salesforce_site_ref]" +
                    " Where [Type_page] = '"+ Page + "' AND [site_ref]='"+ site_ref + "' ";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> SP_SalesForce_SFLaborHr_SRO(string Step,string site_ref)
        {
            

            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "EXEC [SP_SalesForce_SFLaborHr_SRO] '"+Step+"'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public DataTable Export_SP_SalesForce_SFLaborHr_SRO(string Step, string site_ref)
{

            string sql = "EXEC [SP_SalesForce_SFLaborHr_SRO] '" + Step + "'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref));
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public List<ArrayList> SP_SalesForce_SFTiemSheet_Misc(string Step,string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "EXEC [SP_SalesForce_SFTiemSheet_Misc] '" + Step+"'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public DataTable Export_SP_SalesForce_SFTiemSheet_Misc(string Step, string site_ref)
        {
            string sql = "EXEC [SP_SalesForce_SFTiemSheet_Misc] '" + Step + "'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref));
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public List<ArrayList> SP_SFiCash_Transaction_All(string Step, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "EXEC [SP_SFiCash_Transaction_All] '" + Step + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public DataTable Export_SP_SFiCash_Transaction_All(string Step ,string site_ref)
        {
            string sql = "EXEC [SP_SFiCash_Transaction_All] '" + Step + "'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref));
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public List<ArrayList> SP_SFTiemSheet_ADV_Prepare(string Step, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "EXEC [SP_SFTiemSheet_ADV_Prepare] '" + Step + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public DataTable Export_SP_SFTiemSheet_ADV_Prepare(string Step ,string site_ref)
        {
            string sql = "EXEC [SP_SFTiemSheet_ADV_Prepare] '" + Step + "'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref));
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public List<ArrayList> SP_SFTiemSheet_ACT_Prepare(string Step, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "EXEC [SP_SFTiemSheet_ACT_Prepare] '" + Step + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public DataTable Export_SP_SFTiemSheet_ACT_Prepare(string Step ,string site_ref)
        {
            string sql = "EXEC [SP_SFTiemSheet_ACT_Prepare] '" + Step + "'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref));
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public List<ArrayList> SP_SFPriceList_Product(string Step, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "EXEC [SP_SFPriceList_Product] '" + Step + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        //public DataTable Export_SP_SFPriceList_Product(string Step ,string site_ref)
        //{
        //    string sql = "EXEC [SP_SFPriceList_Product] '" + Step + "'";

        //    DataTable DT = new DataTable();
        //    SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref));
        //    SqlCommand cmd = new SqlCommand(sql, connection);

        //    try
        //    {
        //        connection.Open();
        //        cmd.Connection = connection;
        //        cmd.CommandType = CommandType.Text;
        //        cmd.CommandText = sql;
        //        cmd.CommandTimeout = 0;
        //        DT.Load(cmd.ExecuteReader());
        //    }
        //    catch (SqlException ex)
        //    {
        //        connection.Close();
        //        cmd.Dispose();
        //        return DT;
        //    }
        //    connection.Close();
        //    cmd.Dispose();

        //    return DT;
        //}
        public List<ArrayList> SP_SFPriceList_Price_Book(string Step, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "EXEC [SP_SFPriceList_Price_Book] '" + Step + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        //public DataTable Export_SP_SFPriceList_Price_Book(string Step ,string site_ref)
        //{
        //    string sql = "EXEC [SP_SFPriceList_Price_Book] '" + Step + "'";

        //    DataTable DT = new DataTable();
        //    SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref));
        //    SqlCommand cmd = new SqlCommand(sql, connection);

        //    try
        //    {
        //        connection.Open();
        //        cmd.Connection = connection;
        //        cmd.CommandType = CommandType.Text;
        //        cmd.CommandText = sql;
        //        cmd.CommandTimeout = 0;
        //        DT.Load(cmd.ExecuteReader());
        //    }
        //    catch (SqlException ex)
        //    {
        //        connection.Close();
        //        cmd.Dispose();
        //        return DT;
        //    }
        //    connection.Close();
        //    cmd.Dispose();

        //    return DT;
        //}
        public List<ArrayList> TB_SFPriceList_Price_Book(string search,string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT [ID],[Price_Book_ID],[Price_Book_Name],[Description] FROM[dbo].[TB_SFPriceList_Price_Book]";
                if(search != "")
                {
                    sql += " WHERE [Price_Book_ID] like '" + search + "' OR [Price_Book_Name] like '" + search + "' OR [Description] like '" + search + "' ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Search_Product_Code_TB_SFPriceList_Product(string Product_Code, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT Distinct TOP(200) [Product_Code] FROM [dbo].[TB_SFPriceList_Product]";
                     sql += " WHERE 1=1  ";
                
                    if(Product_Code != "")
                    {
                        sql += " AND [Product_Code] = '"+ Product_Code + "'";
                    }
                    
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> Search_Product_ProductCatagory_TB_SFPriceList_Product(string ProductCatagory, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT Distinct TOP(200) [ProductCatagory] FROM [dbo].[TB_SFPriceList_Product]";
                     sql += " WHERE 1=1  ";
                
                    if(ProductCatagory != "")
                    {
                        sql += " AND [ProductCatagory] = '" + ProductCatagory + "'";
                    }
                    
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> TB_SFPriceList_Product(string Product_Code, string Product_Name, string Product_Characteristic, string ProductCatagory, string Status, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT TOP(200) [ID],[Product_ID],[Product_Code],[Product_Name],[Product_Characteristic],[ProductCatagory],[UM],[LeadTime],[Status] FROM [dbo].[TB_SFPriceList_Product]";
                     sql += " WHERE 1=1  ";
                
                    if(Product_Code != "")
                    {
                        sql += " AND [Product_Code] = '"+ Product_Code + "'";
                    }
                    if (Product_Name != "")
                    {
                        sql += " AND [Product_Name] = '" + Product_Name + "'";
                    }
                    if (Product_Characteristic != "")
                    {
                        sql += " AND [Product_Characteristic] = '" + Product_Characteristic + "'";
                    }
                    if (ProductCatagory != "")
                    {
                        sql += " AND [ProductCatagory] = '" + ProductCatagory + "'";
                    }
                    if (Status != "")
                    {
                        sql += " AND [Status] = '" + Status + "'";
                    }
                    
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetTable_Import_Fillter(string textcode_whereIn,string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT [ID],[Product_ID],[Product_Code],[Product_Name],[Product_Characteristic],[ProductCatagory],[UM],[LeadTime],[Status] FROM [dbo].[TB_SFPriceList_Product] ";
                sql += " Where Product_ID IN (" + textcode_whereIn + ") ";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_SFPriceList_Price_Book_Entry_Browse(string Price_Book_ID,string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT [Price_Book_ID],[Currency] FROM [dbo].[VW_SFPriceList_Price_Book_Entry_Browse] ";
                sql+= " WHERE [Price_Book_ID] = '" + Price_Book_ID + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_SFPriceList_Price_Book_Entry(string Price_Book_ID, string Currency, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT [Entry_ID],[Price_Book_Entry_ID],[Price_Book_ID],[Price],[Currency],[Product_ID],[Product_ID_SF],[Product_Code],[Product_Name],[ProductCatagory],[Product_Characteristic],[LeadTime],[UM],[Status]  FROM [dbo].[VW_SFPriceList_Price_Book_Entry]  ";
                sql+= " WHERE 1=1  AND [Price_Book_ID] = '" + Price_Book_ID + "'";
                if (Currency != "")
                {
                    sql += " AND [Currency] = '" + Currency + "'";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetTable_Add_Fillter(string Product_Code, string Product_Name, string Product_Characteristic, string ProductCatagory, string Status, string site_ref)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT [ID],[Product_ID],[Product_Code],[Product_Name],[Product_Characteristic],[ProductCatagory],[UM],[LeadTime],[Status] FROM [dbo].[TB_SFPriceList_Product]";
                sql += " WHERE 1=1  ";

                if (Product_Code != "")
                {
                    sql += " AND [Product_Code] = '" + Product_Code + "'";
                }
                if (Product_Name != "")
                {
                    sql += " AND [Product_Name] = '" + Product_Name + "'";
                }
                if (Product_Characteristic != "")
                {
                    sql += " AND [Product_Characteristic] = '" + Product_Characteristic + "'";
                }
                if (ProductCatagory != "")
                {
                    sql += " AND [ProductCatagory] = '" + ProductCatagory + "'";
                }
                if (Status != "")
                {
                    sql += " AND [Status] = '" + Status + "'";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public void Insert_TB_SFPriceList_Price_Book_Entry_Prepare(string Price_Book_Entry_ID, string Price_Book_ID, string Product_ID, string Price, string Currency, string site_ref)
        {

            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "INSERT INTO[dbo].[TB_SFPriceList_Price_Book_Entry_Prepare]([Price_Book_Entry_ID],[Price_Book_ID],[Product_ID],[Price],[Currency]) " +
                             "VALUES('"+ Price_Book_Entry_ID + "', '"+ Price_Book_ID + "', '"+ Product_ID + "', '"+ Price + "','"+ Currency + "')";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

        }
        public void SP_SFPriceList_Price_Book_Entry(string Action, string site_ref)
        {
            using (SqlConnection conn = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "EXEC [SP_SFPriceList_Price_Book_Entry] '" + Action + "'";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }

    }

    }
    
