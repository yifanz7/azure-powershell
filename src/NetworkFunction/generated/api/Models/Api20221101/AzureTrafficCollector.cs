// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101
{
    using static Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Runtime.Extensions;

    /// <summary>Azure Traffic Collector resource.</summary>
    public partial class AzureTrafficCollector :
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollector,
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorInternal,
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Runtime.IValidates
    {
        /// <summary>
        /// Backing field for Inherited model <see cref= "Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResource"
        /// />
        /// </summary>
        private Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResource __trackedResource = new Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.TrackedResource();

        /// <summary>Collector Policies for Azure Traffic Collector.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inlined)]
        public Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IResourceReference[] CollectorPolicy { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).CollectorPolicy; }

        /// <summary>Backing field for <see cref="Etag" /> property.</summary>
        private string _etag;

        /// <summary>A unique read-only string that changes whenever the resource is updated.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Owned)]
        public string Etag { get => this._etag; }

        /// <summary>Resource ID.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public string Id { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Id; }

        /// <summary>Resource location.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public string Location { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Location; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Location = value ; }

        /// <summary>Internal Acessors for CollectorPolicy</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IResourceReference[] Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorInternal.CollectorPolicy { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).CollectorPolicy; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).CollectorPolicy = value; }

        /// <summary>Internal Acessors for Etag</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorInternal.Etag { get => this._etag; set { {_etag = value;} } }

        /// <summary>Internal Acessors for Property</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormat Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorInternal.Property { get => (this._property = this._property ?? new Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.AzureTrafficCollectorPropertiesFormat()); set { {_property = value;} } }

        /// <summary>Internal Acessors for ProvisioningState</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Support.ProvisioningState? Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorInternal.ProvisioningState { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).ProvisioningState; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).ProvisioningState = value; }

        /// <summary>Internal Acessors for VirtualHub</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IResourceReference Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorInternal.VirtualHub { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).VirtualHub; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).VirtualHub = value; }

        /// <summary>Internal Acessors for VirtualHubId</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorInternal.VirtualHubId { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).VirtualHubId; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).VirtualHubId = value; }

        /// <summary>Internal Acessors for Id</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal.Id { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Id; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Id = value; }

        /// <summary>Internal Acessors for Name</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal.Name { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Name; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Name = value; }

        /// <summary>Internal Acessors for SystemData</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ISystemData Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal.SystemData { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemData; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemData = value; }

        /// <summary>Internal Acessors for Type</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal.Type { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Type; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Type = value; }

        /// <summary>Resource name.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public string Name { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Name; }

        /// <summary>Backing field for <see cref="Property" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormat _property;

        /// <summary>Properties of the Azure Traffic Collector.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormat Property { get => (this._property = this._property ?? new Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.AzureTrafficCollectorPropertiesFormat()); set => this._property = value; }

        /// <summary>The provisioning state of the application rule collection resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inlined)]
        public Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Support.ProvisioningState? ProvisioningState { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).ProvisioningState; }

        /// <summary>Gets the resource group name</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Owned)]
        public string ResourceGroupName { get => (new global::System.Text.RegularExpressions.Regex("^/subscriptions/(?<subscriptionId>[^/]+)/resourceGroups/(?<resourceGroupName>[^/]+)/providers/", global::System.Text.RegularExpressions.RegexOptions.IgnoreCase).Match(this.Id).Success ? new global::System.Text.RegularExpressions.Regex("^/subscriptions/(?<subscriptionId>[^/]+)/resourceGroups/(?<resourceGroupName>[^/]+)/providers/", global::System.Text.RegularExpressions.RegexOptions.IgnoreCase).Match(this.Id).Groups["resourceGroupName"].Value : null); }

        /// <summary>Metadata pertaining to creation and last modification of the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ISystemData SystemData { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemData; }

        /// <summary>The timestamp of resource creation (UTC).</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public global::System.DateTime? SystemDataCreatedAt { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataCreatedAt; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataCreatedAt = value ?? default(global::System.DateTime); }

        /// <summary>The identity that created the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public string SystemDataCreatedBy { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataCreatedBy; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataCreatedBy = value ?? null; }

        /// <summary>The type of identity that created the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Support.CreatedByType? SystemDataCreatedByType { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataCreatedByType; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataCreatedByType = value ?? ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Support.CreatedByType)""); }

        /// <summary>The identity that last modified the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public string SystemDataLastModifiedBy { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataLastModifiedBy; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataLastModifiedBy = value ?? null; }

        /// <summary>The type of identity that last modified the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Support.CreatedByType? SystemDataLastModifiedByType { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataLastModifiedByType; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).SystemDataLastModifiedByType = value ?? ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Support.CreatedByType)""); }

        /// <summary>Resource tags.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceTags Tag { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Tag; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Tag = value ?? null /* model class */; }

        /// <summary>Resource type.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inherited)]
        public string Type { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal)__trackedResource).Type; }

        /// <summary>Resource ID.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.PropertyOrigin.Inlined)]
        public string VirtualHubId { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormatInternal)Property).VirtualHubId; }

        /// <summary>Creates an new <see cref="AzureTrafficCollector" /> instance.</summary>
        public AzureTrafficCollector()
        {

        }

        /// <summary>Validates that this object meets the validation criteria.</summary>
        /// <param name="eventListener">an <see cref="Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Runtime.IEventListener" /> instance that will receive validation
        /// events.</param>
        /// <returns>
        /// A <see cref = "global::System.Threading.Tasks.Task" /> that will be complete when validation is completed.
        /// </returns>
        public async global::System.Threading.Tasks.Task Validate(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Runtime.IEventListener eventListener)
        {
            await eventListener.AssertNotNull(nameof(__trackedResource), __trackedResource);
            await eventListener.AssertObjectIsValid(nameof(__trackedResource), __trackedResource);
        }
    }
    /// Azure Traffic Collector resource.
    public partial interface IAzureTrafficCollector :
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Runtime.IJsonSerializable,
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResource
    {
        /// <summary>Collector Policies for Azure Traffic Collector.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Description = @"Collector Policies for Azure Traffic Collector.",
        SerializedName = @"collectorPolicies",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IResourceReference) })]
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IResourceReference[] CollectorPolicy { get;  }
        /// <summary>A unique read-only string that changes whenever the resource is updated.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Description = @"A unique read-only string that changes whenever the resource is updated.",
        SerializedName = @"etag",
        PossibleTypes = new [] { typeof(string) })]
        string Etag { get;  }
        /// <summary>The provisioning state of the application rule collection resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Description = @"The provisioning state of the application rule collection resource.",
        SerializedName = @"provisioningState",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Support.ProvisioningState) })]
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Support.ProvisioningState? ProvisioningState { get;  }
        /// <summary>Resource ID.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Description = @"Resource ID.",
        SerializedName = @"id",
        PossibleTypes = new [] { typeof(string) })]
        string VirtualHubId { get;  }

    }
    /// Azure Traffic Collector resource.
    internal partial interface IAzureTrafficCollectorInternal :
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.ITrackedResourceInternal
    {
        /// <summary>Collector Policies for Azure Traffic Collector.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IResourceReference[] CollectorPolicy { get; set; }
        /// <summary>A unique read-only string that changes whenever the resource is updated.</summary>
        string Etag { get; set; }
        /// <summary>Properties of the Azure Traffic Collector.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IAzureTrafficCollectorPropertiesFormat Property { get; set; }
        /// <summary>The provisioning state of the application rule collection resource.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Support.ProvisioningState? ProvisioningState { get; set; }
        /// <summary>The virtualHub to which the Azure Traffic Collector belongs.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkFunction.Models.Api20221101.IResourceReference VirtualHub { get; set; }
        /// <summary>Resource ID.</summary>
        string VirtualHubId { get; set; }

    }
}