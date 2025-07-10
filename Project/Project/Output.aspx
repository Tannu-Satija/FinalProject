<%@ Page Title="Output" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Output.aspx.cs" Inherits="Project.Output" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .output-container {
            padding: 30px;
            margin-left: 200px; /* space for sidebar */
            font-family: 'Segoe UI', sans-serif;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .grid-style {
            width: 80%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .grid-style th, .grid-style td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .grid-style th {
            background-color: #f4f4f4;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="output-container">
        <h2>Departments with Average Salary Above Overall Average</h2>
        <asp:GridView ID="GridView1" runat="server" CssClass="grid-style" AutoGenerateColumns="true" />
    </div>
</asp:Content>
