Return-Path: <virtio-comment-return-8770-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5F8C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 09:18:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0682378C8A
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 09:18:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D98FC9864A1
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 09:18:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B854F9841A2; Mon, 11 Dec 2023 09:18:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A836B986471
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Dec 2023 09:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VyF0PLV_1702286280;
Message-ID: <432c176e-9538-44e3-901b-85915684d804@linux.alibaba.com>
Date: Mon, 11 Dec 2023 17:17:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heng Qi <hengqi@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <4dee1860-4790-4217-b13f-3259172b653c@linux.alibaba.com>
 <CACGkMEtDTGafzOo1=-9LDhpQByA9Y=6NtPpUibLc=EVwC4CYXA@mail.gmail.com>
 <d11b39dc-a74b-4bde-9c2d-d7dae09f3c71@linux.alibaba.com>
 <20231205094318-mutt-send-email-mst@kernel.org>
 <bba2c20b-0f61-43f3-81e5-3311144e6208@linux.alibaba.com>
 <CACGkMEuGvz0xy9aML4oBJoStx-DW93LnGDdh6JMXyw3AhrgExA@mail.gmail.com>
 <1701849446.0349424-5-xuanzhuo@linux.alibaba.com>
 <CACGkMEsOeGbP5050RyDhMGvK_ZK=zziEuktWDHy0JCh9WHt8Cg@mail.gmail.com>
 <151752e2-1684-42a8-a53e-722da877c19b@linux.alibaba.com>
 <47e97f8c-fb88-4f32-8230-5b3357fb8091@linux.alibaba.com>
 <CACGkMEv+f+0cUPaOOpVrt6jofBudGwcG08VS+y_iDbcuU4QGvg@mail.gmail.com>
 <CAOEp5Od5nBs31Fd-4JDNAzexQVdZA-O1o1AmuMzs_rZU=Bq_0A@mail.gmail.com>
 <9a31bb06-0688-4f54-90cb-a58472505b46@linux.alibaba.com>
 <CACGkMEsBdLNtx2Vo2Lo-81rS4h=8wt7JDyejcRC=nxq446stWg@mail.gmail.com>
 <4f612fd1-b090-4b2b-ba19-7efd4d61cc32@linux.alibaba.com>
In-Reply-To: <4f612fd1-b090-4b2b-ba19-7efd4d61cc32@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.


Hi all.

Because there are already many V4 threads and valid opinions collected!
For the review experience of maintainers, v5 is refreshed[1], please review.

[1] 
https://lists.oasis-open.org/archives/virtio-comment/202312/msg00069.html

Thanks!


在 2023/12/11 下午3:40, Heng Qi 写道:
>
>
> 在 2023/12/11 下午3:26, Jason Wang 写道:
>> On Mon, Dec 11, 2023 at 10:18 AM Heng Qi <hengqi@linux.alibaba.com> 
>> wrote:
>>>
>>>
>>> 在 2023/12/10 下午1:39, Yuri Benditovich 写道:
>>>> If somebody explains the problem that this patch addresses it will 
>>>> be very,
>>>> _very_ helpful.
>>>> We _were_ sure that if the host suggests VIRTIO_NET_F_GUEST_CSUM 
>>>> and the
>>>> driver acks it - they both can do _more_ than without this feature.
>>>> Specifically the driver claims that it is able to deal with additional
>>>> types of incoming packets and such a way the device is able to provide
>>>> _more_ types of incoming packets than if this feature is not acked..
>>> Hi Yuir.
>>>
>>> Why do you think this patch will change that..?
>>> What types of packets a driver or device can handle will *not change*
>>> with this patch.
>> Well, I think the confusion came from you wanting to modify the
>> definition of VIRTIO_NET_F_GUEST_CSUM.
>
> As we discussed, modifications to the GUEST_CSUM definition will be 
> removed in the next version.
>
>> As discussed, there's no issue with the current definition:
>>
>> When VIRTIO_NET_F_GUEST_CSUM is negotiated and DATA_VALID is set, the
>> checksum is still partial.
>
> I'm confused about this sentence.
>
> DATA_VALID will not appear in a packet together with a partial checksum.
>
> I think what you are saying is that partial checksum means 
> CHECKSUM_UNNECESSARY.
>
> Thanks!
>
>>
>> Or did you see any?
>>
>> Thanks
>
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
> List Guidelines: 
> https://www.oasis-open.org/policies-guidelines/mailing-lists
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

