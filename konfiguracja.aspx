<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="konfiguracja.aspx.cs" Inherits="Projekt_zaliczeniowy.konfiguracja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- SqlData Source dla grupy #1 -->
    <asp:SqlDataSource ID="SData_grupy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Grupy] WHERE [Id_grupy] = @Id_grupy" InsertCommand="INSERT INTO [Grupy] ([Nazwa_grupy]) VALUES (@Nazwa_grupy)" SelectCommand="SELECT Id_grupy AS Id, Nazwa_grupy AS [Nazwa grupy] FROM [Grupy]" UpdateCommand="UPDATE [Grupy] SET [Nazwa_grupy] = @Nazwa_grupy WHERE [Id_grupy] = @Id_grupy">
        <DeleteParameters>
            <asp:Parameter Name="Id_grupy" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nazwa_grupy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nazwa_grupy" Type="String" />
            <asp:Parameter Name="Id_grupy" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- SqlData Source dla grupy #2 -->
    <asp:SqlDataSource ID="SData_grupy2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Grupy] WHERE ([Id_grupy] = @Id_grupy)" DeleteCommand="DELETE FROM [Grupy] WHERE [Id_grupy] = @Id_grupy" InsertCommand="INSERT INTO [Grupy]([Nazwa_grupy]) VALUES (@Nazwa_grupy)" UpdateCommand="UPDATE [Grupy] SET [Nazwa_grupy] = @Nazwa_grupy WHERE [Id_grupy] = @Id_grupy" OnSelecting="SData_grupy2_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Id_grupy" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nazwa_grupy" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id_grupy" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nazwa_grupy" />
            <asp:Parameter Name="Id_grupy" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- SqlData Source dla produktu #1 -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Produkty.Id_produktu, Produkty.Nazwa, Grupy.Nazwa_grupy AS Kategoria, Produkty.Id_grupy, Produkty.Producent, Produkty.Cena, Produkty.Opis, Produkty.Adres_www AS [Adres internetowy], Produkty.Stan_magazynu AS [Stan magazynu] FROM Produkty INNER JOIN Grupy ON Produkty.Id_grupy = Grupy.Id_grupy"></asp:SqlDataSource>

    <!-- SqlData Source dla produktu #2 -->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Produkty.Id_produktu, Produkty.Nazwa, Produkty.Id_grupy, Produkty.Producent, Produkty.Cena, Produkty.Opis, Produkty.Adres_www, Produkty.Stan_magazynu, Grupy.Nazwa_grupy FROM Grupy INNER JOIN Produkty ON Grupy.Id_grupy = Produkty.Id_grupy WHERE (Produkty.Id_produktu = @Id_produktu)" DeleteCommand="DELETE FROM Produkty WHERE Id_produktu = @Id_produktu" InsertCommand="INSERT INTO [Produkty] ([Nazwa], [Id_grupy], [Producent], [Cena], [Opis], [Adres_www], [Stan_magazynu]) VALUES (@Nazwa, @Id_grupy, @Producent, @Cena, @Opis, @Adres_www, @Stan_magazynu)" UpdateCommand="UPDATE [Produkty] SET [Nazwa] = @Nazwa, [Id_grupy] = @Id_grupy ,  [Producent] = @Producent, [Cena] = @Cena, [Opis] = @Opis, [Adres_www] = @Adres_www, [Stan_magazynu] = @Stan_magazynu WHERE [Id_produktu] = @Id_produktu" OnSelecting="SqlDataSource2_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Id_produktu" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nazwa" />
            <asp:Parameter Name="Id_grupy" />
            <asp:Parameter Name="Producent" />
            <asp:Parameter Name="Cena" />
            <asp:Parameter Name="Opis" />
            <asp:Parameter Name="Adres_www" />
            <asp:Parameter Name="Stan_magazynu" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" Name="Id_produktu" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nazwa" />
            <asp:Parameter Name="Id_grupy" />
            <asp:Parameter Name="Producent" />
            <asp:Parameter Name="Cena" />
            <asp:Parameter Name="Opis" />
            <asp:Parameter Name="Adres_www" />
            <asp:Parameter Name="Stan_magazynu" />
            <asp:Parameter Name="Id_produktu" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <!-- SQL DLA LISTY -->
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id_grupy], [Nazwa_grupy] FROM [Grupy]"></asp:SqlDataSource>

    <!-- SQL DLA USERS -->
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [Id_user] = @Id_user" InsertCommand="INSERT INTO [Users] ([Imie], [Nazwisko], [Login], [Password], [Email], [Admin]) VALUES (@Imie, @Nazwisko, @Login, @Password, @Email, @Admin)" SelectCommand="SELECT Id_user AS [ID user], Imie, Nazwisko, Login, Password, Email, Admin FROM Users" UpdateCommand="UPDATE [Users] SET [Imie] = @Imie, [Nazwisko] = @Nazwisko, [Login] = @Login, [Password] = @Password, [Email] = @Email, [Admin] = @Admin WHERE [Id_user] = @Id_user">
        <DeleteParameters>
            <asp:Parameter Name="Id_user" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Imie" Type="String" />
            <asp:Parameter Name="Nazwisko" Type="String" />
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Admin" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Imie" Type="String" />
            <asp:Parameter Name="Nazwisko" Type="String" />
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Admin" Type="Boolean" />
            <asp:Parameter Name="Id_user" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- SQL DLA USERS 2 -->
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [Id_user] = @Id_user" InsertCommand="INSERT INTO [User]([Imie], [Nazwisko], [Login], [Password], [Email], [Admin]) VALUES (@Imie, @Nazwisko, @Login, @Password, @Email, @Admin)" SelectCommand="SELECT * FROM [Users] WHERE ([Id_user] = @Id_user)" UpdateCommand="UPDATE [Users] SET [Imie] = @Imie, [Nazwisko] = @Nawisko, [Login] = @Login, [Password] = @Password, [Email] = @Email, [Admin] = @Admin WHERE [Id_user] = @Id_user" OnSelecting="SqlDataSource5_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Id_user" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Imie" />
            <asp:Parameter Name="Nazwisko" />
            <asp:Parameter Name="Login" />
            <asp:Parameter Name="Password" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="Admin" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView3" Name="Id_user" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Imie" />
            <asp:Parameter Name="Nawisko" />
            <asp:Parameter Name="Login" />
            <asp:Parameter Name="Password" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="Admin" />
            <asp:Parameter Name="Id_user" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <div class="d-flex justify-content-center pb-5">
        <div class="col-md-12 text-center">
            <!-- Buttony -->
            <asp:Button class="btn btn-outline-secondary mr-1" ID="Button1" runat="server" Text="Edycja grup" Height="45px" OnClick="Button1_Click" Width="200px" />
            <asp:Button class="btn btn-outline-secondary mr-1" ID="Button2" runat="server" Text="Edycja produktów" Height="45px" OnClick="Button2_Click" Width="200px" />
            <asp:Button class="btn btn-outline-secondary" ID="Button3" runat="server" Text="Edycja uzytkowników" Height="45px" OnClick="Button3_Click" Width="200px" />
            <!-- Panel edycji grupy -->
            <asp:Panel ID="Panel_grupy" runat="server" Visible="false">
                <div class="border border-dark justify-content-center p-2">
                    <h4>Panel edycji tabeli: <u>Grupy</u></h4>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SData_grupy" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Nazwa grupy" HeaderText="Nazwa grupy" SortExpression="Nazwa grupy" />
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
                    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="190px" AutoGenerateRows="False" DataKeyNames="Id_grupy" DataSourceID="SData_grupy2" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="Id_grupy" HeaderText="Id_grupy" SortExpression="Id_grupy" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Nazwa_grupy" HeaderText="Nazwa_grupy" SortExpression="Nazwa_grupy" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                    </asp:DetailsView>
                </div>
            </asp:Panel>

            <!-- Panel edycji produkty -->
            <asp:Panel ID="Panel_produkty" runat="server" Visible="false">
                <div class="border border-dark justify-content-center p-2">
                    <h4>Panel edycji tabeli: <u>Produkty</u></h4>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="Id_produktu" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                            <asp:BoundField DataField="Kategoria" HeaderText="Kategoria" SortExpression="Kategoria" />
                            <asp:BoundField DataField="Producent" HeaderText="Producent" SortExpression="Producent" />
                            <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                            <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                            <asp:BoundField DataField="Adres internetowy" HeaderText="Adres internetowy" SortExpression="Adres internetowy" />
                            <asp:BoundField DataField="Stan magazynu" HeaderText="Stan magazynu" SortExpression="Stan magazynu" />
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

                    <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="Id_produktu" DataSourceID="SqlDataSource2" GridLines="Horizontal">
                        <EditItemTemplate>
                            Id produktu:
                            <asp:Label ID="Id_produktuLabel1" runat="server" Text='<%# Eval("Id_produktu") %>' />
                            <br />
                            Nazwa:
                            <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                            <br />
                            Id grupy:
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nazwa_grupy" DataValueField="Id_grupy" SelectedValue='<%# Bind("Id_grupy", "{0}") %>'>
                            </asp:DropDownList>
                            <br />
                            Producent:
                            <asp:TextBox ID="ProducentTextBox" runat="server" Text='<%# Bind("Producent") %>' />
                            <br />
                            Cena:
                            <asp:TextBox ID="CenaTextBox" runat="server" Text='<%# Bind("Cena") %>' />
                            <br />
                            Opis:
                            <asp:TextBox ID="OpisTextBox" runat="server" Text='<%# Bind("Opis") %>' />
                            <br />
                            Adres www:
                            <asp:TextBox ID="Adres_wwwTextBox" runat="server" Text='<%# Bind("Adres_www") %>' />
                            <br />
                            Stan magazynu:
                            <asp:TextBox ID="Stan_magazynuTextBox" runat="server" Text='<%# Bind("Stan_magazynu") %>' />
                            <br />
                            Nazwa grupy:
                            <asp:TextBox ID="Nazwa_grupyTextBox" runat="server" Text='<%# Bind("Nazwa_grupy") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            Nazwa:
                            <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                            <br />
                            Id grupy:
                            <br />
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nazwa_grupy" DataValueField="Id_grupy" SelectedValue='<%# Bind("Id_grupy", "{0}") %>'>
                            </asp:DropDownList>
                            <br />
                            Producent:
                            <asp:TextBox ID="ProducentTextBox" runat="server" Text='<%# Bind("Producent") %>' />
                            <br />
                            Cena:
                            <asp:TextBox ID="CenaTextBox" runat="server" Text='<%# Bind("Cena") %>' />
                            <br />
                            Opis:
                            <asp:TextBox ID="OpisTextBox" runat="server" Text='<%# Bind("Opis") %>' />
                            <br />
                            Adres www:
                            <asp:TextBox ID="Adres_wwwTextBox" runat="server" Text='<%# Bind("Adres_www") %>' />
                            <br />
                            Stan magazynu:
                            <asp:TextBox ID="Stan_magazynuTextBox" runat="server" Text='<%# Bind("Stan_magazynu") %>' />
                            <br />
                            Nazwa grupy:
                            <asp:TextBox ID="Nazwa_grupyTextBox" runat="server" Text='<%# Bind("Nazwa_grupy") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Wstaw" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            Id produktu:
                            <asp:Label ID="Id_produktuLabel" runat="server" Text='<%# Eval("Id_produktu") %>' />
                            <br />
                            Nazwa:
                            <asp:Label ID="NazwaLabel" runat="server" Text='<%# Bind("Nazwa") %>' />
                            <br />
                            Id grupy:
                            <asp:Label ID="Id_grupyLabel" runat="server" Text='<%# Bind("Id_grupy") %>' />
                            <br />
                            Producent:
                            <asp:Label ID="ProducentLabel" runat="server" Text='<%# Bind("Producent") %>' />
                            <br />
                            Cena:
                            <asp:Label ID="CenaLabel" runat="server" Text='<%# Bind("Cena") %>' />
                            <br />
                            Opis:
                            <asp:Label ID="OpisLabel" runat="server" Text='<%# Bind("Opis") %>' />
                            <br />
                            Adres www:
                            <asp:Label ID="Adres_wwwLabel" runat="server" Text='<%# Bind("Adres_www") %>' />
                            <br />
                            Stan magazynu:
                            <asp:Label ID="Stan_magazynuLabel" runat="server" Text='<%# Bind("Stan_magazynu") %>' />
                            <br />
                            Nazwa grupy:
                            <asp:Label ID="Nazwa_grupyLabel" runat="server" Text='<%# Bind("Nazwa_grupy") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nowy" />
                        </ItemTemplate>
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                    </asp:FormView>

                </div>
            </asp:Panel>

            <!-- Panel edycji users -->
            <asp:Panel ID="Panel_uzytkownicy" runat="server" Visible="false">
                <div class="border border-dark justify-content-center p-2">
                    <h4>Panel edycji tabeli: <u>Użytkownicy</u></h4>
                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" DataKeyNames="ID user" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:CheckBoxField DataField="Admin" HeaderText="Admin" SortExpression="Admin" />
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

                    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Id_user" DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="Id_user" HeaderText="Id_user" InsertVisible="False" ReadOnly="True" SortExpression="Id_user" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:CheckBoxField DataField="Admin" HeaderText="Admin" SortExpression="Admin" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:DetailsView>

                </div>
            </asp:Panel>
        </div>
    </div>


</asp:Content>
