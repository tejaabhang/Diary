
<!--<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAC-A9tpraq7fsC3Gl5VonjxT38pGqNDZCmueCKFpWF2V1m-Tr9RSZ-QIzawUvCwQ-y04XlsBkgiClZQ" type="text/javascript"></script>-->
<!--<script type="text/javascript" src="http://maps.google.com/">

</script>-->

<body onload="loadmap('<%=request.getParameter("lat") %>','<%=request.getParameter("long")%>');">


<script type="text/javascript">
    //<![CDATA[	

   function loadmap(lat,lon){
	window.location = "http://maps.google.com/?saddr="+lat+","+lon;
   }


 //]]>
</script>

