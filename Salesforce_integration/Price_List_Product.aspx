<%@ Page Title="Price List Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Price_List_Product.aspx.cs" Inherits="Salesforce_integration.Price_List_Product" %>
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
            <h2>Price List Product</h2>
        </div>
    </div>
    <!----End Header---->
    <div class="panel-group">
        <div class="panel-body">
            <div class="row">
                <div id="smartwizard">
                    <ul>
                        <li class="check" data-step="Step1"><a href="#step-1">Import Excel</a></li>
                        <%--<li class="check" data-step="Step2"><a href="#step-2">Export File Excel & Notepad</a></li>--%>
                        <li class="check" data-step="Step2"><a href="#step-2">Complete</a></li>
                        <%--<li class="check" data-step="Step4"><a href="#step-4">Step 4 backup</a></li>
                        <li class="check" data-step="Step5"><a href="#step-5">Step 5 clear</a></li>--%>
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
                                                    <h4>Import Excel Price List Product</h4>
                                                </div>
                                                <div class="panel-body">

                                                    <div class="row" style="margin-bottom: 2rem; margin-top: 2rem;">
                                                        <div class="col-md-12">

                                                            <div class="col-md-12" style="margin-bottom: 2em;">
                                                                <h3 class="control-label">1) เลือก Price List Product ที่ต้องการ Import </h3>

                                                            </div>

                                                            <div class="col-md-12 " style="margin-bottom: 2rem;">
                                                                <input type="file" class="form-control max-wide " id="Step1_fileUpload">
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div style="text-align: right; margin: 1rem;">
                                                        <button id="nextPage1" class="btn btn-warning Pos_Viewer" type="button" data-toggle="modal" style="text-align: left; margin-top: 2rem; display: none;">Next</button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div id="step-2" class="">
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
                         <%--   <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <div class="panel-group">
                                            <div class="panel panel-default" style="margin-top: 1em;">
                                                <div class="panel-heading">
                                                    <h4>Export File Excel & Notepad</h4>
                                                </div>
                                                <div class="panel-body">

                                                    <div class="row" style="margin-bottom: 2rem; margin-top: 2rem;">
                                                        <div class="col-md-12">

                                                            <div class="col-md-12" style="margin-bottom: 2em;">
                                                                <h3 class="control-label">2) Export File Excel & Notepad </h3>
                                                                <span class="control-label red" style="font-size: 13px; margin-left: 1em">*กรุณาดาวน์โหลดไฟล์เพื่อไป Step ถัดไป </span>
                                                            </div>

                                                            <div class="col-md-12 center" style="margin-bottom: 2rem;">
                                                                <div class="col-md-2 " style="margin-bottom: 2rem;">
                                                                </div>
                                                                <div class="col-md-8 " style="margin-bottom: 2rem;">
                                                                    <button class="btn btn-block btn-Excel-dowlaod" id="btn_Download" style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" type="button">Download File</button>

                                                                    <asp:Button runat="server" ID="btnExport" OnClick="btnExport_Click" Text="Export" Style="display:none" UseSubmitBehavior="false" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2 " style="margin-bottom: 2rem;">
                                                            </div>


                                                        </div>
                                                    </div>

                                                    <div style="text-align: right; margin: 1rem;">
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>--%>
                        </div>
                        <%--======Step 2======--%>
               <%--         <div id="step-3" class="">
                            
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
                        </div>--%>
                        <%--======Step 3======--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        $(document).ready(function () {
            var site_ref = getAllUrlParams("site_ref") ? getAllUrlParams("site_ref") : "";


            Page = "Price_List_Product";
            if (site_ref != "") {
                CheckVW_Salesforce_site_ref(Page, site_ref);
                $("#MainContent_snssite_ref").val(site_ref);
                SP_SFPriceList_Product('Step0', site_ref)
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

            $(document).on("change", "#Step1_fileUpload", function () {
                var file = $(this).val();
                if (file != "") {
                    $('#nextPage1').show();
                }
                else {
                    $('#nextPage1').hide();
                }
            });

            $(document).on("click", "#nextPage1", function () {
                var excel = $("#Step1_fileUpload")[0].files[0];
                var extention = excel.name;
                var lastDot = extention.lastIndexOf('.');
                var ext = extention.substring(lastDot + 1);
                var excelExtention = ['xlsx', 'xlsm', 'xlsb', 'xltx', 'xltm', 'xls', 'xlt', 'CSV'];
                if (excel = '') {
                    swal('Error', 'Plese select files.', 'error');
                }
                else if (!excelExtention.includes(ext)) {
                    swal('Error', 'Plese check files.', 'error');
                }
                else {
                    excel = $("#Step1_fileUpload")[0].files[0];
                }
                LoadFile(excel, site_ref, 'Price_List_Product');
            });

            //$(document).on("click", "#btn_Download", function () {
            //    openModal();
            //    $("#MainContent_btnExport").click();
            //    setTimeout(function () {
            //        SP_SFPriceList_Product('Step3', site_ref)
            //        $('#smartwizard').smartWizard("next");
            //        $("#btn_Download").attr("disabled", true)
            //        $("#Step1_fileUpload").attr("disabled", true)
            //        $("#nextPage1").attr("disabled", true)
            //        swal('Complete', 'หากไฟล์เสียหายหรือมีพบปัญหาให้ทำการติดต่อ IT', 'success');
            //    }, 2000);
            //});

            function LoadFile(data, site_ref, type) {
                //console.log(data);
                $("#IMGUpload").modal("show");
                var formData = new FormData();
                formData.append('file', data);
                formData.append('type', type);
                formData.append('site_ref', site_ref);

                if (type == "Price_List_Product") {
                    $.ajax({
                        type: 'post',
                        url: './LoadExcel.ashx',
                        data: formData,
                        async: false,
                        processData: false,
                        contentType: false,
                        success: function (status) {
                            $("#IMGUpload").modal("hide");
                            if (status == "Error") {
                                swal('Error', 'กรุณาตรวจสอบ ไฟล์อัพโหลด', 'error');
                            } else {
                                SP_SFPriceList_Product('Step1', site_ref);
                                $('#smartwizard').smartWizard("next");
                                $("#Step1_fileUpload").attr("disabled", true)
                                $("#nextPage1").attr("disabled", true)
                                swal('Complete', '', 'success');
                            }
                        },
                        error: function () {
                            swal('Error', 'Whoops something went wrong!', 'error');
                        }
                    });
                }
            }

            function SP_SFPriceList_Product(Step, site_ref) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_SFPriceList_Product") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Step: Step, site_ref: site_ref }),
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
