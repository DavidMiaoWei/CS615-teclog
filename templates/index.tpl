{include file="header.tpl" title="miNotes"}

<div id="container">
    
    <div id="notes-list">
        <div id="notes-list-header" class="header">
            <span class="left">miNotes</span>
            <span class="right"><a href="index.php?action=new"><img src="images/CreateNote.png" alt="Create new note."></a></span>
        </div>
        {foreach from=$notes item=note}
            <div class="notes-list-item">
                <span class="notes-list-item-title"><a href="index.php?action=navigate&id={$note.id}" {if $note.id eq $ACTIVE_NOTE_ID}class='active'{/if}>{$note.content|truncate:20}</a></span>
                <span class="notes-list-item-timestamp">{$note.last_modified|date_format:"%b %d"}</span>
            </div>      
        {/foreach}
    </div>
    
    <div id="notepad">
        <div id="notepad-header" class="header">
            <span><a href="#" onclick="document.getElementById('updateForm').submit();">Save</a></span>&nbsp;|&nbsp;<span><a href="index.php?action=delete">Delete</a></span>&nbsp;|&nbsp;<span>Calculator</span>&nbsp;|&nbsp;<span onclick="checkCookie()">Check Cookies</span>
            <span class="right">Fname Lname</span>
            
            <script>
            function checkCookie() //this function is used to check whether the cookies is used
            {
	            if (navigator.cookieEnabled == true)
	           {
		            alert("the cookie is enabled") //show the message 
	           }
	           else
	           {
		           alert("the cookies is disabled")
	           }
            }


</script>
        </div>
        <div>
            {foreach from=$notes item=note}
                {if $note.id eq $ACTIVE_NOTE_ID}
                <span id="timestamp">{$note.last_modified|date_format:"%B %d, %r"}</span>
                <form action="index.php" method="POST" id="updateForm">
                    <div id="tinymce-holder">
                        <textarea rows="20" cols="90" id="content" name="content" style="margin: 20px; border: 1px grey solid">{$note.content}</textarea>
                    </div>  
                    <input type="hidden" name="action" value="update"/>
                </form>
                {/if}
            {/foreach}
        </div>
        
        

            
            
        <div id="CalculatorPad">
            <form name="calc">
                <table border="2" bordercolordark="#000000" bordercolordark="#000000" cellspacing="1" cellpadding="0" align="right">
                    <tr>
                        <td width="250" colspan="5"><input name="result" type="text" size="20" value="0" onfocus="blur()" >
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="40"><input type="button" align="center" name="Cone" value="1" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Ctwo" value="2" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Cthree" value="3" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="CE" value="CE" onclick="clearall()"></td>
                        <td width="40"><input type="button" align="center" name="C" value="C" onclick="clearnow()"></td>
                    </tr>
                    
                    <tr>
                        <td width="40"><input type="button" align="center" name="Cfour" value="4" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Cfive" value="5" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Csix" value="6" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="sing" value="-/+" onclick="change()"></td>
                        <td width="40"><input type="button" align="center" name="equla" value="=" onclick="operate(this.value)"></td>
                    </tr>
                    
                    <tr>
                        <td width="40"><input type="button" align="center" name="Cseven" value="7" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Ceight" value="8" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Cnine" value="9" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Cplus" value="+" onclick="operate(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Csubtract" value="-" onclick="operate(this.value)"></td>
                    </tr>
                    <tr>
                        <td width="40"><input type="button" align="center" name="Czero" value="0" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Cpoint" value="."></td>
                        <td width="40"><input type="button" align="center" name="Cmul" value="*" onclick="operate(this.value)"></td>
                        <td width="40"><input type="button" align="center" name="Cdivid" value="/" onclick="operate(this.value)"></td>
                        <td width="40"></td>
                    </tr>
                    
                </table>
            </form>
        

        <script language="JavaScript">

            var answer = 0
            var lastvalue = 0
            var ope ="+"
            var lastope="+"
            var newnumber = true
            
            function input(number){
                if (ope == "=")
                    clearall()
                if ((!newnumber)&&(document.calc.result.value!="0"))
                    document.calc.result.value += eval(number)
                else
                    document.calc.result.value =""+eval(number)
                newnumber=false
            }
            
            function clearall()
            {
                answer = 0
                ope = "+"
                lastope = "+"
                clearnow()
            }
            
            function clearnow()
            {
                documnet.calc.result.value = "0"
                newnumber = true
            }
            
            function operate(operation){
                if ((newnumber!=true)||(ope == "="))
                {
                    answer = ""+answer
                    if ((operation!="=") && (ope!= "="))
                    {
                        lastvalue = document.calc.result.value
                        lastope = ope
                        answer = eval(answer+lastope+lastvalue)
                        document.calc.result.value = answer
                    }
                    else if (operation=="=")
                    {
                        if (ope!="=")
                        {
                            lastope = ope
                            lastvalue = document.calc.result.value
                        }
                        answer = eval(answer+lastope+lastvalue)
                        document.calc.result.value = answer
                    }
                    newnumber = true
                }
                ope = operation
            }
            
            function change()
            {
                answer = -1*document.calc.result.value
                document.calc.result.value=answer
            }
            
        </script>   
        </div>     
    </div>
</div>

{include file="footer.tpl"}
