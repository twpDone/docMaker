
##
# @file docMaker
# Make documentation for a file which respect the correct syntax
# @param file File to parse.
# @param docFile Html File to create.
# @note Please note that this script need to create temporary files 
# @note These files will be created in the users's current directory.
# @note These files will be automatically removed 
# @note .
# @note This program was created with the non-GNU sed, take care of compatibility!
#

##
# @HowTo Comments
# @syntax Bloc comment must follow this syntax
# @: 
# @: ##
# @: # @keyword
# @: # ...
# @: #
# @: code....
# @: 
#

##
# @CONST DIV_STYLE Define div css style for each block of comment.
#
DIV_STYLE="width:50%;border-style:solid;border-width:thin;padding-left:15px;margin-top:10px;"

##
# @CONST EM_GREEN_TEXT Open a Green texted em html element.  
#
EM_GREEN_TEXT="<em style='color:green;'>"

##
# @CONST DIV_GREEN_STYLE Define div css style for each note div of comment.
#
DIV_GREEN_STYLE="background:#66FF66"

##
# @CONST DIV_NOTE_STYLE Define div css style for each note div of comment.
#
DIV_NOTE_STYLE="background:#FFFF99"

if test $# -ne 2
then 
	echo "Usage: "$0" fileToParse htmlToGenerate"
	exit 1
else 
	if test -f $1 
	then
		echo "Parsing "$1
	else
		echo "This file doesn't exists !"
		exit 127
	fi
fi

sed -e "/^[^#]/ d" \
-e s/"^##"/"<div style='$DIV_STYLE'><p>"/g \
-e s/"^#[ \s]*$"/"<\/p><\/div>"/g \
-e s/".*@function\(.*\)"/"<div id='\1' style='$DIV_GREEN_STYLE'><b>Function<\/b>\1<\/div>"/g \
-e s/".*@file \([^ ]*\) *\([^ ]*\).*"/"<div id='\1' style='$DIV_GREEN_STYLE'><b>File<\/b>$EM_GREEN_TEXT\1<\/em> \2<\/div>"/g \
-e s/".*@CONST \([^ ]*\) \(.*\)"/"<div id='\1' style='$DIV_GREEN_STYLE'><b>CONST<\/b>$EM_GREEN_TEXT \1<\/em> \2 <\/div>"/g \
-e s/".*@var \([^ ]*\) \(.*\)"/"<div id='\1' style='$DIV_GREEN_STYLE'><b>Variable<\/b>$EM_GREEN_TEXT \1<\/em> \2 <\/div>"/g \
-e s/".*@param \([^ ]*\) \(.*\)"/"<br><b>Parameter<\/b>$EM_GREEN_TEXT \1<\/em> \2 "/g \
-e s/".*@note\(.*\)"/"<div style='$DIV_NOTE_STYLE'><b>Note<\/b>\1<\/div>"/g \
-e s/".*@\([^ ]*\) \(.*\)"/"<br><b>\1<\/b> \2 "/g \
-e s/"^#"/"<br>"/g $1 >tmpDoc

grep id= tmpDoc | sed s/".*id='\([^']*\)'.*<b>\([^><]*\)<\/b>.*"/"<br><a href='#\1'>\2 \1<\/a>"/g > tmpIndex

sed -e '1 i\
<div style='$DIV_STYLE'>
' -e '$ a\
<\/div>
' tmpIndex > $2
 
echo "<br>">>$2
cat tmpDoc >>$2

echo "Documentation file : "$2" created"

rm tmpDoc
rm tmpIndex

exit 0
