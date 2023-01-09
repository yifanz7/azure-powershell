// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview
{
    using static Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Extensions;

    /// <summary>
    /// The response body returned for a request to Bot Service Management to check per subscription hostSettings
    /// </summary>
    public partial class HostSettingsResponse :
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IHostSettingsResponse,
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Models.Api20220615Preview.IHostSettingsResponseInternal
    {

        /// <summary>Backing field for <see cref="BotOpenIdMetadata" /> property.</summary>
        private string _botOpenIdMetadata;

        /// <summary>Same as toBotFromChannelOpenIdMetadataUrl, used by SDK < v4.12</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Owned)]
        public string BotOpenIdMetadata { get => this._botOpenIdMetadata; set => this._botOpenIdMetadata = value; }

        /// <summary>Backing field for <see cref="OAuthUrl" /> property.</summary>
        private string _oAuthUrl;

        /// <summary>For in-conversation bot user authentication</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Owned)]
        public string OAuthUrl { get => this._oAuthUrl; set => this._oAuthUrl = value; }

        /// <summary>Backing field for <see cref="ToBotFromChannelOpenIdMetadataUrl" /> property.</summary>
        private string _toBotFromChannelOpenIdMetadataUrl;

        /// <summary>For verifying incoming tokens from the channels</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Owned)]
        public string ToBotFromChannelOpenIdMetadataUrl { get => this._toBotFromChannelOpenIdMetadataUrl; set => this._toBotFromChannelOpenIdMetadataUrl = value; }

        /// <summary>Backing field for <see cref="ToBotFromChannelTokenIssuer" /> property.</summary>
        private string _toBotFromChannelTokenIssuer;

        /// <summary>For verifying incoming tokens from the channels</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Owned)]
        public string ToBotFromChannelTokenIssuer { get => this._toBotFromChannelTokenIssuer; set => this._toBotFromChannelTokenIssuer = value; }

        /// <summary>Backing field for <see cref="ToBotFromEmulatorOpenIdMetadataUrl" /> property.</summary>
        private string _toBotFromEmulatorOpenIdMetadataUrl;

        /// <summary>For verifying incoming tokens from bot emulator</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Owned)]
        public string ToBotFromEmulatorOpenIdMetadataUrl { get => this._toBotFromEmulatorOpenIdMetadataUrl; set => this._toBotFromEmulatorOpenIdMetadataUrl = value; }

        /// <summary>Backing field for <see cref="ToChannelFromBotLoginUrl" /> property.</summary>
        private string _toChannelFromBotLoginUrl;

        /// <summary>For getting access token to channels from bot host</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Owned)]
        public string ToChannelFromBotLoginUrl { get => this._toChannelFromBotLoginUrl; set => this._toChannelFromBotLoginUrl = value; }

        /// <summary>Backing field for <see cref="ToChannelFromBotOAuthScope" /> property.</summary>
        private string _toChannelFromBotOAuthScope;

        /// <summary>For getting access token to channels from bot host</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Owned)]
        public string ToChannelFromBotOAuthScope { get => this._toChannelFromBotOAuthScope; set => this._toChannelFromBotOAuthScope = value; }

        /// <summary>Backing field for <see cref="ValidateAuthority" /> property.</summary>
        private bool? _validateAuthority;

        /// <summary>Per cloud OAuth setting on whether authority is validated</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Origin(Microsoft.Azure.PowerShell.Cmdlets.BotService.PropertyOrigin.Owned)]
        public bool? ValidateAuthority { get => this._validateAuthority; set => this._validateAuthority = value; }

        /// <summary>Creates an new <see cref="HostSettingsResponse" /> instance.</summary>
        public HostSettingsResponse()
        {

        }
    }
    /// The response body returned for a request to Bot Service Management to check per subscription hostSettings
    public partial interface IHostSettingsResponse :
        Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.IJsonSerializable
    {
        /// <summary>Same as toBotFromChannelOpenIdMetadataUrl, used by SDK < v4.12</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"Same as toBotFromChannelOpenIdMetadataUrl, used by SDK < v4.12",
        SerializedName = @"BotOpenIdMetadata",
        PossibleTypes = new [] { typeof(string) })]
        string BotOpenIdMetadata { get; set; }
        /// <summary>For in-conversation bot user authentication</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"For in-conversation bot user authentication",
        SerializedName = @"OAuthUrl",
        PossibleTypes = new [] { typeof(string) })]
        string OAuthUrl { get; set; }
        /// <summary>For verifying incoming tokens from the channels</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"For verifying incoming tokens from the channels",
        SerializedName = @"ToBotFromChannelOpenIdMetadataUrl",
        PossibleTypes = new [] { typeof(string) })]
        string ToBotFromChannelOpenIdMetadataUrl { get; set; }
        /// <summary>For verifying incoming tokens from the channels</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"For verifying incoming tokens from the channels",
        SerializedName = @"ToBotFromChannelTokenIssuer",
        PossibleTypes = new [] { typeof(string) })]
        string ToBotFromChannelTokenIssuer { get; set; }
        /// <summary>For verifying incoming tokens from bot emulator</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"For verifying incoming tokens from bot emulator",
        SerializedName = @"ToBotFromEmulatorOpenIdMetadataUrl",
        PossibleTypes = new [] { typeof(string) })]
        string ToBotFromEmulatorOpenIdMetadataUrl { get; set; }
        /// <summary>For getting access token to channels from bot host</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"For getting access token to channels from bot host",
        SerializedName = @"ToChannelFromBotLoginUrl",
        PossibleTypes = new [] { typeof(string) })]
        string ToChannelFromBotLoginUrl { get; set; }
        /// <summary>For getting access token to channels from bot host</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"For getting access token to channels from bot host",
        SerializedName = @"ToChannelFromBotOAuthScope",
        PossibleTypes = new [] { typeof(string) })]
        string ToChannelFromBotOAuthScope { get; set; }
        /// <summary>Per cloud OAuth setting on whether authority is validated</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.BotService.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"Per cloud OAuth setting on whether authority is validated",
        SerializedName = @"ValidateAuthority",
        PossibleTypes = new [] { typeof(bool) })]
        bool? ValidateAuthority { get; set; }

    }
    /// The response body returned for a request to Bot Service Management to check per subscription hostSettings
    internal partial interface IHostSettingsResponseInternal

    {
        /// <summary>Same as toBotFromChannelOpenIdMetadataUrl, used by SDK < v4.12</summary>
        string BotOpenIdMetadata { get; set; }
        /// <summary>For in-conversation bot user authentication</summary>
        string OAuthUrl { get; set; }
        /// <summary>For verifying incoming tokens from the channels</summary>
        string ToBotFromChannelOpenIdMetadataUrl { get; set; }
        /// <summary>For verifying incoming tokens from the channels</summary>
        string ToBotFromChannelTokenIssuer { get; set; }
        /// <summary>For verifying incoming tokens from bot emulator</summary>
        string ToBotFromEmulatorOpenIdMetadataUrl { get; set; }
        /// <summary>For getting access token to channels from bot host</summary>
        string ToChannelFromBotLoginUrl { get; set; }
        /// <summary>For getting access token to channels from bot host</summary>
        string ToChannelFromBotOAuthScope { get; set; }
        /// <summary>Per cloud OAuth setting on whether authority is validated</summary>
        bool? ValidateAuthority { get; set; }

    }
}