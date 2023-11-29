Return-Path: <virtio-comment-return-8675-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D805C4167B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 08:33:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E5A3D120D51
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 08:33:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B6994986655
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 08:33:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 89AEE9865EB; Wed, 29 Nov 2023 08:33:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78D609865ED
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Nov 2023 08:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 9e2QBcQyMreptG27Yc9UVQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Haixu Cui <quic_haixcui@quicinc.com>, Viresh Kumar
 <viresh.kumar@linaro.org>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
 harald.mommer@opensynergy.com, broonie@kernel.org,
 qiang4.zhang@linux.intel.com, quic_ztu@quicinc.com,
 alex.bennee@linaro.org, vincent.guittot@linaro.org
In-Reply-To: <0674be8e-221f-479a-8da2-8a3e59e45bb9@quicinc.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231124072015.12655-1-quic_haixcui@quicinc.com>
 <20231127101750.6xmthho6lnppyw3k@vireshk-i7>
 <2ca987a6-eeb2-4ed6-9a12-10ae450eb4bf@quicinc.com>
 <20231129073022.ohxsfuawambvh3hm@vireshk-i7>
 <0674be8e-221f-479a-8da2-8a3e59e45bb9@quicinc.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 29 Nov 2023 09:33:49 +0100
Message-ID: <871qc9x8k2.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] [PATCH] [PATCH v5] virtio-spi: add the device
 specification

On Wed, Nov 29 2023, Haixu Cui <quic_haixcui@quicinc.com> wrote:

> Hi Viresh,
>
> On 11/29/2023 3:30 PM, Viresh Kumar wrote:
>> On 28-11-23, 20:58, Haixu Cui wrote:
>>> On 11/27/2023 6:17 PM, Viresh Kumar wrote:
>>>> On 24-11-23, 15:20, Haixu Cui wrote:
>>>>> +For half-duplex read transfer, \field{rx_buf} is filled by Virtio SPI device and consumed
>>>>> +by Virtio SPI driver. For half-duplex write transfer, \field{tx_buf} is filled by Virtio
>>>>> +SPI driver and consumed by Virtio SPI device. And for full-duplex read and write transfer,
>>>>> +both \field{tx_buf} and \field{rx_buf} are used.
>>>>
>>>> Should the length of both the buffers in full-duplex mode be same ? If yes, then
>>>> this should be mentioned (in case it is not).
>>>>
>>>
>>> No, there is no such limitation. Write and read buffers may be different is
>>> size.
>> 
>> Hmm, I worked with a SPI controller over a decade ago, and I must be forgetting
>> something here I guess. But from whatever little I remember, with full-duplex
>> transfer, data flows on both MOSI and MISO lines as soon as clock signal is
>> applied.  And so amount of data sent is always be equal to amount of data
>> received by both sides.
>> 
>> Also if I see Linux's implementation of the `struct spi_transfer` [1], I see
>> `tx_buf`, `rx_buf` and a single `len` field, which applies to both the buffers.
>> Which I guess is indicating that both buffers are supposed to be of same length.
>> 
>> What am I missing ?
>
> Oh so sorry for that. And I don't make it clear. Yes, tx_buf and rx_buf 
> have the same size, Linux has such restriction. Just as you mention, 
> kernel level spi_transfer has single "len", the same for 
> spi_ioc_transfer passed from the userland.
>
> But I am not sure if this is in the scope of the spec. Because this is 
> ensured by Linux, but Virtio SPI driver won't also can't verify this.
> This is a prerequisite for virtio spi processing requests.
>
> What is your suggestion? How about adding some descriptions here, like 
> "for full-duplex, tx_buf and rx_buf are same in size, this is guaranteed 
> by the kernel"?

We must not really make any assumptions in the spec about concrete
implementations (here, the Linux kernel), as someone implementing it in
a different environment will need to make explicit choices.

So, if tx_buf and rx_buf are required to be of the same size, it needs
to be explicitly stated in the spec, or an implementation might choose
to do it differently.


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

