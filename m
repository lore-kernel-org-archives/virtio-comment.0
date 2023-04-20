Return-Path: <virtio-comment-return-5563-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18301C77B73
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Apr 2023 20:45:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 73D11335C3
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Apr 2023 20:45:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6AFDC98663B
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Apr 2023 20:45:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5FF7098634C; Thu, 20 Apr 2023 20:45:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50116986635
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Apr 2023 20:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -1_LwqSMPI6SXJjA1wYpHw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682023518; x=1684615518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7U2LoKrZy4IEtp5AzShio0G6dowEwJFp0f5PqxF3TY=;
        b=GWz4XYQ+hARfnjwn8yD2FEKaz6FFucQFSrcbJ2FVXjyfUYLuGaRD0+AU/v7TmnVcU/
         VJwlc4ecHRRhAFDdK8meBZza2wstuIyUhgZONlBynqp6phf4aa54ZMmR81UiLuFZXUZf
         AdMg5rfErNN2896b0X5AAtgnuecSY3UWHCbRbEZ7lm+fQkcQzc8yePWmTFOx1NwReMA2
         oDYcZ0EvrwAcLh+c7oBnWfQzL6GzVpivN8OrEz1VMPhksX/SExfPXS2ADCcCzCZ4aYuy
         MSlHmB6EL/HjoG4h9beRR/psqXg41oT3rfZbPZKxMCGxmcl9LWK0aGp/3EA8fsjBbP3p
         9ADA==
X-Gm-Message-State: AAQBX9cpxZO91VVc9pxipCtsNsy6nOuiqzOhWok2V8FI/G1GJthssQhl
	GDZ3n9qMwYKXrPlNzeU+mlGxy7RdMrpTXy20LJ6EPzFurjO09rEnH6MPxAMtbZ5GLO/Xlb4Qr1t
	F0ct1+R5HSzDibe3RqIkCwfNCL0pTns7KJg==
X-Received: by 2002:adf:dd85:0:b0:2d1:9c50:5746 with SMTP id x5-20020adfdd85000000b002d19c505746mr2105960wrl.12.1682023518335;
        Thu, 20 Apr 2023 13:45:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350beRLfs/rjDxfIy7JhfPgWXj2hSc0hucgKBktgUVgnK/EuS4Oztda6jASzyAdmpjfW0C93+mA==
X-Received: by 2002:adf:dd85:0:b0:2d1:9c50:5746 with SMTP id x5-20020adfdd85000000b002d19c505746mr2105953wrl.12.1682023518083;
        Thu, 20 Apr 2023 13:45:18 -0700 (PDT)
Date: Thu, 20 Apr 2023 16:45:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230420164508-mutt-send-email-mst@kernel.org>
References: <20230420195158.69737-1-parav@nvidia.com>
 <20230420195158.69737-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230420195158.69737-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 2/2] transport-pci: Improve queue msix vector register
 desc

On Thu, Apr 20, 2023 at 10:51:58PM +0300, Parav Pandit wrote:
> queue_msix_vector register is for receiving virtqueue notification
> interrupts from the device for the virtqueue.
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
> v1->v2:
> - rewrote to indicate MSI-X table entry index
> v0->v1:
> - added 'here'
> - dropped 'receiving'
> ---
>  transport-pci.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index cf2c54d..afa082f 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -367,7 +367,8 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          A 0 means the queue is unavailable.
>  
>  \item[\field{queue_msix_vector}]
> -        The driver uses this to specify the queue vector for MSI-X.
> +        The driver writes the MSI-X table entry index in this field for
> +        virtqueue notification interrupts.

same comment here

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

