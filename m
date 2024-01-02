Return-Path: <virtio-comment-return-8881-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855BC46CD2
	for <virtio-comment@archiver.kernel.org>; Tue,  2 Jan 2024 06:33:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 61DB92AF8E
	for <virtio-comment@archiver.kernel.org>; Tue,  2 Jan 2024 06:33:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B8F49864BA
	for <virtio-comment@archiver.kernel.org>; Tue,  2 Jan 2024 06:33:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1748E9841A5; Tue,  2 Jan 2024 06:33:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 025749863B5
	for <virtio-comment@lists.oasis-open.org>; Tue,  2 Jan 2024 06:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R501e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VzmI2Mr_1704177222;
Message-ID: <7686cc30-8ec9-4320-8cc3-c39e9ca3de25@linux.alibaba.com>
Date: Tue, 2 Jan 2024 14:33:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S . Tsirkin"
 <mst@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <1703749573-2786-1-git-send-email-hengqi@linux.alibaba.com>
 <1703749573-2786-3-git-send-email-hengqi@linux.alibaba.com>
 <CACGkMEuTay71sxburhdzYW37XianBt2FBx30Vt9W87=DzgXR2g@mail.gmail.com>
 <c2497c8d-5c15-4bc5-a380-159676c843f6@linux.alibaba.com>
 <CACGkMEstEAAY8U6hq-9N22509c6T206_f_rCz9Fuaxt4iY0LiQ@mail.gmail.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <CACGkMEstEAAY8U6hq-9N22509c6T206_f_rCz9Fuaxt4iY0LiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v7 2/2] virtio-net: device does not
 deliver partially checksummed packet and may validate the checksum



在 2024/1/2 下午1:56, Jason Wang 写道:
> On Tue, Jan 2, 2024 at 11:33 AM Heng Qi <hengqi@linux.alibaba.com> wrote:
>>
>>
>> 在 2024/1/2 上午9:58, Jason Wang 写道:
>>> On Thu, Dec 28, 2023 at 3:46 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
>>>> virtio-net works in a virtualized system and is somewhat different from
>>>> physical nics. One of the differences is that to save virtio device
>>>> resources, rx may receive partially checksummed packets. However, XDP may
>>>> cause partially checksummed packets to be dropped.
>>>> So XDP loading currently conflicts with the feature VIRTIO_NET_F_GUEST_CSUM.
>>>> When XDP is loaded, the offload of VIRTIO_NET_F_GUEST_CSUM is disabled
>>>> (to disable the tx checksum offload).
>>>>
>>>> In addition, implementation of some performant devices always do not generate
>>>> partially checksummed packets, but the standard driver still cannot load XDP
>>>> when VIRTIO_NET_F_GUEST_CSUM is there.
>>>>
>>>> This patch lets the device to supply fully checksummed packets to the driver.
>>>>
>>>> A new feature VIRTIO_NET_F_GUEST_FULLY_CSUM is added to solve the above
>>>> situation, which provides the driver with configurable offload.
>>>> If the offload is enabled, then the device must deliver fully
>>> For offload, did you mean rx csum offload?
>> I mean FULLY_CSUM's offload.
>>
>>>> checksummed packets to the driver and may validate the checksum.
>>>>
>>>> Use case example:
>>>> If VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated and the offload is enabled,
>>>> after XDP processes a fully checksummed packet, the VIRTIO_NET_HDR_F_DATA_VALID bit
>>>> is retained if the device has validated its checksum, resulting in the guest
>>>> not needing to validate the checksum again. This is useful for guests:
>>>>     1. Bring the driver advantages such as cpu savings.
>>>>     2. For devices that do not generate partially checksummed packets themselves,
>>>>        XDP can be loaded in the driver without modifying the hardware behavior.
>>>>
>>>> Several solutions have been discussed in the previous proposal[1].
>>>> After historical discussion, we have tried the method proposed by Jason[2],
>>>> but some complex scenarios and challenges are difficult to deal with.
>>>> We now return to the method suggested in [1].
>>>>
>>>> [1] https://lists.oasis-open.org/archives/virtio-dev/202305/msg00291.html
>>>> [2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@linux.alibaba.com/
>>>>
>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>>>> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>> ---
>>>> v6->v7:
>>>> - FULLY_CSUM no longer depends on GUEST_CSUM.
>>>> - The description related to DATA_VALID has nothing to do with
>>>>     whether GUEST_CSUM is negotiated or not. @Jason
>>>>
>>>> v5->v6:
>>>> - Rewrite and clarify patch description. @Michael
>>>>
>>>> v4->v5:
>>>> - Remove the modification to the GUEST_CSUM. @Jason
>>>> - The description of this feature has been reorganized for greater clarity. @Michael
>>>>
>>>> v3->v4:
>>>> - Streamline some repetitive descriptions. @Jason
>>>> - Add how features should work, when to be enabled, and overhead. @Jason @Michael
>>>>
>>>> v2->v3:
>>>> - Add a section named "Driver Handles Fully Checksummed Packets"
>>>>     and more descriptions. @Michael
>>>>
>>>> v1->v2:
>>>> - Modify full checksum functionality as a configurable offload
>>>>     that is initially turned off. @Jason
>>>>
>>>>    device-types/net/description.tex        | 68 ++++++++++++++++++++++++++++++---
>>>>    device-types/net/device-conformance.tex |  1 +
>>>>    2 files changed, 64 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>>> index a5210f2..d4a7329 100644
>>>> --- a/device-types/net/description.tex
>>>> +++ b/device-types/net/description.tex
>>>> @@ -122,6 +122,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>>>>        device with the same MAC address.
>>>>
>>>>    \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
>>>> +
>>>> +\item[VIRTIO_NET_F_GUEST_FULLY_CSUM (64)] Device delivers fully checksummed packets
>>>> +    to the driver and may validate the checksum.
>>>>    \end{description}
>>>>
>>>>    \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
>>>> @@ -136,6 +139,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>>>>    \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>>>>    \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>>>>    \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
>>>> +\item[VIRTIO_NET_F_GUEST_FULLY_CSUM] Requires VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
>>>>
>>>>    \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>>>>    \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>>>> @@ -383,7 +387,8 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>>>>    the same system might not need checksumming at all, nor segmentation,
>>>>    if both guests are amenable.}
>>>>       The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
>>>> -  checksummed packets can be received, and if it can do that then
>>>> +  checksummed packets can be received (provided that the offload of
>>>> +  VIRTIO_NET_F_GUEST_FULLY_CSUM is disabled), and if it can do that then
>>>>      the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
>>>>      VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4
>>>>      and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features described above.
>>>> @@ -398,6 +403,55 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>>>>    A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
>>>>    everything else.
>>>>
>>>> +\subsubsection{Device Delivers Fully Checksummed Packets}\label{sec:Device Types / Network Device / Device Initialization / Device Delivers Fully Checksummed Packets}
>>>> +
>>>> +If the feature VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated, the driver can
>>>> +benefit from the device's ability to calculate and validate the checksum.
>>>> +
>>>> +If the feature VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated
>>>> +and its offload is enabled, the device behaves as follows:
>>>> +\begin{itemize}
>>>> +  \item The device delivers a fully checksummed packet to the driver rather than a partially checksummed packet.
>>>> +Partially checksummed packets come from TCP/UDP protocols \ref{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}.
>>>> +  \item The device may validate the packet checksum before delivering it.
>>>> +If the packet checksum has been verified, the VIRTIO_NET_HDR_F_DATA_VALID bit
>>>> +in \field{flags} is set: in case of multiple encapsulated protocols, one
>>>> +level of checksums has been validated.
>>>> +  \item The device can not set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags}.
>>>> +\end{itemize}
>>> I may miss something, but this seems the existing behaviour of the
>>> devices regardless of FULLY_CSUM?
>> Yes Jason.
>> I think that we have the fix from the first patch, our requirements have
>> been met.
>> But back to the second patch itself, on some devices, turning off
>> GUEST_CSUM offload
>> may mean turning off tx checksum offload,
> For tx did you mean guest? If yes, it should be HOST_CSUM I think.
>
> Or you actually mean the tx csum on the host?
>
>> but GUEST_FULLY_CSUM does not
>> have this requirement.
>> GRO_HW will also be turned off.
>>
>>>> +
>>>> +The packet types that the device recognizes and can verify are independent of
>>>> +whether the offload of VIRTIO_NET_F_GUEST_FULLY_CSUM is enabled.
>>> Right, so I don't see why this became part of this patch.
>>>
>>>> +
>>>> +Specific transport protocols that may have VIRTIO_NET_HDR_F_DATA_VALID set
>>>> +in \field{flags} include TCP, UDP, GRE (Generic Routing Encapsulation),
>>>> +and SCTP (Stream Control Transmission Protocol).
>>>> +A fully checksummed packet's checksum field for each of the above protocols
>>>> +is set to a calculated value that covers the transport header and payload
>>>> +(TCP or UDP involves the additional pseudo header) of the packet.
>>>> +
>>>> +Delivering fully checksummed packets rather than partially
>>>> +checksummed packets incurs additional overhead for the device.
>>>> +The overhead varies from device to device, for example the overhead of
>>>> +calculating and validating the packet checksum is a few microseconds
>>>> +for some hardware devices.
>>>> +
>>>> +The feature VIRTIO_NET_F_GUEST_FULLY_CSUM has a corresponding offload \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration},
>>>> +which when enabled means that the device delivers fully checksummed packets
>>>> +to the driver and may validate the checksum.
>>>> +\begin{note}
>>> This is the functional equivalent to disable GUEST_CSUM. So I guess
>>> what I'm missing is the difference between:
>>>
>>> 1) enable FULLY_CUSM
>>>
>>> and
>>>
>>> 2) disable GUEST_CSUM
>>>
>>> It looks to me 1) try to keep e.g HW_GRO (GUEST_TSOX) work? Note that
>>> GRO produce partial csum usually, not sure it can work correctly.
>> When GUEST_CSUM is turned off, GRO_HW offload will be turned off.
> It's the GUEST_TSO4/6 that is actually turned off. So this needs more thought:
>
> 1) Reuse GUEST_TSO4/6 but have a mode to have full checksum
> 2) New feature like GUEST_GRO, and claims that the packet boundary
> needs to be reserved there
>
> My understanding is, 1) may end up being somewhat ambiguous since TSO
> usually have partial checksum.
>
> What's your thought?


I think the reason why GUEST_TSO4/6 etc. rely on GUEST_CSUM is that the 
overhead of segmenting and re-merging
packets can be saved between two vms on the same host.

Currently, disabling GUEST_CSUM happens when XDP is loading, and XDP 
does conflict with GUEST_TSO4/6.
Therefore, in this scenario, when we disable GUEST_CSUM, GUEST_TSO4/6 
must also be disabled.

In non-XDP scenarios, we don't need to disable GUEST_CSUM (and the 
current Linux virtio driver does not provide a way to turn it off),
and they work well.

Designing solutions such as (1)/(2) can indeed be one of the future 
directions, but there does not seem to be a strong motivation(at least 
in the Alibaba cloud scenario).

Therefore, I plan to push only the first fix patch in the next version, 
and fix the bug in Linux that \field{flags} with the DATA_VALID set is 
ignored when XDP is loaded.

Thanks a lot!

>
>> Meaning the hardware will not merge the packets.
> Right.
>
>> IIRC, after the packets have been merged, the packets should have full
>> checksums and have been verified:
>>
>>          if (!(features & NETIF_F_RXCSUM)) {
>>                   /* NETIF_F_GRO_HW implies doing RXCSUM since every packet
>>                    * successfully merged by hardware must also have the
>>                    * checksum verified by hardware.  If the user does not
>>                    * want to enable RXCSUM, logically, we should disable
>> GRO_HW.
>>                    */
>>                   if (features & NETIF_F_GRO_HW) {
>>                           netdev_dbg(dev, "Dropping NETIF_F_GRO_HW since
>> no RXCSUM feature.\n");
>>                           features &= ~NETIF_F_GRO_HW;
>>                   }
>>           }
>>
> Thanks


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

