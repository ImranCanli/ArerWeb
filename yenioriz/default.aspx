<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="yenioriz._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title></title>
    <style type="text/css">
         .auto-style3 {
            text-align: right;
            height: 36px;
        }
        .auto-style4 {
            text-align: left;
            height: 36px;
        }
        .auto-style5 {
            text-align: right;
            color: #FFFFFF;
        }
        .auto-style8 {
            font-size: 15pt;
            font-family: calibri;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            margin-top: 5px;
        }
        .auto-style10 {
            text-align: center;
            font-family: "Berlin Sans FB";
            font-size: 10pt;
            height: 91px;
        }
        .footer{
            background-color:#f1f1f1;
            color:black;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.9);
            font-size:small;
            width:100%;
            z-index:980;
            position:fixed;
            bottom:0;
            left:0;
            padding:10px;
            padding-bottom:10px;
        }
        .baslik{
            background-color:#f1f1f1;
            color:#171c26;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.9);
            top:0;
            left:0;
            height:45px;
            width:100%;
            position:sticky;
            z-index:980;
            font-family:'Arial Black';
            font-weight:bold;
            font-size:14pt;
            padding-bottom:20px;
            padding-top:15px;
        }
        .auto-style12 {
            height: 39px;
        }
        .auto-style13 {
            text-align: left;
            height: 39px;
        }
        .auto-style15 {
            text-align: right;
            font-size: 14pt;
        }
        .auto-style16 {
            font-size: 14pt;
            font-weight: bold;
            color:#f87c1d;
        }
        .container {
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.9);
          padding:20px;
          width:80%;
          background-color: #ffffff;
          align-items: center;
          justify-content: center;
          border-radius:8px;
        }

        .checkbx{
            margin: auto;
            text-align: center;
        }

.centered-content {

}

.centered-image {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: -1;

}
body, html {
  margin: 0;
  padding: 0;
  height: 100%;
  overflow: hidden;
}
    </style>
</head>
<body style ="background-color :#2a3346">

         <div class="baslik" style="left:0; width:100%;" align="center">
      <span style="font-size:14pt; font-weight:bold">ARER KONTROL MOBİLE YÖNETİM SİSTEMİ (1.0)</span> 
    </div>
    <form id="form1" runat="server">
<%--        <div>
            <table style="width:100%">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Button" />
                        <br />
                        test deneme</td>
                </tr>
            </table>
        </div>--%>


    <div class="container" style="background-color:white">
      <div align="center" style="width:100%; background-color:white;">
                  <table style="width:100%; margin-bottom:10px;">
                <tr style="width:100%;">
                    <%--<td align="left" style="padding-left:15px;"><span class="auto-style16" style="font-size:13pt;">Kullanıcı Adı:</span></td>--%>
                    <td align="center"> <asp:TextBox ID="TextBox1" runat="server" Width="270px" Font-Bold="true" Height="30px" placeholder="Kullanıcı Adı"></asp:TextBox></td>
                </tr>
                </table>
            <table style="width:100%; margin-bottom:30px;">
                <tr>
                    <%--<td align="center" style="width:40%;"> <span class="auto-style16">Parola:</span></td>--%>
                    <td align="center"> <asp:TextBox ID="TextBox2" runat="server" Width="270px" Font-Bold="true" Height="30px" placeholder="Şifre" type="password"></asp:TextBox></td>
                </tr>
            </table>
          <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Text="Kişisel verilerin korunması kanunu kapsamındaki hususları onaylıyorum." CssClass="checkbx"></dx:ASPxCheckBox>
      <table style="width:100%;">
          <tr>
              <td align="center">
                  <%--<dx:ASPxButton ID="ASPxButton1" runat="server" Text="SİSTEME GİRİŞ" Width="250px" Font-Bold="True" Height="22px" BackColor ="white" ForeColor="#f87c1d" CssClass="auto-style8" Font-Names="calibri" Font-Size="17pt" OnClick="ASPxButton1_Click"></dx:ASPxButton>--%>
                  <dx:ASPxButton ID="ASPxButton2" runat="server" Text="SİSTEME GİRİŞ" Width="250px" Font-Bold="True" Height="22px" BackColor ="#171c26" ForeColor="white" CssClass="auto-style8" Font-Names="calibri" Font-Size="17pt" OnClick="ASPxButton1_Click"></dx:ASPxButton>
              </td>
          </tr>
      </table>
          <table style="width:100%" align="center">
              <tr style="width:100%" align="center">
                  <td align="center">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Lütfen onay veriniz." Font-Size="9pt" ForeColor="red" Visible="false" Font-Bold="true">
        </dx:ASPxLabel>
                  </td>
              </tr>
          </table>
          </div>
  </div>

    </form>
    <div class="footer">
        <table style="width:100%;">
            <tr>
                <td align="center"> © 2013 ARER Control&nbsp; www.arerotomasyon.com</td>
            </tr>
        </table>
    </div>
</body>
</html>