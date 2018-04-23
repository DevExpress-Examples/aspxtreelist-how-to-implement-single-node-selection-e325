using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxTreeList;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ASPxTreeList1_DataBound(object sender, EventArgs e) {
        DisableParentNodeSelection();
    }

    protected void DisableParentNodeSelection() {
        // Iterates through all nodes and prevents the display of selection check boxes within parent nodes
        TreeListNodeIterator iterator = ASPxTreeList1.CreateNodeIterator();
        TreeListNode node = iterator.GetNext();
        while (node != null) {
            node.AllowSelect = !node.HasChildren;
            node = iterator.GetNext();
        }
    }
    public string LastSelectedNode
    {
        get
        {
            string key = Session["PrevSelectedNodeKey"] as string;
            if (String.IsNullOrEmpty(key))
                key = "-1";
            return key;
        }
        set {
            Session["PrevSelectedNodeKey"] = value;
        }
    }
    protected void ASPxTreeList1_SelectionChanged(object sender, EventArgs e) {
        ASPxTreeList treeList = sender as ASPxTreeList;

        if (treeList.SelectionCount == 1)  // One node is selected within the control
            LastSelectedNode = treeList.GetSelectedNodes()[0].Key;

        if (treeList.SelectionCount > 1) { // Applies selection to the last selected node, if two nodes are selected
            TreeListNode prevSelectedNode = treeList.FindNodeByKeyValue(LastSelectedNode);
            if (prevSelectedNode != null)
            {
                prevSelectedNode.Selected = false;
                LastSelectedNode = treeList.GetSelectedNodes()[0].Key;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e) {
        if (ASPxTreeList1.SelectionCount == 0)
            Label2.Text = "None";
        else {
            TreeListNode node = ASPxTreeList1.GetSelectedNodes()[0];
            Label2.Text = node["Department"].ToString();
        }
    }
}
