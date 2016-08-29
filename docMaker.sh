
##
#> @file docMaker
#> Make documentation for a file which respect the correct syntax
#> @param file File to parse.
#> @param docFile Html File to create.
#> @note Please note that this script need to create temporary files 
#> @note These files will be created in the users's current directory.
#> @note These files will be automatically removed 
#> @note .
#> @note This program was created on an AIX with the dzsh, take care of compatibility!
#> @return 1 Incorrect Number of Arguments 
#> @return 127 File not found
#> @return 0 Success
#

##
#> @HowTo Comments
#> @syntax Bloc comment must follow this syntax
#>
#> ##
#> #> @keyword
#> #> ...
#> #
#> code....
#>  
#

##
#> @TODO Segmenter fichier en fonctions et les documenter
#> @TODO Ajouter des balise @ : @date, @author, @fix, @bug
# 

##
#> @CONST DIV_STYLE Define div css style for each block of comment.
#
DIV_STYLE="width:50%;border-style:solid;border-width:thin;padding-left:15px;margin-top:10px;"

##
#> @CONST EM_GREEN_TEXT Open a Green texted em html element.  
#
EM_GREEN_TEXT="<em style='color:green;'>"

##
#> @CONST DIV_GREEN_STYLE Define div css style for each note div of comment.
#
DIV_GREEN_STYLE="background:#66FF66"

##
#> @CONST DIV_NOTE_STYLE Define div css style for each note div of comment.
#
DIV_NOTE_STYLE="background:#FFFF99"

# Test du nombre d'arguments
# Si nombre d'arguments incorrect, quitter 
if test $# -ne 2
then 
	echo "Usage: "$0" fileToParse htmlToGenerate"
	exit 1
else 
	# Test de l'existance du fichier a parser.
	# if File not fount return 127
	if test -f $1 
	then
		echo "Parsing "$1
	else
		echo "This file doesn't exists !"
		exit 127
	fi
fi

# Main work is done here
# One line for each substitution 
sed -e "/^[^#]/ d" \
-e s/"^##"/"<div style='$DIV_STYLE'><p>"/g \
-e s/"^#[ \s]*$"/"<\/p><\/div>"/g \
-e s/"^#>[ \s]@function\(.*\)"/"<div id='\1' style='$DIV_GREEN_STYLE'><b>Function<\/b>\1<\/div>"/g \
-e s/"^#>[ \s]@file \([^ ]*\) *\([^ ]*\).*"/"<div id='\1' style='$DIV_GREEN_STYLE'><b>File<\/b> $EM_GREEN_TEXT\1<\/em> \2<\/div>"/g \
-e s/"^#>[ \s]@CONST \([^ ]*\) \(.*\)"/"<div id='\1' style='$DIV_GREEN_STYLE'><b>CONST<\/b>$EM_GREEN_TEXT \1<\/em> \2 <\/div>"/g \
-e s/"^#>[ \s]@var \([^ ]*\) \(.*\)"/"<div id='\1' style='$DIV_GREEN_STYLE'><b>Variable<\/b>$EM_GREEN_TEXT \1<\/em> \2 <\/div>"/g \
-e s/"^#>[ \s]@param \([^ ]*\) \(.*\)"/"<br><b>Parameter<\/b>$EM_GREEN_TEXT \1<\/em> \2 "/g \
-e s/"^#>[ \s]@note\(.*\)"/"<div style='$DIV_NOTE_STYLE'><b>Note<\/b>\1<\/div>"/g \
-e s/"^#>[ \s]@see \([^ ]*\) \(.*\)"/"<br><b>See<\/b><a href='\#\1'>\1<\/a> \2"/g \
-e s/"^#>[ \s]@\([^ ]*\) \(.*\)"/"<br><b>\1<\/b> \2 "/g \
-e s/"^#>"/"<br>"/g \
-e "/^#/ d" $1 >tmpDoc

#Generate index
grep id= tmpDoc | sed s/".*id='\([^']*\)'.*<b>\([^><]*\)<\/b>.*"/"<br><a href='#\1'>\2 \1<\/a>"/g > tmpIndex

#Add div for index and create (new) destination file.
sed -e '1 i\
<div style='$DIV_STYLE'>
' -e '$ a\
<\/div>
' tmpIndex > $2
 
#Add doc to destination file
echo "<br>">>$2
cat tmpDoc >>$2

echo "Documentation file : "$2" created"

#Clean working directory.
rm tmpDoc
rm tmpIndex

exit 0
