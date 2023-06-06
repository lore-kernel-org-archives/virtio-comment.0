Return-Path: <virtio-comment-return-6176-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7617BC7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:33:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D0FA6EEA0C
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:33:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6F5098658C
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:33:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B9D1C98657E; Tue,  6 Jun 2023 22:33:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A26F8986583
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 22:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KqVNsNUCPTa2fSXDGBQCkA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686090800; x=1688682800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5sUPLpxS9DXrFeK0lvqrsJl38Ka3pSQbgFHTrMOwtE=;
        b=XTs092AkZvMMZL5q3ar359fkYt7pRZA8s526xLuToxvOrz0fTuH6EVoE5eoOv3nrCJ
         cg5W9Q3i5326/CgVe56zP96/x0IfVsYrBpA3Kwr9hJXVNYOvKhiWriI3JwNA1bH7zcgU
         ttEuLTxUqSFVMC+VmLuAiXf5JllukbALuoQgVoTJjhSOQoDiq+bCBoHmcnkw2cDR1KyR
         WJNWtq86THIVBYSOz+TwUmX/UkiQryZq3KAHCdpGN3owI2S69gft1HSX8lFWIuuJ6WmN
         jam7eV2DFMqTIoFwX1J7qX3AglSkAFCOj1/F2Ar1hjRDisUdX/3UJAaI2dMdawQLzSiq
         Fk/A==
X-Gm-Message-State: AC+VfDxS7PGCw5iwM+3DZGFuMTsuxCrHCLjq1zJrfO9dCpR2EqfYxTx1
	tr0ZR+W0qj0ol5UUVgM3k4xsF/qJa2QkpcXCKpkJZyu2dKnj1SKpGuf1Px1NpUeYmvIPECbHQsF
	rpvhGkG6i/9KV8sQydl1VZwT/BAa2R4ijZw==
X-Received: by 2002:a05:600c:205:b0:3f7:3651:ea8 with SMTP id 5-20020a05600c020500b003f736510ea8mr3011424wmi.37.1686090800436;
        Tue, 06 Jun 2023 15:33:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46KX04YZfzInQYDfCl4hAj2QqG8eMSpAtgBZyPQWefWLpY/izOuHpc4zoYydyGL83q9R81dQ==
X-Received: by 2002:a05:600c:205:b0:3f7:3651:ea8 with SMTP id 5-20020a05600c020500b003f736510ea8mr3011417wmi.37.1686090800116;
        Tue, 06 Jun 2023 15:33:20 -0700 (PDT)
Date: Tue, 6 Jun 2023 18:33:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	virtio@lists.oasis-open.org
Message-ID: <20230606182640-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-4-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230601220305.587034-4-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 3/7] net-features: Add low
 latency receive queue requirements

On Fri, Jun 02, 2023 at 01:03:01AM +0300, Parav Pandit wrote:
> Add requirements for the low latency receive queue.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 38 +++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 55f1b1f..054f951 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
>  
>  # 2. Summary
>  1. Device counters visible to the driver
> -2. Low latency tx virtqueue for PCI transport
> +2. Low latency tx and rx virtqueues for PCI transport
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -107,3 +107,39 @@ struct vnet_data_desc desc[2];
>  
>  7. Ability to place all transmit completion together with it per packet stream
>     transmit timestamp using single PCIe transcation.
> +
> +### 3.2.2 Low latency rx virtqueue
> +1. The device should be able to write a packet receive completion that consists
> +   of struct virtio_net_hdr (or similar) and a buffer id using a single DMA write
> +   PCIe TLP.

why? what is wrong with it being linear with packet instead?

> +2. The device should be able to perform DMA writes of multiple packets
> +   completions in a single DMA transaction up to the PCIe maximum write limit
> +   in a transaction.
> +3. The device should be able to zero pad packet write completion to align it to
> +   64B or CPU cache line size whenever possible.

assuming completion is used buffer, these are eactly 64 bytes with
packed vq, and they are linear so can be written in one transaction.
if so why list requirements which are already met?
if you want them for completeness mention this.

> +4. An example of the above DMA completion structure:
> +
> +```
> +/* Constant size receive packet completion */
> +struct vnet_rx_completion {
> +   u16 flags;
> +   u16 id; /* buffer id */
> +   u8 gso_type;
> +   u8 reserved[3];
> +   le16 gso_hdr_len;
> +   le16 gso_size;
> +   le16 csum_start;
> +   le16 csum_offset;
> +   u16 reserved2;
> +   u64 timestamp; /* explained later */
> +   u8 padding[];
> +};
> +```
> +5. The driver should be able to post constant-size buffer pages on a receive
> +   queue which can be consumed by the device for an incoming packet of any size
> +   from 64B to 9K bytes.

possible with mrg buffers

> +6. The device should be able to know the constant buffer size at receive
> +   virtqueue level instead of per buffer level.

the bigger question is not communicating to device. that is trivial.
the bigger question is that linux IP stack seems to benefit from variable sized
packets because buffers waste precious kernel memory.
is this for non IP stack such as xdp? non-linux guests? dpdk perhaps?

> +7. The device should be able to indicate when a full page buffer is consumed,
> +   which can be recycled by the driver when the packets from the completed
> +   page is fully consumed.

no idea what this means.

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

