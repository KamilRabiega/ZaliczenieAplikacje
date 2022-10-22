<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cennik.aspx.cs" Inherits="Projekt_zaliczeniowy.cennik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- SQL Source dla kategorii -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id_grupy, Nazwa_grupy AS [Wybierz kategorie] FROM Grupy"></asp:SqlDataSource>

    <!-- SQL Source dla wyswietlenia -->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id_produktu], [Nazwa], [Producent], [Cena], [Opis], [Adres_www] AS [Strona internetowa], [Stan_magazynu] AS Stan FROM [Produkty] WHERE [Id_grupy] = @Id_grupy">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id_grupy" PropertyName="SelectedValue" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>

    <!-- SQL Source dla wyszukiwania -->
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id_produktu], [Nazwa], [Producent], [Cena], [Opis], [Adres_www] AS [Strona internetowa], [Stan_magazynu] AS Stan FROM [Produkty] WHERE (Nazwa LIKE @szukany + '%') AND (Cena BETWEEN @cenaod AND @cenado)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="szukany" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" DefaultValue="0" Name="cenaod" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" DefaultValue="100000" Name="cenado" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>


    <!-- Dla textboxa -->


    <div class="col-md-12 text-center">
        <div class="pb-1">
            <asp:Label ID="Label1" runat="server" Text="Wprowadź nazwę produktu aby wyszukać:&nbsp;"></asp:Label>
            <asp:TextBox ID="TextBox1" name="szukajW" runat="server" placeHolder="Nazwa szukanego produktu.." Width="234px"></asp:TextBox>
            <asp:Label ID="LabelError" runat="server" Text="Label" ForeColor="Red" Visible="false"></asp:Label><br />
        </div>
        <div class="pb-1">
            <asp:Label ID="Label2" runat="server" Text="Podaj zakres cenowy:&nbsp;"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" placeHolder="Cena od.."></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" placeHolder="Cena do.."></asp:TextBox><br />
         </div>
        <asp:Button class="btn btn-outline-secondary mr-1" ID="Button1" runat="server" Text="Wyszukaj" OnClick="Button1_Click" />
        
    </div>
    </div><div class="d-flex justify-content-center pt-2">

        <div class="col-md-2 text-center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_grupy" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Wybierz kategorie" HeaderText="Wybierz kategorie" SortExpression="Wybierz kategorie" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        <div class="col-md-10 text-center">
            <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_produktu" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                        <asp:BoundField DataField="Producent" HeaderText="Producent" SortExpression="Producent" />
                        <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                        <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                        <asp:BoundField DataField="Strona internetowa" HeaderText="Strona internetowa" SortExpression="Strona internetowa" />
                        <asp:BoundField DataField="Stan" HeaderText="Stan" SortExpression="Stan" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

            </asp:Panel>


            <br />
            <asp:Panel ID="Panel2" runat="server">
                <asp:GridView ID="GridView3" runat="server" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </asp:Panel>

            <br />
            <br />
            <br />
            <br />

        </div>
</asp:Content>
