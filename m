Return-Path: <virtio-comment-return-6174-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECC5C7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:25:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1D0C260348
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:25:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB314986583
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:25:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D5FFA98657E; Tue,  6 Jun 2023 22:25:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C2F09986585
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 22:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: eK5uyodwOrKuLclX4rqS6g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686090353; x=1688682353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHF18MfgmRvYTNOiJQiyilSklIXH1ac2VYGddJMUH80=;
        b=gOH+H/oqCBZVpPbFZzNbFQnh267mff6/lgdGsBUeKSBAhRWsk9DGt840eQbNeVtXi3
         zh8iLsErCkKb+K6jysOehdNQsQgBhMNweUE8PZwSDk0Tv7uKZBlL+dv7AcGlx3c0E8IG
         CJ5RmrWM6E7ENWnYgNyvznN5D1Vq5SwKSEO+xXyYV30rn7MWKDoru/mj0r+zQxBcRxua
         J9kc6lYq55NvrPqhsYtEsrhJx5/bK7aPXkPr/NSttQTe1X9y6Ca/ud5rxvHfvk9hltRK
         yPEYYoQ1ggCDfi0PzZYbBaj9x1N2LpqwaTW80r9gQ3qDDl5WKwSaMCqS5VXAN/bDPPWd
         IW1Q==
X-Gm-Message-State: AC+VfDzPD6Qd3P9vZq7VOk4kun0lHB/kKwrDvLjuG+/qrftKKw+t4bpk
	ZG1uH3H8l6waRgym481JZy5eNCDWroFvpMVjE3IVm55PQTQrWn1+0ZqSoFIvujevIGINBZVN5rD
	iECI0d+7AvhZsI6x4AZiuwu/xwB4+FSUyTw==
X-Received: by 2002:adf:e5c1:0:b0:30e:1112:7e24 with SMTP id a1-20020adfe5c1000000b0030e11127e24mr2819535wrn.22.1686090353468;
        Tue, 06 Jun 2023 15:25:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jTkdLe7tgL4GIdtnNKSr3uQi9tuMmsDilU61cwyj1oGBo0HUqyRbhfS44EB4vuVhjL+2Mfg==
X-Received: by 2002:adf:e5c1:0:b0:30e:1112:7e24 with SMTP id a1-20020adfe5c1000000b0030e11127e24mr2819527wrn.22.1686090353138;
        Tue, 06 Jun 2023 15:25:53 -0700 (PDT)
Date: Tue, 6 Jun 2023 18:25:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	virtio@lists.oasis-open.org
Message-ID: <20230606181535-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230601220305.587034-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 2/7] net-features: Add low
 latency transmit queue requirements

On Fri, Jun 02, 2023 at 01:03:00AM +0300, Parav Pandit wrote:
> Add requirements for the low latency transmit queue.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 73 ++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 03b4eb3..55f1b1f 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -7,6 +7,7 @@ together is desired while updating the virtio net interface.
>  
>  # 2. Summary
>  1. Device counters visible to the driver
> +2. Low latency tx virtqueue for PCI transport
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -34,3 +35,75 @@ together is desired while updating the virtio net interface.
>     descriptors
>  2. le64 tx_gso_pkts: Packets send as host GSO sequence
>  3. le64 tx_pkts: Total packets send by the device
> +
> +## 3.2 Low PCI latency virtqueues
> +### 3.2.1 Low PCI latency tx virtqueue
> +1. Packet transmit descriptor should contain data descriptors count without any
> +   indirection and without any O(N) search to find the end of a packet stream.
> +   For example, a packet transmit descriptor (called vnet_tx_hdr_desc
> +   subsequently) to contain a field num_next_desc for the packet stream
> +   indicating that a packet is located N data descriptors.
> +
> +2. Packet transmit descriptor should contain segmentation offload-related fields
> +   without any indirection. For example, packet transmit descriptor to contain
> +   gso_type, gso_size/mss, header length, csum placement byte offset, and
> +   csum start.
> +
> +3. Packet transmit descriptor should be able to place a small size packet that
> +   does not have any L4 data after the vnet_tx_hdr_desc in the virtqueue memory.
> +   For example a TCP ack only packet can fit in a descriptor memory which
> +   otherwise consume more than 25% of metadata to describe the packet.

For IPv6? With all the crazy options? Are you sure?

> +
> +4. Packet transmit descriptor should be able to place a full GSO header (L2 to
> +   L4) after header descriptor and before data descriptors. For example, the
> +   GSO header is placed after struct vnet_tx_hdr_desc in the virtqueue memory.
> +   When such a GSO header is positioned adjacent to the packet transmit
> +   descriptor, and when the GSO header is not aligned to 16B, the following
> +   data descriptor to start on the 8B aligned boundary.
> +

These alignments are weirdly specific.


Are these achievable with existing VQ designs? If not this specific part
is not going to be a network specific thing. which is ok but maybe
mention this.

> +5. An example of the above requirements at high level is:
> +
> +```
> +struct vitio_packed_q_desc {
> +   /* current desc for reference */
> +   u64 address;
> +   u32 len;
> +   u16 id;
> +   u16 flags;
> +};
> +
> +/* Constant size header descriptor for tx packets */
> +struct vnet_tx_hdr_desc {
> +   u16 flags; /* indicate how to parse next fields */
> +   u16 id; /* desc id to come back in completion */
> +   u8 num_next_desc; /* indicates the number of the next 16B data desc for this
> +		      * buffer.
> +		      */
> +   u8 gso_type;
> +   le16 gso_hdr_len;
> +   le16 gso_size;
> +   le16 csum_start;
> +   le16 csum_offset;
> +   u8 inline_pkt_len; /* indicates the length of the inline packet after this
> +		       * desc
> +		       */
> +   u8 reserved;
> +   u8 padding[];
> +};
> +
> +/* Example of a short packet or GSO header placed in the desc section of the vq
> + */
> +struct vnet_tx_small_pkt_desc {
> +   u8 raw_pkt[128];
> +};
> +
> +/* Example of header followed by data descriptor */
> +struct vnet_tx_hdr_desc hdr_desc;
> +struct vnet_data_desc desc[2];
> +
> +```

Seems to assume huge descriptors, apparently of variable size.
Are fixed size descriptors valuable?



> +6. Ability to zero pad the transmit completion when the transmit completion is
> + shorter than the CPU cache line size.
> +
> +7. Ability to place all transmit completion together with it per packet stream
> +   transmit timestamp using single PCIe transcation.

I can't decipher the last two ones. Part of it is using non virtio
terminology, part referring to PCI/CPU unnecessarily, part
weird grammar.

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

