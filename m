Return-Path: <virtio-comment-return-7421-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DD6EDE9A9
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:27:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 550B1217B7
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:27:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4CF4398664A
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:27:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 431CB986639; Thu, 14 Sep 2023 11:27:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 346B798663D
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Sep 2023 11:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vPuVgpfXP3SZJggaj9E5RA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690827; x=1695295627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj6eLPwjf2vMYiQpeGhOtexMsL1WiQ9mvmh1khJiV4E=;
        b=BGNc3F4ehTzqxC9MyFt5EkuJo0Zrl0QObk69t6H/Yz2fHRozfyT+j+/yba0IXI1cqt
         2I2WjigV3BThB4Mw3ZwiT3KVSnK67WVv0W10gc0u0LmJyW/0p7J63GAxmgNMxSZj9kYS
         Fr+h5nX+xxO+q9iE0uz8eOqSXBL4PEMFvXjmcykqBgWoJvs2uWRjVwKiH0eWKA0wOJg2
         8pfKXOqqJtKL/segiI93x28qqeZ7FyxzRpH0TZPw6oj4AEGTA0oDWDG/3mxuauxJQRor
         DSXlwsrFWVvdudBodKyde1J2Mcjgg89nSovSAotYWZXsBi8LUyd0nB5de+lv74SwKbzC
         aQRg==
X-Gm-Message-State: AOJu0Yy9MfviOg946Yuw21qDpZVH0npp07jxc68zsKtn63DLFy/+gNz+
	7kUOENernfckrN9RD+2XggRtN6LGqeNGsEMDGyiT0Vv5QcGjgcQqQuyC+cO6C2qmvadDiE+G9zr
	Cxlvp5jS2+mpZJgGJfhm8bVvmISd6nIdm5eRhUMXfPw==
X-Received: by 2002:a05:6402:795:b0:525:6c74:5e58 with SMTP id d21-20020a056402079500b005256c745e58mr4814033edy.23.1694690827759;
        Thu, 14 Sep 2023 04:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDHc6nxaD+2hsvLQ3bcQ6Xr4XHbjYwdNj1wpEgMnyboq5wQHw3/EYoLaN5qQ7U+nHX8hsREA==
X-Received: by 2002:a05:6402:795:b0:525:6c74:5e58 with SMTP id d21-20020a056402079500b005256c745e58mr4814014edy.23.1694690827433;
        Thu, 14 Sep 2023 04:27:07 -0700 (PDT)
Date: Thu, 14 Sep 2023 07:27:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Message-ID: <20230914072552-mutt-send-email-mst@kernel.org>
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230906081637.32185-6-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

On Wed, Sep 06, 2023 at 04:16:37PM +0800, Zhu Lingshan wrote:
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

I see no description either here or in the generic patch
of what does it mean to set or get the state.

> +
>  \end{description}
>  
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
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

