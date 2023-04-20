Return-Path: <virtio-comment-return-5562-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE81C77B73
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Apr 2023 20:44:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CA2C62B026
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Apr 2023 20:44:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B05FA986640
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Apr 2023 20:44:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9763398634C; Thu, 20 Apr 2023 20:44:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85E2B986635
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Apr 2023 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3IxK_XpxPPS0Dnwamt0Ngw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682023483; x=1684615483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou7o0LBEJbCsMdVRUWkMvR54beMz0R6KoLvZHE59x3s=;
        b=SRJ8q+ArDRIdy9JV1wISxGk32n2uIQfSXrwIQr3rgDtiuPL3dVlGauPSXUVGuTQFdK
         e10EJIha9jj6SS+Y0dIPVsnuyc9YpqBpmxToD/Uq2YTT7C1zc0RdmJFPJXSDssJphjnt
         yWsgamsiYaKkp0LxFJG8vgpijCS9+Vg3nYF8rEqnpXmU8MJfqCw6jHMg2TsJN07sfHPW
         8m5xaAPtAiY98+s5y7xuDxCJP7nSu+46wZ+4J+1lStEy6E5H8vMugWZcbtUC0zC3KDVG
         k/cOVMs7GwkCZnu/A3X98YWnh7oNzj0m4AD69MAvnnE5hWNwFEBqIw8l2nKMHcg0KWyf
         0sVw==
X-Gm-Message-State: AAQBX9dBy81mrodcSLm4Rz/xUlvdCakKIOOifAAkx4leQO6Ir0r8IqS7
	R7zHZDSPIwMg8E8ULoH+ZcNxtT1s8CkobsMkGT3LjQltsdHvAEpDAkIdeFq4qEnvq0wF+Lsc9Md
	8H6OshQvLaQIPfsa7pAtVMISR1KXFTyx6ZQ==
X-Received: by 2002:adf:fb49:0:b0:303:6209:65f4 with SMTP id c9-20020adffb49000000b00303620965f4mr301912wrs.38.1682023483089;
        Thu, 20 Apr 2023 13:44:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350a1aFK9ZnZ26ik+dOz4tp5qiKYAAkvdRdXewzZxi9WZaIpoD2NGYCvejeJIpnOfu5qvF4eNFg==
X-Received: by 2002:adf:fb49:0:b0:303:6209:65f4 with SMTP id c9-20020adffb49000000b00303620965f4mr301896wrs.38.1682023482675;
        Thu, 20 Apr 2023 13:44:42 -0700 (PDT)
Date: Thu, 20 Apr 2023 16:44:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230420163800-mutt-send-email-mst@kernel.org>
References: <20230420195158.69737-1-parav@nvidia.com>
 <20230420195158.69737-2-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230420195158.69737-2-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 1/2] transport-pci: Improve config msix
 vector description

On Thu, Apr 20, 2023 at 10:51:57PM +0300, Parav Pandit wrote:
> config_msix_vector is the register that holds the MSI-X vector number
> for receiving configuration change related interrupts.
> 
> It is not "for MSI-X".
> 
> Hence, replace the confusing text with appropriate one.
> 
> Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

it's unfortunate that the pci spec does not have a standard term
for msi-x table entry.

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
> index 1507c69..cf2c54d 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -343,7 +343,8 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          Driver Feature Bits selected by \field{driver_feature_select}.
>  
>  \item[\field{config_msix_vector}]
> -        The driver sets the Configuration Vector for MSI-X.
> +        The driver writes the MSI-X table entry index in this field for
> +        Configuration change notification interrupts.


Urm not exactly. there is also a special value of 0xffff.
I feel this here is just a high level description.
how about
	Used by the driver to set the MSI-X vector for Configuration change notification interrupts.

pci spec also calls the entry "the vector" so I feel it's ok.




>  \item[\field{num_queues}]
>          The device specifies the maximum number of virtqueues supported here.
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

