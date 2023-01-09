// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.Management.CosmosDB.Models
{
    using Newtonsoft.Json;
    using System.Linq;

    /// <summary>
    /// Parameters to indicate the information about the restore.
    /// </summary>
    public partial class RestoreParametersBase
    {
        /// <summary>
        /// Initializes a new instance of the RestoreParametersBase class.
        /// </summary>
        public RestoreParametersBase()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the RestoreParametersBase class.
        /// </summary>
        /// <param name="restoreSource">The id of the restorable database
        /// account from which the restore has to be initiated. For example:
        /// /subscriptions/{subscriptionId}/providers/Microsoft.DocumentDB/locations/{location}/restorableDatabaseAccounts/{restorableDatabaseAccountName}</param>
        /// <param name="restoreTimestampInUtc">Time to which the account has
        /// to be restored (ISO-8601 format).</param>
        public RestoreParametersBase(string restoreSource = default(string), System.DateTime? restoreTimestampInUtc = default(System.DateTime?))
        {
            RestoreSource = restoreSource;
            RestoreTimestampInUtc = restoreTimestampInUtc;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();

        /// <summary>
        /// Gets or sets the id of the restorable database account from which
        /// the restore has to be initiated. For example:
        /// /subscriptions/{subscriptionId}/providers/Microsoft.DocumentDB/locations/{location}/restorableDatabaseAccounts/{restorableDatabaseAccountName}
        /// </summary>
        [JsonProperty(PropertyName = "restoreSource")]
        public string RestoreSource { get; set; }

        /// <summary>
        /// Gets or sets time to which the account has to be restored (ISO-8601
        /// format).
        /// </summary>
        [JsonProperty(PropertyName = "restoreTimestampInUtc")]
        public System.DateTime? RestoreTimestampInUtc { get; set; }

    }
}
