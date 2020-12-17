<!DOCTYPE html

  <html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Wine List</title><style>
            	XML {
					display:none;
				}
                
                XXXXXX
                
                
                body {
					font-family: Arial, Helvetica, sans-serif;
					background-color: #FFFFFF;
					margin: 5px;
					text-align: left;
					color: #523819;
				}
				h2 {
					font-size: 140%;
					color: #0D3427;
					margin-top: 10px;
				}
				p {
					font-size: 80%;
					color: #523819;
				}
				table {
					background-color: #DACFE5;
					border-color: #000000;
					border-width: thin;
					border-collapse: collapse;
					width: 75%;
				}
				th {
					border-color: #000000;
					font-size: 120%;
					color: #0D3427;
				}
				td {
					border-color: #000000;
					font-size: 100%;
					color: #523819;
					padding: 5px;
				}
				img {
					float: left;
					margin-left: 10px;
					margin-right: 10px;
					border: 0px;
				}
				.indent {
					margin-left: 78px;
				}
			</style></head>
   <body>
      <h2>Wine List</h2>
      <p>Select your wines from the list below:</p>
      <table id="wineMenu" border="1" class="indent">
         <thead>
            <tr>
               <th colspan="7">Wine List</th>
            </tr>
            <tr>
               <th>Select</th>
               <th>Name</th>
               <th>Type</th>
               <th>Country</th>
               <th>Region</th>
               <th>Price</th>
               <th>Year</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td align="center"><input name="item" type="checkbox"></td>
               <td colspan="1">Riesling Hugel</td>
               <td colspan="1">white</td>
               <td colspan="1">France</td>
               <td colspan="1">Alsace and East</td>
               <td colspan="1">17.95</td>
               <td colspan="1">2002</td>
            </tr>
            <tr>
               <td align="center"><input name="item" type="checkbox"></td>
               <td colspan="1">Domaine de l'Île Margaux</td>
               <td colspan="1">red</td>
               <td colspan="1">France</td>
               <td colspan="1">Bordeaux</td>
               <td colspan="1">22.50</td>
               <td colspan="1">2006</td>
            </tr>
            <tr>
               <td align="center"><input name="item" type="checkbox"></td>
               <td colspan="1">Dada</td>
               <td colspan="1">red</td>
               <td colspan="1">Argentina</td>
               <td colspan="1">Fincas Las Moras</td>
               <td colspan="1">12.50</td>
               <td colspan="1">2017</td>
            </tr>
         </tbody>
      </table>
      <form class="indent">
         <p><input type="button" name="btnCalcBill" value="Calculate Bill" id="calcBill">
            Total: €
            <input type="text" name="txtBillAmt"></p>
      </form></body>
</html>