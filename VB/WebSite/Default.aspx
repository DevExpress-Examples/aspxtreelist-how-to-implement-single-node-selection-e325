<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v13.2, Version=13.2.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save Selection" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Last Saved Node: "></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="None"></asp:Label><br />
        <br />
        <dxwtl:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False"
            DataSourceID="AccessDataSource1" KeyFieldName="ID" ParentFieldName="PARENTID" OnDataBound="ASPxTreeList1_DataBound" OnSelectionChanged="ASPxTreeList1_SelectionChanged">
            <Columns>
                <dxwtl:TreeListTextColumn FieldName="DEPARTMENT" VisibleIndex="0">
                </dxwtl:TreeListTextColumn>
                <dxwtl:TreeListTextColumn FieldName="LOCATION" VisibleIndex="1">
                </dxwtl:TreeListTextColumn>
            </Columns>
            <SettingsSelection Enabled="True" />
            <SettingsBehavior ProcessSelectionChangedOnServer="True" />
        </dxwtl:ASPxTreeList>
    </div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Departments.mdb"
            SelectCommand="SELECT [ID], [PARENTID], [DEPARTMENT], [LOCATION] FROM [Departments]">
        </asp:AccessDataSource>
    </form>
</body>
</html>