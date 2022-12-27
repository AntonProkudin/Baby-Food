<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartSummary.ascx.cs" 
   Inherits="WebMarket.Controls.CartSummary" %>

<div id="cartSummary">
    <span class="caption">
        <b>В корзине:</b>
        <span id="csQuantity" runat="server"></span> товаров,
        <span id="csTotal" runat="server"></span>
    </span>
    <a id="csLink" runat="server"  style="font-size:20px;text-decoration:none; color:snow;margin-bottom:10px;">Перейти в корзину</a>
</div>