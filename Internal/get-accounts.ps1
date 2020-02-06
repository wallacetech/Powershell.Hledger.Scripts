Function get-accounts {
    [cmdletbinding()]
    Param (
        [string] $path
    )

    return get-content $path | convertfrom-json

}