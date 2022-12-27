<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartView.aspx.cs" Inherits="WebMarket.Pages.CartView"
    MasterPageFile="~/Pages/Store.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="bodyContent" runat="server">

    
    <div class="cartview">
            <h2>Ваша корзина: </h2>
        <table id="cartTable">
            <tbody>
                <asp:Repeater ID="Repeater1" ItemType="WebMarket.Models.CartLine"
                    SelectMethod="GetCartLines" runat="server" EnableViewState="false">
                    <ItemTemplate>
                        <tr>
                            <td><img src="<%# Item.Item.ImageUrl %>"></td>
                            <td>
                                <h3><%# Item.Item.Name %></h3>
                                <%# Item.Item.Category %>
                            </td>

                            <td><%# Item.Quantity%> шт</td>
                            
                            
                            <td><%# Item.Item.Price.ToString("c")%> за шт</td>
                            <td><%# ((Item.Quantity * 
                                Item.Item.Price).ToString("c"))%></td>
                            <td>
                            <div class="buttton">
                                <button style="background-color:white; color:#4494F1; border-radius:10px; border-width: 0px ; font-size:100%" type="submit" class="actionButtons" name="remove"
                                    value="<%#Item.Item.ItemId %>">
                                X</button>
                            </div>
                            </td>
                        </tr>        
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="1">Итого:</th>
                    <th><%= CartTotal.ToString("c") %></th>
                </tr>
            </tfoot>
        </table>
         <a  style="font-size:20px;text-decoration:none; color:#4494F1;margin-left:10px;margin-bottom:10px;" href ="<%= ReturnUrl %>">Продолжить покупки</a>
            <a style="font-size:20px;text-decoration:none;color:#4494F1;margin-left:30px;margin-bottom:10px;" href="<%= CheckoutUrl %>">Оформить заказ</a>
    </div>  
</asp:Content>