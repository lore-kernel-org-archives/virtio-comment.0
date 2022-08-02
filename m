Return-Path: <virtio-comment-return-3285-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8459398649F
	for <virtio-comment@lists.oasis-open.org>; Tue,  2 Aug 2022 03:17:57 +0000 (UTC)
Message-ID: <7045124f-1c67-c521-00cf-e86a383586bd@intel.com>
Date: Tue, 2 Aug 2022 11:17:51 +0800
MIME-Version: 1.0
References: <20220801093216.362119-1-lingshan.zhu@intel.com>
 <20220801093216.362119-3-lingshan.zhu@intel.com>
 <20220801162534-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20220801162534-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Re: [PATCH V2 2/5] Introduce feature bit
 VIRTIO_F_TRANSPT_VQ_MDEV
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



On 8/2/2022 4:27 AM, Michael S. Tsirkin wrote:
> On Mon, Aug 01, 2022 at 05:32:13PM +0800, Zhu Lingshan wrote:
>> This commit introduces feature bit VIRTIO_F_TRANSPT_VQ_MDEV,
>> which depends on VIRTIO_F_TRANSPT_VQ.
>>
>> Feature bit VIRTIO_F_TRANSPT_VQ_MDEV indicates that the managed
>> devices are created, configured and destroyed through the
>> transport virtqueue, the transport virtqueue is the
>> transport layer for the managed devices.
> I'd avoid the term MDEV if possible, it's already used in virt contexts.
yes, let me work out a better name, it was vdev (virtual device) before, 
and maybe
sdev(sub device) or a better one.
>
>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>> ---
>>   content.tex | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index 969ca46..143949e 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2968,6 +2968,18 @@ \subsection{Managed Devices Dscovery}\label{sec:Virtio Transport Options /Virtio
>>   
>>   Managed devices are created and discovered through a transport virtqueue.
>>   
>> +\subsection{Transport Virtqueue Features}\label{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Transport Virtqueue Features}
>> +
>> +Feature bit VIRTIO_F_TRANSPT_VQ_MDEV indicates that the managed devices are created, configured
>> +and destroyed through the transport virtqueue.
> Feature bit being present where? On the management device?
Yes, the management device, I will add this.
>
>> +This means the transport virtqueue is the transport layer for the managed devices.
> confused. how does this differ from VIRTIO_F_TRANSPT_VQ?
VIRTIO_F_TRANSPT_VQ means the management device offers a transport vq.
VIRTIO_F_TRANSPT_VQ_MDEV is a feature of the transport vq, means the 
management device create / destroy and configure the managed device via 
the transport vq.

This reminds me that maybe I should use the term vdev(virtual device), 
so that other kinds of devices can add their own feature bits under 
VIRTIO_F_TRANSPT_VQ

Thanks,
Zhu Lingshan
>
>> +
>> +Feature bit VIRTIO_F_TRANSPT_VQ_MDEV depends on VIRTIO_F_TRANSPT_VQ
>> +
>> +\devicenormative{\subsubsection}{Transport Virtqueue Features}{Virtio Transport Options / Virtio Over Transport Virtqueue / Transport Virtqueue Features}
>> +
>> +The management device MUST not accept VIRTIO_F_TRANSPT_VQ_MDEV if VIRTIO_F_TRANSPT_VQ is not negotiated.
>> +
>>   \chapter{Device Types}\label{sec:Device Types}
>>   
>>   On top of the queues, config space and feature negotiation facilities
>> -- 
>> 2.35.3
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


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

