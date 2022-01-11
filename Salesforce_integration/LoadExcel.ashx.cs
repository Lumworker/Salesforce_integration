using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;

namespace Salesforce_integration
{
    /// <summary>
    /// Summary description for LoadExcel
    /// </summary>
    public class LoadExcel : IHttpHandler
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

        public static String con_CRP2_PKMS = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=CRP2_PKMS_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";


        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            try
            {
                //string filePath = "C:\\Users\\chonprakun.pa\\Desktop\\Service Report\\Temp";
                //for Test

                string webRootPath = context.Server.MapPath("~");
                string filePath = Path.GetFullPath(Path.Combine(webRootPath, "./Temp"));
                //1) Install Microsoft.ACE.OLEDB.12.0 in server 
                //2) Enable 32 bits Application  in  Advanced Setting IIS 
                //for Server

                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }
                string table = "";
                string connDB = "";

                string type = context.Request.Form["type"];
                string site_ref = context.Request.Form["site_ref"];

                //Database 
                if (site_ref == "ERP_PKS")
                {
                    connDB = con_PKS;
                }

                else if (site_ref == "ERP_PKM")
                {
                    connDB = con_PKM;
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

                else if (site_ref == "CRP2_PKMS")
                {
                    connDB = con_CRP2_PKMS;
                }

                //Table
                if (type == "Labor_Cost")
                {
                    table = "TB_SFLaborHr_SRO_Prepare";
                }
                else if (type == "Plan")
                {
                    table = "TB_SFiCash_Plan_Prepare";
                }
                else if (type == "Actual")
                {
                    table = "TB_SFiCash_Actual_Prepare";
                }
                else if (type == "Time_Sheet_Adv")
                {
                    table = "TB_SFTiemSheet_ADV_Prepare";
                }
                else if (type == "Time_Sheet_Actual")
                {
                    table = "TB_SFTiemSheet_ACT_Prepare";
                }
                else if (type == "Price_List_Product")
                {
                    table = "TB_SFPriceList_Product_Prepare";
                }
                else if (type == "Price_List_Price_Book")
                {
                    table = "TB_SFPriceList_Price_Book_Prepare";
                }

                HttpPostedFile file = context.Request.Files["file"];
                string fileName = file.FileName;
                string str_excel = filePath + "\\" + fileName;

                file.SaveAs(str_excel);
                //string excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/Zach/Documents/test1.xls;Extended Properties=Excel 12.0,HDR=Yes;IMEX=1";
                string excelConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + str_excel + ";Extended Properties='Excel 8.0;HDR={1}'";

                // Create Connection to Excel Workbook


                using (OleDbConnection connection = new OleDbConnection(excelConnectionString))
                {

                    connection.Open(); //HERE IS WHERE THE ERROR IS

                    DataTable dtSchema = connection.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
                    string Sheet1 = dtSchema.Rows[0].Field<string>("TABLE_NAME");
                    //Get Sheet1 name
                    OleDbCommand command = new OleDbCommand("Select * FROM [" + Sheet1 + "]", connection);


                    // Create DbDataReader to Data Worksheet
                    using (DbDataReader dr = command.ExecuteReader())
                    {
                        // SQL Server Connection String-----------

                        //string sqlConnectionString = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_PKS_App;Persist Security Info=True;User ID=dv;Password=@Wanlapa; Connect Timeout=0; pooling=true; Max Pool Size=50000";
                        // Bulk Copy to SQL Server
                        using (SqlBulkCopy bulkCopy = new SqlBulkCopy(connDB))
                        {
                            if (type == "Labor_Cost")
                            {
                                bulkCopy.DestinationTableName = table;
                                // Set up the column mappings by name.
                                SqlBulkCopyColumnMapping WorkOrder_Number =
                                    new SqlBulkCopyColumnMapping("Work Order Number", "[WorkOrder_Number]");
                                bulkCopy.ColumnMappings.Add(WorkOrder_Number);

                                //แก้ช่อง Job No. SRO/Project No. เป็น Job No or Sro No
                                SqlBulkCopyColumnMapping Job_No =
                                new SqlBulkCopyColumnMapping("Job No or Sro No", "[Job_No]");
                                bulkCopy.ColumnMappings.Add(Job_No);

                                SqlBulkCopyColumnMapping TimeSheet =
                                new SqlBulkCopyColumnMapping("Name", "[TimeSheet]");
                                bulkCopy.ColumnMappings.Add(TimeSheet);

                                SqlBulkCopyColumnMapping TimeSheet_StartDate =
                                new SqlBulkCopyColumnMapping("Time Sheet Start Date", "[TimeSheet_StartDate]");
                                bulkCopy.ColumnMappings.Add(TimeSheet_StartDate);

                                SqlBulkCopyColumnMapping Emp_Num =
                                new SqlBulkCopyColumnMapping("Emp Num", "[Emp_Num]");
                                bulkCopy.ColumnMappings.Add(Emp_Num);

                                SqlBulkCopyColumnMapping Employee_Name =
                                new SqlBulkCopyColumnMapping("Employee: Employee Name", "[Employee_Name]");
                                bulkCopy.ColumnMappings.Add(Employee_Name);

                                SqlBulkCopyColumnMapping Level =
                                new SqlBulkCopyColumnMapping("Level", "[Level]");
                                bulkCopy.ColumnMappings.Add(Level);

                                SqlBulkCopyColumnMapping Actual_StartDate_Time =
                                new SqlBulkCopyColumnMapping("Actual Start Date/Time", "[Actual_StartDate_Time]");
                                bulkCopy.ColumnMappings.Add(Actual_StartDate_Time);

                                SqlBulkCopyColumnMapping Actual_EndDate_Time =
                                new SqlBulkCopyColumnMapping("Actual End Date/Time", "[Actual_EndDate_Time]");
                                bulkCopy.ColumnMappings.Add(Actual_EndDate_Time);

                                SqlBulkCopyColumnMapping Sum_ActualTime =
                                new SqlBulkCopyColumnMapping("ระบบคำนวณชั่วโมงทำงานจริง", "[Sum_ActualTime]");
                                bulkCopy.ColumnMappings.Add(Sum_ActualTime);

                                SqlBulkCopyColumnMapping OTStart_Period1 =
                                new SqlBulkCopyColumnMapping("Actual OT Start (Period 1)", "[OTStart_Period1]");
                                bulkCopy.ColumnMappings.Add(OTStart_Period1);

                                SqlBulkCopyColumnMapping OTEnd_Period1 =
                                new SqlBulkCopyColumnMapping("Actual OT End (Period 1)", "[OTEnd_Period1]");
                                bulkCopy.ColumnMappings.Add(OTEnd_Period1);

                                SqlBulkCopyColumnMapping OT_Period1 =
                                new SqlBulkCopyColumnMapping("ระบบคำนวณชั่วโมง OT (Period 1) จริง", "[OT_Period1]");
                                bulkCopy.ColumnMappings.Add(OT_Period1);

                                SqlBulkCopyColumnMapping OTStart_Period2 =
                                new SqlBulkCopyColumnMapping("Actual OT Start (Period 2)", "[OTStart_Period2]");
                                bulkCopy.ColumnMappings.Add(OTStart_Period2);

                                SqlBulkCopyColumnMapping OTEnd_Period2 =
                                new SqlBulkCopyColumnMapping("Actual OT End (Period 2)", "[OTEnd_Period2]");
                                bulkCopy.ColumnMappings.Add(OTEnd_Period2);

                                SqlBulkCopyColumnMapping OT_Period2 =
                                new SqlBulkCopyColumnMapping("ระบบคำนวณชั่วโมง OT (Period 2) จริง", "[OT_Period2]");
                                bulkCopy.ColumnMappings.Add(OT_Period2);

                                SqlBulkCopyColumnMapping OTStart_Period3 =
                                new SqlBulkCopyColumnMapping("Actual OT Start (Period 3)", "[OTStart_Period3]");
                                bulkCopy.ColumnMappings.Add(OTStart_Period3);

                                SqlBulkCopyColumnMapping OTEnd_Period3 =
                                new SqlBulkCopyColumnMapping("Actual OT End (Period 3)", "[OTEnd_Period3]");
                                bulkCopy.ColumnMappings.Add(OTEnd_Period3);

                                SqlBulkCopyColumnMapping OT_Period3 =
                                new SqlBulkCopyColumnMapping("ระบบคำนวณชั่วโมง OT (Period 3) จริง", "[OT_Period3]");
                                bulkCopy.ColumnMappings.Add(OT_Period3);

                                SqlBulkCopyColumnMapping OTStart_ForDriver =
                                new SqlBulkCopyColumnMapping("Actual OT Start (For Driver)", "[OTStart_ForDriver]");
                                bulkCopy.ColumnMappings.Add(OTStart_ForDriver);

                                SqlBulkCopyColumnMapping OTEnd_ForDriver =
                                new SqlBulkCopyColumnMapping("Actual OT End (For Driver)", "[OTEnd_ForDriver]");
                                bulkCopy.ColumnMappings.Add(OTEnd_ForDriver);

                                SqlBulkCopyColumnMapping OT_ForDriver =
                                new SqlBulkCopyColumnMapping("ระบบคำนวณชั่วโมง OT (For Driver) จริง", "[OT_ForDriver]");
                                bulkCopy.ColumnMappings.Add(OT_ForDriver);

                                bulkCopy.WriteToServer(dr);
                            }
                            else if (type == "Plan")
                            {
                                bulkCopy.DestinationTableName = table;
                                SqlBulkCopyColumnMapping CallPlan_ID =
                                    new SqlBulkCopyColumnMapping("NAME", "[CallPlan_ID]");
                                bulkCopy.ColumnMappings.Add(CallPlan_ID);
                                
                                SqlBulkCopyColumnMapping Approval_Status =
                                new SqlBulkCopyColumnMapping("APPROVALSTATUS__C", "[Approval_Status]");
                                bulkCopy.ColumnMappings.Add(Approval_Status);

                                SqlBulkCopyColumnMapping Record_Type =
                                new SqlBulkCopyColumnMapping("RECORDTYPEID", "[Record_Type]");
                                bulkCopy.ColumnMappings.Add(Record_Type);

                                SqlBulkCopyColumnMapping OwnerName =
                                new SqlBulkCopyColumnMapping("OWNERID", "[OwnerName]");
                                bulkCopy.ColumnMappings.Add(OwnerName);

                                SqlBulkCopyColumnMapping Accommodation =
                                new SqlBulkCopyColumnMapping("ACCOMMODATION__C", "[Accommodation]");
                                bulkCopy.ColumnMappings.Add(Accommodation);

                                SqlBulkCopyColumnMapping AccommodationType =
                                new SqlBulkCopyColumnMapping("ACCOMMODATIONTYPE__C", "[AccommodationType]");
                                bulkCopy.ColumnMappings.Add(AccommodationType);

                                SqlBulkCopyColumnMapping Allowance =
                                new SqlBulkCopyColumnMapping("ALLOWANCE__C", "[Allowance]");
                                bulkCopy.ColumnMappings.Add(Allowance);

                                SqlBulkCopyColumnMapping Province =
                                new SqlBulkCopyColumnMapping("PROVINCE__C", "[Province]");
                                bulkCopy.ColumnMappings.Add(Province);

                                SqlBulkCopyColumnMapping PlanEntertainCurrency =
                                new SqlBulkCopyColumnMapping("CURRENCYISOCODE", "[PlanEntertainCurrency]");
                                bulkCopy.ColumnMappings.Add(PlanEntertainCurrency);

                                SqlBulkCopyColumnMapping PlanEntertain =
                                new SqlBulkCopyColumnMapping("ENTERTAIN__C", "[PlanEntertain]");
                                bulkCopy.ColumnMappings.Add(PlanEntertain);

                                SqlBulkCopyColumnMapping visitdate =
                                new SqlBulkCopyColumnMapping("VISITDATE__C", "[visitdate]");
                                bulkCopy.ColumnMappings.Add(visitdate);

                                SqlBulkCopyColumnMapping AllowanceType =
                                new SqlBulkCopyColumnMapping("ALLOWANCETYPE__C", "[AllowanceType]");
                                bulkCopy.ColumnMappings.Add(AllowanceType);
                                

                                bulkCopy.WriteToServer(dr);
                            }
                            else if (type == "Actual")
                            {
                                bulkCopy.DestinationTableName = table;
                                SqlBulkCopyColumnMapping CallPlan_ID =
                                    new SqlBulkCopyColumnMapping("NAME", "[CallPlan_ID]");
                                bulkCopy.ColumnMappings.Add(CallPlan_ID);
                                
                                SqlBulkCopyColumnMapping Approval_Status =
                                new SqlBulkCopyColumnMapping("APPROVALSTATUS__C", "[Approval_Status]");
                                bulkCopy.ColumnMappings.Add(Approval_Status);

                                SqlBulkCopyColumnMapping Record_Type =
                                new SqlBulkCopyColumnMapping("RECORDTYPEID", "[Record_Type]");
                                bulkCopy.ColumnMappings.Add(Record_Type);

                                SqlBulkCopyColumnMapping OwnerName =
                                new SqlBulkCopyColumnMapping("OWNERID", "[OwnerName]");
                                bulkCopy.ColumnMappings.Add(OwnerName);

                                SqlBulkCopyColumnMapping Accommodation =
                                new SqlBulkCopyColumnMapping("ACTUALACCOMMODATION__C", "[Accommodation]");
                                bulkCopy.ColumnMappings.Add(Accommodation);

                                SqlBulkCopyColumnMapping AccommodationType =
                                new SqlBulkCopyColumnMapping("ACTUALACCOMMODATIONTYPE__C", "[AccommodationType]");
                                bulkCopy.ColumnMappings.Add(AccommodationType);

                                SqlBulkCopyColumnMapping Allowance =
                                new SqlBulkCopyColumnMapping("ACTUALALLOWANCE__C", "[Allowance]");
                                bulkCopy.ColumnMappings.Add(Allowance);

                                SqlBulkCopyColumnMapping Province =
                                new SqlBulkCopyColumnMapping("PROVINCE__C", "[Province]");
                                bulkCopy.ColumnMappings.Add(Province);

                                SqlBulkCopyColumnMapping EntertainCurrency =
                                new SqlBulkCopyColumnMapping("CURRENCYISOCODE", "[EntertainCurrency]");
                                bulkCopy.ColumnMappings.Add(EntertainCurrency);

                                SqlBulkCopyColumnMapping Entertain =
                                new SqlBulkCopyColumnMapping("ACTUALENTERTAIN__C", "[Entertain]");
                                bulkCopy.ColumnMappings.Add(Entertain);

                                SqlBulkCopyColumnMapping Expressway =
                                new SqlBulkCopyColumnMapping("EXPRESSWAY__C", "[Expressway]");
                                bulkCopy.ColumnMappings.Add(Expressway);

                                SqlBulkCopyColumnMapping TotalDistance =
                                new SqlBulkCopyColumnMapping("TOTALDISTANCE__C", "[TotalDistance]");
                                bulkCopy.ColumnMappings.Add(TotalDistance);

                                SqlBulkCopyColumnMapping Travel =
                                new SqlBulkCopyColumnMapping("TRAVEL__C", "[Travel]");
                                bulkCopy.ColumnMappings.Add(Travel);

                                SqlBulkCopyColumnMapping visitdate =
                                new SqlBulkCopyColumnMapping("ACTUALDATE__C", "[visitdate]");
                                bulkCopy.ColumnMappings.Add(visitdate);

                                SqlBulkCopyColumnMapping AllowanceType =
                                new SqlBulkCopyColumnMapping("ACTUALALLOWANCETYPE__C", "[AllowanceType]");
                                bulkCopy.ColumnMappings.Add(AllowanceType);
                                

                                bulkCopy.WriteToServer(dr);
                            }
                            else if (type == "Time_Sheet_Adv")
                            {
                                bulkCopy.DestinationTableName = table;
                                SqlBulkCopyColumnMapping Job_No =
                                    new SqlBulkCopyColumnMapping("Job No or Sro No", "[Job_No]");
                                bulkCopy.ColumnMappings.Add(Job_No);

                                SqlBulkCopyColumnMapping TimeSheet_StartDate =
                                new SqlBulkCopyColumnMapping("Time Sheet Start Date", "[TimeSheet_StartDate]");
                                bulkCopy.ColumnMappings.Add(TimeSheet_StartDate);

                                SqlBulkCopyColumnMapping TimeSheet =
                                new SqlBulkCopyColumnMapping("Name", "[TimeSheet]");
                                bulkCopy.ColumnMappings.Add(TimeSheet);

                                SqlBulkCopyColumnMapping Emp_Num =
                                new SqlBulkCopyColumnMapping("Emp Num", "[Emp_Num]");
                                bulkCopy.ColumnMappings.Add(Emp_Num);

                                SqlBulkCopyColumnMapping Employee_Name =
                                new SqlBulkCopyColumnMapping("Employee: Employee Name", "[Employee_Name]");
                                bulkCopy.ColumnMappings.Add(Employee_Name);

                                SqlBulkCopyColumnMapping Accommodation =
                                new SqlBulkCopyColumnMapping("Accommodation", "[Accommodation]");
                                bulkCopy.ColumnMappings.Add(Accommodation);

                                SqlBulkCopyColumnMapping Accommodation_Type =
                                new SqlBulkCopyColumnMapping("Plan Acc Cal", "[Accommodation_Type]");
                                bulkCopy.ColumnMappings.Add(Accommodation_Type);

                                SqlBulkCopyColumnMapping Plan_Accommodation_Cost =
                                new SqlBulkCopyColumnMapping("Plan Acc Cost Cal", "[Plan_Accommodation_Cost]");
                                bulkCopy.ColumnMappings.Add(Plan_Accommodation_Cost);

                                SqlBulkCopyColumnMapping RecordType_Name =
                                new SqlBulkCopyColumnMapping("Record Type Name", "[RecordType_Name]");
                                bulkCopy.ColumnMappings.Add(RecordType_Name);

                                bulkCopy.WriteToServer(dr);
                            }
                            else if (type == "Time_Sheet_Actual")
                            {
                                bulkCopy.DestinationTableName = table;
                                SqlBulkCopyColumnMapping Job_No =
                                    new SqlBulkCopyColumnMapping("Job No or Sro No", "[Job_No]");
                                bulkCopy.ColumnMappings.Add(Job_No);

                                SqlBulkCopyColumnMapping TimeSheet_StartDate =
                                new SqlBulkCopyColumnMapping("Time Sheet Start Date", "[TimeSheet_StartDate]");
                                bulkCopy.ColumnMappings.Add(TimeSheet_StartDate);

                                SqlBulkCopyColumnMapping TimeSheet =
                                new SqlBulkCopyColumnMapping("Name", "[TimeSheet]");
                                bulkCopy.ColumnMappings.Add(TimeSheet);

                                SqlBulkCopyColumnMapping Emp_Num =
                                new SqlBulkCopyColumnMapping("Emp Num", "[Emp_Num]");
                                bulkCopy.ColumnMappings.Add(Emp_Num);

                                SqlBulkCopyColumnMapping Employee_Name =
                                new SqlBulkCopyColumnMapping("Employee: Employee Name", "[Employee_Name]");
                                bulkCopy.ColumnMappings.Add(Employee_Name);

                                SqlBulkCopyColumnMapping Actual_Accommodation =
                                new SqlBulkCopyColumnMapping("Actual Accommodation", "[Actual_Accommodation]");
                                bulkCopy.ColumnMappings.Add(Actual_Accommodation);

                                SqlBulkCopyColumnMapping Actual_Accommodation_Type =
                                new SqlBulkCopyColumnMapping("Actual Acc Cal", "[Actual_Accommodation_Type]");
                                bulkCopy.ColumnMappings.Add(Actual_Accommodation_Type);

                                SqlBulkCopyColumnMapping Actual_Accommodation_Cost =
                                new SqlBulkCopyColumnMapping("Actual Acc Cost Cal", "[Actual_Accommodation_Cost]");
                                bulkCopy.ColumnMappings.Add(Actual_Accommodation_Cost);

                                SqlBulkCopyColumnMapping Actual_Allowance =
                                new SqlBulkCopyColumnMapping("Actual Allowance", "[Actual_Allowance]");
                                bulkCopy.ColumnMappings.Add(Actual_Allowance);

                                SqlBulkCopyColumnMapping Actual_Allowance_Type =
                                new SqlBulkCopyColumnMapping("Actual Allowance Type", "[Actual_Allowance_Type]");
                                bulkCopy.ColumnMappings.Add(Actual_Allowance_Type);

                                SqlBulkCopyColumnMapping Actual_Allowance_Cost =
                                new SqlBulkCopyColumnMapping("Actual Allowance Cost", "[Actual_Allowance_Cost]");
                                bulkCopy.ColumnMappings.Add(Actual_Allowance_Cost);

                                SqlBulkCopyColumnMapping RecordType_Name =
                                new SqlBulkCopyColumnMapping("Record Type Name", "[RecordType_Name]");
                                bulkCopy.ColumnMappings.Add(RecordType_Name);

                                bulkCopy.WriteToServer(dr);
                            }
                            else if (type == "Price_List_Product")
                            {
                                if (site_ref == "ERP_SPN")
                                {
                                    bulkCopy.DestinationTableName = table;
                                    SqlBulkCopyColumnMapping Product_ID =
                                        new SqlBulkCopyColumnMapping("ID", "[Product_ID]");
                                    bulkCopy.ColumnMappings.Add(Product_ID);
                                    
                                    SqlBulkCopyColumnMapping Product_Code =
                                        new SqlBulkCopyColumnMapping("PRODUCTCODE", "[Product_Code]");
                                    bulkCopy.ColumnMappings.Add(Product_Code);
                                    
                                    SqlBulkCopyColumnMapping Product_Name =
                                        new SqlBulkCopyColumnMapping("NAME", "[Product_Name]");
                                    bulkCopy.ColumnMappings.Add(Product_Name);
                                    
                                    SqlBulkCopyColumnMapping Product_Characteristic =
                                        new SqlBulkCopyColumnMapping("PRODUCTCHARACTERISTIC__C", "[Product_Characteristic]");
                                    bulkCopy.ColumnMappings.Add(Product_Characteristic);
                                    
                                    SqlBulkCopyColumnMapping ProductCatagory =
                                        new SqlBulkCopyColumnMapping("PRODUCTCATEGORY__C", "[ProductCatagory]");
                                    bulkCopy.ColumnMappings.Add(ProductCatagory);
                                    
                                    SqlBulkCopyColumnMapping UM =
                                        new SqlBulkCopyColumnMapping("UNITOFMEASUREMENT__C", "[UM]");
                                    bulkCopy.ColumnMappings.Add(UM);
                                    
                                    SqlBulkCopyColumnMapping LeadTime =
                                        new SqlBulkCopyColumnMapping("LEADTIME__C", "[LeadTime]");
                                    bulkCopy.ColumnMappings.Add(LeadTime);
                                    
                                    SqlBulkCopyColumnMapping Status =
                                        new SqlBulkCopyColumnMapping("ISACTIVE", "[Status]");
                                    bulkCopy.ColumnMappings.Add(Status);

                                    bulkCopy.WriteToServer(dr);
                                }

                              
                            }
                            else if (type == "Price_List_Price_Book")
                            {
                                if (site_ref == "ERP_SPN")
                                {
                                    bulkCopy.DestinationTableName = table;
                                SqlBulkCopyColumnMapping Price_Book_ID =
                                    new SqlBulkCopyColumnMapping("ID", "[Price_Book_ID]");
                                bulkCopy.ColumnMappings.Add(Price_Book_ID);

                                SqlBulkCopyColumnMapping Price_Book_Name =
                                    new SqlBulkCopyColumnMapping("NAME", "[Price_Book_Name]");
                                bulkCopy.ColumnMappings.Add(Price_Book_Name);

                                SqlBulkCopyColumnMapping Description =
                                    new SqlBulkCopyColumnMapping("DESCRIPTION", "[Description]");
                                bulkCopy.ColumnMappings.Add(Description);

                                bulkCopy.WriteToServer(dr);
                                }
                            }

                        }
                    }
                }
                //UpdateRefID();
                if (System.IO.File.Exists(str_excel))
                {
                    try
                    {
                        System.IO.File.Delete(str_excel);
                    }
                    catch (IOException ex)
                    {
                        context.Response.Write(ex);
                    }
                }

                context.Response.Write(str_excel);
            }
            catch (Exception ex)
            {
                //context.Response.Write(ex.ToString());
                context.Response.Write("Error");
            }


        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}