Return-Path: <virtio-comment-return-5206-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE16C6FD1D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:30:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B75692B02B
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:30:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8B6D9863ED
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:30:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 936199863E4; Tue,  4 Apr 2023 07:30:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 818909863E5
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 07:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: f0btpq-5PfeeRjTtTdZLVw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680593314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16xwJ5s3nYyYVNbB7WO1JLWjuuLwPd192G3ZHVN5PJM=;
        b=pGu9P66OyUQTE3DJsfjP8ixgBjaX3vaYJtRG60+lS7+J5wHmiHIyItWEVRpplcqqt4
         utZL6Y87tO+zCzPa9Ft99kV0TAO6aee+IY3AYG/youiyFGPCu2j63O6rlgBjGqZ/CquX
         eOtNSX5Y8SoriBqVKK4aDikttfy4DiASh6kDIVPmBNBr7I0jq3pg6qddRCnUYIqq0cr9
         xC4Lg2ojgMQgUz836DolyUteY2ftYW71Xu5Iehhcb1mmRlTO93Hp5dxU8jO9KZi6kBHm
         Lbb915QvxQcajna044GSbgqvyo38LfMW71yP8yKjUdh4yOxMCle8ukGmvwiu76LNWLxL
         fGnw==
X-Gm-Message-State: AAQBX9f2JMhYTap2a5cE5IsGZl8xnw9TUxNu9JZwDk5Is+C9ftvzO6VW
	HpV9qWRd3pfruBNSnrJzGZtbLZoSpgZFmucolGhj0CPXQgJpJmfWF99tmXrqz7hwdaFqOg4uZRZ
	/GZ2tnljKQ/BgVk6RdF6bYxXly2ajMWPTqg==
X-Received: by 2002:a17:906:5390:b0:944:308f:b978 with SMTP id g16-20020a170906539000b00944308fb978mr1389029ejo.11.1680593314278;
        Tue, 04 Apr 2023 00:28:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350YzHQHJHThyVkJiNRNF4yLr55W0bu4rWrraK2u2zcNJ9+B5Tah+XMaVC5d5Yxbx7vuKQskwAg==
X-Received: by 2002:a17:906:5390:b0:944:308f:b978 with SMTP id g16-20020a170906539000b00944308fb978mr1389018ejo.11.1680593313997;
        Tue, 04 Apr 2023 00:28:33 -0700 (PDT)
Date: Tue, 4 Apr 2023 03:28:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230404032700-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-8-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230330225834.506969-8-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 07/11] transport-pci: Introduce transitional MMR device id

On Fri, Mar 31, 2023 at 01:58:30AM +0300, Parav Pandit wrote:
> Transitional MMR device PCI Device IDs are unique. Hence,
> any of the existing drivers do not bind to it.
> This further maintains the backward compatibility with
> existing drivers.
> 
> Co-developed-by: Satananda Burla <sburla@marvell.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

I took a fresh look at it, and I don't get it: what exactly is wrong
with just using modern ID? Why do we need new ones?


> ---
>  transport-pci.tex | 45 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index ee11ba5..665448e 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -19,12 +19,14 @@ \section{Virtio Over PCI Bus}\label{sec:Virtio Transport Options / Virtio Over P
>  \subsection{PCI Device Discovery}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Discovery}
>  
>  Any PCI device with PCI Vendor ID 0x1af4, and PCI Device ID 0x1000 through
> -0x107f inclusive is a virtio device. The actual value within this range
> -indicates which virtio device is supported by the device.
> +0x107f inclusive and DeviceID 0x10f9 through 0x10ff is a virtio device.
> +The actual value within this range indicates which virtio device
> +type it is.
>  The PCI Device ID is calculated by adding 0x1040 to the Virtio Device ID,
>  as indicated in section \ref{sec:Device Types}.
> -Additionally, devices MAY utilize a Transitional PCI Device ID range,
> -0x1000 to 0x103f depending on the device type.
> +Additionally, devices MAY utilize a Transitional PCI Device ID range
> +0x1000 to 0x103f inclusive or a Transitional MMR PCI Device ID range
> +0x10f9 to 0x10ff inclusive, depending on the device type.
>  
>  \devicenormative{\subsubsection}{PCI Device Discovery}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Discovery}
>  
> @@ -95,6 +97,41 @@ \subsubsection{Legacy Interfaces: A Note on PCI Device Discovery}\label{sec:Virt
>  
>  This is to match legacy drivers.
>  
> +\subsubsection{Transitional MMR Interface: A Note on PCI Device
> +Discovery}\label{sec:Virtio Transport Options / Virtio Over PCI
> +Bus / PCI Device Discovery / Transitional MMR Interface: A Note on PCI Device Discovery}
> +
> +The transitional MMR device has one of the following PCI Device ID
> +depending on the device type:
> +
> +\begin{tabular}{|l|c|}
> +\hline
> +Transitional PCI Device ID  &  Virtio Device    \\
> +\hline \hline
> +0x10f9      &   network device     \\
> +\hline
> +0x10fa     &   block device     \\
> +\hline
> +0x10fb     & memory ballooning (traditional)  \\
> +\hline
> +0x10fc     &      console       \\
> +\hline
> +0x10fd     &     SCSI host      \\
> +\hline
> +0x10fe     &  entropy source    \\
> +\hline
> +0x10ff     &   9P transport     \\
> +\hline
> +\end{tabular}
> +
> +The PCI Subsystem Vendor ID and the PCI Subsystem Device ID MAY
> +reflect the PCI Vendor and Device ID of the environment.
> +
> +The transitional MMR driver MUST match any PCI Revision ID value.
> +
> +The transitional MMR driver MAY match any PCI Subsystem Vendor ID and
> +any PCI Subsystem Device ID value.
> +
>  \subsection{PCI Device Layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout}
>  
>  The device is configured via I/O and/or memory regions (though see
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

