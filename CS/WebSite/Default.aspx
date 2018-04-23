<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v8.2, Version=8.2.1.0, Culture=neutral, PublicKeyToken=9b171c9fd64da1d1"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.2, Version=8.2.1.0, Culture=neutral, PublicKeyToken=9b171c9fd64da1d1"
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
