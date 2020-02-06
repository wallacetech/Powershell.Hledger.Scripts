Function import-bankstatements {
    [cmdletbinding()]
    Param (
        [string] $path
    )

    $parentdirectory = split-path $path -Leaf
    $accountspath    = join-path $path "\$parentdirectory.accounts.json"
    $accounts        = get-accounts $accountspath


    $csvpath         = join-path $path "\in\*"
    $outputpath      = join-path $path "\csv\"
    

    
    get-childitem -path $csvpath -Include *.csv | foreach-object {

        $outputfile = join-path $outputpath $($_.basename + ".csv")
        format-bankstatement -accounts $accounts -path $_.FullName | set-content $outputfile
    }

}