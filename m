Return-Path: <virtio-comment-return-7063-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF8C001E0
	for <virtio-comment@archiver.kernel.org>; Wed,  9 Aug 2023 08:47:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CA51675322
	for <virtio-comment@archiver.kernel.org>; Wed,  9 Aug 2023 08:47:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BCBB7986490
	for <virtio-comment@archiver.kernel.org>; Wed,  9 Aug 2023 08:47:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AE364983EB8; Wed,  9 Aug 2023 08:47:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9624A986485;
	Wed,  9 Aug 2023 08:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VpPAlyd_1691570826;
Message-ID: <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
Date: Wed, 9 Aug 2023 16:35:37 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: <shahafs@nvidia.com>,
 <hengqi@linux.alibaba.com>,
 <virtio@lists.oasis-open.org>,
 Parav Pandit <parav@nvidia.com>,
 <virtio-comment@lists.oasis-open.org>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-7-parav@nvidia.com>
In-Reply-To: <20230724033421.249893-7-parav@nvidia.com>
Subject: [virtio-comment] Re: [virtio] [PATCH requirements 6/7] net-features: Add packet timestamp requirements

On Mon, 24 Jul 2023 06:34:20 +0300, Parav Pandit <parav@nvidia.com> wrote:
> Add tx and rx packet timestamp requirements.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index d228462..37820b6 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -10,6 +10,7 @@ together is desired while updating the virtio net interface.
>  2. Low latency tx and rx virtqueues for PCI transport
>  3. Virtqueue notification coalescing re-arming support
>  4  Virtqueue receive flow filters (RFF)
> +5. Device timestamp for tx and rx packets
>
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -280,3 +281,28 @@ struct virtio_net_rff_delete {
>  	u8 padding[2];
>  	le32 flow_id;
>  };
> +
> +## 3.5 Packet timestamp
> +1. Device should provide transmit timestamp and receive timestamp of the packets
> +   at per packet level when the device is enabled.
> +2. Device should provide the current free running clock in the least latency
> +   possible using an MMIO register read of 64-bit to have the least jitter.
> +3. Device should provide the current frequency and the frequency unit for the
> +   software to synchronize the reference point of software and the device using
> +   a control vq command.
> +
> +### 3.5.1 Transmit timestamp
> +1. Transmit completion must contain a packet transmission timestamp when the
> +   device is enabled for it.
> +2. The device should record the packet transmit timestamp in the completion at
> +   the farthest egress point towards the network.
> +3. The device must provide a transmit packet timestamp in a single DMA
> +   transaction along with the rest of the transmit completion fields.
> +
> +### 3.5.2 Receive timestamp
> +1. Receive completion must contain a packet reception timestamp when the device
> +   is enabled for it.
> +2. The device should record the received packet timestamp at the closet ingress
> +   point of reception from the network.
> +3. The device should provide a receive packet timestamp in a single DMA
> +   transaction along with the rest of the receive completion fields.


According to the last discuss, the feature will depend on the new desc
structure.

I would to know, can we introduce this to the current spec with a simple change?

 struct vring_used_elem {
 	/* Index of start of used descriptor chain. */
 	__virtio32 id;
 	/* Total length of the descriptor chain which was used (written to) */
 	__virtio32 len;

+	__virtio64 timestamp;
 };


Then, the existing devices can support this easily. If we introduce this by the
new desc structure, we can foresee that this function will not be implemented by
many existing machines. But this function is useful. So we want support this by
a simple way.


Thanks.

> --
> 2.26.2
>
>
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that
> generates this mail.  Follow this link to all your TCs in OASIS at:
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php
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

