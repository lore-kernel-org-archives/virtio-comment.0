Return-Path: <virtio-comment-return-6179-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1755C7EE37
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:40:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0B9C52AD6E
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:40:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F416B986587
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:40:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E8E7898657E; Tue,  6 Jun 2023 22:40:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D581C986589
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 22:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: bCo9YIQIMe6U9-lnFyxKmQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091208; x=1688683208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIZEn6SMFA1Ni7ggXGj46woinRRyhs24sPaJh2KQLI4=;
        b=eoJ0bViTvHtTodQh6jqs+pmW+k0HEGZiaaro0ya63aV8rsBOIdMll+ah2lE94sDMEV
         gOVEESEOnJwttj3qcP52icTyQunhwtzjpzzmUsL3r5MjTenctuKtfIFfB6NgkYIYqGG1
         bj18Fy2Vr/39WgKKJ3mXQBL8iW4RORIyCuBYLkWVaPD7J+zlXm+SF1YzDECJYgDyNqLX
         oa6sAlMyNMOC/AwAja/Ise7u/MEjTGsiF5byW7FTWs8N8V4GnFkF8bFYD6pEKSGRuVdk
         h2pLfBR0GygtT5mTehmAYwSVQP44iyO6yw28I3T/gLAv2afT2DPLVzGlZaghf55cQLvs
         jFuA==
X-Gm-Message-State: AC+VfDy19VlcokqAMYqk+91QD9qEYqQcBQcNdgDt+jKOFrkKJ5cnj14+
	cnNCZ1j/U2fWHjfz/Hfc8ne3DAGo0Z0BIkj7OG8+QbwDlbXlmdAgVmIzB0CV92qwgbokB4New95
	ObyOMUkZIm8t5G5FSSGGFTA5ILtCqRl7RIg==
X-Received: by 2002:a05:600c:210e:b0:3f4:bb58:d174 with SMTP id u14-20020a05600c210e00b003f4bb58d174mr3194375wml.22.1686091208771;
        Tue, 06 Jun 2023 15:40:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5PJ1Fomte3whxWKhWVknQlDswEYJNWAkbiOg/21U/rChBq2XT1ko6b1XAslZAVVbUFp5mZJQ==
X-Received: by 2002:a05:600c:210e:b0:3f4:bb58:d174 with SMTP id u14-20020a05600c210e00b003f4bb58d174mr3194370wml.22.1686091208426;
        Tue, 06 Jun 2023 15:40:08 -0700 (PDT)
Date: Tue, 6 Jun 2023 18:40:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	virtio@lists.oasis-open.org
Message-ID: <20230606183720-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-7-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230601220305.587034-7-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 6/7] net-features: Add
 packet timestamp requirements

On Fri, Jun 02, 2023 at 01:03:04AM +0300, Parav Pandit wrote:
> Add tx and rx packet timestamp requirements.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 41242b4..f94848e 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -10,6 +10,7 @@ together is desired while updating the virtio net interface.
>  2. Low latency tx and rx virtqueues for PCI transport
>  3. Virtqueue notification coalescing re-arming support
>  4. Receive virtqueue n-tuple steering
> +5. Device timestamp for tx and rx packets
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -184,3 +185,27 @@ struct vnet_rx_completion {
>  15. The driver and group owner driver should be able to query supported device
>      limits for the steering entries.
>   
> +## 3.5 Packet timestamp
> +1. Device should provide transmit timestamp and receive timestamp of the packets
> +   at per packet level when the device is enabled.
> +2. Device should provide the current free running clock in the least latency
> +   possible using an MMIO register read of 64-bit to have the least jitter.

wow these reads are expensive. what is the actual requirement?

> +3. Device should provide the current frequency and the frequency unit for the
> +   software to synchronize the reference point of software and the device using
> +   a control vq command.

let's leave mechanism out of it. I think you are trying to say
this is async to data vqs? and cvq is fine.

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

how large do these need to be? ok for timer to overflow?


why do you mention migration in counters but not in timers?

is it ok for time to go back?



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

