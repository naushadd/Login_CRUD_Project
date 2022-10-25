<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajax_Display.aspx.cs" Inherits="LPT.Ajax_Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <script src="../../bower_components/jquery/dist/jquery.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--<asp:Label ID="Label1" runat="server" Text="Label">Name</asp:Label>--%>
            <asp:TextBox ID="txt_Name" placeholder="Name" runat="server"></asp:TextBox>

            <%--<asp:Label ID="Label2" runat="server" Text="Label">Surname</asp:Label>--%>
            <asp:TextBox ID="txt_Surname" placeholder="Surname" runat="server"></asp:TextBox>

            <%--<asp:Label ID="Label3" runat="server" Text="Label">Country</asp:Label>--%>
            <asp:TextBox ID="txt_Country" placeholder="Country" runat="server"></asp:TextBox>

            <button type="button" class="btn btn-primary" id="btn_save" onclick="savedata()">Save</button>
            

        </div>
 

    </form>

    <script type="text/javascript">
        debugger;
        function savedata() {
            alert("abx");

            var Name = $('#txt_Name').val();
            var Surname = $('#txt_Surname').val();
            var Country = $('#txt_Country').val();
    

            var data = {};
            data.txt_Name = Name;
            data.txt_Surname = Surname;
            data.txt_Country = Country;
            debugger;

            $.ajax({

                type: "POST",
                dataType: "json",
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                url: "Ajax_Display.aspx/Showdata",
                success: function (Record) {

                    if (Record != "") {
                        alert("Data Saved");
                    };
                },

            });

        }
    </script>

</body>
</html>
