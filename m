Return-Path: <virtio-comment-return-5538-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE4AC77B73
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:08:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2EEB442573
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:08:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E30F98661F
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:08:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 16AF098641E; Wed, 19 Apr 2023 07:08:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0727B98641F
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Apr 2023 07:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Uteby-PiPkOHdUIoTAk1HQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681888111; x=1684480111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bg0BqieMlM0sWcdkoZ3rrzy9NBLkf+vYo2CqcpS7crM=;
        b=gWb0PNRlBwGU09zMia6OcS4dVFiKlKF0EtUt0MH+lZ/gw+pqy4UxvXm1EnAW3oquVy
         Vd3KkQWec7C8/jbsBqFeHE13xx8TUtWg57jLYh4FuSb4CipprsCYppsyL39qV6MYDA9r
         XMxyaT72fBRGKOVL2hXmfrSUBv9tBqrMG9zC4wFB8eLo2YReo6RvuyuUwJL4qIYStPgb
         jO8AbXJOAQCcWOa+u/XN1IPzfiHwbS7g2BBAimP+057jXiJr0V3Tg5Ze+GR5uEVoh+Qk
         6CC7z4Y5hew9yPjugzs2PBUsZvEn9ZLpLw185AouepDTUrSJRfODU5g7SFbI0js0MfOq
         2Vhw==
X-Gm-Message-State: AAQBX9cpnraGOcQwUgZjulCVu4wlg4PSlmZzSGln4ek16anVRMj1qDxI
	4O9PftqVEoO9dQHWDzh1hllq9Q06bqU79LPTa8FiSV7voWDYZly0F8rISADmhp4ttpb6M+YIdgy
	0VEPX5T+8LxWFZMuSX9Ob1OD979JyXCqlRQ==
X-Received: by 2002:a7b:c049:0:b0:3f1:7dc0:7fa5 with SMTP id u9-20020a7bc049000000b003f17dc07fa5mr1686126wmc.26.1681888110763;
        Wed, 19 Apr 2023 00:08:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350aoLiv8kQfgsfwrFAeChwLk8hjwFD4FXqwMSLHCNVeoyDbgGnUNBxhF79KQkG8A7xYG4vK9VA==
X-Received: by 2002:a7b:c049:0:b0:3f1:7dc0:7fa5 with SMTP id u9-20020a7bc049000000b003f17dc07fa5mr1686105wmc.26.1681888110492;
        Wed, 19 Apr 2023 00:08:30 -0700 (PDT)
Date: Wed, 19 Apr 2023 03:08:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230419030514-mutt-send-email-mst@kernel.org>
References: <20230411194220.752355-1-parav@nvidia.com>
 <20230411194220.752355-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230411194220.752355-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 2/2] transport-pci: Improve queue msix vector register
 desc

On Tue, Apr 11, 2023 at 10:42:20PM +0300, Parav Pandit wrote:
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
> changelog:
> v0->v1:
> - added 'here'
> - dropped 'receiving'
> ---
>  transport-pci.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index cb9fadd..00669b5 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -367,7 +367,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          A 0 means the queue is unavailable.
>  
>  \item[\field{queue_msix_vector}]
> -        The driver uses this to specify the queue vector for MSI-X.
> +        The driver writes an MSI-X vector number here for virtqueue interrupts.

Here it's *the* specific queue not just some queue. And in fact
we call them virtqueue notifications, not interrupts elsewhere.
So how about:

        Used by the driver to set the MSI-X vector number for the virtqueue notifications.


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

