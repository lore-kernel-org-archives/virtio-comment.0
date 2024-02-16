Return-Path: <virtio-comment-return-9116-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF52C48BEB
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Feb 2024 08:56:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E8A1842A6C
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Feb 2024 08:56:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3587986668
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Feb 2024 08:56:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A393F981232; Fri, 16 Feb 2024 08:56:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 92DAF9865FF
	for <virtio-comment@lists.oasis-open.org>; Fri, 16 Feb 2024 08:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2pEbgk6mO9mLlhwiKGG4sA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708073770; x=1708678570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wJ/BW/ih+cckLHrgBJ5R7XqMnb4HA0MXREj7ccXYnk=;
        b=d0iNQkYv4LNKfKnbO+2Bq2yp+HzVPylbDssMYwaxGFgCeMafqTDE3J5BOmv+cNEe0L
         v/DR4/ObRjUkzEjuaaWYPDSwkI8Ji7/k6lzCdYwTDWluVwmdwRuN8kSCR42MLdbBQxf+
         i1IMVhKgrzOjUVK231zzCRw5H4870xMn612cGQYBO2PaqJUBoQquQ5kQVVogXkQTHZDX
         uGJ4Fkc6ZpK756LZp2Wu38C9i1RZkPw9m75x9qCVXZKdhaFiRYpOA7anYGXdBhHBDRNl
         kuO+VblPRCHyVjUP+pS7OwLYQnFkg0wwv/cFCT8IYMbdoOg8zvVL4qC3O2m2U+2aP5JE
         aw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzJcPMGWDO6zvNzNXJObNoCagMwVDt3XOdOmwDKcRS4e3DMnfuxhd9l46mfTE0djlebafc84PwxRzeXAEV1ojFGp0QOvGyV3GcjjMHzVkIe7SWSg==
X-Gm-Message-State: AOJu0Yxu01uofok/JNIC95gtsODNhA0MrFYlrn6JcRk5ivakp8wcT7GX
	x9viIbTmz0MePkBC9t+aqyLqsL8iFpWJOshtqofHz2dzyv2RO4bZi98s4tHxUrrHoYzBnDfEgxU
	3/Ytwmt3FSk73R9oMG3TN0RvTcY2OVe3rxNSON9GtXB8thfqDn895eYG0EtFQmrkrRt+NdrI=
X-Received: by 2002:a05:622a:4c7:b0:42c:6016:5d39 with SMTP id q7-20020a05622a04c700b0042c60165d39mr5246956qtx.19.1708073769699;
        Fri, 16 Feb 2024 00:56:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUy/dng9YgkAUqxDNox+owCGzFmMzwt51f+FlUgySkFYXLWhy2ZgY4esd1Rh7nmIwwrWD0wA==
X-Received: by 2002:a05:622a:4c7:b0:42c:6016:5d39 with SMTP id q7-20020a05622a04c700b0042c60165d39mr5246944qtx.19.1708073769391;
        Fri, 16 Feb 2024 00:56:09 -0800 (PST)
Date: Fri, 16 Feb 2024 03:56:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, parav@nvidia.com
Message-ID: <20240216035144-mutt-send-email-mst@kernel.org>
References: <20240216082432.709956-1-stevensd@chromium.org>
 <20240216082432.709956-2-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20240216082432.709956-2-stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v4 1/1] Add suspend support for virtio PCI devices

On Fri, Feb 16, 2024 at 05:24:32PM +0900, David Stevens wrote:
> Add a virtio power management PCI capability to allow drivers to suspend
> virtio PCI devices. This allows drivers to suspend devices at the virtio
> level before suspending them at the PCI transport layer. This allows
> drivers to do a two phase suspend, which prevents notifications from
> being ignored or lost if interrupts are reconfigured at the PCI
> transport layer immediately before or after the device is put into the
> PCI PM D3 low power state.
> ---
>  transport-pci.tex | 51 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719ea871..ce77708a9b69 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -188,6 +188,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>  /* Vendor-specific data */
>  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
> +/* Power management configuration */
> +#define VIRTIO_PCI_CAP_PM_CFG            10
>  \end{lstlisting}
>  
>          Any other value is reserved for future use.
> @@ -804,6 +806,55 @@ \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport O
>  specified by some other Virtio Structure PCI Capability
>  of type other than \field{VIRTIO_PCI_CAP_PCI_CFG}.
>  
> +\subsubsection{Power management capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Power management capability}
> +
> +The VIRTIO_PCI_CAP_PM_CFG capability refers to a single byte. The
> +driver can write to the byte to set the power state of the device,
> +and it can read from the byte to get the current power state of the
> +device.
> +
> +The valid power states are:
> +
> +\begin{lstlisting}
> +/* Device is operating normally */
> +#define VIRTIO_PM_STATE_ACTIVE    0
> +/* Device operation is suspended */
> +#define VIRTIO_PM_STATE_SUSPENDED 1
> +\end{lstlisting}
> +
> +The device power state has no effect when \field{device status} does
> +not have the DRIVER_OK bit set or does have the DEVICE_NEEDS_RESET bit
> +set.


Given this is only after DRIVER_OK, wouldn't a feature bit + status bit
make more sense? This will make it transport-independent and simplify
discovery.

> +\devicenormative{\paragraph}{Power management capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Power management capability}
> +
> +A device MUST maintain its state while suspended such that all driver
> +visible state after resuming exactly matches driver visible state
> +before suspending.
> +
> +A device MUST NOT send notifications while suspended.
> +
> +A device MAY operate on any buffers in its virtqueue while suspended.

How is this reconsiled with state matching exactly? buffers are
driver-visible ...

> +A device MUST set its power state to VIRTIO_PM_STATE_ACTIVE on reset.
> +
> +A device SHOULD take steps to minimize its resource consumption while
> +suspended, although what this involves is specific to the particular
> +device implementation.
> +
> +\drivernormative{\paragraph}{Power management capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Power management capability}
> +
> +A driver MUST NOT access a suspended device's BARs corresponding to
> +any virtio structures, except for the power management byte.
> +
> +A driver MAY suspend a device that has buffers in one of its
> +virtqueues, but it MUST NOT modify any such buffers while the device
> +is suspended.
> +
> +A driver MUST read from the power management byte after writing to the
> +byte to verify that the device successfully entered the target power
> +state.

Verify how? By checking the value returned? And what should it do with the value 
does not match?


> +
>  \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Legacy Interfaces: A Note on PCI Device Layout}
>  
>  Transitional devices MUST present part of configuration
> -- 
> 2.44.0.rc0.258.g7320e95886-goog


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

