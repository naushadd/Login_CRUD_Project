<%@ Page Title="" Language="C#" MasterPageFile="~/one.Master" AutoEventWireup="true" CodeBehind="User_authentication.aspx.cs" ClientIDMode="Static" Inherits="LPT.User_authentication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <h3>User Authentication</h3>
        <div class="panel panel-primary" style="margin-top: 40px">
            <div class="panel-heading">User Details</div>
            <div class="panel-body">
                <p class="login-box-msg">Sign in to start your session</p>
                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <table id="Mytable" class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td>
                                            <label class="control-label">Staff Name<span class="required" aria-required="true"></span></label>
                                        <td class="col-md-6">
                                            <asp:DropDownList ID="user_ddlStaff"  runat="server" CssClass="form-control input-sm req req_control">
                                            </asp:DropDownList>
                                    </tr>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <table id="Mytable1" class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td>
                                            <label class="control-label">User ID<span class="required" aria-required="true"></span></label>
                                        <td>
                                            <asp:TextBox ID="txt_user" CssClass="number form-control input-sm req req_control" runat="server" Placeholder="User Id"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-6">
                                            <label class="control-label">Password<span class="required" aria-required="true"></span></label>
                                        <td>
                                            <asp:TextBox ID="txt_Password" TextMode="Password" CssClass="number form-control input-sm req req_control " runat="server" Placeholder="Password"></asp:TextBox></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="form-group">
                            <div class="col-md-2 col-md-offset-5">
                                <asp:Button ID="btnsubmit" runat="server" Text="Sign In" CssClass="btn btn-success" OnClick="btnsubmit_Click" />

                                <%--<button type="submit" class="btn btn-success" id="btn_user" onclick="" >Sign In</button>--%>
                            </div>
                        </div>
                        <%--  <p><a href="#">Go to Signup Form</a></p>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>

    </script>

</asp:Content>
