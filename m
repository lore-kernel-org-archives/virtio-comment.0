Return-Path: <virtio-comment-return-6173-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F657C7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:15:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9249942C29
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:15:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84E8E98658B
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:15:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7C9DB98657E; Tue,  6 Jun 2023 22:15:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C7B8986585
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 22:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 7TFJgqEHOoaFDfCFsgr2XA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686089721; x=1688681721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL8hxLrkNFxg4MMI8R3CQwpC5RS6GshjoQu7ZPl6E5M=;
        b=Yq5mhKvFr3l9DYGdR/bhglLeVpG2c+S0FNLtOKL+qSBoaUv6Q5UzgeMv8u8xSp7bJn
         517bREIZpExD2g25LKSs3tLfzJSgjxMtVNX5zKoSZcSA2KniyQGRJgSd3dT2j51osXa+
         aVQrdp1L6g/CmDrXogkHVipxTodBxBw+prvCmetiE8GE9eB1Z1cilRf2fPuGmPwn1BlO
         LWlIozbng1zv44uDEbPrkTVyv1hxPB1nFL1JZSZfBQ5VZoDYbOFdzy7QMmkiVsIzZWwH
         z3sukUaAq8wpCCeOcEItF5rbzQvj3t2nGBYIVyZu2ilnPB1leMfOuLrFZaRhszc8YOD3
         mAgA==
X-Gm-Message-State: AC+VfDwJKTid+MOpj2frTKjddQczoOnaI6mb7SA6jAnkgxZYdRstZeDo
	W57E5RUQGpXI6pFaiqgKRpUxVp2U5aqmU6NbNIWy7nirR5zYX4ICios1Hr2slPMqCVwrsc5V1sU
	ERdLXAQujOZcGJt0RvPVTGYNGDT9myWzqQA==
X-Received: by 2002:a5d:4751:0:b0:30a:ee5e:5cf5 with SMTP id o17-20020a5d4751000000b0030aee5e5cf5mr2888837wrs.31.1686089720857;
        Tue, 06 Jun 2023 15:15:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54zHSnEggxBIrKBbAQYdYvzjQ+JBxX3/Cb08XscNX49WBLIxIOVNBO/wEHkZZSsD6y+mLJtg==
X-Received: by 2002:a5d:4751:0:b0:30a:ee5e:5cf5 with SMTP id o17-20020a5d4751000000b0030aee5e5cf5mr2888827wrs.31.1686089720518;
        Tue, 06 Jun 2023 15:15:20 -0700 (PDT)
Date: Tue, 6 Jun 2023 18:15:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	virtio@lists.oasis-open.org
Message-ID: <20230606180853-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230601220305.587034-2-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4

On Fri, Jun 02, 2023 at 01:02:59AM +0300, Parav Pandit wrote:
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

why does it matter for requirements whether it's a control vq?


what matters is whether they have to be synchronized
with a given queue - I get it they don't have to.

> +3. If this device is migrated between two hosts, the driver should be able
> +   get the counter values in the destination host from where it was left
> +   off in the source host.

we don't cover migration currently don't see how this is a spec
rquirement. unless maybe it's justification for 4?
so maybe it means there needs to be a way to set counters?
so there's no need to mention migration - just that it
should be possible to move counters between devices.

> +4. If a virtio device is group member device, a group owner should be able
> +   to query all the counter attributes using the admin queue command which
> +   a virtio device will expose via a control vq to the driver.


this seems weirdly specific.
what is the actual requirement?


> +
> +### 3.1.1 Per receive queue counters
> +1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet being
> +    oversize than the buffer size

with mergeable buffers how does this differ from 2?

> +2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability of the
> +    buffer in the receive queue
> +3. le64 rx_gro_pkts: Packets treated as guest GSO sequence by the device

what does this mean exactly? packets before or after they are combined?

pls stick to device/driver terminology not guest/host

> +4. le64 rx_pkts: Total packets received by the device

including dropped ones or not?

> +
> +### 3.1.2 Per transmit queue counters
> +1. le64 tx_bad_desc_errors: Descriptors dropped by the device due to errors in
> +   descriptors

since when do we drop packets on error in descriptor?
we just as likely stall ...

> +2. le64 tx_gso_pkts: Packets send as host GSO sequence

same questions as gro

> +3. le64 tx_pkts: Total packets send by the device

sent

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

