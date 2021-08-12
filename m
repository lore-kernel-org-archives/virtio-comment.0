Return-Path: <virtio-comment-return-2198-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D454986404
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Aug 2021 10:35:43 +0000 (UTC)
References: <20210801124527.35655-1-mgurtovoy@nvidia.com>
 <87sfzhx0h3.fsf@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <ed7f44c2-5058-c4ef-e427-d1c83126bc62@nvidia.com>
Date: Thu, 12 Aug 2021 13:35:28 +0300
MIME-Version: 1.0
In-Reply-To: <87sfzhx0h3.fsf@redhat.com>
Subject: [virtio-comment] Re: [PATCH 1/1] Fix reserved Feature bits numbering
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com
Cc: stefanha@redhat.com, eperezma@redhat.com, oren@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/10/2021 9:44 AM, Cornelia Huck wrote:
> On Sun, Aug 01 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>> This should have been updated during VIRTIO_F_NOTIFICATION_DATA and
>> VIRTIO_F_NOTIF_CONFIG_DATA standartization.
>>
>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>> ---
>>   content.tex | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 5c70a3c..e9a32fa 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>>   \begin{description}
>>   \item[0 to 23] Feature bits for the specific device type
>>   
>> -\item[24 to 37] Feature bits reserved for extensions to the queue and
>> +\item[24 to 39] Feature bits reserved for extensions to the queue and
>>     feature negotiation mechanisms
> I'm wondering whether we should do s/reserved/used/ here?

I'm just fixing a bug here. You can take this patch and create another 
one with the above suggestion on top.

I'm ok with your suggestion.

>
>>   
>> -\item[38 and above] Feature bits reserved for future extensions.
>> +\item[40 and above] Feature bits reserved for future extensions.
>>   \end{description}
>>   
>>   \begin{note}

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

