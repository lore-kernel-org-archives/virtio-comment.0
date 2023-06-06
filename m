Return-Path: <virtio-comment-return-6180-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9234C7EE37
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:41:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2C4F229FD2
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:41:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2153D98658B
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:41:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 19F8498657E; Tue,  6 Jun 2023 22:41:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 098C1986583
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 22:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2KgsmdRaN4ufXqdd9Ku5hg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091295; x=1688683295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRpuTom72j6DxpFywu7JKmcaxHo7HD/jBw6fgPYpXfU=;
        b=NPO0u6r6bsCtu1TGcPETmyupYP/t6osuSAK8pBjAYtLYp3obH+jLBYT+XfGJdF8jhE
         /ARWwkazVqUbI+ot33EMzg7r7GeUMkTW29aPhkftJWJG66e/yabKhw4lWFAGefpwlwmm
         kanpDw18dClocwPD0DMKMCXobvcPBxIX1OZMyruvSZk0EmUHmAjaSfM65+B4SnGq2r2v
         NWWwV4fitxVRhlVQMiCFFmbS0HdrxrIh2EtmumS10pFaClOKP3Ng77mSAIEq3w4r1TBT
         4tnLXNDAI+2TcefQ5yz9qdb+8tYNvEJjA4UNeNGbPY5wGYREC00mql/KtPg1YH3Prr1C
         2EZg==
X-Gm-Message-State: AC+VfDwGZbWzxaaDJiXyxVqZ7/NjlNinzfCoQQAiEfWpsrhFSOJgKHVt
	nmkCu4W619CZnpMy6IrgTvHwpbkSPRiTPeC3dimPlJhq8tlPZMdiqJ8eUIRojDdRnb0d87u++dH
	wAUhVASYgPuOCACd+uCGvc3TLdy9oG/UMWevu6JLznA==
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id z15-20020a05600c220f00b003f7395d6585mr6862926wml.15.1686091295514;
        Tue, 06 Jun 2023 15:41:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6U/TMgszumMjE24rFDjIZaZYJU00jo15zgi0/nTZCzCpslYv3quWoq4HYLzmHwSe1DyQL6CQ==
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id z15-20020a05600c220f00b003f7395d6585mr6862918wml.15.1686091295225;
        Tue, 06 Jun 2023 15:41:35 -0700 (PDT)
Date: Tue, 6 Jun 2023 18:41:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	virtio@lists.oasis-open.org
Message-ID: <20230606184022-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-8-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230601220305.587034-8-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 7/7] net-features: Add
 header data split requirements

On Fri, Jun 02, 2023 at 01:03:05AM +0300, Parav Pandit wrote:
> Add header data split requirements for the receive packets.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index f94848e..31680b7 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -11,6 +11,7 @@ together is desired while updating the virtio net interface.
>  3. Virtqueue notification coalescing re-arming support
>  4. Receive virtqueue n-tuple steering
>  5. Device timestamp for tx and rx packets
> +6. Header data split for the receive virtqueue
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -209,3 +210,15 @@ struct vnet_rx_completion {
>     point of reception from the network.
>  3. The device should provide a receive packet timestamp in a single DMA
>     transaction along with the rest of the receive completion fields.
> +
> +## 3.6 Header data split for the receive virtqueue
> +1. The device should be able to DMA the packet header and data to two different
> +   memory locations, this enables driver and networking stack to perform zero
> +   copy to application buffer(s).

what is header here? which layer?

> +2. The driver should be able to configure maximum header buffer size per
> +   virtqueue.
> +3. The header buffer to be in a physically contiguous memory per virtqueue

this is a requirement why?

> +4. The device should be able to indicate header data split in the receive
> +   completion.
> +5. The device should be able to zero pad the header buffer when the received
> +   header is shorter than cpu cache line size.

weirdly specific.
how does device even know the cache line?

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

