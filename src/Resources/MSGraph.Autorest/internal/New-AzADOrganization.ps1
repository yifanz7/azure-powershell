
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Add new entity to organization
.Description
Add new entity to organization
.Example
{{ Add code here }}
.Example
{{ Add code here }}

.Inputs
Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphOrganization
.Outputs
Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphOrganization
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

ASSIGNEDPLAN <IMicrosoftGraphAssignedPlan[]>: The collection of service plans associated with the tenant. Not nullable.
  [AssignedDateTime <DateTime?>]: The date and time at which the plan was assigned. The Timestamp type represents date and time information using ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014 is 2014-01-01T00:00:00Z.
  [CapabilityStatus <String>]: Condition of the capability assignment. The possible values are Enabled, Warning, Suspended, Deleted, LockedOut. See a detailed description of each value.
  [Service <String>]: The name of the service; for example, exchange.
  [ServicePlanId <String>]: A GUID that identifies the service plan. For a complete list of GUIDs and their equivalent friendly service names, see Product names and service plan identifiers for licensing.

BODY <IMicrosoftGraphOrganization>: organization
  [(Any) <Object>]: This indicates any property can be added to this object.
  [DeletedDateTime <DateTime?>]: Date and time when this object was deleted. Always null when the object hasn't been deleted.
  [DisplayName <String>]: The name displayed in directory
  [AssignedPlan <IMicrosoftGraphAssignedPlan[]>]: The collection of service plans associated with the tenant. Not nullable.
    [AssignedDateTime <DateTime?>]: The date and time at which the plan was assigned. The Timestamp type represents date and time information using ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014 is 2014-01-01T00:00:00Z.
    [CapabilityStatus <String>]: Condition of the capability assignment. The possible values are Enabled, Warning, Suspended, Deleted, LockedOut. See a detailed description of each value.
    [Service <String>]: The name of the service; for example, exchange.
    [ServicePlanId <String>]: A GUID that identifies the service plan. For a complete list of GUIDs and their equivalent friendly service names, see Product names and service plan identifiers for licensing.
  [Branding <IMicrosoftGraphOrganizationalBranding>]: organizationalBranding
    [(Any) <Object>]: This indicates any property can be added to this object.
    [BackgroundColor <String>]: Color that will appear in place of the background image in low-bandwidth connections. We recommend that you use the primary color of your banner logo or your organization color. Specify this in hexadecimal format, for example, white is #FFFFFF.
    [BackgroundImage <Byte[]>]: Image that appears as the background of the sign-in page. The allowed types are PNG or JPEG not smaller than 300 KB and not larger than 1920 × 1080 pixels. A smaller image will reduce bandwidth requirements and make the page load faster.
    [BackgroundImageRelativeUrl <String>]: A relative URL for the backgroundImage property that is combined with a CDN base URL from the cdnList to provide the version served by a CDN. Read-only.
    [BannerLogo <Byte[]>]: A banner version of your company logo that appears on the sign-in page. The allowed types are PNG or JPEG no larger than 36 × 245 pixels. We recommend using a transparent image with no padding around the logo.
    [BannerLogoRelativeUrl <String>]: A relative url for the bannerLogo property that is combined with a CDN base URL from the cdnList to provide the read-only version served by a CDN. Read-only.
    [CdnList <String[]>]: A list of base URLs for all available CDN providers that are serving the assets of the current resource. Several CDN providers are used at the same time for high availability of read requests. Read-only.
    [SignInPageText <String>]: Text that appears at the bottom of the sign-in box. You can use this to communicate additional information, such as the phone number to your help desk or a legal statement. This text must be Unicode and not exceed 1024 characters.
    [SquareLogo <Byte[]>]: A square version of your company logo that appears in Windows 10 out-of-box experiences (OOBE) and when Windows Autopilot is enabled for deployment. Allowed types are PNG or JPEG no larger than 240 x 240 pixels and no more than 10 KB in size. We recommend using a transparent image with no padding around the logo.
    [SquareLogoRelativeUrl <String>]: A relative url for the squareLogo property that is combined with a CDN base URL from the cdnList to provide the version served by a CDN. Read-only.
    [UsernameHintText <String>]: String that shows as the hint in the username textbox on the sign-in screen. This text must be a Unicode, without links or code, and can't exceed 64 characters.
    [Id <String>]: The unique idenfier for an entity. Read-only.
    [Localization <IMicrosoftGraphOrganizationalBrandingLocalization[]>]: Add different branding based on a locale.
      [BackgroundColor <String>]: Color that will appear in place of the background image in low-bandwidth connections. We recommend that you use the primary color of your banner logo or your organization color. Specify this in hexadecimal format, for example, white is #FFFFFF.
      [BackgroundImage <Byte[]>]: Image that appears as the background of the sign-in page. The allowed types are PNG or JPEG not smaller than 300 KB and not larger than 1920 × 1080 pixels. A smaller image will reduce bandwidth requirements and make the page load faster.
      [BackgroundImageRelativeUrl <String>]: A relative URL for the backgroundImage property that is combined with a CDN base URL from the cdnList to provide the version served by a CDN. Read-only.
      [BannerLogo <Byte[]>]: A banner version of your company logo that appears on the sign-in page. The allowed types are PNG or JPEG no larger than 36 × 245 pixels. We recommend using a transparent image with no padding around the logo.
      [BannerLogoRelativeUrl <String>]: A relative url for the bannerLogo property that is combined with a CDN base URL from the cdnList to provide the read-only version served by a CDN. Read-only.
      [CdnList <String[]>]: A list of base URLs for all available CDN providers that are serving the assets of the current resource. Several CDN providers are used at the same time for high availability of read requests. Read-only.
      [SignInPageText <String>]: Text that appears at the bottom of the sign-in box. You can use this to communicate additional information, such as the phone number to your help desk or a legal statement. This text must be Unicode and not exceed 1024 characters.
      [SquareLogo <Byte[]>]: A square version of your company logo that appears in Windows 10 out-of-box experiences (OOBE) and when Windows Autopilot is enabled for deployment. Allowed types are PNG or JPEG no larger than 240 x 240 pixels and no more than 10 KB in size. We recommend using a transparent image with no padding around the logo.
      [SquareLogoRelativeUrl <String>]: A relative url for the squareLogo property that is combined with a CDN base URL from the cdnList to provide the version served by a CDN. Read-only.
      [UsernameHintText <String>]: String that shows as the hint in the username textbox on the sign-in screen. This text must be a Unicode, without links or code, and can't exceed 64 characters.
      [Id <String>]: The unique idenfier for an entity. Read-only.
  [BusinessPhone <String[]>]: Telephone number for the organization. Although this is a string collection, only one number can be set for this property.
  [CertificateBasedAuthConfiguration <IMicrosoftGraphCertificateBasedAuthConfiguration[]>]: Navigation property to manage certificate-based authentication configuration. Only a single instance of certificateBasedAuthConfiguration can be created in the collection.
    [Id <String>]: The unique idenfier for an entity. Read-only.
    [CertificateAuthority <IMicrosoftGraphCertificateAuthority[]>]: Collection of certificate authorities which creates a trusted certificate chain.
      [Certificate <Byte[]>]: Required. The base64 encoded string representing the public certificate.
      [CertificateRevocationListUrl <String>]: The URL of the certificate revocation list.
      [DeltaCertificateRevocationListUrl <String>]: The URL contains the list of all revoked certificates since the last time a full certificate revocaton list was created.
      [IsRootAuthority <Boolean?>]: Required. true if the trusted certificate is a root authority, false if the trusted certificate is an intermediate authority.
      [Issuer <String>]: The issuer of the certificate, calculated from the certificate value. Read-only.
      [IssuerSki <String>]: The subject key identifier of the certificate, calculated from the certificate value. Read-only.
  [City <String>]: City name of the address for the organization.
  [Country <String>]: Country/region name of the address for the organization.
  [CountryLetterCode <String>]: Country or region abbreviation for the organization in ISO 3166-2 format.
  [CreatedDateTime <DateTime?>]: Timestamp of when the organization was created. The value cannot be modified and is automatically populated when the organization is created. The Timestamp type represents date and time information using ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014 is 2014-01-01T00:00:00Z. Read-only.
  [Extension <IMicrosoftGraphExtension[]>]: The collection of open extensions defined for the organization. Read-only. Nullable.
    [Id <String>]: The unique idenfier for an entity. Read-only.
  [MarketingNotificationEmail <String[]>]: Not nullable.
  [MobileDeviceManagementAuthority <MdmAuthority?>]: Mobile device management authority.
  [OnPremisesLastSyncDateTime <DateTime?>]: The time and date at which the tenant was last synced with the on-premises directory. The Timestamp type represents date and time information using ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014 is 2014-01-01T00:00:00Z. Read-only.
  [OnPremisesSyncEnabled <Boolean?>]: true if this object is synced from an on-premises directory; false if this object was originally synced from an on-premises directory but is no longer synced. Nullable. null if this object has never been synced from an on-premises directory (default).
  [PostalCode <String>]: Postal code of the address for the organization.
  [PreferredLanguage <String>]: The preferred language for the organization. Should follow ISO 639-1 Code; for example, en.
  [PrivacyProfile <IMicrosoftGraphPrivacyProfile>]: privacyProfile
    [(Any) <Object>]: This indicates any property can be added to this object.
    [ContactEmail <String>]: A valid smtp email address for the privacy statement contact. Not required.
    [StatementUrl <String>]: A valid URL format that begins with http:// or https://. Maximum length is 255 characters. The URL that directs to the company's privacy statement. Not required.
  [ProvisionedPlan <IMicrosoftGraphProvisionedPlan[]>]: Not nullable.
    [CapabilityStatus <String>]: For example, 'Enabled'.
    [ProvisioningStatus <String>]: For example, 'Success'.
    [Service <String>]: The name of the service; for example, 'AccessControlS2S'
  [SecurityComplianceNotificationMail <String[]>]: 
  [SecurityComplianceNotificationPhone <String[]>]: 
  [State <String>]: State name of the address for the organization.
  [Street <String>]: Street name of the address for organization.
  [TechnicalNotificationMail <String[]>]: Not nullable.
  [TenantType <String>]: 
  [VerifiedDomain <IMicrosoftGraphVerifiedDomain[]>]: The collection of domains associated with this tenant. Not nullable.
    [Capability <String>]: For example, Email, OfficeCommunicationsOnline.
    [IsDefault <Boolean?>]: true if this is the default domain associated with the tenant; otherwise, false.
    [IsInitial <Boolean?>]: true if this is the initial domain associated with the tenant; otherwise, false.
    [Name <String>]: The domain name; for example, contoso.onmicrosoft.com.
    [Type <String>]: For example, Managed.

BRANDING <IMicrosoftGraphOrganizationalBranding>: organizationalBranding
  [(Any) <Object>]: This indicates any property can be added to this object.
  [BackgroundColor <String>]: Color that will appear in place of the background image in low-bandwidth connections. We recommend that you use the primary color of your banner logo or your organization color. Specify this in hexadecimal format, for example, white is #FFFFFF.
  [BackgroundImage <Byte[]>]: Image that appears as the background of the sign-in page. The allowed types are PNG or JPEG not smaller than 300 KB and not larger than 1920 × 1080 pixels. A smaller image will reduce bandwidth requirements and make the page load faster.
  [BackgroundImageRelativeUrl <String>]: A relative URL for the backgroundImage property that is combined with a CDN base URL from the cdnList to provide the version served by a CDN. Read-only.
  [BannerLogo <Byte[]>]: A banner version of your company logo that appears on the sign-in page. The allowed types are PNG or JPEG no larger than 36 × 245 pixels. We recommend using a transparent image with no padding around the logo.
  [BannerLogoRelativeUrl <String>]: A relative url for the bannerLogo property that is combined with a CDN base URL from the cdnList to provide the read-only version served by a CDN. Read-only.
  [CdnList <String[]>]: A list of base URLs for all available CDN providers that are serving the assets of the current resource. Several CDN providers are used at the same time for high availability of read requests. Read-only.
  [SignInPageText <String>]: Text that appears at the bottom of the sign-in box. You can use this to communicate additional information, such as the phone number to your help desk or a legal statement. This text must be Unicode and not exceed 1024 characters.
  [SquareLogo <Byte[]>]: A square version of your company logo that appears in Windows 10 out-of-box experiences (OOBE) and when Windows Autopilot is enabled for deployment. Allowed types are PNG or JPEG no larger than 240 x 240 pixels and no more than 10 KB in size. We recommend using a transparent image with no padding around the logo.
  [SquareLogoRelativeUrl <String>]: A relative url for the squareLogo property that is combined with a CDN base URL from the cdnList to provide the version served by a CDN. Read-only.
  [UsernameHintText <String>]: String that shows as the hint in the username textbox on the sign-in screen. This text must be a Unicode, without links or code, and can't exceed 64 characters.
  [Id <String>]: The unique idenfier for an entity. Read-only.
  [Localization <IMicrosoftGraphOrganizationalBrandingLocalization[]>]: Add different branding based on a locale.
    [BackgroundColor <String>]: Color that will appear in place of the background image in low-bandwidth connections. We recommend that you use the primary color of your banner logo or your organization color. Specify this in hexadecimal format, for example, white is #FFFFFF.
    [BackgroundImage <Byte[]>]: Image that appears as the background of the sign-in page. The allowed types are PNG or JPEG not smaller than 300 KB and not larger than 1920 × 1080 pixels. A smaller image will reduce bandwidth requirements and make the page load faster.
    [BackgroundImageRelativeUrl <String>]: A relative URL for the backgroundImage property that is combined with a CDN base URL from the cdnList to provide the version served by a CDN. Read-only.
    [BannerLogo <Byte[]>]: A banner version of your company logo that appears on the sign-in page. The allowed types are PNG or JPEG no larger than 36 × 245 pixels. We recommend using a transparent image with no padding around the logo.
    [BannerLogoRelativeUrl <String>]: A relative url for the bannerLogo property that is combined with a CDN base URL from the cdnList to provide the read-only version served by a CDN. Read-only.
    [CdnList <String[]>]: A list of base URLs for all available CDN providers that are serving the assets of the current resource. Several CDN providers are used at the same time for high availability of read requests. Read-only.
    [SignInPageText <String>]: Text that appears at the bottom of the sign-in box. You can use this to communicate additional information, such as the phone number to your help desk or a legal statement. This text must be Unicode and not exceed 1024 characters.
    [SquareLogo <Byte[]>]: A square version of your company logo that appears in Windows 10 out-of-box experiences (OOBE) and when Windows Autopilot is enabled for deployment. Allowed types are PNG or JPEG no larger than 240 x 240 pixels and no more than 10 KB in size. We recommend using a transparent image with no padding around the logo.
    [SquareLogoRelativeUrl <String>]: A relative url for the squareLogo property that is combined with a CDN base URL from the cdnList to provide the version served by a CDN. Read-only.
    [UsernameHintText <String>]: String that shows as the hint in the username textbox on the sign-in screen. This text must be a Unicode, without links or code, and can't exceed 64 characters.
    [Id <String>]: The unique idenfier for an entity. Read-only.

CERTIFICATEBASEDAUTHCONFIGURATION <IMicrosoftGraphCertificateBasedAuthConfiguration[]>: Navigation property to manage certificate-based authentication configuration. Only a single instance of certificateBasedAuthConfiguration can be created in the collection.
  [Id <String>]: The unique idenfier for an entity. Read-only.
  [CertificateAuthority <IMicrosoftGraphCertificateAuthority[]>]: Collection of certificate authorities which creates a trusted certificate chain.
    [Certificate <Byte[]>]: Required. The base64 encoded string representing the public certificate.
    [CertificateRevocationListUrl <String>]: The URL of the certificate revocation list.
    [DeltaCertificateRevocationListUrl <String>]: The URL contains the list of all revoked certificates since the last time a full certificate revocaton list was created.
    [IsRootAuthority <Boolean?>]: Required. true if the trusted certificate is a root authority, false if the trusted certificate is an intermediate authority.
    [Issuer <String>]: The issuer of the certificate, calculated from the certificate value. Read-only.
    [IssuerSki <String>]: The subject key identifier of the certificate, calculated from the certificate value. Read-only.

EXTENSION <IMicrosoftGraphExtension[]>: The collection of open extensions defined for the organization. Read-only. Nullable.
  [Id <String>]: The unique idenfier for an entity. Read-only.

PRIVACYPROFILE <IMicrosoftGraphPrivacyProfile>: privacyProfile
  [(Any) <Object>]: This indicates any property can be added to this object.
  [ContactEmail <String>]: A valid smtp email address for the privacy statement contact. Not required.
  [StatementUrl <String>]: A valid URL format that begins with http:// or https://. Maximum length is 255 characters. The URL that directs to the company's privacy statement. Not required.

PROVISIONEDPLAN <IMicrosoftGraphProvisionedPlan[]>: Not nullable.
  [CapabilityStatus <String>]: For example, 'Enabled'.
  [ProvisioningStatus <String>]: For example, 'Success'.
  [Service <String>]: The name of the service; for example, 'AccessControlS2S'

VERIFIEDDOMAIN <IMicrosoftGraphVerifiedDomain[]>: The collection of domains associated with this tenant. Not nullable.
  [Capability <String>]: For example, Email, OfficeCommunicationsOnline.
  [IsDefault <Boolean?>]: true if this is the default domain associated with the tenant; otherwise, false.
  [IsInitial <Boolean?>]: true if this is the initial domain associated with the tenant; otherwise, false.
  [Name <String>]: The domain name; for example, contoso.onmicrosoft.com.
  [Type <String>]: For example, Managed.
.Link
https://learn.microsoft.com/powershell/module/az.resources/new-azadorganization
#>
function New-AzADOrganization {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphOrganization])]
[CmdletBinding(DefaultParameterSetName='CreateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Create', Mandatory, ValueFromPipeline)]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphOrganization]
    # organization
    # To construct, see NOTES section for BODY properties and create a hash table.
    ${Body},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.Collections.Hashtable]
    # Additional Parameters
    ${AdditionalProperties},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphAssignedPlan[]]
    # The collection of service plans associated with the tenant.
    # Not nullable.
    # To construct, see NOTES section for ASSIGNEDPLAN properties and create a hash table.
    ${AssignedPlan},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphOrganizationalBranding]
    # organizationalBranding
    # To construct, see NOTES section for BRANDING properties and create a hash table.
    ${Branding},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String[]]
    # Telephone number for the organization.
    # Although this is a string collection, only one number can be set for this property.
    ${BusinessPhone},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphCertificateBasedAuthConfiguration[]]
    # Navigation property to manage certificate-based authentication configuration.
    # Only a single instance of certificateBasedAuthConfiguration can be created in the collection.
    # To construct, see NOTES section for CERTIFICATEBASEDAUTHCONFIGURATION properties and create a hash table.
    ${CertificateBasedAuthConfiguration},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String]
    # City name of the address for the organization.
    ${City},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String]
    # Country/region name of the address for the organization.
    ${Country},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String]
    # Country or region abbreviation for the organization in ISO 3166-2 format.
    ${CountryLetterCode},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.DateTime]
    # Timestamp of when the organization was created.
    # The value cannot be modified and is automatically populated when the organization is created.
    # The Timestamp type represents date and time information using ISO 8601 format and is always in UTC time.
    # For example, midnight UTC on Jan 1, 2014 is 2014-01-01T00:00:00Z.
    # Read-only.
    ${CreatedDateTime},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.DateTime]
    # Date and time when this object was deleted.
    # Always null when the object hasn't been deleted.
    ${DeletedDateTime},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String]
    # The name displayed in directory
    ${DisplayName},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphExtension[]]
    # The collection of open extensions defined for the organization.
    # Read-only.
    # Nullable.
    # To construct, see NOTES section for EXTENSION properties and create a hash table.
    ${Extension},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String[]]
    # Not nullable.
    ${MarketingNotificationEmail},

    [Parameter(ParameterSetName='CreateExpanded')]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Support.MdmAuthority])]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Support.MdmAuthority]
    # Mobile device management authority.
    ${MobileDeviceManagementAuthority},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.DateTime]
    # The time and date at which the tenant was last synced with the on-premises directory.
    # The Timestamp type represents date and time information using ISO 8601 format and is always in UTC time.
    # For example, midnight UTC on Jan 1, 2014 is 2014-01-01T00:00:00Z.
    # Read-only.
    ${OnPremisesLastSyncDateTime},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.Management.Automation.SwitchParameter]
    # true if this object is synced from an on-premises directory; false if this object was originally synced from an on-premises directory but is no longer synced.
    # Nullable.
    # null if this object has never been synced from an on-premises directory (default).
    ${OnPremisesSyncEnabled},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String]
    # Postal code of the address for the organization.
    ${PostalCode},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String]
    # The preferred language for the organization.
    # Should follow ISO 639-1 Code; for example, en.
    ${PreferredLanguage},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphPrivacyProfile]
    # privacyProfile
    # To construct, see NOTES section for PRIVACYPROFILE properties and create a hash table.
    ${PrivacyProfile},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphProvisionedPlan[]]
    # Not nullable.
    # To construct, see NOTES section for PROVISIONEDPLAN properties and create a hash table.
    ${ProvisionedPlan},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String[]]
    # .
    ${SecurityComplianceNotificationMail},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String[]]
    # .
    ${SecurityComplianceNotificationPhone},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String]
    # State name of the address for the organization.
    ${State},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String]
    # Street name of the address for organization.
    ${Street},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String[]]
    # Not nullable.
    ${TechnicalNotificationMail},

    [Parameter(ParameterSetName='CreateExpanded')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [System.String]
    # .
    ${TenantType},

    [Parameter(ParameterSetName='CreateExpanded')]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphVerifiedDomain[]]
    # The collection of domains associated with this tenant.
    # Not nullable.
    # To construct, see NOTES section for VERIFIEDDOMAIN properties and create a hash table.
    ${VerifiedDomain},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName

        $mapping = @{
            Create = 'Az.MSGraph.private\New-AzADOrganization_Create';
            CreateExpanded = 'Az.MSGraph.private\New-AzADOrganization_CreateExpanded';
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {

        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {

        throw
    }

}
end {
    try {
        $steppablePipeline.End()

    } catch {

        throw
    }
} 
}
