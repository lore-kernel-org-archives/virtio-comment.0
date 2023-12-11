Return-Path: <virtio-comment-return-8765-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1B8C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 02:18:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C46562B01E
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 02:17:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9922F9864EF
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 02:17:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7C91C986471; Mon, 11 Dec 2023 02:17:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C2CF983FE0
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Dec 2023 02:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vy9VQrM_1702261073;
Message-ID: <9a31bb06-0688-4f54-90cb-a58472505b46@linux.alibaba.com>
Date: Mon, 11 Dec 2023 10:17:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-comment@lists.oasis-open.org, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <20231204035211-mutt-send-email-mst@kernel.org>
 <CACGkMEs=aM1n95xWkwJMCrbT1+sW1kHO=r0eMR-07OhrdPW8kw@mail.gmail.com>
 <20231204040528-mutt-send-email-mst@kernel.org>
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
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <CAOEp5Od5nBs31Fd-4JDNAzexQVdZA-O1o1AmuMzs_rZU=Bq_0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.



在 2023/12/10 下午1:39, Yuri Benditovich 写道:
> If somebody explains the problem that this patch addresses it will be very,
> _very_ helpful.
> We _were_ sure that if the host suggests  VIRTIO_NET_F_GUEST_CSUM and the
> driver acks it - they both can do _more_ than without this feature.
> Specifically the driver claims that it is able to deal with additional
> types of incoming packets and such a way the device is able to provide
> _more_ types of incoming packets than if this feature is not acked..

Hi Yuir.

Why do you think this patch will change that..?
What types of packets a driver or device can handle will *not change* 
with this patch.

We only tell the device that when GUEST_FULL_CSUM is negotiated, the 
device *must not*
submit *TCP/UDP*[1] partially checksummed packets to the driver.
It would be better if the device can also help the driver verify the 
checksum (just like GUEST_CSUM).
The matter of identifying or verifying packets has never changed with 
this patch.

[1]

If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the device 
MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit inflags, if so:

 1. the device MUST validate the packet checksum at
    offsetcsum_offsetfromcsum_startas well as all preceding offsets;
 2. the device MUST set the packet checksum stored in the receive buffer
    to the *TCP/UDP* pseudo header;
 3. the device MUST setcsum_startandcsum_offsetsuch that calculating a
    ones’ complement checksum fromcsum_startup until the end of the
    packet and storing the result at offsetcsum_offsetfromcsum_startwill
    result in a fully checksummed packet;


Thanks.

> Shall we change our mind somehow?
> I believe that if due to the presence of this feature the driver is _not_
> able to do something this is a bug somewhere around the driver, isn't it?
> Thank you in advance for the clarification.
>
> On Thu, Dec 7, 2023 at 7:35 AM Jason Wang <jasowang@redhat.com> wrote:
>
>> On Thu, Dec 7, 2023 at 12:52 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
>>>
>>>
>>> 在 2023/12/6 下午5:03, Heng Qi 写道:
>>>>
>>>> 在 2023/12/6 下午4:46, Jason Wang 写道:
>>>>> On Wed, Dec 6, 2023 at 4:08 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>>> wrote:
>>>>>> On Wed, 6 Dec 2023 12:36:53 +0800, Jason Wang <jasowang@redhat.com>
>>>>>> wrote:
>>>>>>> On Wed, Dec 6, 2023 at 10:21 AM Heng Qi <hengqi@linux.alibaba.com>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> 在 2023/12/5 下午10:45, Michael S. Tsirkin 写道:
>>>>>>>>> On Tue, Dec 05, 2023 at 10:18:32PM +0800, Heng Qi wrote:
>>>>>>>>>> 在 2023/12/5 上午11:52, Jason Wang 写道:
>>>>>>>>>>> On Mon, Dec 4, 2023 at 5:34 PM Heng Qi
>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
>>>>>>>>>>>> 在 2023/12/4 下午5:05, Michael S. Tsirkin 写道:
>>>>>>>>>>>>> On Mon, Dec 04, 2023 at 04:59:49PM +0800, Jason Wang wrote:
>>>>>>>>>>>>>> On Mon, Dec 4, 2023 at 4:53 PM Michael S. Tsirkin
>>>>>>>>>>>>>> <mst@redhat.com> wrote:
>>>>>>>>>>>>>>> On Mon, Dec 04, 2023 at 04:49:46PM +0800, Jason Wang wrote:
>>>>>>>>>>>>>>>> On Mon, Dec 4, 2023 at 3:37 PM Heng Qi
>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
>>>>>>>>>>>>>>>>> 在 2023/12/4 下午3:18, Jason Wang 写道:
>>>>>>>>>>>>>>>>>> On Fri, Dec 1, 2023 at 3:16 PM Heng Qi
>>>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
>>>>>>>>>>>>>>>>>>> 在 2023/12/1 下午3:05, Jason Wang 写道:
>>>>>>>>>>>>>>>>>>>> On Fri, Dec 1, 2023 at 2:30 PM Heng Qi
>>>>>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
>>>>>>>>>>>>>>>>>>>>> 在 2023/12/1 下午2:24, Heng Qi 写道:
>>>>>>>>>>>>>>>>>>>>>> 在 2023/12/1 下午1:18, Jason Wang 写道:
>>>>>>>>>>>>>>>>>>>>>>> On Wed, Nov 29, 2023 at 4:23 PM Heng Qi
>>>>>>>>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com>
>>>>>>>>>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>>>>>>>>> 在 2023/11/29 下午4:00, Jason Wang 写道:
>>>>>>>>>>>>>>>>>>>>>>>>> On Tue, Nov 28, 2023 at 4:08 PM Heng Qi
>>>>>>>>>>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com>
>>>>>>>>>>>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>> To prevent readers from misunderstanding that
>>>>>>>>>>>>>>>>>>>>>>>>>> the driver can
>>>>>>>>>>>>>>>>>>>>>>>>>> only handles packets with partial checksum when
>>>>>>>>>>>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update
>>>>>>>>>>>>>>>>>>>>>>>>>> the description.
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com
>>>>>>>>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>>>>>>>> device-types/net/description.tex | 2 +-
>>>>>>>>>>>>>>>>>>>>>>>>>>           1 file changed, 1 insertion(+), 1
>>>>>>>>>>>>>>>>>>>>>>>>>> deletion(-)
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>> diff --git a/device-types/net/description.tex
>>>>>>>>>>>>>>>>>>>>>>>>>> b/device-types/net/description.tex
>>>>>>>>>>>>>>>>>>>>>>>>>> index aff5e08..529f470 100644
>>>>>>>>>>>>>>>>>>>>>>>>>> --- a/device-types/net/description.tex
>>>>>>>>>>>>>>>>>>>>>>>>>> +++ b/device-types/net/description.tex
>>>>>>>>>>>>>>>>>>>>>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature
>>>>>>>>>>>>>>>>>>>>>>>>>> bits}\label{sec:Device Types
>>>>>>>>>>>>>>>>>>>>>>>>>> / Network Device / Feature bits
>>>>>>>>>>>>>>>>>>>>>>>>>> \begin{description}
>>>>>>>>>>>>>>>>>>>>>>>>>> \item[VIRTIO_NET_F_CSUM (0)] Device handles
>>>>>>>>>>>>>>>>>>>>>>>>>> packets with
>>>>>>>>>>>>>>>>>>>>>>>>>> partial checksum offload.
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver
>>>>>>>>>>>>>>>>>>>>>>>>>> handles packets with
>>>>>>>>>>>>>>>>>>>>>>>>>> partial checksum.
>>>>>>>>>>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver
>>>>>>>>>>>>>>>>>>>>>>>>>> handles packets with
>>>>>>>>>>>>>>>>>>>>>>>>>> partial checksum or full checksum.
>>>>>>>>>>>>>>>>>>>>>>>>> So patch 2 said
>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>> "
>>>>>>>>>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver
>>>>>>>>>>>>>>>>>>>>>>>>> handles packets with
>>>>>>>>>>>>>>>>>>>>>>>>> full checksum.
>>>>>>>>>>>>>>>>>>>>>>>>> \end{description}
>>>>>>>>>>>>>>>>>>>>>>>>> "
>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>> Is there any difference between the two "full
>>>>>>>>>>>>>>>>>>>>>>>>> checksum" here?
>>>>>>>>>>>>>>>>>>>>>>>> There's no difference.
>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM
>>>>>>>>>>>>>>>>>>>>>>>> means that the driver
>>>>>>>>>>>>>>>>>>>>>>>> "can
>>>>>>>>>>>>>>>>>>>>>>>> only" handle packets with full checksum.
>>>>>>>>>>>>>>>>>>>>>>> This seems to be odd.
>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>> Driver can always handle packet with full checksum,
>>>>>>>>>>>>>>>>>>>>>>> no?
>>>>>>>>>>>>>>>>>>>>>> Yes.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>> I meant it
>>>>>>>>>>>>>>>>>>>>>>> will be then to be functional equivalent to !
>>>>>>>>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
>>>>>>>>>>>>>>>>>>>>>> Are you referring to
>>>>>>>>>>>>>>>>>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
>>>>>>>>>>>>>>>>>>>>> Sorry, this is a typo. I meant
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> Are you referring to
>>>>>>>>>>>>>>>>>>>>> "functional equivalent to
>>>>>>>>>>>>>>>>>>>>> !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> If so, I think it's no.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Maybe a description similar to the following would
>>>>>>>>>>>>>>>>>>>>>> be more clearer:
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver
>>>>>>>>>>>>>>>>>>>>>> does not handle
>>>>>>>>>>>>>>>>>>>>>> packets with partial checksum.
>>>>>>>>>>>>>>>>>>>> I may miss something here, but what's the difference
>>>>>>>>>>>>>>>>>>>> between
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> and
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> !VIRTIO_NET_F_GUEST_CSUM?
>>>>>>>>>>>>>>>>>>>        From the device perspective:
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers
>>>>>>>>>>>>>>>>>>> packets with full
>>>>>>>>>>>>>>>>>>> checksum to the driver,
>>>>>>>>>>>>>>>>>>> but the device can not validate the checksum for these
>>>>>>>>>>>>>>>>>>> packets. That is,
>>>>>>>>>>>>>>>>>>> the flags in virtio-net-hdr
>>>>>>>>>>>>>>>>>>> will not contain _DATA_VALID, and the driver or stack
>>>>>>>>>>>>>>>>>>> needs to validate
>>>>>>>>>>>>>>>>>>> these packets.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers
>>>>>>>>>>>>>>>>>>> packets with full
>>>>>>>>>>>>>>>>>>> checksum to the driver,
>>>>>>>>>>>>>>>>>>> and the device can validate the checksum for these
>>>>>>>>>>>>>>>>>>> packets. That is, the
>>>>>>>>>>>>>>>>>>> flags in virtio-net-hdr
>>>>>>>>>>>>>>>>>>> will contain _DATA_VALID,
>>>>>>>>>>>>>>>>>> I think DATA_VALID is optional here as device can't
>>>>>>>>>>>>>>>>>> recognize all type
>>>>>>>>>>>>>>>>>> of protocols.
>>>>>>>>>>>>>>>>> Yes, you are right, so I used "device *can*" here. Which
>>>>>>>>>>>>>>>>> packet types
>>>>>>>>>>>>>>>>> the device recognizes or validates
>>>>>>>>>>>>>>>>> depends on the device's implementation. This is also the
>>>>>>>>>>>>>>>>> current
>>>>>>>>>>>>>>>>> practice of GUEST_CSUM.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> and the driver or stack does not need to
>>>>>>>>>>>>>>>>>>> validate these packets.
>>>>>>>>>>>>>>>>>> Ok, so I think there're something that is subtle here,
>>>>>>>>>>>>>>>>> Ok, I see.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> and that's why
>>>>>>>>>>>>>>>>>> I'm asking here:
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> 1) "Driver does not handle packets with partial
>>>>>>>>>>>>>>>>>> checksum" is not
>>>>>>>>>>>>>>>>>> accurate, !GUEST_CUSM also fit for this definition.
>>>>>>>>>>>>>>>>>> 2) "Driver handles packets with full checksum" is kind
>>>>>>>>>>>>>>>>>> of ambiguous as
>>>>>>>>>>>>>>>>>> it doesn't say whether or not the packet has been
>>>>>>>>>>>>>>>>>> validated or not.
>>>>>>>>>>>>>>>>> Maybe the description below would be less subtle?
>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles
>>>>>>>>>>>>>>>>> packets with partial
>>>>>>>>>>>>>>>>> checksum or full checksum.
>>>>>>>>>>>>>>>> I'd suggest to leave it as is. As I didn't find any issue
>>>>>>>>>>>>>>>> since even
>>>>>>>>>>>>>>>> with DATA_VALID. Did you?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver
>>>>>>>>>>>>>>>>> handles packets
>>>>>>>>>>>>>>>>> with full checksum,
>>>>>>>>>>>>>>>>> and the device optionally validates the packet's checksum.
>>>>>>>>>>>>>>>> Or maybe something like (not a native speaker)
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> The driver handles packets with full checksum which the
>>>>>>>>>>>>>>>> device has
>>>>>>>>>>>>>>>> already validated.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Thanks
>>>>>>>>>>>>>>> I feel we just need a proper definition of what does "full
>>>>>>>>>>>>>>> checksum"
>>>>>>>>>>>>>>> mean in this context. It is used but not defined.
>>>>>>>>>>>>>>> Assume this feature was negotiated.
>>>>>>>>>>>>>>> My understanding is that this is just like
>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM
>>>>>>>>>>>>>>> but certain values in the header are then disallowed? Which?
>>>>>>>>>>>>>>> This should be in the spec.
>>>>>>>>>>>>>> Yes, I think it is probably the headers that DATA_VALID can
>>>>>>>>>>>>>> work. We
>>>>>>>>>>>>>> never define it in the past.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> E.g in the Linux we map DATA_VALID to CHECKSUM_UNNECESSARY,
>>>>>>>>>>>>>> but it can
>>>>>>>>>>>>>> only work for some specific protocols:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> """
>>>>>>>>>>>>>>       *   %CHECKSUM_UNNECESSARY is applicable to following
>>>>>>>>>>>>>> protocols:
>>>>>>>>>>>>>>       *
>>>>>>>>>>>>>>       *     - TCP: IPv6 and IPv4.
>>>>>>>>>>>>>>       *     - UDP: IPv4 and IPv6. A device may apply
>>>>>>>>>>>>>> CHECKSUM_UNNECESSARY to a
>>>>>>>>>>>>>>       *       zero UDP checksum for either IPv4 or IPv6, the
>>>>>>>>>>>>>> networking stack
>>>>>>>>>>>>>>       *       may perform further validation in this case.
>>>>>>>>>>>>>>       *     - GRE: only if the checksum is present in the
>>>>>>>>>>>>>> header.
>>>>>>>>>>>>>>       *     - SCTP: indicates the CRC in SCTP header has been
>>>>>>>>>>>>>> validated.
>>>>>>>>>>>>>>       *     - FCOE: indicates the CRC in FC frame has been
>>>>>>>>>>>>>> validated.
>>>>>>>>>>>>>> """
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I'm not sure whether it's just fine to duplicate the
>>>>>>>>>>>>>> definition or
>>>>>>>>>>>>>> it's too late to define any now.
>>>>>>>>>>>>> I think it's mostly harmless for other protocols.
>>>>>>>>>>>> I'm not sure if this should be defined by a new FULL_CSUM
>>>>>>>>>>>> feature.
>>>>>>>>>>>> This seems to be an issue with GUEST_CSUM.
>>>>>>>>>>>>
>>>>>>>>>>>> I think we should supplement these with a new patch for
>>>>>>>>>>>> GUEST_CSUM?
>>>>>>>>>>> Probably. My understanding is:
>>>>>>>>>>>
>>>>>>>>>>> You want to reuse DATA_VALID here, so we need to stick to a
>>>>>>>>>>> consistent
>>>>>>>>>>> semantic for GUEST_CUSM and FULL_CSUM. So we need a definition
>> of
>>>>>>>>>>> "full csum" or what kind of packet could DATA_VALID work here.
>>>>>>>>>> I agree, we can be clear about what types of packets DATA_VALID
>>>>>>>>>> might
>>>>>>>>>> cover, e.g. TCP/UDP/GRE/SCTP/FoCE.
>>>>>>>>>>
>>>>>>>>>> But I think we also need something like
>>>>>>>>>> \field{supported_validate_types} to
>>>>>>>>>> indicate which packet types the device supports validating and
>>>>>>>>>> setting
>>>>>>>>>> DATA_VALID,
>>>>>>>>>> otherwise the device driver that negotiates this feature may
>>>>>>>>>> fail to live
>>>>>>>>>> migration.
>>>>>>>>>> Am I right?
>>>>>>>>>>
>>>>>>>>>> I'm not sure how GUEST_CSUM works now as it should also suffer
>>>>>>>>>> from the
>>>>>>>>>> above
>>>>>>>>>> mentioned issues with live migration, but no devices are
>>>>>>>>>> reporting this
>>>>>>>>>> right now.
>>>>>>>>>>
>>>>>>>>>> Maybe, each device only supports checksum verification for
>>>>>>>>>> TCP/UDP by
>>>>>>>>>> default? I don't know.
>>>>>>>>>> But I hope we can focus on this and get consensus, because our
>>>>>>>>>> hw release
>>>>>>>>>> date is coming soon.
>>>>>>>>>>
>>>>>>>>>> Thanks a lot!
>>>>>>>>> First, DATA_VALID is not a thing that hardware should ever use.
>>>>>>>>> It's a hack when packets are passed within host.
>>>>>>>> Get here. Thanks!
>>>>>>> So if I understand correctly, we need a new flag here and define the
>>>>>>> supported protocols.
>>>>>> For what, migration?
>>>>> No.
>>>>>
>>>>> It's basically a question of whether or not we want to reuse
>>>>> DATA_VALID. It has limitations that it only works for some specific
>>>>> protocols.
>>>> Yes, I understand what Xuan means is that we reuse DATA_VALID and
>>>> advertise
>>>> what specific protocols DATA_VALID covers.
>>>>
>>>> Back to supported_validate_types, now I think we really don't need to
>>>> let the device
>>>> provide this field. Why? Because asssuming the device provides it, it
>>>> seems useless
>>>> because the driver does not parse the protocol type for each packet
>>>> and does not use this field.
>>>> The driver and stack just want to know whether the packet is valid or
>>>> checksum unneccessary.
>>> Hi Jason and Michael.
>>>
>>> Are we aligned on this?
>> For supported_validate_types, I don't think we need it.
>>
>> But I'm not sure if we are aligned.
>>
>>> If yes, I'll write a new version to refresh the thread and try to avoid
>>> future rollbacks.
>> Maybe you can post a new version.
>>
>> Thanks
>>
>>> Thanks a lot!
>>>
>>>> Thanks!
>>>>
>>>>> If we don't, we need a new flag.
>>>>>
>>>>> Thanks
>>>>
>>>> This publicly archived list offers a means to provide input to the
>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>
>>>> In order to verify user consent to the Feedback License terms and
>>>> to minimize spam in the list archive, subscription is required
>>>> before posting.
>>>>
>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>> Feedback License:
>> https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>> List Guidelines:
>>>> https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>> Join OASIS: https://www.oasis-open.org/join/
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and
>> to minimize spam in the list archive, subscription is required
>> before posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>> List Guidelines:
>> https://www.oasis-open.org/policies-guidelines/mailing-lists
>> Committee: https://www.oasis-open.org/committees/virtio/
>> Join OASIS: https://www.oasis-open.org/join/
>>
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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

