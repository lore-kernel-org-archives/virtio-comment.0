Return-Path: <virtio-comment-return-8479-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91219C5ACB3
	for <virtio-comment@archiver.kernel.org>; Mon, 20 Nov 2023 02:27:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BFFB060D2A
	for <virtio-comment@archiver.kernel.org>; Mon, 20 Nov 2023 02:27:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6FD398683F
	for <virtio-comment@archiver.kernel.org>; Mon, 20 Nov 2023 02:27:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8E8BD986828; Mon, 20 Nov 2023 02:27:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C97B986829
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Nov 2023 02:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R291e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0VwfkpPs_1700447216;
Message-ID: <c0003710-5e6c-4318-8f84-d7efc7c9513a@linux.alibaba.com>
Date: Mon, 20 Nov 2023 10:26:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S . Tsirkin"
 <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <8acff73199993535bb66528343681209c32b3560.1699951535.git.hengqi@linux.alibaba.com>
 <CACGkMEvCUwJ3rG5Y9cN8JY=LJM9wkXKj+HY_JVhD4oYgN2CMoQ@mail.gmail.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <CACGkMEvCUwJ3rG5Y9cN8JY=LJM9wkXKj+HY_JVhD4oYgN2CMoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v3] virtio-net: support
 distinguishing between partial and full checksum



在 2023/11/16 下午1:34, Jason Wang 写道:
> On Tue, Nov 14, 2023 at 4:49 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
>> virtio-net works in a virtualized system and is somewhat different from
>> physical nics. One of the differences is that to save virtio device
>> resources, rx may receive packets with partial checksum. However, XDP may
>> cause partially checksummed packets to be dropped. So XDP loading conflicts
>> with the feature VIRTIO_NET_F_GUEST_CSUM.
>>
>> This patch lets the device to supply fully checksummed packets to the driver.
>> Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the benefits of
>> device verification checksum.
>>
>> In addition, implementation of some performant devices do not generate
>> partially checksummed packets, but the standard driver still need to clear
>> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices enable the
>> full checksum offloading, then the driver can load XDP without clearing
>> VIRTIO_NET_F_GUEST_CSUM.
>>
>> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve the above
>> situation, which provides the driver with configurable receive full checksum
>> offload. If the offload is enabled, then the device must supply fully
>> checksummed packets to the driver.
>>
>> Use case example:
>> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and receive full checksum
>> offload is enabled, after XDP processes a packet with full checksum, the
>> VIRTIO_NET_HDR_F_DATA_VALID bit is still retained, resulting in the stack
>> not needing to validate the checksum again. This is useful for guests:
>>    1. Bring the driver advantages such as cpu savings.
>>    2. For devices that do not generate partially checksummed packets themselves,
>>       XDP can be loaded in the driver without modifying the hardware behavior.
>>
>> Several solutions have been discussed in the previous proposal[1].
>> After historical discussion, we have tried the method proposed by Jason[2],
>> but some complex scenarios and challenges are difficult to deal with.
>> We now return to the method suggested in [1].
>>
>> [1] https://lists.oasis-open.org/archives/virtio-dev/202305/msg00291.html
>> [2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@linux.alibaba.com/
>>
>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>> v2->v3:
>> - Add a section named "Driver Handles Fully Checksummed Packets"
>>    and more descriptions. @Michael
>>
>> v1->v2:
>> - Modify full checksum functionality as a configurable offload
>>    that is initially turned off. @Jason
>>
>>   device-types/net/description.tex        | 73 +++++++++++++++++++++++--
>>   device-types/net/device-conformance.tex |  1 +
>>   device-types/net/driver-conformance.tex |  1 +
>>   3 files changed, 69 insertions(+), 6 deletions(-)
>>
>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>> index aff5e08..6937a2f 100644
>> --- a/device-types/net/description.tex
>> +++ b/device-types/net/description.tex
>> @@ -122,6 +122,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>>       device with the same MAC address.
>>
>>   \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
>> +
>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets with full checksum.
>>   \end{description}
>>
>>   \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
>> @@ -136,6 +138,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>>   \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>>   \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>>   \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
>>
>>   \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>>   \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>> @@ -398,6 +401,58 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>>   A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
>>   everything else.
>>
>> +\subsubsection{Driver Handles Fully Checksummed Packets}\label{sec:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
>> +
>> +The VIRTIO_NET_F_GUEST_CSUM feature indicates that the driver can handle
>> +partially or fully checksummed packets from the device. When the
>> +driver only expects fully checksummed packets, the VIRTIO_NET_F_GUEST_FULL_CSUM
>> +feature can be negotiated if the device offers it.
>> +Then the driver only handles packets with full checksum.
>> +
>> +By negotiating the VIRTIO_NET_F_GUEST_FULL_CSUM feature, the driver can
>> +benefit, for example, from the device's ability to calculate and validate the checksum
>> +in scenarios where partially checksummed packets are not compatible.
> Not a native speaker, but I think it's not about compatibility. Maybe
> we can just drop the "in scenarios ..."?

Ok! Agree.

>
>> +
>> +Delivering fully checksummed packets rather than partially
>> +checksummed packets incurs additional overhead for the device.
>> +As a result, receive full-checksum offload (meaning the driver only handles
>> +packets with full checksum) is disabled by default \ref{sec:Device Types / Network Device
>> +/ Device Operation / Control Virtqueue / Offloads State Configuration}.
>> +
>> +Receive full-checksum offload can be enabled if the driver successfully
>> +sends the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with the
>> +VIRTIO_NET_F_GUEST_FULL_CSUM bit set.
>> +
>> +\drivernormative{\subsubsection}{Driver Handles Fully Checksummed Packets}{sec:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
>> +
>> +The driver MUST NOT enable receive full-checksum offload for which
>> +VIRTIO_NET_F_GUEST_FULL_CSUM has not been negotiated.
>> +
>> +\devicenormative{\subsubsection}{Driver Handles Fully Checksummed Packets}{sec:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
>> +
>> +Initially (before the device successfully receives any
>> +VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with the VIRTIO_NET_F_GUEST_FULL_CSUM
>> +bit set) receive full-checksum offload MUST be disabled.
> This seems duplicated with the above
>
> "
> +As a result, receive full-checksum offload (meaning the driver only handles
> +packets with full checksum) is disabled by default \ref{sec:Device
> Types / Network Device
> +/ Device Operation / Control Virtqueue / Offloads State Configuration}.
> "

Yes, you are right. But the two places are text and normativity 
respectively.

>
>> +
>> +Upon the device reset, the device MUST disable receive full-checksum offload.
>> +
>> +If VIRTIO_NET_F_GUEST_FULL_CSUM has been negotiated and receive full-checksum
>> +offload has not been enabled, the device MUST NOT perform any of the
>> +functionality provided by VIRTIO_NET_F_GUEST_FULL_CSUM.
> Well the control offload semantic explains this by itself, so I don't
> think we need to repeat it here.

I will drop this.

>
>> +
>> +If a partially checksummed packet is received by the device, the device MUST
>> +calculate full checksum for the packet and then supply it to the driver
>> +\ref{sec:Device Types / Network Device / Device Operation / Packet Transmission}.
> This seems another duplication as no matter what kind of packet is
> received the full checksum should be calculated.

>> +
>> +If receive full-checksum offload has been enabled, the device MUST NOT set
>> +the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} and MUST supply a
>> +fully checksummed packet to the driver.
>> +
>> +If receive full-checksum offload has been enabled and \field{gso_type}
>> +differs from VIRTIO_NET_HDR_GSO_NONE,
> Any reason why VIRTIO_NET_HDR_GSO_NONE differs from others?

It is to correspond to the following
(this patch also modifies the following paragraph accordingly):

"If gso_type differs from VIRTIO_NET_HDR_GSO_NONE, then the driver MUST
also set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in flags and MUST set
gso_size to indicate the desired MSS."

These descriptions are there to make it clear to the reader what this 
feature does, OK,
if you think we don't need to mention this, I'll simplify the above you 
mentioned and here.

>
>> then the device MUST NOT set
>> +the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} and MUST calculate
>> +full checksum for the packet and then supply it to the driver.
> I think we need to clarify:
>
> 1) when the packet has full checksum, we set DATA_VALID but not NEEDS_CSUM?

Yes.

> 2) when the packet has partial checksum, we set NEEDS_CSUM for sure,

"for sure" is when GUEST_CSUM is on. If GUEST_FULL_CSUM is on, 
NEEDS_CSUM will not be set.

> but a conditional DATA_VALID?

How about this:

1. When the packet has full checksum, the device sets DATA_VALID but not 
NEEDS_CSUM;
2. When the packet has partial checksum,
1) If GUEST_FULL_CSUM is on, the device calculates the full checksum and 
can set DATA_VALID.
2) Otherwise, NEEDS_CSUM will be set.

Thanks!

>
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

