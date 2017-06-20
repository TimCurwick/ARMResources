<#
.SYNOPSIS
    WindowsFeaturesDSC.ps1

.Description
    DSC configuration to install arbitrary list of Windows features

.NOTES
    Designed to be used by "RBA Azure VM build console.ps1"

.NOTES
    v 1.0   6/20/2017  Tim Curwick  Created
#>

configuration WindowsFeatures
    {
    param
        (
        [String]$FeatureList
        )

    Node localhost
        {
        ForEach ( $Feature in $FeatureList.Split( ',;' ) )
            {
            WindowsFeature $Feature
                {
                Name   = $Feature
                Ensure = "Present"
                }
            }
        }
    }
