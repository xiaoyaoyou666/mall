<html>
	<head>
		<title></title>
		<script src="app/core/styles/js/jquery.min.js"></script>
		<script type="text/javascript" src="app/core/styles/js/pdfobject.js"></script>
		<script type="text/javascript">
		 
           
			window.onload = function() {
				var thisURL = document.URL;
                var getval = thisURL.split('&')[1];
              
				$("#pdf-box").attr("src",getval);
			};
			
		</script>
       <style>
       	 body,html{
       	 	padding: 0px!important;
       	 	margin:0px;
       	 	overflow-y:hidden!important;
       	 }
         ::-webkit-scrollbar{
           display:none!important;
              }
       </style>
	</head>

	<body>

	
			<embed id="pdf-box" src="" type="application/pdf" width="110%" height="100%">
		
       
	</body>

</html>