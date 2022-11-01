<%@ Page Title="" Language="C#" MasterPageFile="~/one.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="LPT.DashBoard" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="portlet light bordered">

            <div class="portlet-title">
                <div class="caption">
                    <asp:Label ID="lblPageListTitle" runat="server"></asp:Label>
                    <div class="alert alert-success" role="alert" id="message" style="display: none;">
                        <asp:HiddenField ID="hdn_msg" runat="server" />
                    </div>
                    <h3>CMGGA Application Reading</h3>
                </div>
            </div>
            <div class="portlet-body form">

                <%--LIST PAGE Start--%>

                <div>

                    <div class="row">
                        <div class="col-md-6"></div>
                        <div class="col-md-6">

                            <div class="table-toolbar">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="drpbtn btn-group pull-right">
                                            <asp:LinkButton ID="btnAction" runat="server" class="btn default dropdown-toggle" data-toggle="dropdown">
                                            Action <i class="fa fa-angle-down"></i>
                                            </asp:LinkButton>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <asp:LinkButton runat="server" data-toggle="modal" data-target="#ModalPopUp">Evaluate Score</asp:LinkButton>

                                                </li>

                                                <li>
                                                    <a class="dropdown-item" onclick="AssignReader()">Assign Reader</a>

                                                </li>

                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <%--List View Start below--%>
                    <div class="row">

                        <div class="col-md-12">

                            <asp:ListView ID="DSLV" runat="server">

                                <LayoutTemplate>

                                    <table class="table table-striped table-bordered table-hover" id="tblTask">
                                        <thead>
                                            <tr>
                                                <th <%--class="table-checkbox"--%> width="2%">
                                                    <input type="checkbox" /></th>
                                                <th>Application_Name</th>
                                                <th>Reader</th>
                                                <th>Resume Score</th>
                                                <th>Video Score</th>
                                                <th>Hindi Video Status</th>
                                                <th>Reading Score</th>
                                                <th>Reading Status</th>
                                            </tr>
                                        </thead>
                                        <tr id="ItemPlaceholder" runat="server"></tr>

                                    </table>

                                </LayoutTemplate>

                                <ItemTemplate>
                                    <tbody>
                                        <tr>

                                            <td>
                                                <input type="checkbox" class="chk" id="chkbox" attr_autoid='<%# Eval("App_Id") %>' />
                                            </td>


                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Application_Name") %>'></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Reader") %>'></asp:Label>
                                            </td>


                                            <td>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Resume_Score") %>'></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Video_Score") %>'></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("H_V_Status") %>'></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Reading_Score") %>'></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Reading_Status") %>'></asp:Label>
                                            </td>

                                        </tr>
                                    </tbody>
                                </ItemTemplate>

                            </asp:ListView>

                        </div>

                    </div>
                </div>
            </div>


            <%--LIST PAGE End--%>


            <%--MODAL START START BELOW--%>

            <div>
                <div class="modal fade" id="ModalPopUp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <%------------MODAL BODY START----------------%>


                                <div>
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-6">


                                                <div class="form-group">
                                                    <label class="control-label">Application Name<span class="required" aria-required="true"> *</span></label>
                                                    <asp:TextBox ID="txt_AppName" class="form-control req_cntrl" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Resume Score<span class="required" aria-required="true"> *</span></label>
                                                    <asp:TextBox ID="txt_ResumeScore" class="form-control req_cntrl" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>



                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Video Score<span class="required" aria-required="true"> *</span></label>
                                                <asp:TextBox ID="txt_VideoScore" class="form-control req_cntrl" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Hindi Video Status<span class="required" aria-required="true">*</span></label>
                                                    <asp:DropDownList ID="txt_HVStatus" class="form-control req_cntrl" runat="server">
                                                        <asp:ListItem Value="Qualified">Qualified</asp:ListItem>
                                                        <asp:ListItem Value="Disqualified">Disqualified</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Reading Score<span class="required" aria-required="true"> *</span></label>
                                                    <asp:TextBox ID="txt_ReadingScore" class="form-control req_cntrl" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Reading Status<span class="required" aria-required="true">*</span></label>
                                                    <asp:DropDownList ID="txt_ReadingStatus" class="form-control req_cntrl" runat="server">
                                                        <asp:ListItem Value="Selected">Selected</asp:ListItem>
                                                        <asp:ListItem Value="Not Selected">Not Selected</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" onclick="SubmitDetails()">Submit</button>
                            </div>
                            <%------------MODAL BODY END----------------%>
                        </div>
                    </div>
                </div>
                <%--Evaluate End--%>


                <%--ASSIGN READER MODAL START--%>

                <div>
                    <div class="modal fade" id="AssignReaderPopUp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-6">
                                                        <label class="control-label">Assign Reader<span class="required" aria-required="true">*</span></label>
                                                    </div>


                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlReadingStatus" class="form-control req_cntrl" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <%--<button type="button" class="btn btn-primary" onclick="AssignReader()">Assign</button>--%>
                                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Assign" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--ASSIGN READER--%>
    </div>

      

    <asp:HiddenField ID="hid_Id" runat="server" ClientIDMode="Static"/>



 




    <style>
        .drpbtn {
            background-color: darkgray;
            color: black;
            border-radius: 5px;
        }

        #btnAction {
            color: black;
        }
    </style>



   


    <script src="Dashboad.js"></script>
</asp:Content>
