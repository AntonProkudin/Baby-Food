<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="WebMarket.Pages.Admin.Items"
    MasterPageFile="~/Pages/Admin/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" ItemType="WebMarket.Models.Item" SelectMethod="GetItems"
        DataKeyNames="ItemId" UpdateMethod="UpdateItem" DeleteMethod="DeleteItem"
        InsertMethod="InsertItem" InsertItemPosition="LastItem" EnableViewState="false"
        runat="server">
        <LayoutTemplate>
            <div class="outerContainer">
                <table id="productsTable">
                    <tr>
                        <th>Название товара</th>
                        <th>Описание</th>
                        <th>Категория</th>
                        <th>Цена</th>
                        <th>Картинка</th>
                    </tr>
                    <tr runat="server" id="itemPlaceholder"></tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Name %></td>
                <td class="description"><span><%# Item.Description %></span></td>
                <td><%# Item.Category %></td>
                <td><%# Item.Price.ToString("c") %></td>
                <td><%# Item.ImageUrl %></td>
                <td>
                    <asp:Button Style="  margin-bottom: 10px;margin-left: 10px; background-color: #4494F1;border-radius: 5px;border: 0px;cursor: pointer;color: white;width:100px;" ID="Button1" CommandName="Edit" Text="Изменить" runat="server" />
                    <asp:Button Style="  margin-bottom: 10px;margin-left: 10px; background-color: #4494F1;border-radius: 5px;border: 0px;cursor: pointer;color: white;width:100px;" ID="Button2" CommandName="Delete" Text="Удалить" runat="server" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <input name="name" value="<%# Item.Name %>" />
                    <input type="hidden" name="ProductID" value="<%# Item.ItemId %>" />
                </td>
                <td>
                    <input name="description" value="<%# Item.Description %>" /></td>
                <td>
                    <input name="category" value="<%# Item.Category %>" /></td>
                <td>
                    <input name="price" value="<%# Item.Price %>" /></td>
                <td>
                    <input name="url" value="<%# Item.ImageUrl %>" /></td>
                <td>
                    <asp:Button Style="  margin-bottom: 10px;margin-left: 10px; background-color: #4494F1;border-radius: 5px;border: 0px;cursor: pointer;color: white;width:100px;" ID="Button3" CommandName="Update" Text="Обновить" runat="server" />
                    <asp:Button Style="  margin-bottom: 10px;margin-left: 10px; background-color: #4494F1;border-radius: 5px;border: 0px;cursor: pointer;color: white;width:100px;" ID="Button4" CommandName="Cancel" Text="Отмена" runat="server" />
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr>
                <td>
                    <input name="name" />
                    <input type="hidden" name="ProductID" value="0" />
                </td>
                <td>
                    <input name="description" /></td>
                <td>
                    <input name="category" /></td>
                <td>
                    <input name="price" /></td>
                <td>
                    <input name="ImageUrl" /></td>
                <td>
                    <asp:Button Style="  margin-bottom: 10px;margin-left: 10px; background-color: #4494F1;border-radius: 5px;border: 0px;cursor: pointer;color: white;width:100px;" ID="Button5" CommandName="Insert" Text="Вставить" runat="server" />
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>