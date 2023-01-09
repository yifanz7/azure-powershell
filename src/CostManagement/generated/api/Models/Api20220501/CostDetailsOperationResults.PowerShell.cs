// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501
{
    using Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Runtime.PowerShell;

    /// <summary>The result of the long running operation for cost details Api.</summary>
    [System.ComponentModel.TypeConverter(typeof(CostDetailsOperationResultsTypeConverter))]
    public partial class CostDetailsOperationResults
    {

        /// <summary>
        /// <c>AfterDeserializeDictionary</c> will be called after the deserialization has finished, allowing customization of the
        /// object before it is returned. Implement this method in a partial class to enable this behavior
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>

        partial void AfterDeserializeDictionary(global::System.Collections.IDictionary content);

        /// <summary>
        /// <c>AfterDeserializePSObject</c> will be called after the deserialization has finished, allowing customization of the object
        /// before it is returned. Implement this method in a partial class to enable this behavior
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>

        partial void AfterDeserializePSObject(global::System.Management.Automation.PSObject content);

        /// <summary>
        /// <c>BeforeDeserializeDictionary</c> will be called before the deserialization has commenced, allowing complete customization
        /// of the object before it is deserialized.
        /// If you wish to disable the default deserialization entirely, return <c>true</c> in the <paramref name="returnNow" /> output
        /// parameter.
        /// Implement this method in a partial class to enable this behavior.
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>
        /// <param name="returnNow">Determines if the rest of the serialization should be processed, or if the method should return
        /// instantly.</param>

        partial void BeforeDeserializeDictionary(global::System.Collections.IDictionary content, ref bool returnNow);

        /// <summary>
        /// <c>BeforeDeserializePSObject</c> will be called before the deserialization has commenced, allowing complete customization
        /// of the object before it is deserialized.
        /// If you wish to disable the default deserialization entirely, return <c>true</c> in the <paramref name="returnNow" /> output
        /// parameter.
        /// Implement this method in a partial class to enable this behavior.
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>
        /// <param name="returnNow">Determines if the rest of the serialization should be processed, or if the method should return
        /// instantly.</param>

        partial void BeforeDeserializePSObject(global::System.Management.Automation.PSObject content, ref bool returnNow);

        /// <summary>
        /// Deserializes a <see cref="global::System.Collections.IDictionary" /> into a new instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.CostDetailsOperationResults"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>
        internal CostDetailsOperationResults(global::System.Collections.IDictionary content)
        {
            bool returnNow = false;
            BeforeDeserializeDictionary(content, ref returnNow);
            if (returnNow)
            {
                return;
            }
            // actually deserialize
            if (content.Contains("Manifest"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Manifest = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IReportManifest) content.GetValueForProperty("Manifest",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Manifest, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ReportManifestTypeConverter.ConvertFrom);
            }
            if (content.Contains("Error"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Error = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20211001.IErrorDetails) content.GetValueForProperty("Error",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Error, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20211001.ErrorDetailsTypeConverter.ConvertFrom);
            }
            if (content.Contains("Id"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Id = (string) content.GetValueForProperty("Id",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Id, global::System.Convert.ToString);
            }
            if (content.Contains("Name"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Name = (string) content.GetValueForProperty("Name",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Name, global::System.Convert.ToString);
            }
            if (content.Contains("Type"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Type = (string) content.GetValueForProperty("Type",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Type, global::System.Convert.ToString);
            }
            if (content.Contains("Status"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Status = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsStatusType?) content.GetValueForProperty("Status",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Status, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsStatusType.CreateFrom);
            }
            if (content.Contains("ValidTill"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ValidTill = (global::System.DateTime?) content.GetValueForProperty("ValidTill",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ValidTill, (v) => v is global::System.DateTime _v ? _v : global::System.Xml.XmlConvert.ToDateTime( v.ToString() , global::System.Xml.XmlDateTimeSerializationMode.Unspecified));
            }
            if (content.Contains("ManifestRequestContext"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestRequestContext = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IRequestContext) content.GetValueForProperty("ManifestRequestContext",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestRequestContext, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.RequestContextTypeConverter.ConvertFrom);
            }
            if (content.Contains("ManifestVersion"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestVersion = (string) content.GetValueForProperty("ManifestVersion",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestVersion, global::System.Convert.ToString);
            }
            if (content.Contains("ManifestDataFormat"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestDataFormat = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsDataFormat?) content.GetValueForProperty("ManifestDataFormat",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestDataFormat, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsDataFormat.CreateFrom);
            }
            if (content.Contains("ManifestByteCount"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestByteCount = (long?) content.GetValueForProperty("ManifestByteCount",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestByteCount, (__y)=> (long) global::System.Convert.ChangeType(__y, typeof(long)));
            }
            if (content.Contains("ManifestBlobCount"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestBlobCount = (int?) content.GetValueForProperty("ManifestBlobCount",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestBlobCount, (__y)=> (int) global::System.Convert.ChangeType(__y, typeof(int)));
            }
            if (content.Contains("ManifestCompressData"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestCompressData = (bool?) content.GetValueForProperty("ManifestCompressData",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestCompressData, (__y)=> (bool) global::System.Convert.ChangeType(__y, typeof(bool)));
            }
            if (content.Contains("ManifestBlob"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestBlob = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IBlobInfo[]) content.GetValueForProperty("ManifestBlob",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestBlob, __y => TypeConverterExtensions.SelectToArray<Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IBlobInfo>(__y, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.BlobInfoTypeConverter.ConvertFrom));
            }
            if (content.Contains("RequestContextRequestScope"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestContextRequestScope = (string) content.GetValueForProperty("RequestContextRequestScope",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestContextRequestScope, global::System.Convert.ToString);
            }
            if (content.Contains("Code"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Code = (string) content.GetValueForProperty("Code",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Code, global::System.Convert.ToString);
            }
            if (content.Contains("Message"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Message = (string) content.GetValueForProperty("Message",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Message, global::System.Convert.ToString);
            }
            if (content.Contains("RequestContextRequestBody"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestContextRequestBody = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IGenerateCostDetailsReportRequestDefinition) content.GetValueForProperty("RequestContextRequestBody",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestContextRequestBody, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.GenerateCostDetailsReportRequestDefinitionTypeConverter.ConvertFrom);
            }
            if (content.Contains("RequestBodyTimePeriod"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyTimePeriod = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsTimePeriod) content.GetValueForProperty("RequestBodyTimePeriod",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyTimePeriod, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.CostDetailsTimePeriodTypeConverter.ConvertFrom);
            }
            if (content.Contains("RequestBodyMetric"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyMetric = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsMetricType?) content.GetValueForProperty("RequestBodyMetric",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyMetric, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsMetricType.CreateFrom);
            }
            if (content.Contains("RequestBodyBillingPeriod"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyBillingPeriod = (string) content.GetValueForProperty("RequestBodyBillingPeriod",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyBillingPeriod, global::System.Convert.ToString);
            }
            if (content.Contains("RequestBodyInvoiceId"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyInvoiceId = (string) content.GetValueForProperty("RequestBodyInvoiceId",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyInvoiceId, global::System.Convert.ToString);
            }
            if (content.Contains("TimePeriodStart"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).TimePeriodStart = (string) content.GetValueForProperty("TimePeriodStart",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).TimePeriodStart, global::System.Convert.ToString);
            }
            if (content.Contains("TimePeriodEnd"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).TimePeriodEnd = (string) content.GetValueForProperty("TimePeriodEnd",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).TimePeriodEnd, global::System.Convert.ToString);
            }
            AfterDeserializeDictionary(content);
        }

        /// <summary>
        /// Deserializes a <see cref="global::System.Management.Automation.PSObject" /> into a new instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.CostDetailsOperationResults"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>
        internal CostDetailsOperationResults(global::System.Management.Automation.PSObject content)
        {
            bool returnNow = false;
            BeforeDeserializePSObject(content, ref returnNow);
            if (returnNow)
            {
                return;
            }
            // actually deserialize
            if (content.Contains("Manifest"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Manifest = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IReportManifest) content.GetValueForProperty("Manifest",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Manifest, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ReportManifestTypeConverter.ConvertFrom);
            }
            if (content.Contains("Error"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Error = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20211001.IErrorDetails) content.GetValueForProperty("Error",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Error, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20211001.ErrorDetailsTypeConverter.ConvertFrom);
            }
            if (content.Contains("Id"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Id = (string) content.GetValueForProperty("Id",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Id, global::System.Convert.ToString);
            }
            if (content.Contains("Name"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Name = (string) content.GetValueForProperty("Name",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Name, global::System.Convert.ToString);
            }
            if (content.Contains("Type"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Type = (string) content.GetValueForProperty("Type",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Type, global::System.Convert.ToString);
            }
            if (content.Contains("Status"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Status = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsStatusType?) content.GetValueForProperty("Status",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Status, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsStatusType.CreateFrom);
            }
            if (content.Contains("ValidTill"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ValidTill = (global::System.DateTime?) content.GetValueForProperty("ValidTill",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ValidTill, (v) => v is global::System.DateTime _v ? _v : global::System.Xml.XmlConvert.ToDateTime( v.ToString() , global::System.Xml.XmlDateTimeSerializationMode.Unspecified));
            }
            if (content.Contains("ManifestRequestContext"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestRequestContext = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IRequestContext) content.GetValueForProperty("ManifestRequestContext",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestRequestContext, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.RequestContextTypeConverter.ConvertFrom);
            }
            if (content.Contains("ManifestVersion"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestVersion = (string) content.GetValueForProperty("ManifestVersion",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestVersion, global::System.Convert.ToString);
            }
            if (content.Contains("ManifestDataFormat"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestDataFormat = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsDataFormat?) content.GetValueForProperty("ManifestDataFormat",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestDataFormat, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsDataFormat.CreateFrom);
            }
            if (content.Contains("ManifestByteCount"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestByteCount = (long?) content.GetValueForProperty("ManifestByteCount",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestByteCount, (__y)=> (long) global::System.Convert.ChangeType(__y, typeof(long)));
            }
            if (content.Contains("ManifestBlobCount"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestBlobCount = (int?) content.GetValueForProperty("ManifestBlobCount",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestBlobCount, (__y)=> (int) global::System.Convert.ChangeType(__y, typeof(int)));
            }
            if (content.Contains("ManifestCompressData"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestCompressData = (bool?) content.GetValueForProperty("ManifestCompressData",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestCompressData, (__y)=> (bool) global::System.Convert.ChangeType(__y, typeof(bool)));
            }
            if (content.Contains("ManifestBlob"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestBlob = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IBlobInfo[]) content.GetValueForProperty("ManifestBlob",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).ManifestBlob, __y => TypeConverterExtensions.SelectToArray<Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IBlobInfo>(__y, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.BlobInfoTypeConverter.ConvertFrom));
            }
            if (content.Contains("RequestContextRequestScope"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestContextRequestScope = (string) content.GetValueForProperty("RequestContextRequestScope",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestContextRequestScope, global::System.Convert.ToString);
            }
            if (content.Contains("Code"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Code = (string) content.GetValueForProperty("Code",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Code, global::System.Convert.ToString);
            }
            if (content.Contains("Message"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Message = (string) content.GetValueForProperty("Message",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).Message, global::System.Convert.ToString);
            }
            if (content.Contains("RequestContextRequestBody"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestContextRequestBody = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.IGenerateCostDetailsReportRequestDefinition) content.GetValueForProperty("RequestContextRequestBody",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestContextRequestBody, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.GenerateCostDetailsReportRequestDefinitionTypeConverter.ConvertFrom);
            }
            if (content.Contains("RequestBodyTimePeriod"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyTimePeriod = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsTimePeriod) content.GetValueForProperty("RequestBodyTimePeriod",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyTimePeriod, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.CostDetailsTimePeriodTypeConverter.ConvertFrom);
            }
            if (content.Contains("RequestBodyMetric"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyMetric = (Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsMetricType?) content.GetValueForProperty("RequestBodyMetric",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyMetric, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Support.CostDetailsMetricType.CreateFrom);
            }
            if (content.Contains("RequestBodyBillingPeriod"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyBillingPeriod = (string) content.GetValueForProperty("RequestBodyBillingPeriod",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyBillingPeriod, global::System.Convert.ToString);
            }
            if (content.Contains("RequestBodyInvoiceId"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyInvoiceId = (string) content.GetValueForProperty("RequestBodyInvoiceId",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).RequestBodyInvoiceId, global::System.Convert.ToString);
            }
            if (content.Contains("TimePeriodStart"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).TimePeriodStart = (string) content.GetValueForProperty("TimePeriodStart",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).TimePeriodStart, global::System.Convert.ToString);
            }
            if (content.Contains("TimePeriodEnd"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).TimePeriodEnd = (string) content.GetValueForProperty("TimePeriodEnd",((Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResultsInternal)this).TimePeriodEnd, global::System.Convert.ToString);
            }
            AfterDeserializePSObject(content);
        }

        /// <summary>
        /// Deserializes a <see cref="global::System.Collections.IDictionary" /> into an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.CostDetailsOperationResults"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>
        /// <returns>
        /// an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResults"
        /// />.
        /// </returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResults DeserializeFromDictionary(global::System.Collections.IDictionary content)
        {
            return new CostDetailsOperationResults(content);
        }

        /// <summary>
        /// Deserializes a <see cref="global::System.Management.Automation.PSObject" /> into an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.CostDetailsOperationResults"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>
        /// <returns>
        /// an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResults"
        /// />.
        /// </returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResults DeserializeFromPSObject(global::System.Management.Automation.PSObject content)
        {
            return new CostDetailsOperationResults(content);
        }

        /// <summary>
        /// Creates a new instance of <see cref="CostDetailsOperationResults" />, deserializing the content from a json string.
        /// </summary>
        /// <param name="jsonText">a string containing a JSON serialized instance of this model.</param>
        /// <returns>an instance of the <see cref="CostDetailsOperationResults" /> model class.</returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Models.Api20220501.ICostDetailsOperationResults FromJsonString(string jsonText) => FromJson(Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Runtime.Json.JsonNode.Parse(jsonText));

        /// <summary>Serializes this instance to a json string.</summary>

        /// <returns>a <see cref="System.String" /> containing this model serialized to JSON text.</returns>
        public string ToJsonString() => ToJson(null, Microsoft.Azure.PowerShell.Cmdlets.CostManagement.Runtime.SerializationMode.IncludeAll)?.ToString();
    }
    /// The result of the long running operation for cost details Api.
    [System.ComponentModel.TypeConverter(typeof(CostDetailsOperationResultsTypeConverter))]
    public partial interface ICostDetailsOperationResults

    {

    }
}