<#
.SYNOPSIS
    .
.DESCRIPTION
    Load Test Runner
.PARAMETER PropertyFile
    Property File
#>
Param (
    [Parameter(Mandatory)]
    #[ValidateScript({if(-Not ($_ | Test-Path)) { throw "File does not exist" } return $true })]
    #[System.IO.FileInfo]
    [String]    
    $TestPlan,
    [Parameter(Mandatory)]
    #[ValidateScript({if(-Not ($_ | Test-Path)) { throw "File does not exist" } return $true })]
    #[System.IO.FileInfo]
    [String]    
    $PropertyFile
)

$jmeter = "jmeter"
$resultPath = "RunResults"

if(-Not (Test-Path "./$resultPath")) {
    New-Item -Path "." -Name $resultPath -ItemType "directory"
}
    
$runAt=get-date -Format "dd.MM.yyy.HH.mm.ss"
$result = "./$resultPath" + "/result-$($runAt)/"
$log = "./$resultPath" + "/result-$($runAt).log"
$props = "./jmeter.properties"

$args = @('-n', '-t', $TestPlan, '-e', '-o', $result, '-l', $log, '-p', $props, '-q', $PropertyFile)

& $jmeter $args