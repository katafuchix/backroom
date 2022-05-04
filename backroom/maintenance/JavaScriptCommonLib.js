/************************************************************************************

 js_OnlyNumber()		: ¼ýÀÚ¸¸À» ÀÔ·ÂÇÏ±â À§ÇÑ ÇÔ¼ö

 »ç¿ë¿¹					: <input ... onKeypress = "js_OnlyNumber(this)">

*************************************************************************************/

function js_OnlyNumber(obj)
{	
    sFilter="[0-9.]";	
    if(!sFilter)
    {    
      var sKey=String.fromCharCode(event.keyCode);    
      var re=new RegExp(sFilter);
      // Enter´Â Å°°Ë»ç¸¦ ÇÏÁö ¾Ê´Â´Ù.    
      if(sKey!="\r" && !re.test(sKey)) event.returnValue=false;

	  // Enter Å°°¡ ¸ÔÁö ¾Ê°Ô ÇÑ´Ù.
	  if (event.keyCode == 13){event.returnValue =false;}
    }

}

/************************************************************************************

 js_UpperLowerCase(fldName, type): ´ë¹®ÀÚ·Î º¯È¯

 »ç¿ë¿¹						: js_OnlyNumber()

*************************************************************************************/
function js_OnlyNumber() {
	if( !( (event.keyCode>47 && event.keyCode<58) ||
           (event.keyCode>34 && event.keyCode<41) ||
           (event.keyCode>95 && event.keyCode<106) ||
           (event.keyCode == 8) || (event.keyCode == 13) ||
           (event.keyCode == 46)|| (event.keyCode == 9)))
    {
		event.returnValue = false;
    }
}

/************************************************************************************

 js_TabOrder()			: 
 
 »ç¿ë¿¹					: ex) <input ... onkeyup = "js_TabOrder(date, 4)">					

*************************************************************************************/
function js_TabOrder(obj,len) 
{
	var mForm =  document.forms[0]; 	
	var iElements=mForm.elements.length;
	for(i=0; i<iElements; i++)
	{
		if (mForm.elements[i].name == obj.name)
			break;
	}
	var obj2 = mForm.elements[i+1];	
	if (obj.value.length == len)
	{
		if (obj2.type=="hidden")
		{
			mForm.elements[i+2].focus();
		}
		else
		{
			obj2.focus();

			if (obj2.type=="text")
				obj2.select();
		}
	}
	return;
}


/************************************************************************************

 js_CheckAtLeastOneCheckBox()			: 
 
 »ç¿ë¿¹					: ex) <input ... onkeyup = "js_CheckAtLeastOneCheckBox(form,"checkBoxName")">					

*************************************************************************************/
function js_CheckAtLeastOneCheckBox(form,checkBoxName) 
{
	var checkbox_form =  form; 	
	var checkBoxName  = checkBoxName;
	var valid = false;

	// Loop from zero to the one minus the number of checkbox button selections
	for (counter = 0; counter < checkbox_form.elements[checkBoxName].length; counter++)
	{
		if (checkbox_form.elements[checkBoxName][counter].checked)
		{
			valid = true;
		}		
	}
	
	return valid;
	
}

/************************************************************************************


*************************************************************************************/
function js_CheckBoxAllSet(form,checkBoxName,boolean) 
{
	var checkbox_form =  form; 	
	var checkBoxName  = checkBoxName;
	var select = boolean;
	// Loop from zero to the one minus the number of checkbox button selections
	for (counter = 0; counter < checkbox_form.elements[checkBoxName].length; counter++)
	{
		checkbox_form.elements[checkBoxName][counter].checked = select;
	}
	
	return ;
	
}


/************************************************************************************


*************************************************************************************/
function js_CheckNecessary(formName,fieldName,msg) 
{
	return js_CheckNecessary(formName,fieldName,true,msg) ;
	
}

/************************************************************************************


*************************************************************************************/
function js_CheckNecessary(formName,fieldName,spaceAvailable,msg) 
{
	var obj = document.forms[formName].elements[fieldName];
	var value = obj.value;


	if(value == null || !spaceAvailable )
	{
		value = js_RemoveSpaceFromValue(value);
	}
	if(value.length == 0)
	{
		alert(msg);
		obj.focus();
		return false;
	}
	else
	{
		return true;
	}
	
}

/************************************************************************************

 js_RemoveSpace()		: " "(space)¸¦ ÀüºÎ ¾ø¾Ö´Â ÇÔ¼ö

 »ç¿ë¿¹					: <input ... onfocus[or onblur] = "js_RemoveSpace(this)">

*************************************************************************************/

function js_RemoveSpaceFromValue(value) 
{
	return value.replace(/,/g,"");
}

/************************************************************************************

 js_RemoveSpace()		: " "(space)¸¦ ÀüºÎ ¾ø¾Ö´Â ÇÔ¼ö

 »ç¿ë¿¹					: <input ... onfocus[or onblur] = "js_RemoveSpace(this)">

*************************************************************************************/

function js_RemoveSpace(obj) 
{
    for (i=0; i < obj.value.length; i++) 
		obj.value = obj.value.replace(/,/g,"");
    return;
}

/************************************************************************************

*************************************************************************************/
function js_RemoveChar(formName,fieldName,removeChar)
{
	return js_RemoveChar(document.forms[formName].elements[fiedlName], removeChar);
}

function js_RemoveChar(object,removeChar)
{

	var s = object.value;
	return js_RemoveCharFromValue(s,removeChar);
	
}

function js_RemoveCharFromValue(val,removeChar)
{
	var returnStr = "";

	for (i = 0; i < val.length; i++)
	{   
				// Check that current character isn't whitespace.
		var c = val.charAt(i);
		if (c.indexOf(removeChar) == -1) 
		{
					returnStr += c;
		}
	}

	return returnStr;	
	
}



/************************************************************************************

*************************************************************************************/
function isEnglishLetter (c)
{   
	return ( ((c >= "a") && (c <= "z")) || ((c >= "A") && (c <= "Z")) )
}


/************************************************************************************
// Returns true if character c is a digit 
// (0 .. 9).
*************************************************************************************/

function isDigit (c)
{   
	return ((c >= "0") && (c <= "9"))
}

function isAllDigit(val)
{
	var valid = true;
	for(var i =0; i < val.length; i++)
	{
		var c = val.charAt(i);
		
		if(!isDigit(c))
		{
		
			valid = false;
			break;
		}
			
	}
	return valid;
}

/************************************************************************************
// Returns true if character c is a letter or digit.
*************************************************************************************/


function isEnglishLetterOrDigit (c)
{   
	return (isLetter(c) || isDigit(c))
}

/************************************************************************************
// 
*************************************************************************************/


function isPriceValue(val)
{   
	var isValid = false;
	var paramValue = js_RemoveCharFromValue(val,",");	
	return  isAllDigit(paramValue); 
}



//
	/**
	 * Not Null Check
	 * checks if the string is not empty
	 */
	function checkField(aValue, aMessage) {
		if (aValue == "") {
			alert(aMessage);
			return false;
		}
		return true;
	}

	/* Kanji Check
	 * checks if the string is all non-ascii and non-hankaku-kana
	 * Old Name: isTwoByteChars
	 */
	function isKanji(str1){
	  err = 0;
	  for (i=0;i<str1.length;i++){
	    code = str1.charCodeAt(i);
	    onebytechars = "±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜ¦Ý§¨©ª«¯¬­®¤¡¢£Þß!\"#$%&'()-^\\=~|@[;:],./`{+*}<>?_ ";
	    if (onebytechars.indexOf(str1.charAt(i)) > -1) {
	      err++;
	    }
	    else if ((48<=code && code <=57) || (65<= code && code <=90) || (97 <= code && code <= 122)) {
	      err++;
	    }
	    else {
	    }
	  }
	  if (err!=0) {
	    return false; // includes 1byte char
	  }
	  else {
	    return true; // is all 2byte chars
	  }
	}


	/**
	 * hankaku-kana included in string or not
	 */
	function hasHankakukana(str1){
	  err = 0;
	  for (i=0;i<str1.length;i++){
	    code = str1.charCodeAt(i);
	    onebytechars = "±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜ¦Ý§¨©ª«¯¬­®¤¡¢£Þß";
	    if (onebytechars.indexOf(str1.charAt(i)) > -1) {
	      err++;
	    }
	    else {
	    }
	  }
	  if (err!=0) {
	    return true; // includes hankaku-kana
	  }
	  else {
	    return false; // is all 2byte chars or ASCII chars
	  }
	}


	/**
	 * check if the string is 1-byte katakana
	 */
	function isHankakukana(inputStr)
	{
		err = 0;
		if (inputStr == null || inputStr == "") {
			//return false; // if you want to check empty value
		}

		for (i=0;i<inputStr.length;i++){
			hankakukana = "±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜ¦Ý§¨©ª«¯¬­®¤¡¢£Þß";
			if (hankakukana.indexOf(inputStr.charAt(i)) > -1) {
			}
			else {
				err++;
			}
		}
		if (err!=0) {
			return false;
		}
		else {
			return true;
		}
	}


	/**
	 * Katakana Check
	 * checks if the string is a katakana
	 */
	function isKatakana(str1, aMessage){
		var RE = /^[ƒ@-ƒ–\uFFFDE\uFFFD[\uFFFDR\uFFFDS]*$/
		if(RE.test(str1) == true) {
			return true;
		}
		else {
			alert(aMessage);
			return false;
		}
	}

	/**
	 * Kanji Check
	 * checks if the string is all non-ASCII characters
	 */
	function isKanji2(str1) {
		var i;
		for(i=0; i < str1.length; i++) {
			if(escape(str1.charAt(i)).length < 4) {
				return false;
			}
		}
		return true;
	}


	/* ASCII Check
	 * checks if the string is all ASCII characters
	 */
	function isAllAsciistr(str1){
	  err = 0;
	  for (i=0;i<str1.length;i++){
	    code = str1.charCodeAt(i);
	    asciisymbol = "!\"#$%&'()-^\\=~|@[;:],./`{+*}<>?_ ";
	    if (asciisymbol.indexOf(str1.charAt(i)) > -1) {
	    }
	    else if ((48<=code && code <=57) || (65<= code && code <=90) || (97 <= code && code <= 122)) {
	    }
	    else {
	      err++;
	    }
	  }
	  if (err!=0) {
	    return false;
	  }
	  else {
	    return true;
	  }
	}

	function isDigit (c)
	{   return ((c >= "0") && (c <= "9"))
	}
	    

	function isAllDigit (s)
	{   var i;
		// Search through string's characters one by one
		// until we find a non-numeric character.
		// When we do, return false; if we don't, return true.

		for (i = 0; i < s.length; i++)
		{   
		    // Check that current character is number.
		    var c = s.charAt(i);
		    
		    if (!isDigit(c)) return false;
		}
		// All characters are numbers.
		return true;
	}


	/**
	 * Number Check
	 * checks if the string is a number
	 */
	function isAsciistr(str1) {
		if(isNaN(str1)) {
			return false;
		}
		else {
			return true;
		}
	}

	/* Date Validation
	 * (YYYY/MM/DD)
	 */
	function isValidDate(yyyy, mm, dd){
		if (mm < 01 || mm > 12) {
			return false;
		}
		if ((mm == 04 || mm == 06 || mm == 09 || mm == 11) && (dd < 01 || dd > 30)) {
			return false;
		}

		if ((mm == 01 || mm == 03 || mm == 05 || mm == 07 || mm == 08 || mm == 10 || mm == 12) && (dd < 01 || dd > 31)) {
			return false;
		}

		if (mm == 02) {
			if(((yyyy % 400 != 0 && yyyy % 100 == 0) || yyyy % 4 != 0) && (dd < 01 || dd > 28)) {
				return false;
			}
		    if ((yyyy % 400 == 0 || yyyy % 4 == 0) && (dd < 01 || dd > 29)) {
				return false;
			}
		}
		return true;
	}


	/* Date Validation
	 * (YY/MM)
	 */
	function isValidShortDate(yy, mm){
		if (yy < 0) {
			return false;
		}
		var yyyy = "20" + yy;
		if (mm < 01 || mm > 12) {
			return false;
		}
		return true;
	}

	/**
	 * Validates the integrity of the form
	 */
	function formValidation(aForm, aType) {
		 if (aForm.hddFormName.value == "frmIndex")
		 {
		 	 if (aType == "Add")
		 	 {
                           // Null Check
			   if (!checkField(aForm.giftType.options[aForm.giftType.selectedIndex].text, "Gift Type not supplied."))
	  		    return false;
			   if (!checkField(aForm.agentID.value, "Agent ID not supplied."))
	  		    return false;
		 	 }
		 }


		 if (aForm.hddFormName.value == "frmEdit")
		 {
		 	 if (aType == "Edit")
		 	 {
// Null Check
			   if (!checkField(aForm.agentID.value, "Agent ID not supplied."))
	  		    return false;

// Validation Commented by Mr. Kondo's request
//			   if (!checkField(aForm.startDate.value, "Open Date not supplied."))
//	  		    return false;
			   if (!checkField(aForm.allotNumber.value, "Allot Number not supplied."))
	  		    return false;
			   if (!checkField(aForm.price.value, "Price not supplied."))
	  		    return false;
			   if (!checkField(aForm.smallCat.value, "Small Category not supplied."))
	  		    return false;

                           if (aForm.allotNumber.value.length>4)
                           {
                                   alert("AllotNumber is invalid");
                                   return false;
                           }

                           if (aForm.price.value.length>8)
                           {
                                   alert("Price is invalid");
                                   return false;
                           }

                            /* Validation Commented by Mr. Kondo's request
                            // Length
                           if (aForm.startDate.value.length!=8)
                           {
                                   alert("Open Date is invalid");
                                   return false;
                           }

                            Date Fields
                           if (!isValidDate(aForm.startDate.value.substring(0,4), aForm.startDate.value.substring(4,6), aForm.startDate.value.substring(6,8)))
                           {
                                   alert("Open Date is invalid");
                                   return false;
                           }

                           */
                           if (!isAsciistr(aForm.allotNumber.value))
                           {
                             alert("allotNumber is not numeric");
                             return false;
                           }
                           if (!isAsciistr(aForm.price.value))
                           {
                             alert("price is not numeric");
                             return false;
                           }

                           if (!isAllDigit(aForm.allotNumber.value))
                           {
                             alert("allotNumber is not valid");
                             return false;
                           }
                           if (!isAllDigit(aForm.price.value))
                           {
                             alert("price is not valid");
                             return false;
                           }
                           
		 	 }
		 }



/*		if (!checkField(aForm.LastName_Kanji.value, "‚¨–¼‘O‚Ì\uFFFD©‚Í•K\uFFFD{\uFFFD€–Ú‚Å‚·"))
			return false;

		if (!checkField(aForm.Prefecture.options[aForm.Prefecture.selectedIndex].text, "“s“¹•{Œ§‚Í•K\uFFFD{\uFFFD€–Ú‚Å‚·"))
			return false;

		if (!isKatakana(aForm.LastName_Furigana.value, "ƒtƒŠƒKƒi‚Ì\uFFFD©‚Í‘SŠpƒJƒ^ƒJƒi‚Å“ü—Í‚µ‚Ä‚­‚¾‚³‚¢"))
			return false;

		if (hasHankakukana(aForm.City.value)) {
			alert("‚²\uFFFDZ\uFFFDŠ‚ÌŽs‹æ’¬‘º‚É”¼ŠpƒJƒi‚ªŠÜ‚Ü‚ê‚Ä‚¢‚Ü‚·\uFFFDB");
			return false;
		}

		if (!isAllAsciistr(aForm.PostalCode.value)) {
			alert("—X•Ö”Ô\uFFFD†‚Í”¼Šp\uFFFD”Žš‚Å“ü—Í‚µ‚Ä‚­‚¾‚³‚¢");
			return false;
		}

		if (!isHankakukana(aForm.ic_name.value)) {
			alert("ICƒJ\uFFFD[ƒh‚Ì‚¨–¼‘O‚Í”¼ŠpƒJƒi16•¶ŽšˆÈ“à‚Å“ü—Í‚µ‚Ä‚­‚¾‚³‚¢");
			return false;
		}

		if (!isValidDate(aForm.YearBirthday.value, aForm.MonthBirthday.value, aForm.DayBirthday.value)) {
			alert("\uFFFD¶”NŒŽ“ú‚Ì“ú•t‚ª•s\uFFFD³‚È“ú•t‚Å‚·\uFFFDB‚²Šm”F‚­‚¾‚³‚¢");
			return false;
		}

		if (!isValidShortDate(aForm.YearCreditCard.value, aForm.MonthCreditCard.value)) {
			alert("ƒNƒŒƒWƒbƒgƒJ\uFFFD[ƒh—LŒøŠúŒÀ‚Ì“ú•t‚ª•s\uFFFD³‚È“ú•t‚Å‚·\uFFFDB‚²Šm”F‚­‚¾‚³‚¢");
			return false;
		}

		if (!isKanji(aForm.FirstName_Kanji.value)) {
			alert("‚¨–¼‘O‚Ì\uFFFD©‚Í‘SŠp‚Å“ü—Í‚µ‚Ä‚­‚¾‚³‚¢");
			return false;
		}
*/
		return true;
	}
