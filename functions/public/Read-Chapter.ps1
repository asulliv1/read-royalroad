function Read-Chapter
{
    Param
    (
        [String]$ChapterURL
    )

    $BaseURL = "https://www.royalroad.com"

    $ChapterContent = Invoke-WebRequest -uri "$($BaseURL)$($ChapterURL)"

    [string]$Chapter = ($ChapterContent.ParsedHtml.GetElementsByTagName('div') | Where-Object {
        $_.ClassName -eq 'chapter-inner chapter-content'
    }).InnerText

    Add-Type -AssemblyName System.Speech
    $speak = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
    $speak.SelectVoice('Microsoft Zira Desktop')

    #We are going to iterate through each line so we can top the narrator sooner.
    Foreach ($line in $Chapter.Split([System.Environment]::NewLine,[System.StringSplitOptions]::RemoveEmptyEntries)){
        write-host $line
        $speak.Speak($line)
    }
}