Return-Path: <mgurtovoy@nvidia.com>
Message-ID: <6cfc4508-b64e-0772-3439-7696a357b7b1@nvidia.com>
Date: Mon, 3 Jan 2022 19:42:04 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] Fix reserved Feature bits numbering
References: <20220103170344.3696-1-mgurtovoy@nvidia.com>
 <87mtkcwxaq.fsf@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <87mtkcwxaq.fsf@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com
Cc: oren@nvidia.com, stefanha@redhat.com, eperezma@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 1/3/2022 7:20 PM, Cornelia Huck wrote:
> On Mon, Jan 03 2022, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>> This should have been updated during VIRTIO_F_NOTIFICATION_DATA,
>> VIRTIO_F_NOTIF_CONFIG_DATA and VIRTIO_F_RING_RESET standartization.
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/128
>
> Can you please also update the archive link in the issue, once the mail
> shows up there?

Done.

Please let me know if there is something else, or you can take it from 
here ?


>
>> ---
>>
>> changes from v1:
>>   - added "Reviewed-by" signature (Stefan)
>>   - include VIRTIO_F_RING_RESET feature bit (Cornelia)
>>
>> ---
>>   content.tex | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index cf20570..32de668 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>>   \begin{description}
>>   \item[0 to 23] Feature bits for the specific device type
>>   
>> -\item[24 to 37] Feature bits reserved for extensions to the queue and
>> +\item[24 to 40] Feature bits reserved for extensions to the queue and
>>     feature negotiation mechanisms
>>   
>> -\item[38 and above] Feature bits reserved for future extensions.
>> +\item[41 and above] Feature bits reserved for future extensions.
>>   \end{description}
>>   
>>   \begin{note}
> LGTM.
>

