// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20211001
{
    using static Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Runtime.Extensions;

    /// <summary>The configuration of dataset in the forecast.</summary>
    public partial class ForecastDatasetConfiguration :
        Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20211001.IForecastDatasetConfiguration,
        Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20211001.IForecastDatasetConfigurationInternal
    {

        /// <summary>Backing field for <see cref="Column" /> property.</summary>
        private string[] _column;

        /// <summary>
        /// Array of column names to be included in the forecast. Any valid forecast column name is allowed. If not provided, then
        /// forecast includes all columns.
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Origin(Microsoft.Azure.PowerShell.Cmdlets.CostManagement.PropertyOrigin.Owned)]
        public string[] Column { get => this._column; set => this._column = value; }

        /// <summary>Creates an new <see cref="ForecastDatasetConfiguration" /> instance.</summary>
        public ForecastDatasetConfiguration()
        {

        }
    }
    /// The configuration of dataset in the forecast.
    public partial interface IForecastDatasetConfiguration :
        Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Runtime.IJsonSerializable
    {
        /// <summary>
        /// Array of column names to be included in the forecast. Any valid forecast column name is allowed. If not provided, then
        /// forecast includes all columns.
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"Array of column names to be included in the forecast. Any valid forecast column name is allowed. If not provided, then forecast includes all columns.",
        SerializedName = @"columns",
        PossibleTypes = new [] { typeof(string) })]
        string[] Column { get; set; }

    }
    /// The configuration of dataset in the forecast.
    public partial interface IForecastDatasetConfigurationInternal

    {
        /// <summary>
        /// Array of column names to be included in the forecast. Any valid forecast column name is allowed. If not provided, then
        /// forecast includes all columns.
        /// </summary>
        string[] Column { get; set; }

    }
}