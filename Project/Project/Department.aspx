<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="Project.Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .department-container {
            margin-left: 200px; /* Push content right of sidebar */
            margin-top: 0px;
            padding: 20px;
            font-family: 'Segoe UI', sans-serif;
        }

        .department-container h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .department-table {
            width: 100%;
            border-collapse: collapse;
        }

        .department-table th, .department-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .department-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="department-container">
        <h2>Departments Overview</h2>
        <asp:GridView ID="gvDepartments" runat="server" AutoGenerateColumns="true" CssClass="department-table" />
    </div>
</asp:Content>
