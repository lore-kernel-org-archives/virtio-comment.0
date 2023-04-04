Return-Path: <virtio-comment-return-5204-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DA9C7618D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:21:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C45E92CAF7
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:21:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 38367986418
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:21:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2F92B9863E4; Tue,  4 Apr 2023 07:21:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B0A09865C1
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 07:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Rr7CMqNNPiGo93XWI6_VtQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf46jMez8uLXGzDInvids57wIpOiPvE7GGH8QQCjI4I=;
        b=z/zVz6XwtFLcW0YuUTuRKd7IFlQojvJpZevdL73GAOeHkKq1/C8YafyONKykfMyyzd
         UJlFx7TsI+tGX7N41pGkCswUpv3XFBRvhSiouHIZkojWfhXBPj8pAeEzGCs6ySxQREN3
         px4DxiZLaZjFiVjQZDlWWMSH14UmTV01XMgEtBTAzij58X/6kuMZ8b/8fdMs7ZfsrNuw
         WgfcyrcuXObHWlUTWwqgjv4rxWJU7B3G7rrOEZ98YWRq9cgWop8iqLfNa+4vdhi20NW+
         r2RrEVLmmtm4/B3ReyYH6sKTn4JX/NV/9p1rVomOoqcvvL4Qv0+/dFaS8LzA7Z+cLPLj
         3TDw==
X-Gm-Message-State: AAQBX9fguWVliiyRKSq9fFkw+/K7Yc01eEb5D4HnOd0tfsz+wCLjmMT7
	UjlPf1Kxxqe9v9fcKB9L6teyg6Nxub6737n9JcNQgHZmRdot9qVY6/ukHgj9k5jARGuhX2czJI+
	NvkHaw9DxjVvCSJlvakzxi19cfGTWDIA2VedX8Vq7k5gWYjc=
X-Received: by 2002:a17:906:95c2:b0:8b0:f277:5cde with SMTP id n2-20020a17090695c200b008b0f2775cdemr1065727ejy.32.1680592861279;
        Tue, 04 Apr 2023 00:21:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350YuAbADbrj4d8R6WM/8UZ9vjXbMPjLUO8FltLtEMgrfV4h2819irIQgC2vy34hqg8j4U+kXYA==
X-Received: by 2002:a17:906:95c2:b0:8b0:f277:5cde with SMTP id n2-20020a17090695c200b008b0f2775cdemr1065720ejy.32.1680592860961;
        Tue, 04 Apr 2023 00:21:00 -0700 (PDT)
Date: Tue, 4 Apr 2023 03:20:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230404031723-mutt-send-email-mst@kernel.org>
References: <20230324013534.280820-1-parav@nvidia.com>
 <20230324013534.280820-4-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230324013534.280820-4-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 3/3] transport-pci: Improve queue msix vector register
 desc

On Fri, Mar 24, 2023 at 04:35:34AM +0300, Parav Pandit wrote:
> queue_msix_vector register is for receiving interrupts from the device
> for the virtqueue.
> 
> "for MSI-X" is confusing term.
> 
> Also it is the register that driver "writes" to, similar to
> many other registers such as queue_desc, queue_driver etc.
> 
> Hence, replace the verb from use to write.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> ---
>  transport-pci.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 1bc89b4..9d492d5 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -367,7 +367,8 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          A 0 means the queue is unavailable.
>  
>  \item[\field{queue_msix_vector}]
> -        The driver uses this to specify the queue vector for MSI-X.
> +        The driver writes an MSI-X vector number for receiving
> +        virtqueue interrupts.

Ok but "receiving" is confusing here. And the verb writes seems
to ask for direction, look at queue_desc as an example.

Following that example:

	The driver writes the MSI-X vector number used for virtqueue interrupts here.

would you agree?



>  \item[\field{queue_enable}]
>          The driver uses this to selectively prevent the device from executing requests from this virtqueue.
> -- 
> 2.26.2


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

