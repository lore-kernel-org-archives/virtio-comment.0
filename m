Return-Path: <virtio-comment-return-8273-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5378FC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:56:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ADD273E565
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:56:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A88FB986CB5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:56:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9ED00986CAA; Wed,  8 Nov 2023 17:56:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90E92986CAB
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 17:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: K7siRhrUPTyNY2REvJcOxg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699466204; x=1700071004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCCxXuTPLy4QISHXPhyXjOfgVfQDeFq3MZiz/oErxJY=;
        b=wC7hkdhlHj0T//cm3tHFyS7NQxRgu3DVLen9G/AOMIfMjXFvDByKP4cxd7z9x2YSzb
         6EdMF1FcG+BDSWZp+eG2y3NnuQ4UnmuqdUMahlEqa9XSgpdETMPVu6xlwqqOQkBx+Rrx
         xPlyKuulWGY08fOeRPjH1flF/lNjXqgiLQ/HJjGVU2EgCXoshL/YBl47CeEtRLSIra3B
         i2dwP/jAIpmG9rshNpaNWK69fxRaRz5MRgdr4VeG2vjnauMajlvkKZrVsmKYAvfGXqQY
         cXzcbd+pfVmk/KyyK2jSNVzcFmUg9LAJjX1QvDBzTLN80vgx+dTm6T+XovaXT/bxdV3S
         tC/w==
X-Gm-Message-State: AOJu0YxNJeZ2ykQ2DkvaOF1u9wBK3N1VxsvKygS/xMcoNwMuWfMhkAQ/
	yfZxw6buBnzL7vSmE14xqSf9rr+M4XDWJue+cLXvCCt22xbS7MC0Hi+n+OoAkzLu4M7IjpduRF9
	eEdUyLb1MDiQhyP5TBLLxIRA+UzM2h8x/Yg==
X-Received: by 2002:a05:600c:3550:b0:401:bd2e:49fc with SMTP id i16-20020a05600c355000b00401bd2e49fcmr2363569wmq.24.1699466204283;
        Wed, 08 Nov 2023 09:56:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFudCCLk4IdVUBLFUK/P3PVSdd418i55auxiWizHnAPAgrZgXIIy362g2/Gp1UxhLEcurlqPg==
X-Received: by 2002:a05:600c:3550:b0:401:bd2e:49fc with SMTP id i16-20020a05600c355000b00401bd2e49fcmr2363553wmq.24.1699466203952;
        Wed, 08 Nov 2023 09:56:43 -0800 (PST)
Date: Wed, 8 Nov 2023 12:56:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231108125515-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-5-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20231103103437.72784-5-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Fri, Nov 03, 2023 at 06:34:35PM +0800, Zhu Lingshan wrote:
> This patch adds two new le16 fields to common configuration structure
> to support VIRTIO_F_QUEUE_STATE in PCI transport layer.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  transport-pci.tex | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..3161519 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -325,6 +325,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          /* About the administration virtqueue. */
>          le16 admin_queue_index;         /* read-only for driver */
>          le16 admin_queue_num;         /* read-only for driver */
> +
> +	/* Virtqueue state */
> +        le16 queue_avail_state;         /* read-write */
> +        le16 queue_used_state;          /* read-write */
>  };
>  \end{lstlisting}
>  
> @@ -428,6 +432,17 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  	The value 0 indicates no supported administration virtqueues.
>  	This field is valid only if VIRTIO_F_ADMIN_VQ has been
>  	negotiated.
> +
> +\item[\field{queue_avail_state}]
> +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> +        negotiated. The driver sets and gets the available state of
> +        the virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> +
> +\item[\field{queue_used_state}]
> +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> +        negotiated. The driver sets and gets the used state of the
> +        virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> +
>  \end{description}
>  
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}


Two fields are pointless in the general case.  Fix this to at least
support out of order buffer use, then there's something to talk about.
I suspect we'll be back to yet another bespoke mailbox and a bitmap for
this.


> @@ -488,6 +503,9 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  present either a value of 0 or a power of 2 in
>  \field{queue_size}.
>  
> +If VIRTIO_F_QUEUE_STATE has not been negotiated, the device MUST ignore
> +any accesses to \field{queue_avail_state} and \field{queue_used_state}.
> +
>  If VIRTIO_F_ADMIN_VQ has been negotiated, the value
>  \field{admin_queue_index} MUST be equal to, or bigger than
>  \field{num_queues}; also, \field{admin_queue_num} MUST be
> -- 
> 2.35.3


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

