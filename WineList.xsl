<!DOCTYPE html
  PUBLIC "XSLT-compat">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Wine List</title><style>
            	XML {
					display:none;
				}
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
               <td colspan="7"></td>
            </tr>
            <tr id="1" wineReserve="true">
               <td align="center"><input name="item" type="checkbox"></td>
               <td>Riesling Hugel</td>
               <td>white</td>
               <td>France</td>
               <td>Alsace and East</td>
               <td>17.95</td>
               <td>2002</td>
            </tr>
            <tr>
               <td colspan="7"></td>
            </tr>
            <tr id="1" wineReserve="true">
               <td align="center"><input name="item" type="checkbox"></td>
               <td>Domaine de l'Île Margaux</td>
               <td>red</td>
               <td>France</td>
               <td>Bordeaux</td>
               <td>22.50</td>
               <td>2006</td>
            </tr>
            <tr>
               <td colspan="7"></td>
            </tr>
            <tr id="1" wineReserve="true">
               <td align="center"><input name="item" type="checkbox"></td>
               <td>Dada</td>
               <td>red</td>
               <td>Argentina</td>
               <td>Fincas Las Moras</td>
               <td>12.50</td>
               <td>2017</td>
            </tr>
         </tbody>
      </table>
      <form class="indent">
         <p><input type="button" name="btnCalcBill" value="Calculate Bill" id="calcBill">
            Total: €
            <input type="text" name="txtBillAmt"></p>
      </form><script>
				
					var gEntreeCount = 0;
															// returns a number that represents the sum of all the selected menu
															// item prices.
					function calculateBill(idwineMenu) {
						var fBillTotal = 0.0;
						var i=0;

															// find the table tag
						var oTable = document.getElementById(idwineMenu);

															// go through the table and add up the prices of all
															// the selected items. The code takes advantage of the 
															// fact that each checkbox has a corresponding row in
															// the table, and the only INPUT tags are the checkboxes.
						var aCBTags = oTable.getElementsByTagName('INPUT');
						for (i=0; i < aCBTags.length; i++) {
															// is this menu item selected? it is if the checkbox is checked
							if (aCBTags[i].checked) {
															// get the checkbox' parent table row
								var oTR = getParentTag(aCBTags[i],'TR');
		
															// retrieve the price from the price column, which is the third column in the table
								var oTDPrice = oTR.getElementsByTagName('TD')[2];
															// the first child text node of the column contains the price
								fBillTotal += parseFloat(oTDPrice.firstChild.data);
							};
						};
															// return the price as a decimal number with 2 decimal places
						return Math.round(fBillTotal*100.0)/100.0;
					};

															// This function either turns on or off the row highlighting for vegetarian
															// items (depending on the value of bShowVeg)
					function highlightVegetarian(idTable, bShowVeg) {
															// if bShowVeg is true, then we're highlighting vegetarian
															//	meals, otherwise we're unhighlighting them.
						var i=0;
						var oTable = document.getElementById(idTable);

						var oTBODY = oTable.getElementsByTagName('TBODY')[0];
						var aTRs = oTBODY.getElementsByTagName('TR');
																// walk through each of the table rows and see if it has a 
																// "vegetarian" attribute on it.
						for (i=0; i < aTRs.length; i++) {
							if (aTRs[i].getAttribute('vegetarian') && aTRs[i].getAttribute('vegetarian') == "true") {
								if (bShowVeg){
									aTRs[i].style.backgroundColor = "lightGreen";
								} else {
									aTRs[i].style.backgroundColor = "";
								};
							};
						};
					};

																// Utility function for getting the parent tag of a given tag
																// but only of a certain type (i.e. a TR, a TABLE, etc.)
					function getParentTag(oNode, sParentType) {
						var oParent = oNode.parentNode;
						while (oParent) {
							if (oParent.nodeName == sParentType)
								return oParent;
							oParent = oParent.parentNode;
						};
						return oParent;
					};
			
			</script><script>
				
			        window.addEventListener("load", function() {
			            document.forms[0].txtBillAmt.value = calculateBill('menuTable');
			            document.querySelector("#calcBill").addEventListener("click", function() {
			                document.forms[0].txtBillAmt.value = calculateBill('menuTable');
			            });
			            document.querySelector("#showVeg").addEventListener("click", function() {
			                highlightVegetarian('menuTable', this.checked);
			            });
			        });
			
			</script></body>
</html>