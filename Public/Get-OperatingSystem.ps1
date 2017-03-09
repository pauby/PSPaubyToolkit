function Get-OperatingSystem
{
    $os = Get-WmiObject -class Win32_OperatingSystem

    switch ($os.Version) {
        "6.0.6001" {
            if ($os.ProductType -ne 1){
                $ver = 2008
            }
        }
        "6.1.7600" {
            if ($os.ProductType -ne 1) {
                $ver = 2008 # really 2008 r2
            }
        }
        "6.1.7601" {
            $ver = 2008 # really 2008 r2
        }
        "6.2.9200" {
            if ($os.ProductType -ne 1) {
                $ver = 2012
            }
        }
        "6.3.9600" {
            if ($os.ProductType -ne 1) {
                $ver = 2012 # really 2012 r2
            }
        }
        default {
            $ver = 0
        }
    }

    $ver
}
