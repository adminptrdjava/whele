<%@page import="java.sql.ResultSet"%>
<%@page import="Service.Getvv"%>
<%@page import="Model.Bean.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
<% User usr = (User)session.getAttribute("usr");
    System.out.print("on page :"+usr);
    int L = Integer.parseInt(usr.getLevel());
%>


<script>
    
    function initElement() {
  var p = document.getElementById("ibutton");
  p.onclick = showAlert;
    }
  function showAlert() {
  alert("onclick Event detected!");
}
    //var timer0 = setInterval("main_init()",3000);
    var timer = setInterval("normal_set()",30000);
    
     function main_init(){
         
      //  $(document).ready(function() {
    
     //var value ='BidVal='+ajaxdata;
 
     $.ajax({
     url: "TestTing",
     //type: "post",
     //data: value,
     cache: false,
     success: function(data) {
     //$("#BidVal").val('');
     $("#scrp").add(data);//append(data);
     }
     });


load_whlIns();
     };
     
     function set_bd(){
         
      //  $(document).ready(function() {
    
     //var value ='BidVal='+ajaxdata;
 
     $.ajax({
     url: "SetBd",
     //type: "post",
     //data: value,
     cache: false,
     success: function(data) {
     //$("#BidVal").val('');
     $("#scrp").html(data);
     }
     });
 }

</script>
<div id="scrp"></div> 

<script>
     
   function normal_set(){
       //set_bd();
      
	 // load_home();
	  
	 load_whl();
   }
    
    function load_home(){
            document.getElementById("content").innerHTML='<object type="type/html" data="whele.jsp" ></object>';}
        
      function load_whl(){window.location.replace("whele.jsp"); document.getElementById("content").innerHTML='<object type="type/html" data="whele.jsp" ></object>';
            window.clearTimeout();
  }
    
  $(document).ready(function(e) {
   
});
 $(document).ready(function() {
	 var uid= '<%=usr.getUid() %>';
	 var coin ;
	 var no;
	  $('#v10').click( function(e){
		coin = '10';
		 alert("CALL" +coin+ 'USER: '+uid);
		
	});
	
	$('#N0').click( function(e){
		no = '0';
		 alert("CALL" +no);
		
	});
	$('#N1').click( function(e){
		no = '1';
		 alert("CALL" +no);
		
	});
	$('#N2').click( function(e){
		no = '2';
		 alert("CALL" +no);
		
	});
	$('#N3').click( function(e){
		no = '3';
		 alert("CALL" +no);
		
	});
	$('#N4').click( function(e){
		no = '4';
		 alert("CALL" +no);
		
	});
	$('#N5').click( function(e){
		no = '5';
		 alert("CALL" +no);
		
	});
	$('#N6').click( function(e){
		no = '6';
		 alert("CALL" +no);
		
	});
	$('#N7').click( function(e){
		no = '7';
		 alert("CALL" +no);
		
	});
	$('#N8').click( function(e){
		no = '8';
		 alert("CALL" +no);
		
	});
	$('#N9').click( function(e){
		no = '9';
		 alert("CALL" +no);
		
	});
	
	 $('#v20').click( function(e){
		coin = '20';
		 alert("CALL" +coin);
		
	});
	 $('#v50').click( function(e){
		coin = '50';
		 alert("CALL" +coin);
		
	});
	
	 $('#v100').click( function(e){
		coin = '100';
		 alert("CALL" +coin);
		
	});
	
	
	 $('#v500').click( function(e){
		coin = '500';
		 alert("CALL" +coin);
		
	});
     $('#ibutton').click(function(e) {
     e.preventDefault();
    // var ajaxdata = $("#BidVal").val();
	 var ajaxdata = no;
     var ajxuid=uid;
     var ajxcoin=coin;
     var value ='BidVal='+ajaxdata+'&uid='+ajxuid+'&mony='+ajxcoin ;
 
     $.ajax({
     url: "BookBid",
     //type: "post",
     data: value,
     cache: false,
     success: function(data) {
     //$("#BidVal").val('');
     $("#message").append(("<br> <b> SELECTED NO: "),data,("<b> BID VALUE "),coin,("<b> INR"));
     }
     });
});
});


 


</script>
</head>

         <body bgcolor="black">

<center>
<h3 style="color:#FFFF66">SELECT BID VALUE</h3></div>
<div id="content">

</div>
 <!--<form name="form1" id="form1" action="BookBid" method="" >-->
 <table class="table">
 <tr>
  <td><li id="N0"><img src="coins/number-0-icon.png"</li></td>
 <td><li id="N1"><img src="coins/number-1-icon.png"</li></td>
  <td><li id="N2"><img src="coins/number-2-icon.png"</li></td>
   <td><li id="N3"><img src="coins/number-3-icon.png"</li></td>
    <td><li id="N4"><img src="coins/number-4-icon.png"</li></td>
     <td><li id="N5"><img src="coins/number-5-icon.png"</li></td>
      <td><li id="N6"><img src="coins/number-6-icon.png"</li></td>
       <td><li id="N7"><img src="coins/number-7-icon.png"</li></td>
        <td><li id="N8"><img src="coins/number-8-icon.png"</li></td>
         <td><li id="N9"><img src="coins/number-9-icon.png"</li></td>
         
 </tr>
 </table>
        <!--<select name="BidVal"  id="BidVal">
            <option>0</option>
             <option>1</option> 
             <option>2</option>
             <option>3</option>
              <option>4</option>
               <option>5</option>
                <option>6</option>
                 <option>7</option>
                  <option>8</option>
                   <option>9</option>
        </select> -->
        
                              </div>
                            
                            <div id="panel panel-default">
    <div id ="message"style=" color: #FF0000"> </div>
        </div>
        </div>
        
        
        <div id="panel panel-default">
    
          <div class="panel-heading">
          <div class="panel-heading">
          
          <ul class="icon-list">
          
   <table class="table">
          <tr>
          <td><li id="v10"><img src="coins/10a.png" width="100" height="100"></li></td>
          <td><li id="v20" onClick=""><img src="coins/20.png" width="100" height="100"></li></td>
          <td><li id="v50"><img src="coins/50.png" width="100" height="100"></li></td>
          <td><li id="v100"><img src="coins/100.png" width="100" height="100"></li></td>
          <td><li id="v500"><img src="coins/500.png" width="100" height="100"></li><td>
          </table>
        <label id="result" value=""/>
        <input type="button" id="ibutton" value="BOOK"  class="icon-loop-2" />
      <!--  </form> -->
          
          
      
            <div class="panel panel-default">
	          <div class="panel-heading">
			<h2 style="color:#FFFF66">LAST 5 RESULT </h2>
                         <table style="color:#FF0000">
                             <thead>
                                 <td>
                                     <th></th>
                                    
                                 </td>
                             </thead>
                        <% Getvv gv = new Getvv();
                         ResultSet rs = gv.last5show(usr.getUid());
                                 if(rs!=null){
                                     while(rs.next()){
                                         %>
                                        
                                         <td><div style="border:#0033FF ;width:40px;"><h4><%=rs.getString("win_no") %></h4></div></td>
                                             
                                         
                                         
                                    <% }
                                 }
                                    %>
                         </table>
                    </div>


</center>


</body>
</html>
