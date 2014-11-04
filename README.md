docMaker
========

Shell script to generate html documentation with specials code comments.

<div style=width:50%;border-style:solid;border-width:thin;padding-left:15px;margin-top:10px;>
<br><a href='#docMaker'>File docMaker</a>
<br><a href='#DIV_STYLE'>CONST DIV_STYLE</a>
<br><a href='#EM_GREEN_TEXT'>CONST EM_GREEN_TEXT</a>
<br><a href='#DIV_GREEN_STYLE'>CONST DIV_GREEN_STYLE</a>
<br><a href='#DIV_NOTE_STYLE'>CONST DIV_NOTE_STYLE</a>
</div>
<br>

<div style='width:50%;border-style:solid;border-width:thin;padding-left:15px;margin-top:10px;'><p>
<div id='docMaker' style='background:#66FF66'><b>File</b><em style='color:green;'>docMaker</em> </div>
<br> Make documentation for a file which respect the correct syntax
<br><b>Parameter</b><em style='color:green;'> file</em> File to parse. 
<br><b>Parameter</b><em style='color:green;'> docFile</em> Html File to create. 
<div style='background:#FFFF99'><b>Note</b> Please note that this script need to create temporary files </div>
<div style='background:#FFFF99'><b>Note</b> These files will be created in the users's current directory.</div>
<div style='background:#FFFF99'><b>Note</b> These files will be automatically removed </div>
<div style='background:#FFFF99'><b>Note</b> .</div>
<div style='background:#FFFF99'><b>Note</b> This program was created on an AIX with the dzsh, take care of compatibility!</div>
</p></div>

<div style='width:50%;border-style:solid;border-width:thin;padding-left:15px;margin-top:10px;'><p>
<br><b>HowTo</b> Comments 
<br><b>syntax</b> Bloc comment must follow this syntax 
<br><b>:</b>  
<br><b>:</b> ## 
<br><b>:</b> # @keyword 
<br><b>:</b> # ... 
<br><b>:</b> # 
<br><b>:</b> code.... 
<br><b>:</b>  
</p></div>

<div style='width:50%;border-style:solid;border-width:thin;padding-left:15px;margin-top:10px;'><p>
<div id='DIV_STYLE' style='background:#66FF66'><b>CONST</b><em style='color:green;'> DIV_STYLE</em> Define div css style for each block of comment. </div>
</p></div>

<div style='width:50%;border-style:solid;border-width:thin;padding-left:15px;margin-top:10px;'><p>
<div id='EM_GREEN_TEXT' style='background:#66FF66'><b>CONST</b><em style='color:green;'> EM_GREEN_TEXT</em> Open a Green texted em html element.   </div>
</p></div>

<div style='width:50%;border-style:solid;border-width:thin;padding-left:15px;margin-top:10px;'><p>
<div id='DIV_GREEN_STYLE' style='background:#66FF66'><b>CONST</b><em style='color:green;'> DIV_GREEN_STYLE</em> Define div css style for each note div of comment. </div>
</p></div>

<div style='width:50%;border-style:solid;border-width:thin;padding-left:15px;margin-top:10px;'><p>
<div id='DIV_NOTE_STYLE' style='background:#66FF66'><b>CONST</b><em style='color:green;'> DIV_NOTE_STYLE</em> Define div css style for each note div of comment. </div>
</p></div>







