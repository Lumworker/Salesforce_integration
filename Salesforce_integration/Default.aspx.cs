using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.UI;

namespace Salesforce_integration
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<ArrayList> VW_Salesforce_site_ref(string Page)
        {
            return new ClassBrowseNew().VW_Salesforce_site_ref(Page);
        }
        [WebMethod]
        public static List<ArrayList> CheckVW_Salesforce_site_ref(string Page,string site_ref)
        {
            return new ClassBrowseNew().CheckVW_Salesforce_site_ref(Page, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> SP_SalesForce_SFLaborHr_SRO(string Step,string site_ref)
        {
            return new ClassBrowseNew().SP_SalesForce_SFLaborHr_SRO(Step, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> SP_SalesForce_SFTiemSheet_Misc(string Step,string site_ref)
        {
            return new ClassBrowseNew().SP_SalesForce_SFTiemSheet_Misc(Step, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> SP_SFiCash_Transaction_All(string Step, string site_ref)
        {
            return new ClassBrowseNew().SP_SFiCash_Transaction_All(Step, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> SP_SFTiemSheet_ADV_Prepare(string Step, string site_ref)
        {
            return new ClassBrowseNew().SP_SFTiemSheet_ADV_Prepare(Step, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> SP_SFTiemSheet_ACT_Prepare(string Step, string site_ref)
        {
            return new ClassBrowseNew().SP_SFTiemSheet_ACT_Prepare(Step, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> SP_SFPriceList_Product(string Step, string site_ref)
        {
            return new ClassBrowseNew().SP_SFPriceList_Product(Step, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> SP_SFPriceList_Price_Book(string Step, string site_ref)
        {
            return new ClassBrowseNew().SP_SFPriceList_Price_Book(Step, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> TB_SFPriceList_Price_Book(string search, string site_ref)
        {
            return new ClassBrowseNew().TB_SFPriceList_Price_Book(search, site_ref);
        }
        //[WebMethod]
        //public static List<ArrayList> TB_SFPriceList_Product(string Product_Code, string Product_Name, string Product_Characteristic, string ProductCatagory, string Status, string site_ref)
        //{
        //    return new ClassBrowseNew().TB_SFPriceList_Product( Product_Code,  Product_Name,  Product_Characteristic,  ProductCatagory,  Status,  site_ref);
        //}
        [WebMethod]
        public static List<ArrayList> Search_Product_Code_TB_SFPriceList_Product(string Product_Code, string site_ref)
        {
            return new ClassBrowseNew().Search_Product_Code_TB_SFPriceList_Product( Product_Code,  site_ref);
        }
        [WebMethod]
        public static List<ArrayList> Search_Product_ProductCatagory_TB_SFPriceList_Product(string ProductCatagory, string site_ref)
        {
            return new ClassBrowseNew().Search_Product_ProductCatagory_TB_SFPriceList_Product(ProductCatagory,  site_ref);
        }
        [WebMethod]
        public static List<ArrayList> GetTable_Import_Fillter(string textcode_whereIn, string site_ref)
        {
            return new ClassBrowseNew().GetTable_Import_Fillter(textcode_whereIn, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> GetTable_Add_Fillter(string Product_Code, string Product_Name, string Product_Characteristic, string ProductCatagory, string Status, string site_ref)
        {
            return new ClassBrowseNew().GetTable_Add_Fillter(Product_Code, Product_Name, Product_Characteristic, ProductCatagory, Status, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> VW_SFPriceList_Price_Book_Entry_Browse(string Price_Book_ID, string site_ref)
        {
            return new ClassBrowseNew().VW_SFPriceList_Price_Book_Entry_Browse(Price_Book_ID, site_ref);
        }
        [WebMethod]
        public static List<ArrayList> VW_SFPriceList_Price_Book_Entry(string Price_Book_ID, string Currency, string site_ref)
        {
            return new ClassBrowseNew().VW_SFPriceList_Price_Book_Entry(Price_Book_ID, Currency, site_ref);
        }
        [WebMethod]
        public static void Insert_TB_SFPriceList_Price_Book_Entry_Prepare(string Price_Book_Entry_ID, string Price_Book_ID, string Product_ID, string Price, string Currency, string site_ref)
        {
            new ClassBrowseNew().Insert_TB_SFPriceList_Price_Book_Entry_Prepare( Price_Book_Entry_ID,  Price_Book_ID,  Product_ID,  Price,  Currency,  site_ref);
        }
        
        [WebMethod]
        public static void SP_SFPriceList_Price_Book_Entry(string Action, string site_ref)
        {
            new ClassBrowseNew().SP_SFPriceList_Price_Book_Entry(Action, site_ref);
        }

    }
}