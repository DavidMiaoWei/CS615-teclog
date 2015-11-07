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
            <span><a href="#" onclick="document.getElementById('updateForm').submit();">Save</a></span>&nbsp;|&nbsp;<span><a href="index.php?action=delete">Delete</a></span>&nbsp;|&nbsp;<span>Calculator</span>&nbsp;|&nbsp;<span>Check Cookies</span>
            <span class="right">Fname Lname</span>
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
                <center><table border="2" bordercolordark="#000000" cellspacing="1" cellpadding="0">
                    <tr>
                        <td width="250" colspan="5"><input name="result" type="text" size="20" value="0" onfocus="blur()" >
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="40"><input type="button" name="Cone" value="1" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="Ctwo" value="2" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="Cthree" value="3" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="CE" value="CE" onclick="clearall()"></td>
                        <td width="40"><input type="button" name="C" value="C" onclick="clearnow()"></td>
                    </tr>
                    
                    <tr>
                        <td width="40"><input type="button" name="Cfour" value="4" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="Cfive" value="5" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="Csix" value="6" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="sing" value="-/+" onclick="change()"></td>
                        <td width="40"><input type="button" name="equla" value="=" onclick="operate(this.value)"></td>
                    </tr>
                    
                    <tr>
                        <td width="40"><input type="button" name="Cseven" value="7" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="Ceight" value="8" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="Cnine" value="9" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="Cplus" value="+" onclick="operate(this.value)"></td>
                        <td width="40"><input type="button" name="Csubtract" value="-" onclick="operate(this.value)"></td>
                    </tr>
                    <tr>
                        <td width="40"><input type="button" name="Czero" value="0" onclick="input(this.value)"></td>
                        <td width="40"><input type="button" name="Cpoint" value="." onclick="point()"></td>
                        <td width="40"><input type="button" name="Cmul" value="*" onclick="operate(this.value)"></td>
                        <td width="40"><input type="button" name="Cdivid" value="/" onclick="operate(this.value)"></td>
                        <td width="40"></td>
                    </tr>
                    
                </table>
    </div>
</div>

{include file="footer.tpl"}
