<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Password_Reset.aspx.cs" Inherits="LPT.Password_Reset" %>

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

        <div class="container" style="width: 45rem">
            <div class="panel panel-primary" style="margin-top: 12rem">
                <div class="panel-heading">Reset Password</div>
                <div class="panel-body">
                    <%--<div class="alert alert-success" role="alert" id="hdn_msg" style="display: none;"></div>--%>
                    <asp:HiddenField ID="hdn_msg" runat="server" />
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div>

                                <asp:Label runat="server">Enter Your Registerd Email Id</asp:Label><br /><br/>
                                <asp:TextBox ID="txt_To" CssClass="number form-control" runat="server"></asp:TextBox><br />

                            </div>

                            <div class="form-group">
                                <div class="col-md-12 col-md-offset-4">
                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SendEmail"/><br/><br/>

                                </div>
                                <span class="col-md-12 col-md-offset-1">Already have account?<a href="Login.aspx" style="color: red"> Click here to Login</a></span>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

         <style>
            body {
                background-color: lightgray;
            }
        </style>

    </form>
</body>
</html>
