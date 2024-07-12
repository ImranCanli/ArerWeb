<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="duruslar.aspx.cs" Inherits="yenioriz.oriz.duruslar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet' />
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

        .vardiyavetarih {
            position: sticky;
            width: 97%;
            top: 0;
            margin: 0 auto;
            padding: 15px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            background-color: #171c26;
            color: white;
            z-index: 20;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            font-family: poppins-bold;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .duruscontainer {
            width: 98%;
            padding: 2px 10px;
            background-color: #f1f1f1;
            box-sizing: border-box;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            margin-bottom: 80px;
        }

        .durusici {
            background-color: white;
            margin: 2px 2px;
            height: 23vh;
            padding: 20px;
            display: grid;
            grid-template-columns: 35% 65%;
            grid-template-rows: 35% 15% 15% 50%;
            font-family: poppins-bold;
            font-size: small;
            box-sizing: border-box;
            padding-bottom: 30px;
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
            /*box-sizing: border-box;*/
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
            /*box-sizing: border-box;*/
        }

            .sub-button:hover {
                background-color: #1d3c3c;
            }

        .makineborder {
            border: 2px solid #ff6d24;
        }

        .gorunmeyenkoy{
            display: none;
        }

        .kirmizifont{
            color: red;
        }

        .yesilfont{
            color: green;
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
            /*bottom: 20px;*/
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
            /*bottom: 20px;*/
            text-align: center;
            font-size: medium;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        .devirbuton:hover{
            background-color: darkgreen;
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
            /*position: absolute;*/
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
            /*bottom: 20px;*/
            text-align: center;
            font-size: small;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        .acildi{
            display: flex;
            align-items: center;
            justify-content: center;
        }

        @media only screen and (max-width: 1120px) {
            .duruscontainer {
                grid-template-columns: repeat(5, 1fr);
            }
        }

        @media only screen and (max-width: 930px) {
            .duruscontainer {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        @media only screen and (max-width: 745px) {
            .duruscontainer {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media only screen and (max-width: 540px) {
            .duruscontainer {
                grid-template-columns: repeat(2, 1fr);
            }
            .durusici{
                grid-template-rows: 35% 15% 15% 50%;
            }
        }

        @media only screen and (max-width: 370px) {
            .vardiyavetarih {
                padding: 15px 20px;
                font-size: medium;
            }
        }

        html, body {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #f1f1f1;
        }

            body::-webkit-scrollbar {
                display: none;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label runat="server" ID="makinetutucu" Visible="false" style="display: none;"></asp:Label>
        <div class="vardiyavetarih">
            <asp:Label runat="server" ID="vardiyaturlabel"></asp:Label>
            <asp:Label runat="server" ID="vardiyatarihlabel"></asp:Label>
            <%--<label>VARDİYA : A</label><label>TARİH : 24.02.2024</label>--%>
        </div>
        <div class="duruscontainer">
            <asp:Repeater runat="server" ID="Repeater1">
                <ItemTemplate>
                    <div class="durusici">
                        <div class="gorunmeyenkoy"><%# Eval("tur")%></div>
                        <div class="gorunmeyenkoy"><%# Eval("sure")%></div>
                        <div class="gorunmeyenkoy"><%# Eval("maknokimlik")%></div>
                        <div class="gorunmeyenkoy"><%# Eval("kimlik")%></div>
                        <div>TÜR:&nbsp;</div>
                        <div class="yapisalbirim"><%# Eval("tur")%></div>
                        <div>SÜRE:&nbsp;</div>
                        <div class="yapisalbirim" style="padding-left: 10px"><%# Eval("sure")%></div>
                        <div style="margin-top: 10px;">NEDEN:&nbsp;</div>
                        <div class="yapisalbirim" style="padding-left: 10px; margin-top: 10px;"><asp:Label runat="server" Style="z-index: 200;" ID="Label1" Text='<%# (Eval("neden").ToString().Length == 0 ? "NEDEN YOK" : (Eval("neden").ToString().Length > 10 ? Eval("neden").ToString().Substring(0, 9) + "..." : Eval("neden").ToString())) %>'></asp:Label></div>
                        <div class="yapisalbirim" style="grid-column: span 2; padding-top: 20px;">
                            <asp:Label runat="server" ID="perisimlabel" Text='<%# (Eval("aciklama2").ToString().Length == 0 ? "Açıklama yok." : (Eval("aciklama2").ToString().Length > 31 ? Eval("aciklama2").ToString().Substring(0, 28) + "..." : Eval("aciklama2").ToString())) %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <asp:HiddenField runat="server" ID="turtut"/>
        <asp:HiddenField runat="server" ID="suretut"/>
        <asp:HiddenField runat="server" ID="kimliktut"/>
        <asp:HiddenField runat="server" ID="maknokimliktut"/>

        <div class="popup-overlay" id="popupOverlay6" onclick="closePopup('popupOverlay6')">
            <div class="popup-container" id="popupContainer6" onclick="event.stopPropagation();" style="width: 120%;">
                <span class="close-btn" onclick="closePopup('popupOverlay6')">&times;</span>
                <h2 style="font-family: poppins-bold; margin: 10px 0 30px 0;">AÇIKLAMA EKLE</h2>
                <div style="width: 95%; display: grid; margin: 0 auto; grid-template-columns: repeat(1, 1fr);">
                    <asp:TextBox runat="server" Style="width: 94%; height: 160px; margin: 20px auto; padding: 5px; font-size: large; padding-left: 5px; font-family: poppins-regular; border-radius: 8px;" TextMode="MultiLine" ID="aciklamaentry" Placeholder="Açıklama girin..."></asp:TextBox>
                    <div style="width: 90%; margin: 10px auto; display: flex; justify-content: space-between; align-items: center;">
                        <a class="devirbutoniptal" onclick="closePopup('popupOverlay6')">İPTAL</a>
                        <asp:Button runat="server" ID="aciklamaonaybuton" CssClass="devirbuton" Text="KAYDET" OnClick="aciklamaonaybuton_Click"/>
                    </div>
                </div>
            </div>
        </div>

        <div id="main-button">İŞLEM</div>
        <div id="sub-buttons">
            <a class="sub-button" style="padding: 0;" onclick="openaltmenu()">NEDEN SEÇ</a>
            <a class="sub-button" style="padding: 0;" onclick="openPopup('popupOverlay6')">AÇIKLAMA</a>
            <asp:Button runat="server" ID="plansidurusbuton" class="sub-button" Text="ANA SAYFA" OnClick="plansidurusbuton_Click"/>
        </div>

        <div id="main-button2">DURUŞ TÜRÜ</div>
        <div id="sub-buttons2">
            <asp:Button runat="server" ID="planlidurusfiltreyeni" Text="PLANLI" class="sub-button2" OnClick="planlidurusfiltreyeni_Click"/>
            <asp:Button runat="server" ID="plansizfiltreyeni" Text="PLANSIZ" class="sub-button2" OnClick="plansizfiltreyeni_Click"/>
            <asp:Button runat="server" ID="tumduruslarfiltreyeni" Text="TÜMÜ" class="sub-button2" OnClick="tumduruslarfiltreyeni_Click"/>
        </div>

        <div class="altpopup" id="altpopup">
            <span class="close-btn" onclick="closePopup('popupOverlay6')">&times;</span>
            <asp:Repeater runat="server" ID="Repeater2">
                <ItemTemplate>
                    <div class="altpopupici">
                        <div class="divforpersonel">
                            <div class="subdivforpersonel"><%# Eval("durusad")%></div>
                            <div class="subdivforpersonel"><%# Eval("kimlik")%></div>
                            <asp:Label runat="server" Style="z-index: 200;" ID="perisimlabel" Text='<%# (Eval("durusad").ToString().Length == 0 ? "Atanmadı" : (Eval("durusad").ToString().Length > 20 ? Eval("durusad").ToString().Substring(0, 15) + "..." : Eval("durusad").ToString())) %>'></asp:Label>
                            <div style="display: flex; flex-direction: row;">
                            <asp:Button runat="server" ID="nedenatamabuton" CssClass="repbuton" Text="KAYDET" OnCommand="nedenatamabuton_Command" CommandArgument='<%# $"{Eval("durusad")},{Eval("kimlik")}" %>'/>
                            <asp:Button runat="server" ID="nedenaktarmabuton" style="margin-left: 5px;" CssClass="repbuton" Text="AKTAR" OnCommand="nedenaktarmabuton_Command" CommandArgument='<%# $"{Eval("durusad")},{Eval("kimlik")}" %>'/>
                            </div>
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
            window.onload = function () {

                var planli = "PLANLI DURUŞ";
                var plansiz = "PLANSIZ DURUŞ";

                var repeateritems = document.getElementsByClassName('durusici');
                for (var j = 0; j < repeateritems.length; j++) {
                    repeateritems[j].id = "element_" + j;
                }


                var items = document.getElementsByClassName('durusici');

                for (var i = 0; i < items.length; i++) {

                    var durusturu = items[i].getElementsByClassName('gorunmeyenkoy')[0].innerHTML;

                    if (durusturu == planli) {
                        items[i].getElementsByClassName('yapisalbirim')[0].classList.add('yesilfont');
                    }
                    else if (durusturu == plansiz) {
                        items[i].getElementsByClassName('yapisalbirim')[0].classList.add('kirmizifont');
                    }
                    else {
                    }
                }
            };

            document.addEventListener('DOMContentLoaded', function () {
                var makinedivs = document.getElementsByClassName('durusici');
                var personeldivs = document.getElementsByClassName('divforpersonel');
                for (var i = 0; i < makinedivs.length; i++) {

                    makinedivs[i].addEventListener('click', function () {

                        var allMakinedivs = document.getElementsByClassName('durusici');
                        for (var j = 0; j < allMakinedivs.length; j++) {
                            allMakinedivs[j].classList.remove('makineborder');
                        }

                        this.classList.add('makineborder');

                        document.getElementById('maknokimliktut').value = this.getElementsByClassName('gorunmeyenkoy')[2].innerText;
                        document.getElementById('turtut').value = this.getElementsByClassName('gorunmeyenkoy')[0].innerText;
                        document.getElementById('suretut').value = this.getElementsByClassName('gorunmeyenkoy')[1].innerText;
                        document.getElementById('kimliktut').value = this.getElementsByClassName('gorunmeyenkoy')[3].innerText;
                    });
                }

                var sonTiklananButon = null;
                var sontiklananButon2 = null;

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
                            if (sontiklananButon2 !== null) {
                                sontiklananButon2.classList.remove('acildi');
                            }

                            this.classList.add('makineborder');

                            var indeks = 'Repeater2_nedenatamabuton_' + k;
                            var indeks2 = 'Repeater2_nedenaktarmabuton_' + k;
                            var personelatamabuton = personeldivs[k].querySelector('[id="' + indeks + '"]');
                            var personelatamabuton2 = personeldivs[k].querySelector('[id="' + indeks2 + '"]');

                            if (personelatamabuton && personelatamabuton2) {
                                personelatamabuton.classList.add('acildi');
                                personelatamabuton2.classList.add('acildi');
                            }

                            sonTiklananButon = personelatamabuton;
                            sontiklananButon2 = personelatamabuton2;
                        });
                    })(k);
                }
            });
        </script>
        <script>
            function scrollToTop() {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            }

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
    </form>
</body>
</html>