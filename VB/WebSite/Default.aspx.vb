Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxTreeList

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Protected Sub ASPxTreeList1_DataBound(ByVal sender As Object, ByVal e As EventArgs)
		DisableParentNodeSelection()
	End Sub

	Protected Sub DisableParentNodeSelection()
		' Iterates through all nodes and prevents the display of selection check boxes within parent nodes
		Dim iterator As TreeListNodeIterator = ASPxTreeList1.CreateNodeIterator()
		Dim node As TreeListNode = iterator.GetNext()
		Do While node IsNot Nothing
			node.AllowSelect = Not node.HasChildren
			node = iterator.GetNext()
		Loop
	End Sub

	Protected Sub ASPxTreeList1_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs)
		Dim treeList As ASPxTreeList = TryCast(sender, ASPxTreeList)

		If treeList.SelectionCount = 1 Then ' One node is selected within the control
			Session("PrevSelectedNodeKey") = treeList.GetSelectedNodes()(0).Key
		End If

		If treeList.SelectionCount > 1 Then ' Applies selection to the last selected node, if two nodes are selected
			Dim prevSelectedNode As TreeListNode = treeList.FindNodeByKeyValue(Session("PrevSelectedNodeKey").ToString())
			prevSelectedNode.Selected = False
			Session("PrevSelectedNodeKey") = treeList.GetSelectedNodes()(0).Key
		End If
	End Sub

	Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
		If ASPxTreeList1.SelectionCount = 0 Then
			Label2.Text = "None"
		Else
			Dim node As TreeListNode = ASPxTreeList1.GetSelectedNodes()(0)
			Label2.Text = node("Department").ToString()
		End If
	End Sub
End Class
