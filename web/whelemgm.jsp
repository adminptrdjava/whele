<%@page import="java.sql.ResultSet"%>
<%@page import="Service.Getvv"%>
<%@page import="Model.Bean.User"%>
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="js/js.js" type="text/javascript"></script>
<% Getvv gv = new Getvv();

int i = gv.getMaxval();

gv.setResult(i);
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<% User usr = (User)session.getAttribute("usr");
    System.out.print("on page :"+usr);
    int L = Integer.parseInt(usr.getLevel());
%>
<html>
    <head>
        <title>Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script src="spinner.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
       <script>
var timer = setInterval("mytimer()",800);
seconds = 0;
function mytimer()
{
 // this is the same as $("div_timer").html(timer) in       jquery.
seconds++;
if(seconds < 3)
    document.getElementById("div_timer").innerHTML = 'TIME: '+seconds;
if(seconds===3){
      
    spin(<%=i%>);
	
    window.clearTimeout();
    document.getElementById("div_timer").innerHTML = 'DONE';
    document.getElementById("msg").innerHTML = '<h3 class="panel-title"> NO <%=i%> WIN </h3>';
}
if(seconds===40){
  //  alert("call");
  // main_init();
     load_whl();
     
}

}

function main_init(){
         
      //  $(document).ready(function() {
    
     //var value ='BidVal='+ajaxdata;
 
     $.ajax({
     url: "ResetBd",
     //type: "post",
     //data: value,
     cache: false,
     success: function(data) {
     //$("#BidVal").val('');
     $("#scrp").html(data);
     }
     });
 }
     //////////////////////////////////
 function load_whl(){window.location.replace("bead2.jsp"); document.getElementById("content").innerHTML='<object type="type/html" data="whele.jsp" ></object>';
            window.clearTimeout();
           
        }
    
  
        </script>
        <style type="text/css">
            body {
                background: url(images/bg1.jpg);
                //background-color: #FFCC00;
                //background-repeat: no-repeat;
            }
            #bottom {
                border: 2px solid darkorange;
                border-radius: 5px;
                text-align: center;
                padding: 5px;
                background-color: black;
                vertical-align: middle;
            }
            .bottom_btn {                
                border: 5px groove darkorange;
                border-radius: 10px;
                text-align: center;
                padding: 5px;
                font-size: larger;
                font-weight: bolder;
                color: white;
                background-color: cornflowerblue;
                vertical-align: top;
                height: 100%;
            }
            #top 
            { 
                color: White;
                vertical-align: baseline;
            }
            #mid 
            {
                border: 2px solid darkorange;
                border-radius: 5px;
            }
            #timer {
                color: white;
                vertical-align: middle;
                font-weight: bolder;
                font-family: "OCR A Extended";
                border: 1px solid white;
            }
            .larged:hover {
                height: 60px;
                width: 60px;
            }
        </style>
        <script src="js/js.js" type="text/javascript"></script>
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>





    </head>
    <body>
        <div id="top">
            <img src="images/banner.png" alt="Star Casino" style="float:left;" height="30" width="230"/>
            <span style="color: White; font-size:smaller; font-weight: bold; vertical-align: top;">FOR AMUSEMENT ONLY</span>
            <span style="border: 1px solid darkorange; color: White; vertical-align:top; font-size: larger;">WELCOME, DEMO1</span>
            <span style="color: White; vertical-align: top; font-size: larger;;">Print Ticket</span>
            <span style="border: 1px solid darkorange; color: White; vertical-align:top; font-size: larger;">Game ID: 10904</span>
            <input type="text" style="vertical-align: top;"/><button style="border: 1px solid darkorange; background-color:crimson; color: White; vertical-align: top; font-size: larger;">CLAIM</button>
            <button style="background-color: Black; color: White; vertical-align: top; font-weight: bolder; font-size: larger;" disabled="disabled">BALANCE</button>
            <button style="background-color: darkorange; color: black; vertical-align: top; font-weight: bolder; font-size: larger;" disabled="disabled">76600</button>
            <!--button style="background-color: black; color: white; vertical-align: top; font-size: larger; font-weight: bolder;">Log out</button-->
            <img src="images/logout.png" alt="logout" height="30" width="40" id="logout" title="log out"/>
        </div>
        <div id="mid" style="width: 100%;">
            <table style="width: 100%;">
                <tr style="width: 100%;">
                    <td style="width: 33%;">
                        <span style="color: lightgreen; font-size: larger; font-weight: bolder;" id="time">DRAW TIME: 12:45</span> <br /><br />
                        <div style="font-size: 20pt; color: black; text-align: right; background: skyblue; border: 3px groove darkorange; border-radius: 5px; font-weight: bolder;">
                            PLAY: &nbsp;<input style="font-size: 20pt; background-color:Black; color: lightgreen; font-weight: bolder; border: 1px solid darkorange; border-radius: 5px; width: 60%;" type="text" readonly value="0"/>
                            <br />
                            WIN: &nbsp;&nbsp;<input style="font-size: 20pt; background-color:Black; color: lightgreen; font-weight: bolder; border: 1px solid darkorange; border-radius: 5px; width:60%;" type="text" readonly value="0"/>
                            <br />
                        </div> <br />
                        <div style="font-size: 20pt; color: black; text-align: center; background: skyblue; border: 3px groove darkorange; border-radius: 5px; font-weight: bolder;padding: 5px;">
                            HISTORY <br /><br />
                            <span style="border: 1px solid darkgoldenrod; border-radius: 5px; height: fit-content;padding: 0;"><%  
                          
                            ResultSet rs = gv.last5show(usr.getUid());
                                 if(rs!=null){  
                                     while(rs.next()){
                                         %>

<span style="color: black; background-color: #FF0000; border: 2px gold outset;border-radius: 5px;font-size:30px; font-weight: bolder; padding: 5px;margin: 0;"><%=rs.getInt("win_no") %></span>
<% }
     }
        %>
                               
                                
                            </span><br /><br />
                            <span style="float: left;">RECENT</span>
                            <span style="float: right;">OLDER</span>
                            <br />
                        </div>
                    </td>
                    <td>
                        <!--img src="images/Spinning-Wheel.gif" alt="spinning-wheel" height="400" width="400"  /-->
                        <canvas id="wheelcanvas" width="500" height="500"></canvas>
     <script type="application/javascript">
                           var colors = ["#FF0000", "#980000", "#FF0000", "#980000",
               "#FF0000", "#980000", "#FF0000", "#980000",
               "#FF0000", "#980000"];
  var restaraunts = ["3", "4", "5", "6",
                     "7", "8", "9", "0",
                     "1", "2" ];
  
  var startAngle = 0;
  var arc = Math.PI / 5;
  var spinTimeout = null;
  
  var spinArcStart = 10;
  var spinTime = 0;
  var spinTimeTotal = 0;
  
  var ctx;
  
  function draw() {
    drawRouletteWheel();
  }
  
  function drawRouletteWheel() {
    var canvas = document.getElementById("wheelcanvas");
    if (canvas.getContext) {
      var outsideRadius = 180;
      var textRadius = 130;
      var insideRadius = 105;
      
      ctx = canvas.getContext("2d");
      ctx.clearRect(0,0,500,500);
      
      
      ctx.strokeStyle = "skyblue";
      ctx.lineWidth = 4;
      
      ctx.font = 'bold 30px Bookman Old Style';
      
      for(var i = 0; i < 10; i++) {
        var angle = startAngle + i * arc;
        ctx.fillStyle = colors[i];
        
        ctx.beginPath();
        ctx.arc(250, 250, outsideRadius, angle, angle + arc, false);
        ctx.arc(250, 250, insideRadius, angle + arc, angle, true);
        ctx.stroke();
        ctx.fill();
        
        ctx.save();
        ctx.shadowOffsetX = -1;
        ctx.shadowOffsetY = -1;
        ctx.shadowBlur    = 0;
        ctx.shadowColor   = "rgb(220,220,220)";
        ctx.fillStyle = "blue";
        ctx.translate(250 + Math.cos(angle + arc / 2) * textRadius, 250 + Math.sin(angle + arc / 2) * textRadius);
        ctx.rotate(angle + arc / 2 + Math.PI / 2);
        var text = restaraunts[i];
        ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
        ctx.restore();
      } 
      
      //Arrow
      ctx.fillStyle = "skyblue";
      ctx.beginPath();
      ctx.moveTo(250 - 4, 250 - (outsideRadius + 5));
      ctx.lineTo(250 + 4, 250 - (outsideRadius + 5));
      ctx.lineTo(250 + 4, 250 - (outsideRadius - 5));
      ctx.lineTo(250 + 9, 250 - (outsideRadius - 5));
      ctx.lineTo(250 + 0, 250 - (outsideRadius - 13));
      ctx.lineTo(250 - 9, 250 - (outsideRadius - 5));
      ctx.lineTo(250 - 4, 250 - (outsideRadius - 5));
      ctx.lineTo(250 - 4, 250 - (outsideRadius + 5));
      ctx.fill();
    }
  }
  
  draw();
           
       </script>
                    </td>
                    <td>
                        <img src="images/banner3.png" height="300" width="350" alt="Diamond Casino" /> <br />
                        <img src="images/pyc.png" height="50" width="350" alt="Place your chpis..." /> <br />
                    </td>
                </tr>
            </table>
            <div style="text-align: center; margin: auto;">
                <img  id="N0"src="images/BTN/btn0.png" alt="0" style="cursor: pointer; padding: 5px;"/>
                <img id="N1" src="images/BTN/btn1.png" alt="1" style="cursor: pointer; padding: 5px;"/>
                <img id="N2"src="images/BTN/btn2.png" alt="2" style="cursor: pointer; padding: 5px;"/>
                <img id="N3"src="images/BTN/btn3.png" alt="3" style="cursor: pointer; padding: 5px;"/>
                <img id="N4"src="images/BTN/btn4.png" alt="4" style="cursor: pointer; padding: 5px;"/>
                <img id="N5"src="images/BTN/btn5.png" alt="5" style="cursor: pointer; padding: 5px;"/>
                <img id="N6"src="images/BTN/btn6.png" alt="6" style="cursor: pointer; padding: 5px;"/>
                <img id="N7"src="images/BTN/btn7.png" alt="7" style="cursor: pointer; padding: 5px;"/>
                <img id="N8"src="images/BTN/btn8.png" alt="8" style="cursor: pointer; padding: 5px;"/>
                <img id="N9"src="images/BTN/btn9.png" alt="9" style="cursor: pointer; padding: 5px;"/>
            </div>
        </div>
        <div id="bottom">
            <!--img src="images/chips.png" alt="chips" /-->&nbsp;
            <img id="v02" src="images/chips/chip2.png" alt="chip 2" height="50" width="50" class="larged"/>
            <img id="v05" src="images/chips/chip5.png" alt="chip 5" height="50" width="50" class="larged"/>
            <img id="v10"src="images/chips/chip10.png" alt="chip 10" height="50" width="50" class="larged"/>
            <img id="v50" src="images/chips/chip50.png" alt="chip 50" height="50" width="50" class="larged"/>
            <img id="v100"src="images/chips/chip100.png" alt="chip 100" height="50" width="50" class="larged"/>
            <img id="v500" src="images/chips/chip500.png" alt="chip 500" height="50" width="50" class="larged"/>
            <img id="v1000" src="images/chips/chip1000.png" alt="chip 1000" height="50" width="50" class="larged"/>
            <button class="bottom_btn">INFO</button>
            <button class="bottom_btn">DOUBLE</button>
            <button class="bottom_btn">REPEAT</button>
            <button class="bottom_btn">CLEAR</button>
            <button class="bottom_btn" style="color: red;" id="ibutton" onclick="return confirm('ARE YOU SURE ?')">BUY</button>
            <span id="timer" style="float: right; font-size:50px;color:red"></span>
        </div>
       
    </body>
</html>
