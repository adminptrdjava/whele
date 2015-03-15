<%-- 
    Document   : admin.jsp
    Created on : 15 Mar, 2015, 1:54:38 PM
    Author     : Swarnendu
--%>
<script>
$(document).ready(function() {
     $('#ibutton').click(function(e) {
     e.preventDefault();
     var ajaxdata = $("#BidVal").val();
     var value ='BidVal='+ajaxdata;
 
     $.ajax({
     url: "BookBid",
     //type: "post",
     data: value,
     cache: false,
     success: function(data) {
     $("#BidVal").val('');
     $("#message").html(data);
     }
     });
});
});
</script>