function validate()
{
	document.getElementById('num-err').style.display = 'none'; 
	document.getElementById('num-incorrect').style.display = 'none';	
	document.getElementById('pass-err').style.display = 'none';

	if(document.getElementById('wrong') != null)
	{
		document.getElementById('wrong').style.display = 'none';
	}
	
	if( document.login.num.value == "" )
	{	
		document.getElementById('num-err').style.display = 'block'; 
	    return false;
	}

	if(isNaN(document.login.num.value))
	{
	 	document.getElementById('num-incorrect').style.display = 'block';	
	 	return false;
	}	

	if( document.login.pass.value == "" )
	{
	 	document.getElementById('pass-err').style.display = 'block';
	    return false;
	}
	 
	return true;
}