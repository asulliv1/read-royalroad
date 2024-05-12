Import-Module  ".\read-royalroad.psd1" -force -verbose

#Select a Chapter to read.
$Booklist = Find-Book -Title "defiance of the fall"
$bookurl = Show-Menu -list $Booklist
$Chapterlist = List-Chapters -bookURL $bookurl
$Chapterurl = Show-Menu -list $Chapterlist
Read-Chapter -ChapterURL $Chapterurl

#Read the newest Chapter.
$bookurl = "fiction/24709/defiance-of-the-fall"
$Chapterlist = List-Chapters -bookURL $bookurl
Read-Chapter -ChapterURL ($Chapterlist | Select-Object -Last 1)


