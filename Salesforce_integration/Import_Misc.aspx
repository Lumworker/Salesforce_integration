<%@ Page Title="Import Misc" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Import_Misc.aspx.cs" Inherits="Salesforce_integration.Import_Misc" %>

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


        /*.btn-Excel-dowlaod {
            background-color: #1f7244;
            color: ghostwhite;
            border: none;
        }
        .btn-Excel-dowlaod:hover {
                background-color: #006400;
                color: ghostwhite;
            }
            */
        .btn-Excel-dowlaod {
            background-color: #006400;
            color: ghostwhite;
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
            <h2>Import Miscellaneous</h2>
        </div>
    </div>
    <!----End Header---->
    <div class="panel-group">
        <div class="panel-body">
            <div class="row">
                <div id="smartwizard">
                    <ul>
                        <li class="check" data-step="Step1"><a href="#step-1">Sync Data</a></li>
                        <li class="check" data-step="Step2"><a href="#step-2">Export Excel</a></li>
                        <li class="check" data-step="Step3"><a href="#step-3">Complete</a></li>
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
                                                    <h4>Sync Data</h4>
                                                </div>
                                                <div class="panel-body">

                                                    <div class="row" style="margin-bottom: 2rem; margin-top: 2rem;">
                                                        <div class="col-md-12">

                                                            <div class="col-md-12" style="margin-bottom: 2em;">
                                                                <h3 class="control-label">1) กดปุ่ม Sync Dataเพื่อทำการอัพเดทข้อมูลล่าสุด</h3>

                                                            </div>


                                                            <div class="col-md-12 center" style="margin-bottom: 2rem;">
                                                                <div class="col-md-2 " style="margin-bottom: 2rem;">
                                                                </div>
                                                                <div class="col-md-8 " style="margin-bottom: 2rem;">
                                                                    <button class="btn btn-block btn-info" id="nextPage1" style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" type="button">Sync Data</button>

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
                        </div>
                        <div id="step-2" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Export excel</h4>
                                    </div>
                                    <div class="panel-body">

                                        <div class="row" style="margin-bottom: 2rem; margin-top: 2rem;">
                                            <div class="col-md-12">

                                                <div class="col-md-12" style="margin-bottom: 2em;">
                                                    <h3 class="control-label">2) Export excel</h3>
                                                    <span class="control-label red" style="font-size: 13px; margin-left: 1em">*กรุณาดาวน์โหลดไฟล์เพื่อไป Step ถัดไป </span>
                                                </div>

                                                <div class="col-md-12 center" style="margin-bottom: 2rem;">
                                                    <div class="col-md-2 " style="margin-bottom: 2rem;">
                                                    </div>
                                                    <div class="col-md-8 " style="margin-bottom: 2rem;">
                                                        <button class="btn btn-block btn-Excel-dowlaod" id="btn_Download" style="min-width: 100%; height: 80px; font-size: 24px; font-weight: bold;" type="button">Export Excel</button>

                                                        <asp:Button runat="server" class="btn btn-block btn-Excel-dowlaod"
                                                            ID="btnExport" OnClick="btnExport_Click" Text="Export" Style="display: none;"
                                                            UseSubmitBehavior="false" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2 " style="margin-bottom: 2rem;">
                                                </div>


                                            </div>
                                        </div>

                                        <div style="text-align: right; margin: 1rem;">
                                            <%--<button id="nextPage2" class="btn btn-warning " type="button" data-toggle="modal" style="text-align: left; margin-top: 2rem; display: none;">Next</button>--%>
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
                                        <h4>Complete</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3 class="control-label" style="text-align: center;">Completed</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--======Step 2======--%>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <script type="text/javascript">
        $(document).ready(function () {
            var site_ref = getAllUrlParams("site_ref")?getAllUrlParams("site_ref"):"";
            var Page = "Misc";
            if (site_ref != "") {
                CheckVW_Salesforce_site_ref(Page, site_ref);
                $("#MainContent_snssite_ref").val(site_ref);
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

            $(document).on("click", "#nextPage1", function () {
                SP_SalesForce_SFTiemSheet_Misc("Step1", site_ref)
                $('#smartwizard').smartWizard("next");
            });

            $(document).on("click", "#nextPage2", function () {
            });


            $(document).on("click", "#btn_Download", function () {
                $("#MainContent_btnExport").click();
                setTimeout(function () {
                $('#smartwizard').smartWizard("next");
                    SP_SalesForce_SFTiemSheet_Misc("Step3", site_ref)
                    swal('Completed', '', 'success');
                }, 3000);

            });



            function SP_SalesForce_SFTiemSheet_Misc(step, site_ref) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_SalesForce_SFTiemSheet_Misc") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Step: step, site_ref: site_ref }),
                    success: function (response) {
                    }
                });
            }

        });


    </script>

</asp:Content>
