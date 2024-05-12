Import-Module  ".\read-royalroad.psd1" -force -verbose

#Select a Chapter to read.
$Booklist = Find-Book -Title "post human"
$bookurl = Show-Menu -list $Booklist
$Chapterlist = List-Chapters -bookURL $bookurl
$Chapterurl = Show-Menu -list $Chapterlist
Read-Chapter -ChapterURL $Chapterurl



