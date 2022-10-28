<%@ Page Title="" Language="C#" MasterPageFile="~/one.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="LPT.DashBoard" %>
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
                                                    <asp:LinkButton ID="btnAddNew" runat="server">Evaluate Score</asp:LinkButton>

                                                </li>

                                                <li>
                                                    <asp:LinkButton ID="lnkEdit" runat="server">Assign Reader</asp:LinkButton>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

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
                                                <th>Reader </th>
                                                <th>Resume Score</th>
                                                <th>Video Score</th>
                                                <th>Hindi Video Status</th>
                                                <th>Reading Score</th>
                                                <th>Reading Status</th>
                                            </tr>
                                        </thead>
                                        <tr id="ItemPlaceholder" runat="server"></tr>

                                    </table>
                                    <asp:HiddenField ID="hidId" Value="0" runat="server" />

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


            <%--TEMPLATE PAGE START BELOW--%>
        </div>
    </div>




    <style>
        .drpbtn{
            background-color:darkgray;
            color:black;
            border-radius:5px;
        }
        #btnAction {
            
            color: black;
        }
    </style>

</asp:Content>
