Function Set-Credentials ([string]$Username, [string]$Password)
{
    $SecurePassword = ConvertTo-SecureString -String $Password -AsPlainText -Force
    
    $Credential = new-object -typename System.Management.Automation.PSCredential -argumentlist $Username, $SecurePassword

    Return $Credential
}

Function Set-CredentialsFromFile ([string]$Username, [string]$Filename)
# first you have to create a file with following command:
#    read-host -assecurestring | convertfrom-securestring | out-file $LocalPath"\securestring.txt"
{
    $SecurePassword = cat $Filename | ConvertTo-SecureString
    
    $Credential = new-object -typename System.Management.Automation.PSCredential -argumentlist $Username, $SecurePassword

    Return $Credential
}