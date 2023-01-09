// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview
{
    using static Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Extensions;

    /// <summary>A private link resource</summary>
    public partial class PrivateLinkResource :
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResource,
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceInternal,
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.IValidates
    {
        /// <summary>
        /// Backing field for Inherited model <see cref= "Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBase"
        /// />
        /// </summary>
        private Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBase __privateLinkResourceBase = new Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.PrivateLinkResourceBase();

        /// <summary>The private link resource group id.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Inlined)]
        public string GroupId { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourcePropertiesInternal)Property).GroupId; }

        /// <summary>
        /// Fully qualified resource ID for the resource. Ex - /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{resourceType}/{resourceName}
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Inherited)]
        public string Id { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal)__privateLinkResourceBase).Id; }

        /// <summary>Internal Acessors for Id</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal.Id { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal)__privateLinkResourceBase).Id; set => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal)__privateLinkResourceBase).Id = value; }

        /// <summary>Internal Acessors for Name</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal.Name { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal)__privateLinkResourceBase).Name; set => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal)__privateLinkResourceBase).Name = value; }

        /// <summary>Internal Acessors for Type</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal.Type { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal)__privateLinkResourceBase).Type; set => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal)__privateLinkResourceBase).Type = value; }

        /// <summary>Internal Acessors for GroupId</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceInternal.GroupId { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourcePropertiesInternal)Property).GroupId; set => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourcePropertiesInternal)Property).GroupId = value; }

        /// <summary>Internal Acessors for Property</summary>
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceProperties Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceInternal.Property { get => (this._property = this._property ?? new Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.PrivateLinkResourceProperties()); set { {_property = value;} } }

        /// <summary>Internal Acessors for RequiredMember</summary>
        string[] Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceInternal.RequiredMember { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourcePropertiesInternal)Property).RequiredMember; set => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourcePropertiesInternal)Property).RequiredMember = value; }

        /// <summary>The name of the resource</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Inherited)]
        public string Name { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal)__privateLinkResourceBase).Name; }

        /// <summary>Backing field for <see cref="Property" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceProperties _property;

        /// <summary>Resource properties.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceProperties Property { get => (this._property = this._property ?? new Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.PrivateLinkResourceProperties()); set => this._property = value; }

        /// <summary>The private link resource required member names.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Inlined)]
        public string[] RequiredMember { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourcePropertiesInternal)Property).RequiredMember; }

        /// <summary>The private link resource Private link DNS zone name.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Inlined)]
        public string[] RequiredZoneName { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourcePropertiesInternal)Property).RequiredZoneName; set => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourcePropertiesInternal)Property).RequiredZoneName = value ?? null /* arrayOf */; }

        /// <summary>
        /// The type of the resource. E.g. "Microsoft.Compute/virtualMachines" or "Microsoft.Storage/storageAccounts"
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Inherited)]
        public string Type { get => ((Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal)__privateLinkResourceBase).Type; }

        /// <summary>Creates an new <see cref="PrivateLinkResource" /> instance.</summary>
        public PrivateLinkResource()
        {

        }

        /// <summary>Validates that this object meets the validation criteria.</summary>
        /// <param name="eventListener">an <see cref="Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.IEventListener" /> instance that will receive validation
        /// events.</param>
        /// <returns>
        /// A <see cref = "global::System.Threading.Tasks.Task" /> that will be complete when validation is completed.
        /// </returns>
        public async global::System.Threading.Tasks.Task Validate(Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.IEventListener eventListener)
        {
            await eventListener.AssertNotNull(nameof(__privateLinkResourceBase), __privateLinkResourceBase);
            await eventListener.AssertObjectIsValid(nameof(__privateLinkResourceBase), __privateLinkResourceBase);
        }
    }
    /// A private link resource
    public partial interface IPrivateLinkResource :
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.IJsonSerializable,
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBase
    {
        /// <summary>The private link resource group id.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Description = @"The private link resource group id.",
        SerializedName = @"groupId",
        PossibleTypes = new [] { typeof(string) })]
        string GroupId { get;  }
        /// <summary>The private link resource required member names.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Description = @"The private link resource required member names.",
        SerializedName = @"requiredMembers",
        PossibleTypes = new [] { typeof(string) })]
        string[] RequiredMember { get;  }
        /// <summary>The private link resource Private link DNS zone name.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"The private link resource Private link DNS zone name.",
        SerializedName = @"requiredZoneNames",
        PossibleTypes = new [] { typeof(string) })]
        string[] RequiredZoneName { get; set; }

    }
    /// A private link resource
    internal partial interface IPrivateLinkResourceInternal :
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceBaseInternal
    {
        /// <summary>The private link resource group id.</summary>
        string GroupId { get; set; }
        /// <summary>Resource properties.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IPrivateLinkResourceProperties Property { get; set; }
        /// <summary>The private link resource required member names.</summary>
        string[] RequiredMember { get; set; }
        /// <summary>The private link resource Private link DNS zone name.</summary>
        string[] RequiredZoneName { get; set; }

    }
}