Return-Path: <virtio-comment-return-6868-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFA9C0015E
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:12:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5D81C120D4A
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:12:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4539A98680D
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:12:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 33EAB9867FC; Thu, 20 Jul 2023 02:12:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1DB1C9867FD;
	Thu, 20 Jul 2023 02:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vnnt7PL_1689819149;
Message-ID: <1689819034.2537746-2-xuanzhuo@linux.alibaba.com>
Date: Thu, 20 Jul 2023 10:10:34 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: <shahafs@nvidia.com>,
 <hengqi@linux.alibaba.com>,
 <virtio@lists.oasis-open.org>,
 Parav Pandit <parav@nvidia.com>,
 <virtio-comment@lists.oasis-open.org>
References: <20230702234410.47546-1-parav@nvidia.com>
 <20230702234410.47546-2-parav@nvidia.com>
In-Reply-To: <20230702234410.47546-2-parav@nvidia.com>
Subject: [virtio-comment] Re: [virtio] [PATCH REQUIREMENTS v2 1/7] net-features: Add requirements document for release 1.4

On Mon, 3 Jul 2023 02:44:04 +0300, Parav Pandit <parav@nvidia.com> wrote:
> Add requirements document template for the virtio net features.
>
> Add virtio net device counters visible to driver.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v0->v1:
> - removed tx dropped counter
> - updated requirements to mention about virtqueue interface for counters
>   query
> ---
>  net-workstream/features-1.4.md | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 net-workstream/features-1.4.md
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> new file mode 100644
> index 0000000..4c3797b
> --- /dev/null
> +++ b/net-workstream/features-1.4.md
> @@ -0,0 +1,35 @@
> +# 1. Introduction
> +
> +This document describes the overall requirements for virtio net device
> +improvements for upcoming release 1.4. Some of these requirements are
> +interrelated and influence the interface design, hence reviewing them
> +together is desired while updating the virtio net interface.
> +
> +# 2. Summary
> +1. Device counters visible to the driver
> +
> +# 3. Requirements
> +## 3.1 Device counters
> +1. The driver should be able to query the device and/or per vq counters for
> +   debugging purpose using a virtqueue directly from driver to device for
> +   example using a control vq.
> +2. The driver should be able to query which counters are supported using a
> +   virtqueue command, for example using an existing control vq.
> +3. If this device is migrated between two hosts, the driver should be able
> +   get the counter values in the destination host from where it was left
> +   off in the source host.
> +4. If a virtio device is group member device, a group owner should be able
> +   to query all the counter attributes using the administration command which
> +   a virtio member device will expose via a virtqueue to the driver.
> +
> +### 3.1.1 Per receive queue counters
> +1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet being
> +    oversize than the buffer size
> +2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability of the
> +    buffer in the receive queue
> +3. le64 rx_gro_pkts: Packets treated as receive GSO sequence by the device
> +4. le64 rx_pkts: Total packets received by the device
> +
> +### 3.1.2 Per transmit queue counters
> +1. le64 tx_gso_pkts: Packets send as transmit GSO sequence
> +2. le64 tx_pkts: Total packets send by the device


Hi

About the device counter, I will continue to push this patch, can you review it.

http://lore.kernel.org/all/20220315032402.6088-1-xuanzhuo@linux.alibaba.com

Thanks


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

