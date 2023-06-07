Return-Path: <virtio-comment-return-6214-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1B3C77B7A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:31:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7AC1B2AC47
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:31:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B838986655
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:31:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5CD4698664C; Wed,  7 Jun 2023 09:31:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48E4598664F;
	Wed,  7 Jun 2023 09:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0Vka86IJ_1686130287;
Message-ID: <1686130261.1695995-2-xuanzhuo@linux.alibaba.com>
Date: Wed, 7 Jun 2023 17:31:01 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: <shahafs@nvidia.com>,
 <virtio@lists.oasis-open.org>,
 Parav Pandit <parav@nvidia.com>,
 <virtio-comment@lists.oasis-open.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
In-Reply-To: <20230601220305.587034-2-parav@nvidia.com>
Subject: Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add requirements document for release 1.4

On Fri, 2 Jun 2023 01:02:59 +0300, Parav Pandit <parav@nvidia.com> wrote:
> Add requirements document template for the virtio net features.
>
> Add virtio net device counters visible to driver.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 36 ++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 net-workstream/features-1.4.md
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> new file mode 100644
> index 0000000..03b4eb3
> --- /dev/null
> +++ b/net-workstream/features-1.4.md
> @@ -0,0 +1,36 @@
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
> +   debugging purpose using a control vq command.
> +2. The driver should be able to query which counters are supported using a
> +   control vq command.
> +3. If this device is migrated between two hosts, the driver should be able
> +   get the counter values in the destination host from where it was left
> +   off in the source host.
> +4. If a virtio device is group member device, a group owner should be able
> +   to query all the counter attributes using the admin queue command which
> +   a virtio device will expose via a control vq to the driver.
> +
> +### 3.1.1 Per receive queue counters
> +1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet being
> +    oversize than the buffer size
> +2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability of the
> +    buffer in the receive queue
> +3. le64 rx_gro_pkts: Packets treated as guest GSO sequence by the device
> +4. le64 rx_pkts: Total packets received by the device
> +
> +### 3.1.2 Per transmit queue counters
> +1. le64 tx_bad_desc_errors: Descriptors dropped by the device due to errors in
> +   descriptors
> +2. le64 tx_gso_pkts: Packets send as host GSO sequence
> +3. le64 tx_pkts: Total packets send by the device


We hope to support device custom counter. That is, virtio spec provides a
channel for driver and device, and both key and value are provided by device.

We discussed this issue earlier, and after some internal practice, I think it is
still necessary to discuss this again.

It is very important, each cloud vendor will always have some special counters,
these counters may not exist in another vendor. At the same time, if we have
to discuss it in the spec every time we add a counter, or add a feature, I
think it is very inconvenient. Manufacturers may add some new counters at any
time based on some new requirements. Some counters may also be removed at any
time.

Of course I know that doing this might hurt migration. But what I want to say is,
why does it affect live migration? These counters we plan to give to users
through ethtool, and some changes have taken place in the ethtool counters
output by users. Does this have any practical impact? Or do we directly use
some other output in a way, we can clearly tell the user that these counters
may change during the migration process. For example, the driver is migrated
to some new devices. These devices support some new counters. I think users
should be able to see these new counters. These new counters may be the
purpose of the migration.

We don't need to support live migration at this point.

Thanks.


> --
> 2.26.2
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

