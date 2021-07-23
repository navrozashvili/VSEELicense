# 📜 VSEELicense

- [Details](#details)
- [Usage](#usage)
- [Examples](#examples)
  - [Get Visual Studio 2022 Enterprise Edition license expiration date](#get-visual-studio-enterprise-edition-license-expiration-date)
  - [Set Visual Studio 2022 Enterprise Edition license expiration date](#set-visual-studio-enterprise-edition-license-expiration-date)
    - [Set license expiration date to 31 day from now](#set-license-expiration-date-to-31-days-from-nowy)
    - [Set license expiration date to 10 days from now](#set-license-expiration-date-to-10-days-from-now)
    - [Set license expiration date to current date](#set-license-expiration-date-to-current-date)
- [Changelog](#changelog)

## Details

PowerShell module to get and set Visual Studio 2022 Enterprise Edition license expiration date in the registry.

Based on [Dmitrii](https://stackoverflow.com/users/10046552/dmitrii)'s answer to this question: [Is Visual Studio Community a 30 day trial?](https://stackoverflow.com/questions/43390466/visual-studio-community-2017-is-a-30-day-trial/51570570#51570570)

## Usage

1. Download/clone this repository
2. Run PowerShell.exe as Administrator
3. Import module:

    Assuming that you cloned/downloaded this repo to `C:\VSEELicense`

   ```pwsh
   Import-Module -Name "C:\VSEELicense\VSEELicense.psd1"
   ```

    If you get `execution of scripts is disabled on this system` message, you can temporarily override PowerShell execution policy by running

   ```pwsh
   Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
   ```

    See PowerShell documentation for more details:

    - [Set-ExecutionPolicy](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy)
    - [About Execution Policies](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies)

## Examples

### Get Visual Studio 2022 Enterprise Edition license expiration date

```pwsh
Get-VSEELicenseExpirationDate
```

### Set Visual Studio 2022 Enterprise Edition license expiration date

⚡ Writing to the Visual Studio license registry key requires elevated permissions. Run PowerShell as administrator for examples to work.

#### Set license expiration date to 31 day from now

```pwsh
Set-VSEELicenseExpirationDate
```

#### Set license expiration date to 10 days from now

```pwsh
Set-VSEELicenseExpirationDate -AddDays 10
```

#### Set license expiration date to current date

⚡ This will immediately expire your license and you wouldn't be able to use Visual Studio.

```pwsh
Set-VSEELicenseExpirationDate -AddDays 0
```

### Changelog

- 0.0.10 - Replaced 2019 with 2022 prerelase 
- 0.0.9 - Added 2019 Enterprise support only. Removed 2015, 2017 & 2019 Community
- 0.0.8 - Make it easier to use by not requiring to specify Visual Studio version
- 0.0.7 - Added 2015 support ([@GDI123](https://github.com/GDI123))
- 0.0.6 - Load `System.Security` assembly if module was imported without manifest
- 0.0.5 - Duh, actually set `PowerShellVersion = "3.0"` in manifest
- 0.0.4 - Support downlevel PowerShell versions, starting from `3.0`
- 0.0.3 - Fixed manifest to avoid execution errors under fresh PowerShell environments ([@1Dimitri](https://github.com/1Dimitri))
- 0.0.2 - Added 2019 support
- 0.0.1 - Initial commit, 2017 support
