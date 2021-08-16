Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [PATCH 1/1] Fix copy/paste bug in PCI transport paragraph
References: <20210815160140.22749-1-mgurtovoy@nvidia.com>
 <20210815174335-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <84ee7baf-869a-1647-edaf-c86f1bc771e7@nvidia.com>
Date: Mon, 16 Aug 2021 11:10:52 +0300
MIME-Version: 1.0
In-Reply-To: <20210815174335-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com, stefanha@redhat.com, eperezma@redhat.com, oren@nvidia.com, jasowang@redhat.com, aadam@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/16/2021 12:44 AM, Michael S. Tsirkin wrote:
> On Sun, Aug 15, 2021 at 07:01:40PM +0300, Max Gurtovoy wrote:
>> Refer to "Shared memory capability" and not to "Device-specific
>> configuration".
>>
>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>> ---
>>   content.tex | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 1bfce9f..60b6072 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -1144,7 +1144,7 @@ \subsubsection{Shared memory capability}\label{sec:Virtio Transport Options / Vi
>>   The identifier in \field{cap.id} does not denote a certain order of
>>   preference; it is only used to uniquely identify a region.
>>   
>> -\devicenormative{\paragraph}{Device-specific configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Shared memory capability}
>> +\devicenormative{\paragraph}{Shared memory capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Shared memory capability}
>>   
>>   The region defined by the combination of \field{cap.offset},
>>   \field{offset_hi}, and \field {cap.length}, \field{length_hi}
>> @@ -1152,7 +1152,7 @@ \subsubsection{Shared memory capability}\label{sec:Virtio Transport Options / Vi
>>   
>>   The \field{cap.id} MUST be unique for any one device instance.
>>   
>> -\devicenormative{\paragraph}{Device-specific configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Shared memory capability}
>> +\devicenormative{\paragraph}{Shared memory capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Shared memory capability}
>>   
>>   The region defined by the combination of the \field {cap.offset},
>>   \field {cap.offset_hi}, and \field {cap.length}, \field
>
> And I guess we then need to fix the conformance clauses?

It looks ok actually there.



>
>> -- 
>> 2.21.0

