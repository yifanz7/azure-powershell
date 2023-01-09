// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.BotService.Support
{

    /// <summary>The status of the operation being performed.</summary>
    public partial struct OperationResultStatus :
        System.IEquatable<OperationResultStatus>
    {
        public static Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus Canceled = @"Canceled";

        public static Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus Failed = @"Failed";

        public static Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus Requested = @"Requested";

        public static Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus Running = @"Running";

        public static Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus Succeeded = @"Succeeded";

        /// <summary>the value for an instance of the <see cref="OperationResultStatus" /> Enum.</summary>
        private string _value { get; set; }

        /// <summary>Conversion from arbitrary object to OperationResultStatus</summary>
        /// <param name="value">the value to convert to an instance of <see cref="OperationResultStatus" />.</param>
        internal static object CreateFrom(object value)
        {
            return new OperationResultStatus(global::System.Convert.ToString(value));
        }

        /// <summary>Compares values of enum type OperationResultStatus</summary>
        /// <param name="e">the value to compare against this instance.</param>
        /// <returns><c>true</c> if the two instances are equal to the same value</returns>
        public bool Equals(Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus e)
        {
            return _value.Equals(e._value);
        }

        /// <summary>Compares values of enum type OperationResultStatus (override for Object)</summary>
        /// <param name="obj">the value to compare against this instance.</param>
        /// <returns><c>true</c> if the two instances are equal to the same value</returns>
        public override bool Equals(object obj)
        {
            return obj is OperationResultStatus && Equals((OperationResultStatus)obj);
        }

        /// <summary>Returns hashCode for enum OperationResultStatus</summary>
        /// <returns>The hashCode of the value</returns>
        public override int GetHashCode()
        {
            return this._value.GetHashCode();
        }

        /// <summary>Creates an instance of the <see cref="OperationResultStatus"/> Enum class.</summary>
        /// <param name="underlyingValue">the value to create an instance for.</param>
        private OperationResultStatus(string underlyingValue)
        {
            this._value = underlyingValue;
        }

        /// <summary>Returns string representation for OperationResultStatus</summary>
        /// <returns>A string for this value.</returns>
        public override string ToString()
        {
            return this._value;
        }

        /// <summary>Implicit operator to convert string to OperationResultStatus</summary>
        /// <param name="value">the value to convert to an instance of <see cref="OperationResultStatus" />.</param>

        public static implicit operator OperationResultStatus(string value)
        {
            return new OperationResultStatus(value);
        }

        /// <summary>Implicit operator to convert OperationResultStatus to string</summary>
        /// <param name="e">the value to convert to an instance of <see cref="OperationResultStatus" />.</param>

        public static implicit operator string(Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus e)
        {
            return e._value;
        }

        /// <summary>Overriding != operator for enum OperationResultStatus</summary>
        /// <param name="e1">the value to compare against <paramref name="e2" /></param>
        /// <param name="e2">the value to compare against <paramref name="e1" /></param>
        /// <returns><c>true</c> if the two instances are not equal to the same value</returns>
        public static bool operator !=(Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus e1, Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus e2)
        {
            return !e2.Equals(e1);
        }

        /// <summary>Overriding == operator for enum OperationResultStatus</summary>
        /// <param name="e1">the value to compare against <paramref name="e2" /></param>
        /// <param name="e2">the value to compare against <paramref name="e1" /></param>
        /// <returns><c>true</c> if the two instances are equal to the same value</returns>
        public static bool operator ==(Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus e1, Microsoft.Azure.PowerShell.Cmdlets.BotService.Support.OperationResultStatus e2)
        {
            return e2.Equals(e1);
        }
    }
}