<%@ Page Title="Price List Price Book Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Price_List_Price_Book_Entry.aspx.cs" Inherits="Salesforce_integration.Price_List_Price_Book_Entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .max-wide {
            max-width: 100%;
        }

        .min-wide {
            min-width: 100%;
        }

        .datepicker {
            background: #333;
            border: 1px solid #555;
            color: #EEE;
        }

        .nav-tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        .ui-datepicker {
            z-index: 2 !important;
        }

        .btn-margin-left {
            margin-left: 2px;
        }

        .red {
            color: red;
        }

        .img-thumbnail {
            display: inline-block;
            max-width: 100%;
            padding: 4px;
            line-height: 1.42857143;
            border: 1px solid #ddd;
            border-radius: 4px;
            -webkit-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out;
        }

        input[type=checkbox] {
            /* Double-sized Checkboxes */
            -ms-transform: scale(2); /* IE */
            -moz-transform: scale(2); /* FF */
            -webkit-transform: scale(2); /* Safari and Chrome */
            -o-transform: scale(2); /* Opera */
            transform: scale(2);
            padding: 10px;
            margin-right: 1em;
            margin-bottom: 1em;
        }

        input[type=radio] {
            /* Double-sized Checkboxes */
            -ms-transform: scale(2); /* IE */
            -moz-transform: scale(2); /* FF */
            -webkit-transform: scale(2); /* Safari and Chrome */
            -o-transform: scale(2); /* Opera */
            transform: scale(2);
            padding: 10px;
            margin-right: 1em;
            margin-bottom: 1em;
        }

        /* Might want to wrap a span around your checkbox text */
        .checkboxtext {
            /* Checkbox text */
            font-size: 110%;
            display: inline;
        }

        .sorting_1 {
            text-align: center;
        }

        .center {
            text-align: center;
        }

        .att-margin {
            margin-top: 2.5rem;
        }


        .btn-Excel-dowlaod {
            background-color: #1f7244;
            color: ghostwhite;
            border: none;
        }

            .btn-Excel-dowlaod:hover {
                background-color: #006400;
                color: ghostwhite;
            }
    </style>
    <div style="overflow: hidden; width: 0; height: 0;">
        <asp:TextBox runat="server" ID="snssite_ref" />
    </div>

    <div class="page-header">
        <div class="row">
            <h2>Price List Price Book Entry</h2>
        </div>
    </div>
    <!----End Header---->
    <div class="panel-group">
        <div class="panel-body">
            <div class="row">
                <div id="smartwizard">
                    <ul>
                        <li class="check" data-step="Step1"><a href="#step-1">Step 1</a></li>
                        <li class="check" data-step="Step2"><a href="#step-2">Step 2</a></li>
                        <li class="check" data-step="Step3"><a href="#step-3">Step 3</a></li>
                        <li class="check" data-step="Step4"><a href="#step-4">Step 4</a></li>
                        <li class="check" data-step="Step5"><a href="#step-5">Step 5</a></li>
                    </ul>

                    <div>
                        <%--======Step 1======--%>
                        <div id="step-1" class="">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <div class="panel-group">
                                            <div class="panel panel-default" style="margin-top: 1em;">
                                                <div class="panel-heading">
                                                    <h4>Step 1</h4>
                                                </div>
                                                <div class="panel-body">

                                                    <div class="row" style="margin-top: 2rem;">

                                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label class="col-md-2 col-xs-12" runat="server" Font-Bold="True" Text="ID (Hidden)"></asp:Label>
                                                            <div class="col-md-6">
                                                                <input id="Step1_text_Price_Book_ID" type="text" class="form-control max-wide" placeholder="ID (Hidden)" disabled>
                                                            </div>
                                                        </div>


                                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label class="col-md-2 col-xs-12" runat="server" Font-Bold="True" Text="Price Book ID"></asp:Label>
                                                            <div class="col-md-10 col-xs-12">
                                                                <div class="input-group">
                                                                    <input id="Step1_text_Price_Book_ID_show" type="text" placeholder="Price Book ID" class="form-control max-wide" disabled>
                                                                    <div class="input-group-btn">
                                                                        <button class="btn btn-default Browse_modal" data-type="Browse_Price_Book" type="button">
                                                                            <i class="glyphicon glyphicon-search"></i>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label class="col-md-2 col-xs-12" runat="server" Font-Bold="True" Text="Price Book Name"></asp:Label>
                                                            <div class="col-md-10 col-xs-12">
                                                                <input id="Step1_text_Price_Book_Name" type="text" placeholder="Price Book Name" class="form-control max-wide" disabled>
                                                            </div>
                                                        </div>


                                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label class="col-md-2 col-xs-12" runat="server" Font-Bold="True" Text="Description"></asp:Label>
                                                            <div class="col-md-10 col-xs-12">
                                                                <textarea id="Step1_text_Description" rows="3" cols="10" class="form-control max-wide" placeholder="Description" disabled></textarea>
                                                            </div>
                                                        </div>

                                                    </div>



                                                    <div style="text-align: right; margin: 1rem;">
                                                        <button id="nextPage1" class="btn btn-warning " type="button" data-toggle="modal" style="text-align: left; margin-top: 2rem; display: none;">Next</button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div id="step-2" class="">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <div class="panel-group">
                                            <div class="panel panel-default" style="margin-top: 1em;">
                                                <div class="panel-heading">
                                                    <h4>Step 2</h4>
                                                </div>
                                                <div class="panel-body">

                                                    <div class="row" style="margin-bottom: 2rem; margin-top: 2rem;">
                                                        <div class="col-md-12">

                                                            <div class="col-md-12" style="margin-bottom: 2em;">
                                                                <h3 class="control-label">Price Book Entry Action </h3>
                                                            </div>

                                                            <div class="col-md-12 center" style="margin-bottom: 2rem;">
                                                                <div class="col-md-6 " style="margin-bottom: 2rem;">
                                                                    <button class="btn btn-block btn-success nextPage2" data-action="Insert" style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" type="button">Insert</button>
                                                                </div>
                                                                <div class="col-md-6 " style="margin-bottom: 2rem;">
                                                                    <button class="btn btn-block btn-warning nextPage2" data-action="Update" style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" type="button">Update</button>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2 " style="margin-bottom: 2rem;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--======Step 2======--%>
                        <div id="step-3" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Step 3</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">
                                            <h3><span id="Step3_text_Action"></span>PriceBook Entry (<span id="text_Currency"></span>)</h3>
                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <button class="btn btn-success" type="button" id="btnModalAdd">Add</button>
                                                    <button class="btn btn-warning" type="button" id="btnModalImport">Import</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="table_Maintain_PriceBook_Entry">
                                                        <thead>
                                                            <tr>
                                                                <th>Product code</th>
                                                                <th>Product Name</th>
                                                                <th>Product Characteristic</th>
                                                                <th>Product Catagory</th>
                                                                <th>Status</th>
                                                                <th>Price</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="Step3_Maintain_PriceBook_Entry">
                                                            <%--   <tr>
                                                                <td>MDB CAPA 2500KVA</td>
                                                                <td>ตู้เมนพร้อมคาปาซิเตอร์ รับหม้อแปลงขนาด 1000 KVA</td>
                                                                <td>ตู้เมนพร้อมคาปาซิเตอร์ รับหม้อแปลงขนาด 1000 KVA</td>
                                                                <td>Product</td>
                                                                <td>true</td>
                                                                <td>199,999</td>
                                                                <td class="center">
                                                                    <button class="btn btn-danger" type="button">Delete</button></td>
                                                            </tr>
                                                            <tr>
                                                                <td>PK-9 90A-PKAG191-25-ME</td>
                                                                <td>PATKOL PK-60AF (2019) - Complete set of  tube ice machine (38.1 mm, V1100CM+180HP, CDS, 380V/3Ph/50Hz, Ammonia) for Indonesia</td>
                                                                <td>Project</td>
                                                                <td></td>
                                                                <td>true</td>
                                                                <td>9,999</td>
                                                                <td class="center">
                                                                    <button class="btn btn-danger" type="button">Delete</button></td>
                                                            </tr>
                                                            <tr>
                                                                <td>01t5g000003vQFVAA2</td>
                                                                <td>สกรู SS 1/4" x 3/4"</td>
                                                                <td>สกรู SS 1/4" x 3/4"</td>
                                                                <td>Part</td>
                                                                <td>False</td>
                                                                <td>100,999</td>
                                                                <td class="center">
                                                                    <button class="btn btn-danger" type="button">Delete</button></td>
                                                            </tr>--%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div style="text-align: right; margin: 1rem;">
                                                <button id="nextPage3" class="btn btn-warning " type="button" data-toggle="modal" style="text-align: left; margin-top: 2rem;">Next</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--======Step 3======--%>
                        <div id="step-4" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Complete</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row" style="margin-bottom: 2rem; margin-top: 2rem;">
                                            <div class="col-md-12">

                                                <div class="col-md-12" style="margin-bottom: 2em;">
                                                    <h3 class="control-label">Export excel</h3>
                                                    <span class="control-label red" style="font-size: 13px; margin-left: 1em">*กรุณาดาวน์โหลดไฟล์เพื่อไป Step ถัดไป </span>
                                                </div>

                                                <div class="col-md-12 center" style="margin-bottom: 2rem;">
                                                    <div class="col-md-2 " style="margin-bottom: 2rem;">
                                                    </div>
                                                    <div class="col-md-8 " style="margin-bottom: 2rem;">
                                                        <button class="btn btn-block btn-Excel-dowlaod" id="btn_Download" style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" type="button">Export Excel</button>

                                                        <%--<asp:Button runat="server" class="btn btn-block btn-Excel-dowlaod"
                                                            ID="btnExport" OnClick="btnExport_Click" Text="Export" Style="display: none;"
                                                            UseSubmitBehavior="false" />--%>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 " style="margin-bottom: 2rem;">
                                                </div>


                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--======Step 4======--%>
                        <div id="step-5" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Complete</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3 class="control-label" style="text-align: center;">Complete</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--======Step 5======--%>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="ModalAdd" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="width: 80%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <%--<h4 class="modal-title">Add Product </h4>--%>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 38em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">Add Product</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-6 form-group">
                                                    <div class="col-md-3">
                                                        <label class="control-label" style="font-size: 13px">Product code : </label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <div class="input-group">
                                                            <input type="text" id="text_Product_Code" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-default Browse_modal" type="button" data-type="Browse_Product_code">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 form-group">
                                                    <div class="col-md-3">
                                                        <label class="control-label" style="font-size: 13px">Product Name : </label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input type="text" id="text_Product_Name" class="form-control max-wide" autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="col-md-6 form-group">
                                                    <div class="col-md-3">
                                                        <label class="control-label" style="font-size: 13px">Product Characteristic : </label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input type="text" id="text_Product_Characteristic" class="form-control max-wide" autocomplete="off">
                                                    </div>
                                                </div>

                                                <div class="col-md-6 form-group">
                                                    <div class="col-md-3">
                                                        <label class="control-label" style="font-size: 13px">Product Catagory : </label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <div class="input-group">
                                                            <input type="text" id="text_ProductCatagory" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-default Browse_modal" type="button" data-type="Browse_ProductCatagory">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="col-md-6 form-group">
                                                    <div class="col-md-3">
                                                        <label class="control-label" style="font-size: 13px">Status : </label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <select class="form-control max-wide" id="text_Status">
                                                            <option value="">=== กรุณาเลือก Stauts ===</option>
                                                            <option value="True">True</option>
                                                            <option value="False">False</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 form-group">
                                                <button type="button" class="btn btn-info" style="float: right" id="btnStep3_Add_search">Search</button>
                                            </div>

                                        </div>
                                        <%--End Search--%>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered" id="Table_Add_Fillter">
                                            <thead>
                                                <tr>
                                                    <th class="center" style="max-width: 15%">
                                                        <input class="form-check-input checkAll center" id="checkAll" type="checkbox" style="margin-left: 15px" value="">
                                                    </th>
                                                    <th>Product code</th>
                                                    <th>Product Name</th>
                                                    <th>Product Characteristic</th>
                                                    <th>Product Catagory</th>
                                                    <th>Status</th>
                                                    <th>Price</th>
                                                </tr>
                                            </thead>
                                            <tbody id="List_ADD_Fillter">
                                                <%--  <tr>
                                                    <td class="center">
                                                        <input class="form-check-input checkboxAssign" type="checkbox" style="margin-left: 15px" value=""></td>
                                                    <td>MDB CAPA 2500KVA</td>
                                                    <td>ตู้เมนพร้อมคาปาซิเตอร์ รับหม้อแปลงขนาด 1000 KVA</td>
                                                    <td>ตู้เมนพร้อมคาปาซิเตอร์ รับหม้อแปลงขนาด 1000 KVA</td>
                                                    <td>Product</td>
                                                    <td>true</td>
                                                    <td>
                                                        <input class="form-control " type="text" style="width: 100%"></td>
                                                </tr>
                                                <tr>
                                                    <td class="center">
                                                        <input class="form-check-input checkboxAssign" type="checkbox" style="margin-left: 15px" value=""></td>
                                                    <td>PK-9 90A-PKAG191-25-ME</td>
                                                    <td>PATKOL PK-60AF (2019) - Complete set of  tube ice machine (38.1 mm, V1100CM+180HP, CDS, 380V/3Ph/50Hz, Ammonia) for Indonesia</td>
                                                    <td>Project</td>
                                                    <td></td>
                                                    <td>true</td>
                                                    <td>
                                                        <input class="form-control " type="text" style="width: 100%"></td>
                                                </tr>
                                                <tr>
                                                    <td class="center">
                                                        <input class="form-check-input checkboxAssign" type="checkbox" style="margin-left: 15px" value=""></td>
                                                    <td>01t5g000003vQFVAA2</td>
                                                    <td>สกรู SS 1/4" x 3/4"</td>
                                                    <td>สกรู SS 1/4" x 3/4"</td>
                                                    <td>Part</td>
                                                    <td>False</td>
                                                    <td>
                                                        <input class="form-control " type="text" style="width: 100%"></td>
                                                </tr>--%>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <%--End CheckTable--%>
                        </div>
                    </div>

                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" style="float: right; margin-top: 0.5em;" id="btnAdd_Product">Add</button>
                </div>
            </div>
        </div>
    </div>
    <%--End Modal Add--%>


    <div class="modal fade" id="ModalImport" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="width: 80%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <%--<h4 class="modal-title">Add Product </h4>--%>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 38em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">Import Product</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row" style="margin-bottom: 2rem;">
                                                    <div class="col-md-12">
                                                        <div class="col-md-12" style="margin-bottom: 3px">
                                                            <label class="control-label " style="font-size: 13px">Step 1 Download Template for Import </label>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <button type="button" class="btn btn-lg btn-Excel-dowlaod" id="btnStep3_DowloadTemplate_show">Dowload template</button>
                                                            <asp:Button runat="server" ID="btnStep3_DowloadTemplate" OnClick="btnStep3_DowloadTemplate_Click" Style="display: none;" />
                                                            <%--<asp:Button runat="server" class="btn btn-block btn-Excel-dowlaod"
                                                            ID="btnExport" OnClick="btnExport_Click" Text="Export" Style="display: none;"
                                                            UseSubmitBehavior="false" />--%>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row" style="margin-bottom: 2rem;">
                                                    <div class="col-md-12">
                                                        <div class="col-md-12" style="margin-bottom: 3px">
                                                            <label class="control-label" style="font-size: 13px">Step 2 Import Template </label>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <input type="file" class="form-control max-wide " id="Step3_fileUpload">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <button type="button" class="btn btn-info" style="float: right" id="btnStep3_Import">Import</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <%--End Search--%>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered" id="Table_Import_Fillter">
                                            <thead>
                                                <tr>
                                                    <th>Product code</th>
                                                    <th>Product Name</th>
                                                    <th>Product Characteristic</th>
                                                    <th>Product Catagory</th>
                                                    <th>Status</th>
                                                    <th>Price</th>
                                                </tr>
                                            </thead>
                                            <tbody id="List_Import_Fillter">
                                                <%--  <tr>
                                                    <td>MDB CAPA 2500KVA</td>
                                                    <td>ตู้เมนพร้อมคาปาซิเตอร์ รับหม้อแปลงขนาด 1000 KVA</td>
                                                    <td>ตู้เมนพร้อมคาปาซิเตอร์ รับหม้อแปลงขนาด 1000 KVA</td>
                                                    <td>Product</td>
                                                    <td>true</td>
                                                    <td><input class="form-control " type="text" style="width: 100%"></td>
                                                </tr>
                                                <tr>
                                                    <td>PK-9 90A-PKAG191-25-ME</td>
                                                    <td>PATKOL PK-60AF (2019) - Complete set of  tube ice machine (38.1 mm, V1100CM+180HP, CDS, 380V/3Ph/50Hz, Ammonia) for Indonesia</td>
                                                    <td>Project</td>
                                                    <td></td>
                                                    <td>true</td>
                                                    <td><input class="form-control " type="text" style="width: 100%"></td>
                                                </tr>
                                                <tr>
                                                    <td>01t5g000003vQFVAA2</td>
                                                    <td>สกรู SS 1/4" x 3/4"</td>
                                                    <td>สกรู SS 1/4" x 3/4"</td>
                                                    <td>Part</td>
                                                    <td>False</td>
                                                    <td><input class="form-control " type="text" style="width: 100%"></td>
                                                </tr>--%>
                                            </tbody>
                                        </table>
                                    </div>


                                </div>
                            </div>
                            <%--End CheckTable--%>
                        </div>
                    </div>

                </div>
                <%--Modal Body --%>

                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnImport_Product" style="float: right; margin-top: 0.5em;">Add</button>
                </div>
            </div>
        </div>
    </div>
    <%--End Modal Add--%>

    <div class="modal fade" id="ModalMenuCurrency" role="dialog" style="z-index: 9999;">
        <div class="modal-dialog modal-md">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em; padding-left: 0.5em;">
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <p class="text-center">
                            <img class="text-center" src="images/Currency.png" width="200" height="200" />
                        </p>
                        <div class="col-md=12">
                            <div class="form-group">
                                <h3 style="text-align: center">Select Currency</h3>
                            </div>
                            <div class=" row form-group">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <select id="text_Select_Currency" class="form-control" style="margin: auto; max-width: 350px !important; min-width: 350px !important; text-align-last: center;">
                                            <option value="">=======Please Select Currency=======</option>
                                            <option value="THB">THB</option>
                                            <option value="USD">USD</option>
                                            <option value="EUR">EUR</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <p>
                                <button id="clickselect_Currency" class="btn btn-info btn-block" data-type="" type="button" style="max-width: 350px; margin: auto;">Submit</button>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalBrowseSearch" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs" id="modalSize">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 id="Titlebrowse" class="modal-title">Text</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
                            <div id="search_box">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TbListBrowse" class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr class="header" id="TBheaderBrowse">
                            </tr>
                        </thead>
                        <tbody id='TBbodyBrowse'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--Browse_modal--%>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/xlsx.full.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#ModalAdd").modal("show");
            //$("#ModalAdd").modal("show");
            var site_ref = getAllUrlParams("site_ref") ? getAllUrlParams("site_ref") : "";
            Page = "Price_List_Price_Book_Entry";
            if (site_ref != "") {
                CheckVW_Salesforce_site_ref(Page, site_ref);
                $("#MainContent_snssite_ref").val(site_ref);
                //SP_SFPriceList_Price_Book('Step0', site_ref)
            }
            else {
                CheckVW_Salesforce_site_ref(Page, "");
                swal('กรุณาเลือก Company', '', 'error');
            }
            $('#smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
            });

            $(document).on("click", ".Browse_modal", function () {
                var fragment = '';
                var fragmentHeader = '';
                var Type = $(this).attr("data-type");
                $("#Titlebrowse").text(Type);
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="search_' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');

                if (Type == 'Browse_Price_Book') {
                    Get_Browse_Price_Book('');
                }

                else if (Type == 'Browse_Product_code') {
                    Get_Browse_Product_code('');
                }

                else if (Type == 'Browse_ProductCatagory') {
                    Get_Browse_ProductCatagory('');
                }

                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });
            //Modal Browse

            $(document).on("click", "#nextPage1", function () {
                $('#smartwizard').smartWizard("next");
            });

            $(document).on("click", ".nextPage2", function () {
                let Action = $(this).attr("data-Action");
                $("#Step3_text_Action").text(Action)
                ModalMenuCurrency(Action);
            });

            $(document).on("click", "#nextPage3", function () {
                var Action = $("#Step3_text_Action").text();
                var Currency = $("#text_Currency").text();
                SP_SFPriceList_Price_Book_Entry('Clear');
                //Clear TB_Prepare
                $('#Step3_Maintain_PriceBook_Entry > tr').each(function () {
                    let Price_Book_ID = $("#Step1_text_Price_Book_ID").val();
                    var type = $(this).closest("tr").attr("data-type");
                    var Product_ID = $(this).closest("tr").attr("data-id");
                    var Product_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                    var Product_Name = $(this).closest("tr").find("td:nth-child(2)").text();
                    var Product_Characteristic = $(this).closest("tr").find("td:nth-child(3)").text();
                    var ProductCatagory = $(this).closest("tr").find("td:nth-child(4)").text();
                    var Status = $(this).closest("tr").find("td:nth-child(5)").text();
                    var Price = $(this).closest("tr").find("td:nth-child(6)").text();
                    if (Action != "") {
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/Insert_TB_SFPriceList_Price_Book_Entry_Prepare") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({
                                Price_Book_Entry_ID: '', Price_Book_ID: Price_Book_ID, Product_ID: Product_ID, Price: Price, Currency: Currency, site_ref: site_ref
                            }),
                            success: function (response) {

                            }
                        })
                    }
                    //Inserrt TB_Prepare
                });
                SP_SFPriceList_Price_Book_Entry(Action);

                swal('Complete', 'บันทึกสำเร็จ', 'success');
                $('#smartwizard').smartWizard("next");
                //Call SP
            });

            $(document).on("click", "#clickselect_Currency", function () {
                let Currency = $("#text_Select_Currency").val();
                let Price_Book_ID = $("#Step1_text_Price_Book_ID").val();
                let type = $(this).attr("data-type");
                if (type == "Update") {
                    Step2_btnUpdate_getListStep3(Price_Book_ID, Currency)
                }
                $("#text_Currency").text(Currency);
                $("#ModalMenuCurrency").modal("hide");
                $('#smartwizard').smartWizard("next");
            });

            $(document).on("click", "#btnModalAdd", function () {
                $("#text_Product_Code").val('');
                $("#text_Product_Name").val('');
                $("#text_Product_Characteristic").val('');
                $("#text_ProductCatagory").val('');
                $("#text_Status").val('');
                $("#ModalAdd").modal("show");
                getListStep3('btnModalAdd');
            });


            $(document).on("click", "#btnModalImport", function () {
                $("#ModalImport").modal("show");
                getListStep3('btnModalImport');
            });

            $(document).on("click", "#btnStep3_DowloadTemplate_show", function () {
                $("#MainContent_btnStep3_DowloadTemplate").click();
            });

            $(document).on("change", "#search_Browse_Price_Book", function () {
                var search = $(this).val();
                Get_Browse_Price_Book(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("click", ".clickselecttext_Browse_Price_Book", function () {
                var Column1 = $(this).closest("tr").find("td:nth-child(1)").text();
                var Column2 = $(this).closest("tr").find("td:nth-child(2)").text();
                var Column3 = $(this).closest("tr").find("td:nth-child(3)").text();
                var id = $(this).closest("tr").attr("data-id");
                $('#search_Browse1').attr("id", 'SearchBrowse');
                $("#SearchBrowse").val("");
                $("#Step1_text_Price_Book_ID").val(id);
                $("#Step1_text_Price_Book_ID_show").val(Column1);
                $("#Step1_text_Price_Book_Name").val(Column2);
                $("#Step1_text_Description").val(Column3);
                $("#modalBrowseSearch").modal("hide");
                $('#nextPage1').show();
            });

            $(document).on("click", ".clickselecttext_Browse_Product_code", function () {
                var Column1 = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#SearchBrowse").val("");
                $("#text_Product_Code").val(Column1);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttext_Browse_ProductCatagory", function () {
                var Column1 = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#SearchBrowse").val("");
                $("#text_ProductCatagory").val(Column1);
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".btnDelete", function () {
                $(this).closest('tr').remove()
            });

            $(document).on("change", "#search_Browse_Product_code", function () {
                var search = $(this).val();
                Get_Browse_Product_code(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#search_Browse_ProductCatagory", function () {
                var search = $(this).val();
                Get_Browse_ProductCatagory(search);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("change", "#checkAll", function () {
                if ($(this).prop('checked')) {
                    $('#List_ADD_Fillter > tr').each(function () {
                        let checkbox = $(this).closest("tr").attr("data-checkbox");
                        if (checkbox != "no") {
                            var checked = $(this).find("input[type=checkbox]").prop("checked", true);
                        }
                    });
                } else {
                    $('#List_ADD_Fillter > tr').each(function () {
                        let checkbox = $(this).closest("tr").attr("data-checkbox");
                        if (checkbox != "no") {
                            var checked = $(this).find("input[type=checkbox]").prop("checked", false);
                        }
                    });
                }

            });

            $(document).on("click", "#btnStep3_Add_search", function () {
                let Product_Code = $("#text_Product_Code").val();
                let Product_Name = $("#text_Product_Name").val();
                let Product_Characteristic = $("#text_Product_Characteristic").val();
                let ProductCatagory = $("#text_ProductCatagory").val();
                let Status = $("#text_Status").val();
                let fragment = "";
                $("#IMGUpload").modal("show");
                let Array_Temp = [];
                //Clear Column

                $('#List_ADD_Fillter > tr').each(function () {
                    var checked = $(this).find("input[type=checkbox]").prop("checked");
                    if (checked) {
                        var ID = $(this).closest("tr").attr("data-id");
                        Array_Temp.push(ID);
                    } else {
                        $(this).remove();
                    }
                });
                //console.log(Array_Temp);

                //Get Column
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetTable_Add_Fillter") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Product_Code: Product_Code, Product_Name: Product_Name, Product_Characteristic: Product_Characteristic
                        , ProductCatagory: ProductCatagory, Status: Status, site_ref: site_ref
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Product_ID = val[1];
                                var Product_Code = val[2];
                                var Product_Name = val[3];
                                var Product_Characteristic = val[4];
                                var ProductCatagory = val[5];
                                var UM = val[6];
                                var LeadTime = val[7];
                                var Status = val[8];

                                if (jQuery.inArray(ID, Array_Temp) != -1) {
                                    console.log("ID have checked :" + ID)
                                } else {
                                    fragment += '<tr data-id="' + ID + '" data-type="new" >';
                                    fragment += '<td class="center"><input class="form-check-input checkboxAssign" type="checkbox" style="margin-left: 15px" value=""></td>';
                                    fragment += '<td>' + Product_Code + '</td>';
                                    fragment += '<td>' + Product_Name + '</td>';
                                    fragment += '<td>' + Product_Characteristic + '</td>';
                                    fragment += '<td>' + ProductCatagory + '</td>';
                                    fragment += '<td>' + Status + '</td>';
                                    fragment += '<td><input class="form-control " type="text" style="width: 100%"></td>';
                                }
                            });
                        }
                        $("#List_ADD_Fillter").append(fragment);
                    }
                })

                $("#IMGUpload").modal("hide");
            });

            $(document).on("click", "#btnStep3_Import", function () {
                CheckExcelImport();
            });

            $(document).on("click", "#btnAdd_Product", function () {
                Step3_Maintain_PriceBook_Entry("btnAdd_Product");
            });

            $(document).on("click", "#btnImport_Product", function () {
                Step3_Maintain_PriceBook_Entry("btnImport_Product");
            });

            function ModalMenuCurrency(Action) {
                $("#text_Select_Currency").empty();
                $("#clickselect_Currency").attr("data-type", Action);
                var fragment = '<option value="">=======Please Select Currency=======</option>';
                if (Action == "Insert") {
                    fragment += '<option value="THB">THB</option>';
                    fragment += '<option value="USD">USD</option>';
                    fragment += '<option value="EUR">EUR</option>';
                } else if (Action == "Update") {
                    let Price_Book_ID = $("#Step1_text_Price_Book_ID").val();
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/VW_SFPriceList_Price_Book_Entry_Browse") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            Price_Book_ID: Price_Book_ID, site_ref: site_ref
                        }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var Currency = val[1];
                                    fragment += '<option value="' + Currency + '">' + Currency + '</option>';
                                });
                            } 
                        }
                    });

                }
                $("#text_Select_Currency").append(fragment);
                $("#ModalMenuCurrency").modal("show");

            }

            function Get_Browse_Price_Book(search) {
                $("#Titlebrowse").text('Search Price Book');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                //size Modal
                fragmentHeader = `<th>Price Book ID</th>
                                     <th>Price Book Name</th>
                                     <th>Description</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/TB_SFPriceList_Price_Book") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search, site_ref: site_ref }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Price_Book_ID = val[1];
                                var Price_Book_Name = val[2];
                                var Description = val[3];
                                fragment += '<tr data-id="' + ID + '">';
                                fragment += '<td><a class="clickselecttext_Browse_Price_Book" href="javascript:void(0)"  >' + Price_Book_ID + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Browse_Price_Book" href="javascript:void(0)"  >' + Price_Book_Name + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Browse_Price_Book" href="javascript:void(0)"  >' + Description + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

            function Get_Browse_Product_code(search) {
                $("#Titlebrowse").text('Search Price Book');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                //size Modal
                fragmentHeader = `<th>Product_Code</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Search_Product_Code_TB_SFPriceList_Product") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Product_Code: search, site_ref: site_ref
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Product_Code = val[0];
                                //var ID = val[0];
                                //var Product_ID = val[1];
                                //var Product_Code = val[2];
                                //var Product_Name = val[3];
                                //var Product_Characteristic = val[4];
                                //var ProductCatagory = val[5];
                                //var UM = val[6];
                                //var LeadTime = val[7];
                                //var Status = val[8];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_Browse_Product_code" href="javascript:void(0)"  >' + Product_Code + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

            function Get_Browse_ProductCatagory(search) {
                $("#Titlebrowse").text('Search Price Book');
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                //size Modal
                fragmentHeader = `<th>ProductCatagory</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Search_Product_ProductCatagory_TB_SFPriceList_Product") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ProductCatagory: search, site_ref: site_ref
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ProductCatagory = val[0];
                                //var ID = val[0];
                                //var Product_ID = val[1];
                                //var Product_Code = val[2];
                                //var Product_Name = val[3];
                                //var Product_Characteristic = val[4];
                                //var ProductCatagory = val[5];
                                //var UM = val[6];
                                //var LeadTime = val[7];
                                //var Status = val[8];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_Browse_ProductCatagory" href="javascript:void(0)"  >' + ProductCatagory + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

            function getListStep3(type) {
                let fragment = "";
                if (type == "btnModalAdd") {
                    $("#List_ADD_Fillter").empty();
                    $("#checkAll").prop("checked", false);
                    $('#Step3_Maintain_PriceBook_Entry > tr').each(function () {
                        var type = $(this).closest("tr").attr("data-type");
                        var ID = $(this).closest("tr").attr("data-id");
                        var Product_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                        var Product_Name = $(this).closest("tr").find("td:nth-child(2)").text();
                        var Product_Characteristic = $(this).closest("tr").find("td:nth-child(3)").text();
                        var ProductCatagory = $(this).closest("tr").find("td:nth-child(4)").text();
                        var Status = $(this).closest("tr").find("td:nth-child(5)").text();
                        var Price = $(this).closest("tr").find("td:nth-child(6)").text();

                        fragment += '<tr data-id="' + ID + '" data-type="' + type + '" data-checkbox="no">';
                        fragment += '<td class="center"><input class="form-check-input checkboxAssign" type="checkbox" style="margin-left: 15px" checked disabled></td>';
                        fragment += '<td>' + Product_Code + '</td>';
                        fragment += '<td>' + Product_Name + '</td>';
                        fragment += '<td>' + Product_Characteristic + '</td>';
                        fragment += '<td>' + ProductCatagory + '</td>';
                        fragment += '<td>' + Status + '</td>';
                        fragment += '<td><input class="form-control" type="text" style="width: 100%" value="' + Price + '"></td>';
                    });
                    $("#List_ADD_Fillter").append(fragment);
                }
                else if (type == "btnModalImport") {
                    $("#List_Import_Fillter").empty();
                    $("#Step3_fileUpload").val('');
                    $('#Step3_Maintain_PriceBook_Entry > tr').each(function () {
                        var type = $(this).closest("tr").attr("data-type");
                        var ID = $(this).closest("tr").attr("data-id");
                        var Product_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                        var Product_Name = $(this).closest("tr").find("td:nth-child(2)").text();
                        var Product_Characteristic = $(this).closest("tr").find("td:nth-child(3)").text();
                        var ProductCatagory = $(this).closest("tr").find("td:nth-child(4)").text();
                        var Status = $(this).closest("tr").find("td:nth-child(5)").text();
                        var Price = $(this).closest("tr").find("td:nth-child(6)").text();

                        fragment += '<tr data-id="' + ID + '" data-type="' + type + '" >';
                        fragment += '<td>' + Product_Code + '</td>';
                        fragment += '<td>' + Product_Name + '</td>';
                        fragment += '<td>' + Product_Characteristic + '</td>';
                        fragment += '<td>' + ProductCatagory + '</td>';
                        fragment += '<td>' + Status + '</td>';
                        fragment += '<td><input class="form-control" type="text" style="width: 100%" value="' + Price + '"></td>';
                    });
                    $("#List_Import_Fillter").append(fragment);
                }
            }

            function Step2_btnUpdate_getListStep3(Price_Book_ID, Currency) {
               let fragment = "";
                $("#Step3_Maintain_PriceBook_Entry").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/VW_SFPriceList_Price_Book_Entry") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Price_Book_ID: Price_Book_ID,Currency:Currency, site_ref: site_ref
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Entry_ID = val[0];
                                var Price_Book_Entry_ID = val[1];
                                var Price_Book_ID = val[2];
                                var Price = val[3];
                                var Currency = val[4];
                                var Product_ID = val[5];
                                var Product_ID_SF = val[6];
                                var Product_Code = val[7];
                                var Product_Name = val[8];
                                var ProductCatagory = val[9];
                                var Product_Characteristic = val[10];
                                var LeadTime = val[11];
                                var UM = val[12];
                                var Status = val[13];

                                fragment += '<tr data-id="' + Product_ID + '" data-type="old" data-checkbox="no">';
                                fragment += '<td>' + Product_Code + '</td>';
                                fragment += '<td>' + Product_Name + '</td>';
                                fragment += '<td>' + Product_Characteristic + '</td>';
                                fragment += '<td>' + ProductCatagory + '</td>';
                                fragment += '<td>' + Status + '</td>';
                                fragment += '<td>' + Price + '</td>';
                                fragment += '<td class="center"><button class="btn btn-danger btnDelete" type="button">Delete</button></td>';
                                fragment += '</tr>';

                            });
                        }
                        $("#Step3_Maintain_PriceBook_Entry").append(fragment);
                    }

                });
            }


            function Step3_Maintain_PriceBook_Entry(type) {
                let fragment = "";
                let checkPrice = 0;
                if (type == "btnAdd_Product") {
                    $('#List_ADD_Fillter > tr').each(function () {
                        var checked = $(this).find("input[type=checkbox]").prop("checked");
                        if (checked) {
                            var Price = $(this).closest("tr").find("td:nth-child(7)").find("input[type='text']").val();
                            //console.log(Price)
                            if (Price == "") {
                                checkPrice = 1;
                                swal('Error', 'กรุณากรอกข้อมูล', 'error');
                            }
                        }
                    });
                    if (checkPrice == 0) {
                        $("#Step3_Maintain_PriceBook_Entry").empty();
                        $('#List_ADD_Fillter > tr').each(function () {
                            var checked = $(this).find("input[type=checkbox]").prop("checked");
                            if (checked) {
                                var type = $(this).closest("tr").attr("data-type");
                                var ID = $(this).closest("tr").attr("data-id");
                                var Product_Code = $(this).closest("tr").find("td:nth-child(2)").text();
                                var Product_Name = $(this).closest("tr").find("td:nth-child(3)").text();
                                var Product_Characteristic = $(this).closest("tr").find("td:nth-child(4)").text();
                                var ProductCatagory = $(this).closest("tr").find("td:nth-child(5)").text();
                                var Status = $(this).closest("tr").find("td:nth-child(6)").text();
                                var Price = $(this).closest("tr").find("td:nth-child(7)").find("input[type='text']").val();
                                if (type != "old") {
                                    fragment += '<tr data-id="' + ID + '" data-type="new" >';
                                } else {
                                    fragment += '<tr data-id="' + ID + '" data-type="old" >';
                                }
                                fragment += '<td>' + Product_Code + '</td>';
                                fragment += '<td>' + Product_Name + '</td>';
                                fragment += '<td>' + Product_Characteristic + '</td>';
                                fragment += '<td>' + ProductCatagory + '</td>';
                                fragment += '<td>' + Status + '</td>';
                                fragment += '<td>' + Price + '</td>';
                                fragment += '<td class="center"><button class="btn btn-danger btnDelete" type="button">Delete</button></td>';
                            }
                        });
                        $("#Step3_Maintain_PriceBook_Entry").append(fragment);
                        $("#ModalAdd").modal("hide");
                    }
                } else if (type == "btnImport_Product") {
                    $('#List_Import_Fillter > tr').each(function () {
                        var Price = $(this).closest("tr").find("td:nth-child(6)").find("input[type='text']").val();
                        if (Price == "") {
                            checkPrice = 1;
                            swal('Error', 'กรุณากรอกข้อมูล', 'error');
                        }
                    });

                    if (checkPrice == 0) {
                        $("#Step3_Maintain_PriceBook_Entry").empty();
                        $('#List_Import_Fillter > tr').each(function () {
                            var type = $(this).closest("tr").attr("data-type");
                            var ID = $(this).closest("tr").attr("data-id");
                            var Product_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                            var Product_Name = $(this).closest("tr").find("td:nth-child(2)").text();
                            var Product_Characteristic = $(this).closest("tr").find("td:nth-child(3)").text();
                            var ProductCatagory = $(this).closest("tr").find("td:nth-child(4)").text();
                            var Status = $(this).closest("tr").find("td:nth-child(5)").text();
                            var Price = $(this).closest("tr").find("td:nth-child(6)").find("input[type='text']").val();
                            if (type != "old") {
                                fragment += '<tr data-id="' + ID + '" data-type="new" >';
                            } else {
                                fragment += '<tr data-id="' + ID + '" data-type="old" >';
                            }
                            fragment += '<td>' + Product_Code + '</td>';
                            fragment += '<td>' + Product_Name + '</td>';
                            fragment += '<td>' + Product_Characteristic + '</td>';
                            fragment += '<td>' + ProductCatagory + '</td>';
                            fragment += '<td>' + Status + '</td>';
                            fragment += '<td>' + Price + '</td>';
                            fragment += '<td class="center"><button class="btn btn-danger btnDelete" type="button">Delete</button></td>';
                        });
                        $("#Step3_Maintain_PriceBook_Entry").append(fragment);
                        $("#ModalImport").modal("hide");
                    }
                }
            }

            function CheckExcelImport() {
                var filecheck = $("#Step3_fileUpload").val();
                if (filecheck) {
                    var fileUpload = $("#Step3_fileUpload")[0];
                    var regex = /(.xlsx)$/;
                    if (regex.test(fileUpload.value.toLowerCase())) {
                        if (typeof (FileReader) != "undefined") {
                            $("#IMGUpload").modal("show");
                            //console.log(fileUpload.files[0]);
                            var reader = new FileReader();
                            //For Browsers other than IE.
                            if (reader.readAsBinaryString) {
                                reader.onload = function (e) {
                                    var workbook = XLSX.read(e.target.result, {
                                        type: 'binary'
                                    });
                                    var firstSheet = workbook.SheetNames[0];
                                    if (firstSheet == "Sheet 1") {
                                        READFILE(e.target.result);

                                    } else {
                                        swal('Error', 'Please upload Template file', 'error');
                                    }
                                };
                                reader.readAsBinaryString(fileUpload.files[0]);
                            } else {
                                //For IE Browser.
                                reader.onload = function (e) {
                                    var data = "";
                                    var bytes = new Uint8Array(e.target.result);
                                    for (var i = 0; i < bytes.byteLength; i++) {
                                        data += String.fromCharCode(bytes[i]);
                                    }
                                    var workbook = XLSX.read(data, {
                                        type: 'binary'
                                    });
                                    var firstSheet = workbook.SheetNames[0];
                                    if (firstSheet == "Sheet 1") {
                                    } else {
                                        swal('Error', 'Please upload Template file', 'error');
                                    }
                                };
                                reader.readAsArrayBuffer(fileUpload.files[0]);
                            };
                        } else {
                            swal('Error', 'This browser does not support HTML5.', 'error');
                        }
                    } else {
                        console.log('not excel file')
                        swal('Error', 'Please upload CSV file only', 'error');
                    }
                } else {
                    swal('Error', 'Please upload file Template', 'error');
                }
                $("#IMGUpload").modal("hide")
            }
            function READFILE(data) {
                //Read the Excel File data.
                var workbook = XLSX.read(data, {
                    type: 'binary'
                });
                var excelRows = XLSX.utils.sheet_to_row_object_array(workbook.Sheets["Sheet 1"]);
                var Array_value = [];
                //console.log(excelRows);
                for (var i = 0; i < excelRows.length; i++) {
                    let Array_Temp = [];
                    let Product_ID = (excelRows[i].Product_ID ? excelRows[i].Product_ID : "");
                    let Price = (excelRows[i].Price ? excelRows[i].Price : "");
                    Array_Temp.push(Product_ID, Price);
                    Array_value.push(Array_Temp);
                }
                //console.log(Array_value);
                GetTable_Import_Fillter(Array_value);
            }

            function GetTable_Import_Fillter(Array_value) {
                let textcode_whereIn = "";
                let fragment = "";
                let Array_Temp = [];
                for (var i = 0; i < Array_value.length; i++) {
                    let Product_ID = (Array_value[i][0]);
                    if (i === Array_value.length - 1) {
                        textcode_whereIn += "'" + Product_ID + "'";
                    } else {
                        textcode_whereIn += "'" + Product_ID + "',";
                    }
                }
                //console.log(textcode_whereIn)
                console.log(Array_value)
                $('#List_Import_Fillter > tr').each(function () {
                    var ID = $(this).closest("tr").attr("data-id");
                    Array_Temp.push(ID);
                });

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetTable_Import_Fillter") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ textcode_whereIn: textcode_whereIn, site_ref: site_ref }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Product_ID = val[1];
                                var Product_Code = val[2];
                                var Product_Name = val[3];
                                var Product_Characteristic = val[4];
                                var ProductCatagory = val[5];
                                var UM = val[6];
                                var LeadTime = val[7];
                                var Status = val[8];

                                if (jQuery.inArray(ID, Array_Temp) != -1) {

                                } else {
                                    let this_value = Array_value.find(Array_value => Array_value[0] === Product_ID);
                                    console.log(this_value)
                                    fragment += '<tr data-id="' + ID + '" data-type="new" >';
                                    fragment += '<td>' + Product_Code + '</td>';
                                    fragment += '<td>' + Product_Name + '</td>';
                                    fragment += '<td>' + Product_Characteristic + '</td>';
                                    fragment += '<td>' + ProductCatagory + '</td>';
                                    fragment += '<td>' + Status + '</td>';
                                    fragment += '<td><input class="form-control " type="text" style="width: 100%" value ="' + this_value[1] + '"></td>';
                                }

                            });

                            $("#List_Import_Fillter").append(fragment);
                        }
                    }
                })

            }
            function SP_SFPriceList_Price_Book_Entry(Action) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_SFPriceList_Price_Book_Entry") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Action: Action, site_ref: site_ref
                    }),
                    success: function (response) {

                    }
                });
            }


        });


        function openModal() {
            $('#IMGUpload').modal('show');
        }

        function hideModal() {
            $('#IMGUpload').modal('hide');
        }
    </script>
</asp:Content>
