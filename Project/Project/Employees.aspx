<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Project.Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .employee-container {
            margin-left: 200px; /* aligns after sidebar */
            margin-top: 0px;     /* flush with top */
            padding: 20px;
            font-family: 'Segoe UI', sans-serif;
        }

        .employee-container h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .employee-table {
            width: 100%;
            border-collapse: collapse;
        }

        .employee-table th, .employee-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .employee-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="employee-container">
        <h2>Employee List</h2>
        <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="true" CssClass="employee-table" />
    </div>
</asp:Content>
