<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Project.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .dashboard-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            font-family: 'Segoe UI', sans-serif;
            box-sizing: border-box;
            max-width: 100%;
        }

        .card {
            flex: 1 1 100%;
            max-width: 48%;
            min-width: 300px;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 15px;
            background-color: #f9f9f9;
            box-shadow: 1px 1px 8px rgba(0,0,0,0.08);
            box-sizing: border-box;
        }

        @media screen and (max-width: 900px) {
            .card {
                max-width: 100%;
            }
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            flex-wrap: wrap;
        }

        .card-header h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        .aspNet-Style {
            padding: 4px 8px;
            font-size: 13px;
            border-radius: 5px;
            margin-left: 10px;
        }

        .gridview {
            margin-top: 10px;
            width: 100%;
            font-size: 13px;
            overflow-x: auto;
        }

        .gridview th, .gridview td {
            padding: 6px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .gridview th {
            background-color: #e0e0e0;
            font-weight: 600;
        }
    </style>

    <div class="dashboard-container">
        <!-- Department Averages Card -->
        <div class="card">
            <div class="card-header">
                <h3>Averages of Department</h3>
                <asp:DropDownList ID="ddlDeptSort" runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlDeptSort_SelectedIndexChanged" CssClass="aspNet-Style">
                    <asp:ListItem Text="Ascending" Value="ASC" />
                    <asp:ListItem Text="Descending" Value="DESC" />
                </asp:DropDownList>
            </div>
            <asp:GridView ID="gvDepartments" runat="server" AutoGenerateColumns="true"
                CssClass="gridview" BorderStyle="None" GridLines="Horizontal" />
        </div>

        <!-- Employees Card -->
        <div class="card">
            <div class="card-header">
                <h3>Employees of Department</h3>
                <asp:DropDownList ID="ddlEmpSort" runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlEmpSort_SelectedIndexChanged" CssClass="aspNet-Style">
                    <asp:ListItem Text="Ascending" Value="ASC" />
                    <asp:ListItem Text="Descending" Value="DESC" />
                </asp:DropDownList>
            </div>
            <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="true"
                CssClass="gridview" BorderStyle="None" GridLines="Horizontal" />
        </div>
    </div>
</asp:Content>
