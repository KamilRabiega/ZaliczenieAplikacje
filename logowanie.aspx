<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="logowanie.aspx.cs" Inherits="Projekt_zaliczeniowy.logowanie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="col-md-4 text-center">
        <table>
            <tbody>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Wprowadź login:&nbsp;"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Wprowadź hasło:&nbsp;"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" type="password"></asp:TextBox>

                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Zaloguj się" OnClick="Button1_Click" /><asp:Button ID="Button2" runat="server" Text="Anuluj" OnClick="Button2_Click" /><br />
        <span>Nie posiadasz jeszcze konta?&nbsp;<a href="rejestracja.aspx">Zarejestruj się</a>!</span><br />
        <asp:Label ID="LabelError" runat="server" Visible="False" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
