Return-Path: <virtio-comment-return-8288-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457A7C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 08:42:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8C48A3E583
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 08:42:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8230C986CD1
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 08:42:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7756F986CC5; Thu,  9 Nov 2023 08:42:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A2F1986CC6
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 08:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R541e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vw01iT4_1699519359;
Message-ID: <33bf91ec-c9c2-4a52-9b35-53ee09a0fca0@linux.alibaba.com>
Date: Thu, 9 Nov 2023 16:42:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Parav Pandit <parav@nvidia.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <fac1080d10df30450e889379b8da2a6db6523c23.1697695970.git.hengqi@linux.alibaba.com>
 <20231027032707-mutt-send-email-mst@kernel.org>
 <79a89ece-f931-4a59-ac5c-25b60c4102a1@linux.alibaba.com>
 <CACGkMEvzAyQmO=YBzqNjxjkCMyFw42bWD+RQ1Audb06WpeG6EA@mail.gmail.com>
 <20231101013634-mutt-send-email-mst@kernel.org>
 <CACGkMEucwwx2p1Y-3DN3yBAA6_Mu6pdmKxpCj8pDbD6YxjvFPg@mail.gmail.com>
 <20231102024425-mutt-send-email-mst@kernel.org>
 <CACGkMEvXBjHUmHAjBvn8UE47Ca26vx0+J22=nAygB96nakXPcw@mail.gmail.com>
 <20231109030057-mutt-send-email-mst@kernel.org>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <20231109030057-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: support distinguishing
 between partial and full checksum



在 2023/11/9 下午4:01, Michael S. Tsirkin 写道:
> On Thu, Nov 09, 2023 at 11:55:01AM +0800, Jason Wang wrote:
>>>> Most userspace doesn't care about the checksum though.
>>>>
>>>>> Maybe we need a flag
>>>>> to say which offloads are expensive?
>>>>>
>>>> That exposes some device details which seem not good (e.g we may want
>>>> to do migration among hardware and software).
>>>>
>>>> Thanks
>>> If you do then things will be less well tuned on one of the migration
>>> ends but then that is by design, isn't it?
>> Ok, so I'm fine to enable it by default.
>>
>> Thanks
> I was really asking a question. Is it true that full is more expensive
> than partial for the device?

It depends on the device. For performant (e.g. IO queues are hardware 
accelerated)
or well-resourced devices, the overhead of full csum compared to partial 
csum is almost negligible.

> So it should only be enabled if
> strictly required?

I think for software devices, yes.

Thanks.

>
>>> --
>>> MST
>>>
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

