Return-Path: <virtio-comment-return-8707-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBF3C4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 06:24:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E78062B022
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 06:24:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BEFB4986842
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 06:24:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A07B798614B; Fri,  1 Dec 2023 06:24:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F2F798669A
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Dec 2023 06:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0VxWqHR6_1701411876;
Message-ID: <5bb13b60-f324-412f-99a2-a476320d79b1@linux.alibaba.com>
Date: Fri, 1 Dec 2023 14:24:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S . Tsirkin"
 <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
 <CACGkMEuN20TaSF1OeFgwEF85ZadxPomnsoMmprS3=DpCFPJKhQ@mail.gmail.com>
 <90ef9ec4-6cce-49c4-a27d-7168990ae3f3@linux.alibaba.com>
 <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.



在 2023/12/1 下午1:18, Jason Wang 写道:
> On Wed, Nov 29, 2023 at 4:23 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
>>
>>
>> 在 2023/11/29 下午4:00, Jason Wang 写道:
>>> On Tue, Nov 28, 2023 at 4:08 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
>>>> To prevent readers from misunderstanding that the driver can
>>>> only handles packets with partial checksum when
>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the description.
>>>>
>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>>>> ---
>>>>    device-types/net/description.tex | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>>> index aff5e08..529f470 100644
>>>> --- a/device-types/net/description.tex
>>>> +++ b/device-types/net/description.tex
>>>> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>>>>    \begin{description}
>>>>    \item[VIRTIO_NET_F_CSUM (0)] Device handles packets with partial checksum offload.
>>>>
>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial checksum.
>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial checksum or full checksum.
>>> So patch 2 said
>>>
>>> "
>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets with
>>> full checksum.
>>>    \end{description}
>>> "
>>>
>>> Is there any difference between the two "full checksum" here?
>> There's no difference.
>>
>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that the driver "can
>> only" handle packets with full checksum.
> This seems to be odd.
>
> Driver can always handle packet with full checksum, no?

Yes.

> I meant it
> will be then to be functional equivalent to !
> VIRTIO_NET_F_GUEST_FULL_CSUM?

Are you referring to
"functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
If so, I think it's no.

Maybe a description similar to the following would be more clearer:

+\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does not handle packets with partial checksum.

Thanks!

>
> Thanks
>
>> Thanks!
>>
>>> Thanks
>>>
>>>>    \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel offloads
>>>>            reconfiguration support.
>>>> --
>>>> 2.19.1.6.gb485710b
>>>>


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

