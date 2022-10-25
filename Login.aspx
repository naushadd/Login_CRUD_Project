<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LPT.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container" style="width: 60rem">
            <div class="panel panel-primary" style="margin-top: 12rem">
                <div class="panel-heading">User Login</div>
                <div class="panel-body">
                    <%--<div class="alert alert-success" role="alert" id="hdn_msg" style="display: none;"></div>--%>
                    <asp:HiddenField ID="hdn_msg" runat="server" />
                    <div class="row">
                        <div class="col-md-12">
                            <div>
                                <table id="Mytable1" class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label class="control-label">User Name ❤<span class="required" aria-required="true"></span></label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_user" CssClass="number form-control input-sm req req_control" runat="server" Placeholder="User Name"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td class="col-md-6">
                                                <label class="control-label">Password<span class="required" aria-required="true"></span></label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Password" TextMode="Password" CssClass="number form-control input-sm req req_control " runat="server" Placeholder="Password"></asp:TextBox></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group">
                                <div class="col-md-2 col-md-offset-5">
                                    <asp:Button ID="btnsubmit" runat="server" Text="Sign In" CssClass="btn btn-success" OnClick="Btn_login" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:HiddenField ID="txt_Id" runat="server" />

        <script type="text/javascript">

            //Msg Display For Login
            $(document).ready(function () {
                if ($("#hdn_msg").val() != "") {
                    alert($("#hdn_msg").val());
                }
                //else {
                //    alert($("#hdn_msg").val());

                //}
            })

        </script>

    </form>
</body>
</html>
