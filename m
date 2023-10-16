Return-Path: <virtio-comment-return-7730-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C58C46CA1
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 08:53:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E94BD1318C7
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 08:53:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D726798648C
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 08:53:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C331E986412; Mon, 16 Oct 2023 08:53:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B455998643F
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 08:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VuE6ErL_1697446410;
Message-ID: <57e3990a-1108-4327-86e3-acce30779baa@linux.alibaba.com>
Date: Mon, 16 Oct 2023 16:53:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S . Tsirkin"
 <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <40b847baf9158cac8c23cb97dd643f768e3a6e05.1697006458.git.hengqi@linux.alibaba.com>
 <CACGkMEtWifs4gwU83-_x_5xKysVpyEsvxT0dcTOyPeOQGVVu-w@mail.gmail.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <CACGkMEtWifs4gwU83-_x_5xKysVpyEsvxT0dcTOyPeOQGVVu-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH] virtio-net: support distinguishing
 between partial and full checksum



在 2023/10/13 上午10:00, Jason Wang 写道:
> On Wed, Oct 11, 2023 at 2:43 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
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
>> In addition, implementation of some performant devices do not generate partially
>> checksummed packets, but the standard driver still need to clear
>> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices negotiate the
>> new feature provided by this patch, then the driver can load XDP.
>>
>> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve the above
>> situation, which forces the device to supply fully checksummed packets
>> to the driver.
>>
>> Use case example:
>> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and after XDP processes a packet
> I believe this feature needs to be turned on dynamically after XDP is
> enabled via control offloads instead of trying to negotiating it from
> the probe?
I guess what you mean is that we need to add requirements for this feature:
The device must supply fully checksummed packets when it receives
the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with a offloads parameter
carrying the VIRTIO_NET_F_GUEST_FULL_CSUM feature bit, otherwise it
works as described by VIRTIO_NET_F_GUEST_FULL_CSUM, right?

We did not do this because dynamically enabling offload when xdp is 
loaded will cause
both partial checksum and full checksum packets to exist in the queue, 
resulting in partialled
checksummed packets to be dropped.

>
>> with full checksum, the VIRTIO_NET_HDR_F_DATA_VALID bit is still retained,
>> resulting in the stack not needing to validate the checksum again. This is
>> useful for guests with performant devices: e.g. bringing the driver advantages
>> such as cpu savings.
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
>>   device-types/net/description.tex | 38 +++++++++++++++++++++++++++-----
>>   1 file changed, 32 insertions(+), 6 deletions(-)
>>
>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>> index 76585b0..a63d497 100644
>> --- a/device-types/net/description.tex
>> +++ b/device-types/net/description.tex
>> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>>       channel.
>>
>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (50)] Driver handles packets with full checksum.
>> +
>>   \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash for encapsulated packets.
>>
>>   \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notification coalescing.
>> @@ -133,6 +135,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>>   \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>>   \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>>   \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM.
>>
>>   \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>>   \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>> @@ -390,6 +393,11 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>>   \ref{sec:Device Types / Network Device / Device Operation /
>>   Processing of Incoming Packets}~\nameref{sec:Device Types /
>>   Network Device / Device Operation / Processing of Incoming Packets} below.
>> +
>> +\item The VIRTIO_NET_F_GUEST_FULL_CSUM feature indicates that the driver handles
>> +  packets with full checksum and does not handle packets with partial checksum,
>> +  which means that partially checksummed packets can not be received by the driver
>> +  and the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} can not be set by the device.
>>   \end{enumerate}
>>
>>   A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
>> @@ -720,7 +728,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>     \field{num_buffers} is one, then the entire packet will be
>>     contained within this buffer, immediately following the struct
>>     virtio_net_hdr.
>> -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>> +\item If the VIRTIO_NET_F_GUEST_CSUM feature (regardless of whether
>> +  VIRTIO_NET_F_GUEST_FULL_CSUM was negotiated) was negotiated, the
>>     VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>>     set: if so, device has validated the packet checksum.
>>     In case of multiple encapsulated protocols, one level of checksums
>> @@ -744,7 +753,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>     number of coalesced TCP segments in \field{csum_start} field and
>>     number of duplicated ACK segments in \field{csum_offset} field
>>     and sets bit VIRTIO_NET_HDR_F_RSC_INFO in \field{flags}.
>> -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>> +\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated but the
>> +  VIRTIO_NET_F_GUEST_FULL_CSUM feature was not negotiated, the
>>     VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} can be
>>     set: if so, the packet checksum at offset \field{csum_offset}
>>     from \field{csum_start} and any preceding checksums
>> @@ -802,8 +812,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>   device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>>   \field{gso_type}.
>>
>> -If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
>> -device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>> +If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated but
>> +the VIRTIO_NET_F_GUEST_FULL_CSUM feature has not been negotiated,
>> +the device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> So FULL_CSUM is mutually exclusive with GUEST_GSO_XXX?

They are not mutually exclusive. If there are packets that carry gso 
information and
have partial checksum, the purpose of this patch is to calculate full 
checksum for these packets.

But if the capability of this patch changes to the dynamic enabling you 
suggested,
then I think this feature conflicts with GUEST_GSO_xx. Because XDP 
currently cannot coexist with GRO_HW etc.

Thanks！

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

