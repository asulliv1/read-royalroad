function Find-Book
{
    Param
    (
        [string]$Title
    )

    $BaseURL = "https://www.royalroad.com"
    $Title = $Title.replace(" ","+")

    $Searchresults = Invoke-WebRequest -uri "$($BaseURL)/fictions/search?title=$($Title)" -UseBasicParsing

    $HTML = New-Object -Com "HTMLFile"
    [string]$htmlBody = $Searchresults.links.outerHTML
    $HTML.write([ref]$htmlBody)
    $filter = $HTML.getElementsByClassName("font-red-sunglo bold")
    $results = ($filter | select-object pathname).pathname

    return $results
}