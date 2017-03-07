. $PSScriptRoot\Helpers\AppVeyorHelpers.ps1

Import-Module $PSScriptRoot\DeepMind.psm1 -Force


Describe "Add-DeepMind" {
    It "Adds <A> and <B> in the cloud and returns <Expected>" -TestCases @(
        @{ A = 1; B = 1; Expected = 2 },
        @{ A = 100; B = 10; Expected = 110 },
        @{ A = -1; B = 1; Expected = 0 }       
    ) {
        param($A, $B, $Expected)
        # -- Arrange

        # -- Act
        $actual = Add-DeepMind -A $A -B $B

        # -- Assert
        $actual | Should Be $Expected
    }

    It "Calls Invoke-WebRequest with the correct parameters" {
        # -- Arrange
        $expectedUri = "http://dupsug10.0115633a.svc.dockerapp.io/deepmind/add" 
        Mock Invoke-WebRequest 
        Mock Invoke-WebRequest -ParameterFilter { $Uri -eq $expectedUri }

        # -- Act
        Add-DeepMind -A 10 -B 11

        # -- Assert
        Assert-MockCalled -CommandName Invoke-WebRequest -ParameterFilter { $Uri -eq $expectedUri } 
    } 
}