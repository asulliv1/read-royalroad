function Show-Menu
{
    Param
    (
        [Parameter(Mandatory=$true)]$list
    )

    $menu = @{}
    if($list.count -eq 1){
        #only 1 object return just that
        $selection = $list
    }else{
        for ($i=1;$i -le $list.count; $i++){
            Write-Host "$i. $($list[$i-1])" 
            $menu.Add($i,($list[$i-1]))
        }
        [int]$ans = Read-Host 'Enter selection'
        $selection = $menu.Item($ans)
    }


    return $selection
}