// calculates the sum of the selected wines from the table
function calculateBill(wineMenu) {
    var fBillTotal = 0.0;
    var i = 0;
    var aCBTags = document.querySelectorAll('input');
    for (i = 0; i < aCBTags.length; i++) {
        // is this menu item selected? it is if the checkbox is checked
        if (aCBTags[i].checked) {
            // get the checkbox' parent table row
            var oTR = getParentTag(aCBTags[i], 'TR');
            // retrieve the price from the price column, which is the third column in the table
            var oTDPrice = oTR.getElementsByTagName('TD')[4];
            // the first child text node of the column contains the price
            fBillTotal += parseFloat(oTDPrice.firstChild.data);
        };
    };
    // return the price as a decimal number with 2 decimal places
    return Math.round(fBillTotal * 100.0) / 100.0;
};

//function to highlight the reserve wines on the table
function highlightReserveWine(wineMenu, showReserveWine) {
    // if showReserveWine is true, then we're highlighting reserve wines
    var i = 0;
    var oTable = document.getElementById(wineMenu);
    var oTBODY = oTable.getElementsByTagName('tbody')[0];
    var aTRs = oTBODY.getElementsByTagName('tr');
    // walk through each of the table rows and see if it has a "wineReserve = true" attribute on it.
    for (i = 0; i < aTRs.length; i++) {
        if (aTRs[i].getAttribute('wineReserve') == "true") {
            if (showReserveWine) {
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

//form validation
const form = document.getElementById('form-control');
const name = document.getElementById('name');
const country = document.getElementById('country');
const region = document.getElementById('region');
const price = document.getElementById('price');
const year = document.getElementById('year');

form.addEventListener('submit', (e) => {
    //prevent the browser to submit the for with empty fields if the user hit submit button
    e.preventDefault();

    checkInputs();

});
    function checkInputs() {
        //get the values from the inputs
        const nameValue = name.value.trim();
        const countryValue = country.value.trim();
        const regionValue = region.value.trim();
        const priceValue = price.value.trim();
        const yearValue = year.value.trim();

        if(nameValue === ''){

            setErrorFor(name, 'Name cannot be blank');
        } else {
            setSuccessFor(name);
        }

}

    function setErrorFor(input, message) {
        const formControl = input.parentElement;
        const small = formControl.querySelector('small');

        small.innerText = message;

        formControl.className = 'form-control error';

    }




