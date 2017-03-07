function Add-DeepMind ($A, $B) {
    $body = [pscustomobject]@{
        a = $A;
        b = $B
    } | ConvertTo-Json

    # "http://dupsug10.0115633a.svc.dockerapp.io/deepmind/add"
    

    # implement the same thing as in Postman
}

Export-ModuleMember -Function "Add-DeepMind"