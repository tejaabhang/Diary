/*
  -------------------------------------------------------------------------
		                JavaScript Form Validator
                                Version 3.0
                    Part of the JavaScript Coder software
					
	Copyright 2003 JavaScript-coder.com. All rights reserved.
    This javascript code is installed as part of JavaScript Coder software.
	You may adapt this script for your Web pages, provided these opening credit
    lines (down to the lower dividing line) are kept intact.
    You may not reprint or redistribute this code without permission from 
    JavaScript-Coder.com.
	
	JavaScript Coder
	It precisely codes what you imagine!
	Grab your copy here:
		http://www.javascript-coder.com/
    -------------------------------------------------------------------------  
*/
function Validator(frmname)
{
    this.formobj=document.forms[frmname];
	if(!this.formobj)
	{
	  alert("BUG: couldnot get Form object "+frmname);
		return;
	}
	if(this.formobj.onsubmit)
	{
	 this.formobj.old_onsubmit = this.formobj.onsubmit;
	 this.formobj.onsubmit=null;
	}
	else
	{
	 this.formobj.old_onsubmit = null;
	}
	this.formobj.onsubmit=form_submit_handler;
	this.addValidation = add_validation;
	this.setAddnlValidationFunction=set_addnl_vfunction;
	this.clearAllValidations = clear_all_validations;
}
function set_addnl_vfunction(functionname)
{
  this.formobj.addnlvalidation = functionname;
}
function clear_all_validations()
{
	for(var itr=0;itr < this.formobj.elements.length;itr++)
	{
		this.formobj.elements[itr].validationset = null;
	}
}
function form_submit_handler()
{
	for(var itr=0;itr < this.elements.length;itr++)
	{
		if(this.elements[itr].validationset &&
	   !this.elements[itr].validationset.validate())
		{
		  return false;
		}
	}
	if(this.addnlvalidation)
	{
	  str =" var ret = "+this.addnlvalidation+"()";
	  eval(str);
    if(!ret) return ret;
	}
	return true;
}
function add_validation(itemname,descriptor,errstr)
{
	if(!this.formobj)
	{
		alert("BUG: the form object is not set properly");
		return;
	}//if
	var itemobj = this.formobj[itemname];

    if(itemobj.length && isNaN(itemobj.selectedIndex) )
    //for radio button; don't do for 'select' item
	{
		itemobj = itemobj[0];
	}	
	if(!itemobj)
	{
		alert("BUG: Couldnot get the input object named: "+itemname);
		return;
	}
	
	if(!itemobj.validationset)
	{
		itemobj.validationset = new ValidationSet(itemobj);
	}
	itemobj.validationset.add(descriptor,errstr);
}
function ValidationDesc(inputitem,desc,error)
{
    this.desc=desc;
	this.error=error;
	this.itemobj = inputitem;
	this.validate=vdesc_validate;
}
function vdesc_validate()
{
 if(!validateInput(this.desc,this.itemobj,this.error))
 {
    this.itemobj.focus();
		return false;
 }
 return true;
}
function ValidationSet(inputitem)
{
    this.vSet=new Array();
	this.add= add_validationdesc;
	this.validate= vset_validate;
	this.itemobj = inputitem;
}
function add_validationdesc(desc,error)
{
  this.vSet[this.vSet.length]= 
  new ValidationDesc(this.itemobj,desc,error);
}
function vset_validate()
{
   for(var itr=0;itr<this.vSet.length;itr++)
	 {
	   if(!this.vSet[itr].validate())
		 {
		   return false;
		 }
	 }
	 return true;
}
/*  checks the validity of an email address entered 
*   returns true or false 
*/ 
function validateEmail(email)
{
    var splitted = email.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}

function TestComparison(objValue,strCompareElement,strvalidator,strError)
{
   var bRet=true;
   var objCompare=null;
   if(!objValue.form)
   {
      alert("BUG: No Form object!");
	  return false
   }
   objCompare = objValue.form.elements[strCompareElement];
   if(!objCompare)
   {
     alert("BUG: Element with name"+strCompareElement+" not found !");
     return false;
   }
   if(strvalidator != "eqelmnt" &&
   	  strvalidator != "neelmnt")
   {
      if(isNaN(objValue.value)) 
      { 
        alert(objValue.name+": Should be a number "); 
        return false; 
      }//if 
      if(isNaN(objCompare.value)) 
      { 
        alert(objCompare.name+": Should be a number "); 
        return false; 
      }//if 	  
   }//if
   var cmpstr="";
   switch(strvalidator)
   {
       case "eqelmnt": 
			{
			   if(objValue.value != objCompare.value)
			   {
 	 		      cmpstr = " should be equal to ";
			      bRet = false;
			   }//if
			   break;
			}//case
		case "ltelmnt":
			{
			if(eval(objValue.value) >= eval(objCompare.value)) 
				{
			       cmpstr =  " should be less than "; 
			       bRet = false;					
				}
			  break;
			}//case
		case "leelmnt":
			{
				if(eval(objValue.value) >  eval(objCompare.value)) 
				{
			       cmpstr =  " should be less than or equal to"; 
			       bRet = false;					
				}
			  break;
			}//case		
		case "gtelmnt":
			{
				if(eval(objValue.value) <=  eval(objCompare.value)) 
				{
			       cmpstr =  " should be greater than"; 
			       bRet = false;					
				}
			  break;
			}//case
		case "geelmnt":
			{
				if(eval(objValue.value) < eval(objCompare.value)) 
				{
			       cmpstr =  " should be greater than or equal to"; 
			       bRet = false;					
				}
			  break;
			}//case
		case "neelmnt":
			{
			   if(objValue.value.length > 0 &&
			     objCompare.value.length > 0 &&
			     objValue.value == objCompare.value)
			   {
 	 		      cmpstr = " should be different from ";
			      bRet = false;
			   }//if
			   break;			
			}			
   }//switch
   if(bRet==false)
   {
      if(!strError || strError.length==0)
	  {
	    strError = objValue.name + cmpstr + objCompare.value; 
	  }//if
	  alert(strError);
   }//if
   return bRet;
}
function TestSelMin(objValue,strMinSel,strError)
{
    var bret = true;
	var objcheck = objValue.form.elements[objValue.name];
	var chkcount =0;
	if(objcheck.length)
	{
		for(var c=0;c < objcheck.length;c++)
		{
		   if(objcheck[c].checked == "1")
		   {
		     chkcount++;
		   }//if
		}//for
	}
	else
	{
	  chkcount = (objcheck.checked == "1")?1:0;
	}
	var minsel = eval(strMinSel);
	if(chkcount < minsel)
	{
		if(!strError || strError.length ==0) 
		{ 
			strError = "Please Select atleast"+minsel+" check boxes for"+objValue.name;  
		}//if                                                               
		alert(strError); 
		bret = false;
	}
	return bret;
}

function TestDontSelectChk(objValue,chkValue,strError)
{
    var pass=true;
	var objcheck = objValue.form.elements[objValue.name];
    if(objcheck.length)
	{
		var idxchk=-1;
		for(var c=0;c < objcheck.length;c++)
		{
		   if(objcheck[c].value == chkValue)
		   {
		     idxchk=c;
			 break;
		   }//if
		}//for
		if(idxchk>= 0)
		{
		  if(objcheck[idxchk].checked=="1")
		  {
		    pass=false;
		  }
		}//if
	}
	else
	{
		if(objValue.checked == "1")
		{
			pass=false;
		}//if
	}//else
	if(pass==false)
	{
     if(!strError || strError.length ==0) 
        { 
        	strError = "Can't Proceed as you selected "+objValue.name;  
        }//if			  
	  alert(strError);
	  
	}
    return pass;
}

function TestRequiredInput(objValue,strError)
{
 var ret = true;
    if(eval(objValue.value.length) == 0) 
    { 
       if(!strError || strError.length ==0) 
       { 
         strError = objValue.name + " : Required Field"; 
       }//if 
       alert(strError); 
       ret=false; 
    }//if 
return ret;
}

function TestMaxLen(objValue,strMaxLen,strError)
{
 var ret = true;
    if(eval(objValue.value.length) > eval(strMaxLen)) 
    { 
      if(!strError || strError.length ==0) 
      { 
        strError = objValue.name + " : "+ strMaxLen +" characters maximum "; 
      }//if 
      alert(strError + "\n[Current length = " + objValue.value.length + " ]"); 
      ret = false; 
    }//if 
return ret;
}

function TestMinLen(objValue,strMinLen,strError)
{
 var ret = true;
    if(eval(objValue.value.length) <  eval(strMinLen)) 
    { 
      if(!strError || strError.length ==0) 
      { 
        strError = objValue.name + " : " + strMinLen + " characters minimum  "; 
      }//if               
      alert(strError + "\n[Current length = " + objValue.value.length + " ]"); 
      ret = false;   
    }//if 
return ret;
}

function TestInputType(objValue,strRegExp,strError,strDefaultError)
{
   var ret = true;

    var charpos = objValue.value.search(strRegExp); 
    if(objValue.value.length > 0 &&  charpos >= 0) 
    { 
     if(!strError || strError.length ==0) 
      { 
        strError = strDefaultError;
      }//if 
      alert(strError + "\n [Error character position " + eval(charpos+1)+"]"); 
      ret = false; 
    }//if 
 return ret;
}

function TestEmail(objValue,strError)
{
var ret = true;
     if(objValue.value.length > 0 && !validateEmail(objValue.value)	 ) 
     { 
       if(!strError || strError.length ==0) 
       { 
          strError = objValue.name+": Enter a valid Email address "; 
       }//if                                               
       alert(strError); 
       ret = false; 
     }//if 
return ret;
}

function TestLessThan(objValue,strLessThan,strError)
{
var ret = true;
	  if(isNaN(objValue.value)) 
	  { 
	    alert(objValue.name+": Should be a number "); 
	    ret = false; 
	  }//if 
	  else
	  if(eval(objValue.value) >=  eval(strLessThan)) 
	  { 
	    if(!strError || strError.length ==0) 
	    { 
	      strError = objValue.name + " : value should be less than "+ strLessThan; 
	    }//if               
	    alert(strError); 
	    ret = false;                 
	   }//if   
return ret;          
}

function TestGreaterThan(objValue,strGreaterThan,strError)
{
var ret = true;
     if(isNaN(objValue.value)) 
     { 
       alert(objValue.name+": Should be a number "); 
       ret = false; 
     }//if 
	 else
     if(eval(objValue.value) <=  eval(strGreaterThan)) 
      { 
        if(!strError || strError.length ==0) 
        { 
          strError = objValue.name + " : value should be greater than "+ strGreaterThan; 
        }//if               
        alert(strError);  
        ret = false;
      }//if  
return ret;           
}

function TestRegExp(objValue,strRegExp,strError)
{
var ret = true;
    if( objValue.value.length > 0 && 
        !objValue.value.match(strRegExp) ) 
    { 
      if(!strError || strError.length ==0) 
      { 
        strError = objValue.name+": Invalid characters found "; 
      }//if                                                               
      alert(strError); 
      ret = false;                   
    }//if 
return ret;
}
function TestDontSelect(objValue,index,strError)
{
var ret = true;
     if(objValue.selectedIndex == null) 
     { 
       alert("BUG: dontselect command for non-select Item"); 
       ret = false; 
     } 
	 else
     if(objValue.selectedIndex == eval(index)) 
     { 
      if(!strError || strError.length ==0) 
       { 
       strError = objValue.name+": Please Select one option "; 
       }//if                                                               
       alert(strError); 
       ret =  false;                                   
      } 
return ret;
}

function TestSelectOneRadio(objValue,strError)
{
	var objradio = objValue.form.elements[objValue.name];
	var one_selected=false;
	for(var r=0;r < objradio.length;r++)
	{
	  if(objradio[r].checked == "1")
	  {
	  	one_selected=true;
		break;
	  }
	}
	if(false == one_selected)
	{
      if(!strError || strError.length ==0) 
       {
	    strError = "Please select one option from "+objValue.name;
	   }	
	  alert(strError);
	}
return one_selected;
}

//*  Checks each field in a form 
function validateInput(strValidateStr,objValue,strError) 
{ 
    var ret = true;
    var epos = strValidateStr.search("="); 
    var  command  = ""; 
    var  cmdvalue = ""; 
    if(epos >= 0) 
    { 
     command  = strValidateStr.substring(0,epos); 
     cmdvalue = strValidateStr.substr(epos+1); 
    } 
    else 
    { 
     command = strValidateStr; 
    } 

    switch(command) 
    { 
        case "req": 
        case "required": 
         { 
		   ret = TestRequiredInput(objValue,strError)
           break;             
         }
        case "maxlength": 
        case "maxlen": 
          { 
			 ret = TestMaxLen(objValue,cmdvalue,strError)
             break; 
          }
        case "minlength": 
        case "minlen": 
           { 
			 ret = TestMinLen(objValue,cmdvalue,strError)
             break; 
           }
        case "alnum": 
        case "alphanumeric": 
           { 
				ret = TestInputType(objValue,"[^A-Za-z0-9]",strError, 
						objValue.name+": Only alpha-numeric characters allowed ");
				break; 
           }
        case "alnum_s": 
        case "alphanumeric_space": 
           { 
				ret = TestInputType(objValue,"[^A-Za-z0-9\\s]",strError, 
						objValue.name+": Only alpha-numeric characters and space allowed ");
				break; 
           }		   
        case "num": 
        case "numeric": 
           { 
                ret = TestInputType(objValue,"[^0-9]",strError, 
						objValue.name+": Only digits allowed ");
                break;               
           }
        case "alphabetic": 
        case "alpha": 
           { 
                ret = TestInputType(objValue,"[^A-Za-z]",strError, 
						objValue.name+": Only alphabetic characters allowed ");
                break; 
           }
        case "alphabetic_space": 
        case "alpha_s": 
           { 
                ret = TestInputType(objValue,"[^A-Za-z\\s]",strError, 
						objValue.name+": Only alphabetic characters and space allowed ");
                break; 
           }
        case "email": 
          { 
			   ret = TestEmail(objValue,strError);
               break; 
          }
        case "lt": 
        case "lessthan": 
         { 
    	      ret = TestLessThan(objValue,cmdvalue,strError);
              break; 
         }
        case "gt": 
        case "greaterthan": 
         { 
			ret = TestGreaterThan(objValue,cmdvalue,strError);
            break; 
         }
        case "regexp": 
         { 
			ret = TestRegExp(objValue,cmdvalue,strError);
           break; 
         }
        case "dontselect": 
         { 
			 ret = TestDontSelect(objValue,cmdvalue,strError)
             break; 
         }
		case "dontselectchk":
		{
			ret = TestDontSelectChk(objValue,cmdvalue,strError)
			break;
		}
		case "selmin":
		{
			ret = TestSelMin(objValue,cmdvalue,strError);
			break;
		}
		case "selone":
		{
			ret = TestSelectOneRadio(objValue,strError);
		    break;
		}		 
		//Comparisons
		case "eqelmnt": 
		case "ltelmnt":
		case "leelmnt":
		case "gtelmnt":
		case "geelmnt":
		case "neelmnt":
		{
		    return TestComparison(objValue,cmdvalue,command,strError);
    		break;
		}
    }//switch 
    return ret; 
}
/*
	Copyright 2003 JavaScript-coder.com. All rights reserved.
*/