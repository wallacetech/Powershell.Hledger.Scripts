Function format-bankstatement {
    [cmdletbinding()]
    Param (
        [string] $path,
        [object] $accounts
    )

    try {
        $content = get-content $path
    } 
    catch {
       Write-Error "Failed to open file $path" -ErrorAction stop
    }

    # Strip quotes
    $content = $content -replace "`"", ""

    # replace Account # with hledger account
    $accounts.accounts | ForEach-Object { $content = $content -replace $_.accountno, $_.hledgeraccount }
    
    return $content
}


