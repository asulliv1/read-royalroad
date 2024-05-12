function List-Chapters
{
    Param
    (
        [String]$bookURL
    )

    $BaseURL = "https://www.royalroad.com"

    $Mainpage = Invoke-WebRequest -uri "$($BaseURL)/$($bookURL)" -UseBasicParsing

    $Chapters = $Mainpage.links | Select-Object -ExpandProperty href -ErrorAction SilentlyContinue | select-String -Pattern "chapter-" | Select-Object -Unique

    return $Chapters
}