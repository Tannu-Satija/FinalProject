<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Charts.aspx.cs" Inherits="Project.Charts" MasterPageFile="~/Home.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .charts-container {
            margin-left: 200px; /* to avoid overlapping with sidebar */
            padding: 30px;
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .chart-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 450px;
            min-height: 400px;
        }

        .chart-box h3 {
            text-align: center;
            margin-bottom: 15px;
            font-size: 18px;
            color: #333;
        }

        canvas {
            width: 100% !important;
            height: auto !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hidden Fields -->
    <asp:HiddenField ID="hfEmployeeNames" runat="server" />
    <asp:HiddenField ID="hfEmployeeSalaries" runat="server" />
    <asp:HiddenField ID="hfDepartmentNames" runat="server" />
    <asp:HiddenField ID="hfDepartmentAverages" runat="server" />

    <div class="charts-container">
        <div class="chart-box">
            <h3>Employee Salary Distribution</h3>
            <canvas id="pieChart"></canvas>
        </div>

        <div class="chart-box">
            <h3>Average Salary by Department</h3>
            <canvas id="barChart"></canvas>
        </div>
    </div>

    <script>
        window.onload = function () {
            const empNames = JSON.parse(document.getElementById('<%= hfEmployeeNames.ClientID %>').value || "[]");
            const empSalaries = JSON.parse(document.getElementById('<%= hfEmployeeSalaries.ClientID %>').value || "[]");
            const deptNames = JSON.parse(document.getElementById('<%= hfDepartmentNames.ClientID %>').value || "[]");
            const deptAverages = JSON.parse(document.getElementById('<%= hfDepartmentAverages.ClientID %>').value || "[]");

            new Chart(document.getElementById('pieChart'), {
                type: 'pie',
                data: {
                    labels: empNames,
                    datasets: [{
                        label: 'Salary',
                        data: empSalaries,
                        backgroundColor: [
                            '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0',
                            '#9966FF', '#FF9F40', '#C9CBCF', '#8E44AD',
                            '#2ECC71', '#E67E22'
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });

            new Chart(document.getElementById('barChart'), {
                type: 'bar',
                data: {
                    labels: deptNames,
                    datasets: [{
                        label: 'Average Salary',
                        data: deptAverages,
                        backgroundColor: '#36A2EB'
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    </script>
</asp:Content>
