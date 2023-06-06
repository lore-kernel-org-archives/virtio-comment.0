Return-Path: <virtio-comment-return-6178-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB42C77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:36:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5222C157EE7
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:36:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B31598658E
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:36:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3FAAF98657E; Tue,  6 Jun 2023 22:36:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F6A6986583
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 22:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cmNDRExUOyCRgugbqgNfaw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091006; x=1688683006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+waZQ107AT1r1o2ePCwz3Y/+5f6yB8qU1QT689B1fh0=;
        b=cpRUOeG/A/UIbkGb0OJanJ0QRSXTgSFkA3T12pylCQ9TAIfe7roVHXJg5/V7ky5xNf
         QA6x8h621PTksfn44hDT3cZJ1wtiLOFa5alKGe0bfZNgMgYc1rtUOW37P+YKRPfH2+IR
         AuCvcDjoQvfM3G6Puzz9sjPMukBMK+HTNmoZgcjAxI1qbm5Hd7QYwDHKqMDegzD9h0KR
         bx2SxOZfXx12RIQeswN5R+Ze+m1bcRsaNBr2PqblCvK3ZwI5fkVFgAXju/xzCi6a/F7a
         mdSKU3IuMqmhj0Dh3vx0Yg54AyiyYYJsAMFQlbh9cCwnzBwu0v1dRbrp+jHn1MhESk/E
         yAKg==
X-Gm-Message-State: AC+VfDwdLI3SSwNRRsqXP8E7WYRnJz1GfwEgs+aMjMZqqmiakH+gBgnU
	8BiNy9Mgvn7iTk0zqP8RxkwEzgXuWytYA+4HFiPUNOazXLRQpP25FUG/ixDujaabyZovfkn92eW
	Id9qDDpA6S583wtKIP9NVpgzyU8sJEuXARA==
X-Received: by 2002:adf:e550:0:b0:30c:6b4f:6f7c with SMTP id z16-20020adfe550000000b0030c6b4f6f7cmr2626207wrm.33.1686091006348;
        Tue, 06 Jun 2023 15:36:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6YcYG3mfxc9hn1Eonfe2cWMIkeoGncT6jRE3PLnwZzF3pHo5SWKqkoOuSfXeTR9bqqwmVgXw==
X-Received: by 2002:adf:e550:0:b0:30c:6b4f:6f7c with SMTP id z16-20020adfe550000000b0030c6b4f6f7cmr2626199wrm.33.1686091006043;
        Tue, 06 Jun 2023 15:36:46 -0700 (PDT)
Date: Tue, 6 Jun 2023 18:36:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	virtio@lists.oasis-open.org
Message-ID: <20230606183336-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-5-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230601220305.587034-5-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 4/7] net-features: Add
 notification coalescing requirements

On Fri, Jun 02, 2023 at 01:03:02AM +0300, Parav Pandit wrote:
> Add virtio net device notification coalescing improvements requirements.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 054f951..fc36f31 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -8,6 +8,7 @@ together is desired while updating the virtio net interface.
>  # 2. Summary
>  1. Device counters visible to the driver
>  2. Low latency tx and rx virtqueues for PCI transport
> +3. Virtqueue notification coalescing re-arming support
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -143,3 +144,10 @@ struct vnet_rx_completion {
>  7. The device should be able to indicate when a full page buffer is consumed,
>     which can be recycled by the driver when the packets from the completed
>     page is fully consumed.
> +
> +## 3.3 Virtqueue notification coalescing re-enable support
> +1. Tx and Rx virtqueue notification coalescing should auto-disable on
> +   notification reporting to the driver. The driver should be able to enable
> +   coalescing after processing the packets per VQ. This ensures that when
> +   networking stack decides to poll, no new notifications are generated when
> +   per VQ notification coalescing is used.

Weirdly specific.
I don't know what does auto-disable and enable coalescing mean.
Does this refer to VIRTIO_NET_F_NOTF_COAL?
what is the problem this is trying to solve?

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

