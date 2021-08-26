Return-Path: <virtio-comment-return-2260-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 655759864EA
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Aug 2021 04:32:47 +0000 (UTC)
References: <1629707299.9152007-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4678446c-7ec9-7724-dac9-071388ac117a@redhat.com>
Date: Thu, 26 Aug 2021 12:32:34 +0800
MIME-Version: 1.0
In-Reply-To: <1629707299.9152007-1-xuanzhuo@linux.alibaba.com>
Subject: [virtio-comment] Re: [virtio-dev] [PATCH] virtio: introduce VIRTIO_F_RING_RESET for
 reset queue
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>


=D4=DA 2021/8/23 =CF=C2=CE=E74:28, Xuan Zhuo =D0=B4=B5=C0:
> cc jasowang@redhat.com
>
> On Fri, 13 Aug 2021 10:31:05 +0800, Xuan Zhuo <xuanzhuo@linux.alibaba.com=
> wrote:
>> This patch allows the driver to reset a queue individually.
>>
>> This is very common on general network equipment. By disabling a queue,
>> you can quickly reclaim the buffer currently on the queue. If necessary,
>> we can reinitialize the queue separately.
>>
>> For example, when virtio-net implements support for AF_XDP, we need to
>> disable a queue to release all the original buffers when AF_XDP setup.
>> And quickly release all the AF_XDP buffers that have been placed in the
>> queue when AF_XDP exits.
>>
>> Since mmio's QueueReady allows setting 0 to stop the queue, there is no
>> need to distinguish whether VIRTIO_F_RING_RESET is negotiated.
>>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   content.tex | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 7cec1c3..70a9765 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -1001,7 +1001,13 @@ \subsubsection{Common configuration structure lay=
out}\label{sec:Virtio Transport
>>   After writing 0 to \field{device_status}, the driver MUST wait for a r=
ead of
>>   \field{device_status} to return 0 before reinitializing the device.
>>
>> -The driver MUST NOT write a 0 to \field{queue_enable}.
>> +If the VIRTIO_F_RING_RESET feature bit is not negotiated,
>> +the driver MUST NOT write a 0 to \field{queue_enable}.
>> +
>> +Otherwise, if the VIRTIO_F_RING_RESET feature bit is negotiated,
>> +the driver can stop using the queue by writing a 0 to \field{queue_enab=
le} and
>> +MUST read the value back to ensure synchronization. Then optionally re-=
enable
>> +the queue.



So I think we need to clarify what did "stop" mean here. Since you're=20
use "RESET" in the feature I guess the virtqueue state is also reset.=20
That's fine but I'm not sure if MMIO has the similar semantic.

E.g is the virtqueue state preserved during a stop and resume?

Thanks


>>
>>   \subsubsection{Notification structure layout}\label{sec:Virtio Transpo=
rt Options / Virtio Over PCI Bus / PCI Device Layout / Notification capabil=
ity}
>>
>> @@ -6672,6 +6678,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
>>     transport specific.
>>     For more details about driver notifications over PCI see \ref{sec:Vi=
rtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization =
And Device Operation / Available Buffer Notifications}.
>>
>> +  \item[VIRTIO_F_RING_RESET(40)] This feature indicates
>> +  that the driver can reset a queue individually.
>> +
>>   \end{description}
>>
>>   \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bit=
s}
>> --
>> 2.31.0
>>
>>
>> ---------------------------------------------------------------------
>> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
>> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>>


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

