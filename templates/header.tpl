<html>
<head>
    <title>{$title} - {$Name}</title>
    <link rel="stylesheet" lang="text/css" href="styles.css"/>
</head>
<body onload="checkCookies()">
<script>
function checkCookies() //this function is used to check whether the cookies is used
{
	if (navigator.cookieEnabled == true)
	{
		alert("the cookie is enabled")
	}
	else
	{
		alert("the cookies is disabled")
	}
}

function myFunction()
{
    alert("Do you really want leave");
}
</script>

<button onclick="myFunction()">CLOSE</button>
