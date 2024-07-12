<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="yenioriz.oriz.anasayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet' />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <title></title>
    <style>
        @font-face {
            font-family: 'poppins-bold';
            src: url('../fonts/poppins-bold.ttf') format('truetype');
        }

        @font-face {
            font-family: 'poppins-regular';
            src: url('../fonts/poppins-regular.ttf') format('truetype');
        }

        .anacontainer {
            width: 100%;
            margin: 0;
            padding: 0;
            display: grid;
            position: relative;
            left: 0;
            grid-template-columns: repeat(6, 1fr);
            padding-top: 1px;
            background-color: #f1f1f1;
            margin-bottom: 80px;
        }

        .icdiv {
            align-items: center;
            justify-content: center;
            width: 98%;
            height: auto;
            min-height: 19vh;
            margin: 2px 0px;
            display: flex;
            background-color: white;
            min-width: 80px;
            position: relative;
        }

        .ustanacontainer {
            width: 100%;
            padding: 0;
            display: grid;
            position: relative;
            top: 0;
            left: 0;
            margin-bottom: 1px;
            grid-template-columns: repeat(4, 1fr);
            padding-bottom: 1px;
            background-color: #f1f1f1;
        }

        .anaicdiv {
            width: 99%;
            height: 23vh;
            background-color: white;
            margin: 1px;
            min-width: 190px;
            padding: 0;
            display: grid;
            grid-template-columns: repeat(1, 1fr);
        }

        body {
            padding: 0;
            margin: 0;
            background-color: #f1f1f1;
            box-sizing: border-box;
            align-items: center;
            overflow-x: hidden;
        }

            body::-webkit-scrollbar {
                display: none;
            }

        .baslik {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            top: 0;
            left: 0;
            position: absolute;
            font-weight: bold;
            padding: 5px;
            font-family: poppins-bold;
            font-size: small;
        }

        .subdiv {
            display: none;
        }

        .subdivyeni {
            display: none;
        }

        .fab {
            position: fixed;
            cursor: pointer;
            width: 45px;
            height: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5px;
            right: 20px;
            bottom: 20px;
            background-color: #171c26;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            color: white;
            font-weight: bold;
            font-size: 35px;
        }

            .fab:hover {
                background-color: #1d3c3c;
            }

        .menuikonu {
            font-size: 32px;
            cursor: pointer;
        }

        .filterr {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            width: 20%;
            position: fixed;
            padding: 5px;
            bottom: 20px;
            left: 20px;
        }

        .duran {
            border-radius: 10px;
            width: 90px;
            padding: 5px;
            height: 45px;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
            background-color: #171c26;
            cursor: pointer;
            text-align: center;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: poppins-regular;
            margin: 0 5px;
            text-decoration: none;
        }

        .yeniicdiv {
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        .makineborder {
            border: 2px solid #ff6d24;
        }

        #main-button2 {
            position: fixed;
            bottom: 30px;
            left: 160px;
            padding: 10px;
            border-radius: 10px;
            z-index: 10;
            background-color: #171c26;
            color: white;
            font-family: poppins-bold;
            text-align: center;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
            padding: 5px;
            font-size: small;
            width: 100px;
            height: 40px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            box-sizing: border-box;
        }

            #main-button2:hover {
                background-color: #1d3c3c;
            }

            #main-button2.active2 {
                border: 4px solid #ff6d24;
            }

        #sub-buttons2 {
            position: fixed;
            bottom: 70px;
            left: 155px;
            display: none;
            flex-direction: column;
        }

        .sub-button2 {
            margin: 5px;
            padding: 10px;
            border: none;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
            background-color: #171c26;
            color: white;
            font-family: poppins-regular;
            font-size: small;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100px;
            height: 40px;
            border-radius: 10px;
            cursor: pointer;
        }

            .sub-button2:hover {
                background-color: #1d3c3c;
            }

        #main-button {
            position: fixed;
            bottom: 30px;
            left: 40px;
            padding: 10px;
            border-radius: 10px;
            z-index: 10;
            background-color: #171c26;
            color: white;
            font-family: poppins-bold;
            text-align: center;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
            padding: 5px;
            font-size: small;
            width: 100px;
            height: 40px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            box-sizing: border-box;
        }

            #main-button:hover {
                background-color: #1d3c3c;
            }

            #main-button.active {
                border: 4px solid #ff6d24;
            }


        #sub-buttons {
            position: fixed;
            bottom: 70px;
            left: 35px;
            display: none;
            flex-direction: column;
        }

        .sub-button {
            margin: 5px;
            padding: 10px;
            border: none;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
            background-color: #171c26;
            color: white;
            font-family: poppins-regular;
            font-size: small;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100px;
            height: 40px;
            border-radius: 10px;
            cursor: pointer;
        }

            .sub-button:hover {
                background-color: #1d3c3c;
            }

        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 10002;
            background: rgba(0, 0, 0, 0.7);
            opacity: 0;
            transition: opacity 0.3s ease;
            overflow-x: hidden;
            box-sizing:border-box;
        }

        .popup-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.7);
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            max-width: 700px;
            width: 100%;
            text-align: center;
            z-index: 10002;
            opacity: 0;
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .close-btn {
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
            font-family: poppins-bold;
        }

        .altpopup {
            padding: 15px 10px;            
            position: fixed;
            bottom: -60%;
            width: 100%;
            height: 45vh;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            background-color: white;
            transition: ease all .3s;
            left: 0;
            z-index: 10002;
            overflow-y:scroll;
            scroll-snap-type: none;
            box-sizing: border-box;
        }

        .open {
            bottom: 0;
        }

        .altpopup::-webkit-scrollbar {
            display: none;
        }

        .altpopupici {
            width: 100%;
            overflow-y: scroll;
            border-radius: 8px;
        }

            .altpopupici::-webkit-scrollbar {
                display: none;
            }

        .repbuton {
            display: none;
            width: 85px;
            height: 30px;
            padding: 5px;
            border-radius: 8px;
            background-color: forestgreen;
            color: white;
            font-family: poppins-bold;
            border: none;
            outline: none;
            cursor: pointer;
            text-align: center;
            font-size: small;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        .acildi{
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .devirbutoniptal{
            width: 125px;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 50px;
            padding: 0;
            border-radius: 8px;
            background-color: red;
            color: white;
            font-family: poppins-bold;
            border: none;
            outline: none;
            cursor: pointer;
            text-align: center;
            font-size: medium;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        .devirbutoniptal:hover{
            background-color: darkred;
        }

        .devirbuton{
            width: 125px;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 50px;
            padding: 0;
            border-radius: 8px;
            background-color: forestgreen;
            color: white;
            font-family: poppins-bold;
            border: none;
            outline: none;
            cursor: pointer;
            text-align: center;
            font-size: medium;
        }
        .devirbuton:hover{
            background-color: darkgreen;
        }

        .divforpersonel {
            display: flex;
            justify-content: space-between;
            font-family: poppins-bold;
            background-color: white;
            width: 95%;
            margin: 2px auto;
            padding: 5px;
            border-radius: 8px;
        }

        .subdivforpersonel {
            display: none;
        }

        .duranmakine{
            border-bottom: 8px solid #fcec16;
        }

        .tiklanandiv{
            cursor: pointer;
            margin: 5px;
            width: 40px;
            height: 40px;
            padding: 5px;
            box-sizing: border-box;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: large;
        }

        .vardiyavetarih{
            width: calc(100% - 82px);
            padding: 15px 40px;
            display: flex;
            left:-6px;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            background-color: #171c26;
            color: white;
            z-index: 20;
            top: 0;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
        }

        .projebasligi{
            top: 4vh; 
            position: sticky; 
            width: 98%; 
            height: 4vh; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            padding: 10px; 
            margin: auto; 
            margin-top: 10px; 
            color: white; 
            background-color:#171c26; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); 
            border-radius: 8px; 
            font-family: poppins-bold;
        }

        html{
            position: relative;
            left: -6px;
            padding-left: 12px;
        }

        @media only screen and (max-width: 1205px) {
            .ustanacontainer {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media only screen and (max-width: 1100px) {
            .anacontainer {
                grid-template-columns: repeat(5, 1fr);
            }
        }

        @media only screen and (max-width: 950px) {
            .anacontainer {
                grid-template-columns: repeat(4, 1fr);
            }

            .projebasligi{
                width: 97%;
            }
        }

        @media only screen and (max-width: 745px) {
            .ustanacontainer {
                grid-template-columns: repeat(1, 1fr);
            }

            .projebasligi{
                width: 96%;
            }
        }

        @media only screen and (max-width: 715px) {
            .anacontainer {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media only screen and (max-width: 650px) {
            .anaicdiv {
                height: 21vh;
                margin: 4px 0px;
            }
        }

        @media only screen and (max-width: 560px) {
            .anacontainer {
                grid-template-columns: repeat(2, 1fr);
            }

            .filterr {
                grid-template-columns: repeat(1, 1fr);
            }

            .duran {
                margin: 5px;
            }

            .projebasligi{
                width: 94%;
            }
        }

        @media only screen and (max-width: 390px) {
    
            .vardiyavetarih{
                font-size: small;
            }

        }

        *{
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

         <div class="vardiyavetarih">
            <asp:Label runat="server" style="font-family: poppins-bold;" ID="vardiyaturlabel"></asp:Label>
            <asp:Label runat="server" style ="font-family: poppins-bold;" ID="tarihlabel"></asp:Label>
        </div>
        <div class="projebasligi">
            ÖRGÜ İZLEME SİSTEMİ
        </div>

        <div class="ustanacontainer">
            <div class="anaicdiv">
                <label style="color: #454545; font-family: poppins-regular; font-size: 35px; margin: 15px;">GENEL VERİM</label>
                <asp:Label runat="server" ID="ortmakverimlabel" Style="font-family: poppins-bold; font-size: 40px; margin-left: 20px;"></asp:Label>
            </div>
            <div class="anaicdiv">
                <label style="color: #454545; font-family: poppins-regular; font-size: 35px; margin: 15px;">ÇALIŞAN MAK.</label>
                <asp:Label runat="server" ID="calisanmakineadetlabel" Style="font-family: poppins-bold; font-size: 40px; margin-left: 20px;"></asp:Label>
            </div>
            <div class="anaicdiv">
                <label style="color: #454545; font-family: poppins-regular; font-size: 35px; margin: 15px;">DURAN MAK.</label>
                <asp:Label runat="server" ID="duranmakineadetlabel" Style="font-family: poppins-bold; font-size: 40px; margin-left: 20px;"></asp:Label>
            </div>
            <div class="anaicdiv">
                <label style="color: #454545; font-family: poppins-regular; font-size: 35px; margin: 15px;">VARDİYA SÜRESİ</label>
                <asp:Label runat="server" ID="toplamuretimlabel" Style="font-family: poppins-bold; font-size: 40px; margin-left: 20px;"></asp:Label>
            </div>
        </div>
        <div class="anacontainer">
            <asp:Repeater runat="server" ID="Repeater1">
                <ItemTemplate>
                    <div class="icdiv">
                        <div class="baslik">
                            MAKİNE <%# Eval("makkod")%>
                        </div>

                        <div class="yeniicdiv">
                            <div class="subdiv">
                                <%# Eval("makverim")%>
                            </div>
                            <div class="subdiv">
                                <%# Eval("plansizdurus")%>
                            </div>
                        </div>

                        <div class="subdivyeni"><%# Eval("perkod")%></div>
                        <div class="subdivyeni"><%# Eval("makkod")%></div>
                        <div class="subdivyeni"><%# Eval("dev")%></div>
                        <div class="subdivyeni"><%# Eval("kimlik")%></div>
                        <div class="subdivyeni"><%# Eval("gecidurussay")%></div>
                        <div class="subdivyeni"><%# Eval("makad")%></div>
                        <div class="subdivyeni"><%# Eval("perisim")%></div>
                        <div style="position: absolute; bottom: 5px; margin: 0 auto; font-family: poppins-bold;">
                            <asp:Label runat="server" Style="z-index: 200;" ID="perisimlabel" Text='<%# (Eval("perisim").ToString().Length == 0 ? "Atanmadı" : (Eval("perisim").ToString().Length > 12 ? Eval("perisim").ToString().Substring(0, 9) + "..." : Eval("perisim").ToString())) %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <asp:HiddenField runat="server" ID="makkodgonder" />
        <asp:HiddenField runat="server" ID="kimlikgonder" />
        <asp:HiddenField runat="server" ID="perkodgonder" />
        <asp:HiddenField runat="server" ID="perisimgonder" />
        <asp:HiddenField runat="server" ID="devgonder" />
        <asp:HiddenField runat="server" ID="makadgonder" />
        <asp:HiddenField runat="server" ID="perkodonay" />
        <asp:HiddenField runat="server" ID="personelisimonay" />
        <asp:HiddenField runat="server" ID="vardiyaturutut" />

        <div class="popup-overlay" id="popupOverlay6" onclick="closePopup('popupOverlay6')">
            <div class="popup-container" id="popupContainer6" onclick="event.stopPropagation();" style="width: 120%;">
                <span class="close-btn" onclick="closePopup('popupOverlay6')">&times;</span>
                <h2 style="font-family: poppins-bold; margin: 10px 0 30px 0;">DEVİR ATA</h2>
                <div style="width: 95%; display: grid; margin: 0 auto; grid-template-columns: repeat(1, 1fr);">
                    <div style="width: 100%; display: grid; grid-template-columns: repeat(4, 1fr);">
                    </div>
                    <table style="width: 100%; margin: auto;">
                        <tr style="width: 100%;">
                            <td style="width: 30%; text-align: right;"><label style="font-family: poppins-regular; font-size: large">MAKİNE :&nbsp;</label></td>
                            <td style="width: 30%; text-align: left;"><label id="makinelabelfordevir" style="font-family: poppins-bold; font-size: large;"></label></td>
                            <td style="width: 20%; text-align: right;"><label style="font-family: poppins-regular; font-size: large;">DEVİR :&nbsp;</label></td>
                            <td style="width: 20%; text-align: left;"><label id="devirlabelfordevir" style="font-family: poppins-bold; font-size: large;"></label></td>
                        </tr>
                    </table>
                    <asp:TextBox runat="server" TextMode="Number" Style="width: 94%; height: 60px; margin: 20px auto; font-size: large; padding-left: 5px; font-family: poppins-regular; border-radius: 8px;" ID="devirentry" Placeholder="Devir girin..."></asp:TextBox>
                    <div style="width: 90%; margin: 10px auto; display: flex; justify-content: space-between; align-items: center;">
                        <a class="devirbutoniptal" onclick="closePopup('popupOverlay6')">İPTAL</a>
                        <asp:Button runat="server" ID="deviratamonaybuton" CssClass="devirbuton" Text="KAYDET" OnClick="deviratamonaybuton_Click"/>
                    </div>
                </div>
            </div>
        </div>

            <div class="popup-overlay" id="popupOverlay3" onclick="closePopup('popupOverlay3')">
                <div class="popup-container" id="popupContainer3" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay3')">&times;</span>
                    <h2 style="font-family: poppins-bold;">TARİH SEÇ</h2>
                    <div style="display: flex; align-items: center; justify-content:space-around; font-family: poppins-bold; padding: 0 15px; margin: 10px auto;">
                        <asp:TextBox ID="arsivdate" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 60%; height: 50px; border-radius: 5px; font-family: poppins-bold; margin: 10px 0; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                    <div style="display:flex; justify-content: space-around;">
                        <div class="tiklanandiv" id="tiklanandiv1" onclick="vardiyaSecildi('A', 'tiklanandiv1')">A</div>
                        <div class="tiklanandiv" id="tiklanandiv2" onclick="vardiyaSecildi('B', 'tiklanandiv2')">B</div>
                        <div class="tiklanandiv" id="tiklanandiv3" onclick="vardiyaSecildi('C', 'tiklanandiv3')">C</div>
                        </div>
                    </div>
                    <div style="width: 90%; margin: 10px auto; display: flex; justify-content: space-between; align-items: center;">
                        <a class="devirbutoniptal" onclick="closePopup('popupOverlay3')">İPTAL</a>
                        <asp:Button runat="server" ID="arsivsorgubuton" CssClass="devirbuton" Text="TAMAM" OnClick="arsivsorgubuton_Click"/>
                    </div>
                </div>
            </div>

        <div id="main-button">MENÜ</div>
        <div id="sub-buttons">
            <a class="sub-button" style="padding: 0;" onclick="openaltmenu()">PERSONEL ATA</a>
            <a class="sub-button" style="padding: 0;" onclick="openPopup('popupOverlay6')">DEVİR ATA</a>
            <a class="sub-button" style="padding: 0;" onclick="openPopup('popupOverlay3')">ARŞİV</a>
            <asp:Button runat="server" ID="durusatamaa" class="sub-button" Text="DURUŞ ATA" OnClick="durusatamaa_Click"/>
            <asp:Button runat="server" ID="onlinevardiyabuton" class="sub-button" Text="ONLİNE" OnClick="onlinevardiyabuton_Click"/>
        </div>

        <div id="main-button2">FİLTRE</div>
        <div id="sub-buttons2">
            <asp:Button runat="server" ID="calisanmakinefiltreyeni" Text="ÇALIŞAN" class="sub-button2" OnClick="calisanmakinefiltre_Click" />
            <asp:Button runat="server" ID="duranmakinefiltreyeni" Text="DURAN" class="sub-button2" OnClick="duranmakinefiltre_Click" />
            <asp:Button runat="server" ID="tummakinefiltreyeni" Text="TÜMÜ" class="sub-button2" OnClick="tummakinefiltre_Click" />
        </div>

        <div class="altpopup" id="altpopup">
            <span class="close-btn" onclick="closePopup('popupOverlay6')">&times;</span>
            <asp:Repeater runat="server" ID="Repeater2">
                <ItemTemplate>
                    <div class="altpopupici">
                        <div class="divforpersonel">
                            <div class="subdivforpersonel"><%# Eval("kartno")%></div>
                            <div class="subdivforpersonel"><%# Eval("ad")%><%# Eval("soyad")%></div>
                            <%# Eval("ad")%> <%# Eval("soyad")%>
                            <asp:Button runat="server" ID="personelatamabuton" CssClass="repbuton" Text="KAYDET" OnCommand="personelatamabuton_Command" CommandArgument='<%# $"{Eval("ad")} {Eval("soyad")},{Eval("kartno")}" %>'/>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="fab" onclick="scrollToTop()">
            <i class='bx bx-chevron-up'></i>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            function createGauge(elementId, value, durus, renkk) {
               
                var options = {
                    chart: {
                        height: 240,
                        type: 'radialBar',
                    },

                    series: [value],
                    labels: ['DURUŞ:' + durus + 'DK'],
                    plotOptions: {
                        radialBar: {
                            hollow: {
                                size: '35%',
                            },
                            dataLabels: {
                                name: {
                                    fontSize: '11px',
                                    style: {
                                        colors: '#F1F1F1',
                                    }
                                },
                                value: {
                                    fontSize: '20px',
                                    fontWeight: 'bold',
                                },
                            },
                        },
                    },
                    colors: renkk,
                    annotations: {
                        belowChart: {
                            text: 'Alt Başlık',
                            fontSize: '14px',
                            offsetY: -10,
                        },
                        aboveChart: {
                            text: 'Üst Başlık',
                            fontSize: '14px',
                            offsetY: 10,
                        },
                    },
                };

                var chart = new ApexCharts(document.getElementById(elementId), options);
                chart.render();
            }


            window.onload = function () {

                var repeateritems = document.getElementsByClassName('yeniicdiv');
                for (var j = 0; j < repeateritems.length; j++) {
                    repeateritems[j].id = "element_" + j;
                }


                var items = document.getElementsByClassName('yeniicdiv');

                for (var i = 0; i < items.length; i++) {

                    var subdivitem = items[i].getElementsByClassName('subdiv')[0];
                    var subdivitem2 = items[i].getElementsByClassName('subdiv')[1];

                    if (subdivitem && subdivitem2) {
                        var value = subdivitem.innerHTML;
                        var value2 = subdivitem2.innerHTML;
                        var colorr = ['#42d121'];

                        if (value < 70) {
                            colorr = ['#e61017'];
                        }
                        else if (value < 85) {
                            colorr = ['#f76116'];
                        }
                        createGauge(items[i].id, value, value2, colorr);
                    }
                    /*var value = items[i].innerHTML;*/

                    /*var altLabel = items[i].getElementsByClassName('altlabel')[0];*/
                    /*altLabel.textContent = 'Value: ' + value;*/
                }
            };

            document.addEventListener('DOMContentLoaded', function () {
                var makinedivs = document.getElementsByClassName('icdiv');
                var personeldivs = document.getElementsByClassName('divforpersonel');
                for (var i = 0; i < makinedivs.length; i++) {

                    var onlinedurus = makinedivs[i].getElementsByClassName('subdivyeni')[4].innerText;

                    if (onlinedurus > 3) {
                        makinedivs[i].classList.add('duranmakine');
                    }

                    makinedivs[i].addEventListener('click', function () {

                        var allMakinedivs = document.getElementsByClassName('icdiv');
                        for (var j = 0; j < allMakinedivs.length; j++) {
                            allMakinedivs[j].classList.remove('makineborder');
                        }

                        this.classList.add('makineborder');

                        var makineadi = this.getElementsByClassName('subdivyeni')[5].innerText;
                        var devirdegeri = this.getElementsByClassName('subdivyeni')[2].innerText;

                        document.getElementById('makkodgonder').value = this.getElementsByClassName('subdivyeni')[1].innerText;
                        document.getElementById('makadgonder').value = makineadi;
                        document.getElementById('perisimgonder').value = this.getElementsByClassName('subdivyeni')[6].innerText;
                        document.getElementById('kimlikgonder').value = this.getElementsByClassName('subdivyeni')[3].innerText;
                        document.getElementById('devgonder').value = devirdegeri;
                        document.getElementById('perkodgonder').value = this.getElementsByClassName('subdivyeni')[0].innerText;

                        document.getElementById('makinelabelfordevir').innerText = makineadi;
                        document.getElementById('devirlabelfordevir').innerText = devirdegeri;
                        //var onlinedurus = this.getElementsByClassName('subdivyeni')[4].innerText;

                        //if (onlinedurus > 3) {
                        //    this.classList.add('duranmakine');
                        //}
                    });
                }

                var sonTiklananButon = null;

                for (var k = 0; k < personeldivs.length; k++) {
                    (function (k) {
                        personeldivs[k].addEventListener('click', function () {
                            var allpersoneldivs = document.getElementsByClassName('divforpersonel');
                            for (var m = 0; m < allpersoneldivs.length; m++) {
                                allpersoneldivs[m].classList.remove('makineborder');
                            }

                            if (sonTiklananButon !== null) {
                                sonTiklananButon.classList.remove('acildi');
                            }

                            this.classList.add('makineborder');

                            var indeks = 'Repeater2_personelatamabuton_' + k;
                            var personelatamabuton = personeldivs[k].querySelector('[id="' + indeks + '"]');
                            if (personelatamabuton) {
                                personelatamabuton.classList.add('acildi');
                            }

                            document.getElementById('perkodonay').value = this.getElementsByClassName('subdivforpersonel')[0].innerText;
                            document.getElementById('personelisimonay').value = this.getElementsByClassName('subdivforpersonel')[1].innerText;

                            sonTiklananButon = personelatamabuton;
                        });
                    })(k);
                }
            });

            function scrollToTop() {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            }
        </script>
        <script>
            $(document).ready(function () {
                $("#main-button").click(function () {
                    $("#sub-buttons").slideToggle(500);

                    
                    $(this).toggleClass("active");
                });
            });
            $(document).ready(function () {
                $("#main-button2").click(function () {
                    $("#sub-buttons2").slideToggle(500);

                   
                    $(this).toggleClass("active2");
                });
            });
        </script>
        <script>
            function openPopup(popupId) {
                var popupOverlay = document.getElementById(popupId);
                var popupContainer = popupOverlay.querySelector('.popup-container');

                popupOverlay.style.display = 'block';

                setTimeout(function () {
                    popupOverlay.style.opacity = 1;
                    popupContainer.style.opacity = 1;
                }, 10);

            }

            function closePopup(popupId) {
                var popupOverlay = document.getElementById(popupId);
                var popupContainer = popupOverlay.querySelector('.popup-container');
                var altmenu = document.getElementById('altpopup');
                altmenu.classList.remove('open');

                popupOverlay.style.opacity = 0;
                popupContainer.style.opacity = 0;

                setTimeout(function () {
                    popupOverlay.style.display = 'none';
                }, 300);
            }

            function openaltmenu() {
                var popupOverlay = document.getElementById('popupOverlay6');


                popupOverlay.style.display = 'block';

                var altmenu = document.getElementById('altpopup');
                altmenu.classList.toggle('open');

                setTimeout(function () {
                    popupOverlay.style.opacity = 1;
                    altmenu.style.opacity = 1;
                }, 10);
            }

            function vardiyaSecildi(secilenvardiya, secilendiv) {

                var vardiyadivs = document.getElementsByClassName('tiklanandiv');
                for (var s = 0; s < vardiyadivs.length; s++) {
                    vardiyadivs[s].classList.remove('makineborder');
                }

                document.getElementById(secilendiv).classList.add('makineborder');

                document.getElementById('vardiyaturutut').value = secilenvardiya;
            }
        </script>
    </form>
</body>
</html>
