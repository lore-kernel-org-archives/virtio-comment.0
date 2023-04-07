Return-Path: <virtio-comment-return-5302-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43347C76196
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 08:55:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6B3212B056
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 08:55:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C0F89865DE
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 08:55:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4A76E983F7B; Fri,  7 Apr 2023 08:55:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 381D09865D8
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Apr 2023 08:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wBN98w7RP6OdjprMt3OfrQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDl1fy8Ssbq7j9jecG5eGwcWQdgvPh1uxwatLNEkgss=;
        b=CsLdJHoUfkspsNif7T1y5f2NRhaU/K4u/ZaztJYIjdEXj8x1USL8X7ZDN/xCwDLkf8
         P4Jj4DlHwr/qdDbcRFvy/VSOBmCHuCsvyiIlRdo7LlB6DJubz+0ZbKnEuOf7mRsjZnXt
         YLd8MjBtlKx67+wTY/US1TM0HKlinLH/Gd1st9CHH5pSyLWCrnq68zyfUKK6iI04lLi5
         q6ZBbpaLUbNj6qnHFF9bFHn5BIekwYtZqAcVM5CUZktfqneFYlnLoH2edb9+IU8zJxKV
         pHol7lumjdVx4jhp85OncgfaknWP9SVALT00VEIHiP8S6rz+O8ooHq8ZSJB/g96gPBRS
         GMcw==
X-Gm-Message-State: AAQBX9cwnHD/69O8YdSi3xj2F8cdiJFrhM9+40YcL9hODlk3JykykQ4g
	mIhY4X8SbjyvmpsQnZHuhq3Isxni/Yd/mEInGi+dYtljNGo7KYZWvsWReduQYaG08lX93dG1gK3
	GQkYBl4hHCTHMyf4BZwMY7SVtmNVDIL5eag==
X-Received: by 2002:a5d:4885:0:b0:2ef:b4ac:8e5 with SMTP id g5-20020a5d4885000000b002efb4ac08e5mr135311wrq.28.1680857709700;
        Fri, 07 Apr 2023 01:55:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zsuv5fe+T1x/adBKgURa37WGjOY6WdayiinaOjhOiKHtR8k5d6M3E8LFCc3lAs0fimG/vNAA==
X-Received: by 2002:a5d:4885:0:b0:2ef:b4ac:8e5 with SMTP id g5-20020a5d4885000000b002efb4ac08e5mr135299wrq.28.1680857709366;
        Fri, 07 Apr 2023 01:55:09 -0700 (PDT)
Date: Fri, 7 Apr 2023 04:55:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230407043841-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-10-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230330225834.506969-10-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI MMR dev config
 registers

On Fri, Mar 31, 2023 at 01:58:32AM +0300, Parav Pandit wrote:
> Legacy virtio configuration registers and adjacent
> device configuration registers are located somewhere
> in a memory BAR.
> 
> A new capability supplies the location of these registers
> which a driver can use to map I/O access to legacy
> memory mapped registers.
> 
> This gives the ability to locate legacy registers in either
> the existing memory BAR or as completely new BAR at BAR 0.
> 
> A below example diagram attempts to depicts it in an existing
> memory BAR.
> 
> +------------------------------+
> |Transitional                  |
> |MMR SRIOV VF                  |
> |                              |
> ++---------------+             |
> ||dev_id =       |             |
> ||{0x10f9-0x10ff}|             |
> |+---------------+             |
> |                              |
> ++--------------------+        |
> || PCIe ext cap = 0xB |        |
> || cfg_type = 10      |        |
> || offset   = 0x1000  |        |
> || bar      = A {0..5}|        |
> |+--|-----------------+        |
> |   |                          |
> |   |                          |
> |   |    +-------------------+ |
> |   |    | Memory BAR = A    | |
> |   |    |                   | |
> |   +------>+--------------+ | |
> |        |  |legacy virtio | | |
> |        |  |+ dev cfg     | | |
> |        |  |registers     | | |
> |        |  +--------------+ | |
> |        +-----------------+ | |
> +------------------------------+
> 
> Co-developed-by: Satananda Burla <sburla@marvell.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>


I am split about using the extended capability for this, since in
practice this makes for more code in hypervisors.  How about just using
an existing capability as opposed to the extended capability? Less work
for existing hypervisors, no? And let's begin to use the extended
capability for something more important than legacy access.




> ---
>  transport-pci.tex | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index aeda4a1..55a6aa0 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -168,6 +168,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  \item ISR Status
>  \item Device-specific configuration (optional)
>  \item PCI configuration access
> +\item Legacy memory mapped configuration registers (optional)
>  \end{itemize}
>  
>  Each structure can be mapped by a Base Address register (BAR) belonging to
> @@ -228,6 +229,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>  /* Vendor-specific data */
>  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
> +/* Legacy configuration registers capability */
> +#define VIRTIO_PCI_CAP_LEGACY_MMR_CFG    10
>  \end{lstlisting}
>  
>          Any other value is reserved for future use.
> @@ -682,6 +685,18 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  Configuration Space / Legacy Interface: Device Configuration
>  Space}~\nameref{sec:Basic Facilities of a Virtio Device / Device Configuration Space / Legacy Interface: Device Configuration Space} for workarounds.
>  
> +\paragraph{Transitional MMR Interface: A Note on Configuration Registers}
> +\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabilities / Common configuration structure layout / Transitional MMR Interface: A Note on Configuration Registers}
> +
> +The transitional MMR device MUST present legacy virtio registers
> +consisting of legacy common configuration registers followed by
> +legacy device specific configuration registers described in section
> +\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabilities / Common configuration structure layout / Legacy Interfaces: A Note on Configuration Registers}
> +in a memory region PCI BAR.
> +
> +The transitional MMR device MUST provide the location of the
> +legacy virtio configuration registers using a legacy memory mapped
> +registers capability described in section \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabilities / Transitional MMR Interface: Legacy Memory Mapped Configuration Registers Capability}.
>  
>  \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
>  
> @@ -956,9 +971,23 @@ \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport O
>  specified by some other Virtio Structure PCI Capability
>  of type other than \field{VIRTIO_PCI_CAP_PCI_CFG}.
>  
> +\subsubsection{Transitional MMR Interface: Legacy Memory Mapped Configuration Registers Capability}
> +\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabilities / Transitional MMR Interface: Legacy Memory Mapped Configuration Registers Capability}
> +
> +The optional VIRTIO_PCI_CAP_LEGACY_MMR_CFG capability defines
> +the location of the legacy virtio configuration registers
> +followed by legacy device specific configuration registers in
> +the memory region BAR for the transitional MMR device.
> +
> +The \field{cap.offset} MUST be 4-byte aligned.
> +The \field{cap.offset} SHOULD be 4KBytes aligned and

what's the point of this?

> +\field{cap.length} SHOULD be 4KBytes.

Why is length 4KBytes? Why not the actual length?


> +
> +The transitional MMR device MUST present a legacy configuration
> +memory mapped registers capability using \field{virtio_pcie_ext_cap}.
> +
>  \subsubsection{Legacy Interface: A Note on Feature Bits}
> -\label{sec:Virtio Transport Options / Virtio Over PCI Bus /
> -Virtio Structure PCI Capabilities / Legacy Interface: A Note on Feature Bits}
> +\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabilities / Legacy Interface: A Note on Feature Bits}
>


So it is not by chance that we abadoned the legacy interface,
it had some fundamental issues.
Let me list some off the top of my mind:
- no atomicity across accesses, so if a register changes
  while it is read driver gets trash. solved using generation id
- no defined endian-ness. solved using le
- no way to reject driver configuration

we just did a new thing instead, but I feel if you are reviving the
legacy interface yet again, it is worth thinking about solving the worst
of the warts. For example, I can see an endian-ness register that
hypervisor can either read to check device is compatible with guest, or
maybe even write to force device to specific endian-ness.
A generation counter that hypervisor can check to
verify value is consistent? Can work if hypervisor
caches configuration.
A bad state flag that device can set to make hypervisor
stop guest? Better than corrupting it ...



  
>  Only Feature Bits 0 to 31 are accessible through the
>  Legacy Interface. When used through the Legacy Interface,
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

