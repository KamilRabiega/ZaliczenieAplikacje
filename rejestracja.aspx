<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rejestracja.aspx.cs" Inherits="Projekt_zaliczeniowy.rejestracja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-5">
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
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Wprowadź adres e-mail:&nbsp;"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Wprowadź swoje imię:&nbsp;"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Wprowadź swoje nazwisko:&nbsp;"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>

                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <div class="col-md-12 text-center">
            <asp:Button ID="Button1" runat="server" Text="Zarejestruj się" OnClick="Button1_Click" /><asp:Button ID="Button2" runat="server" Text="Anuluj" OnClick="Button2_Click" /><br />
            <span>Posiadasz już konto?&nbsp;<a href="logowanie.aspx">Zaloguj się</a>!</span><br />
            <asp:Label ID="LabelError" runat="server" Visible="False" ForeColor="Red"></asp:Label>
        </div>
    </div>

</asp:Content>
