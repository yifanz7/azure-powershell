﻿// -----------------------------------------------------------------------------
﻿//
﻿// Copyright Microsoft Corporation
﻿// Licensed under the Apache License, Version 2.0 (the "License");
﻿// you may not use this file except in compliance with the License.
﻿// You may obtain a copy of the License at
﻿// http://www.apache.org/licenses/LICENSE-2.0
﻿// Unless required by applicable law or agreed to in writing, software
﻿// distributed under the License is distributed on an "AS IS" BASIS,
﻿// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
﻿// See the License for the specific language governing permissions and
﻿// limitations under the License.
﻿// -----------------------------------------------------------------------------
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:5.0.17
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Microsoft.Azure.Commands.Batch.Models
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using Microsoft.Azure.Batch;
    
    
    public partial class PSComputeNodeError
    {
        
        internal Microsoft.Azure.Batch.ComputeNodeError omObject;
        
        private IReadOnlyList<PSNameValuePair> errorDetails;
        
        internal PSComputeNodeError(Microsoft.Azure.Batch.ComputeNodeError omObject)
        {
            if ((omObject == null))
            {
                throw new System.ArgumentNullException("omObject");
            }
            this.omObject = omObject;
        }
        
        public string Code
        {
            get
            {
                return this.omObject.Code;
            }
        }
        
        public IReadOnlyList<PSNameValuePair> ErrorDetails
        {
            get
            {
                if (((this.errorDetails == null) 
                            && (this.omObject.ErrorDetails != null)))
                {
                    List<PSNameValuePair> list;
                    list = new List<PSNameValuePair>();
                    IEnumerator<Microsoft.Azure.Batch.NameValuePair> enumerator;
                    enumerator = this.omObject.ErrorDetails.GetEnumerator();
                    for (
                    ; enumerator.MoveNext(); 
                    )
                    {
                        list.Add(new PSNameValuePair(enumerator.Current));
                    }
                    this.errorDetails = list;
                }
                return this.errorDetails;
            }
        }
        
        public string Message
        {
            get
            {
                return this.omObject.Message;
            }
        }
    }
}
