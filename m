Return-Path: <virtio-comment-return-5979-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFF1C77B7F
	for <virtio-comment@archiver.kernel.org>; Fri, 19 May 2023 06:10:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0D3A341EE3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 May 2023 06:10:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0495F98673C
	for <virtio-comment@archiver.kernel.org>; Fri, 19 May 2023 06:10:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F0DC698671F; Fri, 19 May 2023 06:10:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE647986721
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 May 2023 06:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: FXLoVvPjPc-rXbutpUmyTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684476625; x=1687068625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaL2Um4S7YpzJTgVM8Z9SyiG26BlS90fArl6Ky0EDUQ=;
        b=ISVYEtTyLCLSzEhIqmRbAZltOKbdQbmTekW1iSqzoqcSM8SoahIX9ObdTj6I7zBYQk
         s6qGtGGRl7P8E85URMBkyUonA9llHERCmOXAN4acQbxmVtIdl1avp01Rt+G6zIlk5pi3
         KF+Nwddb4P2tRBUGKNj0yuAv8pT7TI1YITfQym1SaItZWMqzqbbRyY5odqQ4YS02n40W
         Om9oiP7rPIaU77WgRtd4gW5ijK2ZuopOPkP8UFzdV1QYptmobfR25FC73prVeqhMtW0n
         EwimGIVoS/pfWUjQrjF9lUsvXftJsSu+vwgDfom1gsY1AS3gv4pqPFBgCkfXOixRYGPu
         Bnrw==
X-Gm-Message-State: AC+VfDyx0+3E0mW1TufUW2uCM7WmGNaAJ2c+rfTS71/xBVkMk7W5lEEJ
	TDHJ931eY+UPthKC8uxfWj67B9GyBEKlSJ0H11NvXhsTxECVoBuL2xMOtJFbvRqVzl4s79zWhIz
	mtmbYdlrUJ/4Jcct7deJ/hOsizuTxQ0CpKg==
X-Received: by 2002:ac2:4a6f:0:b0:4f1:4796:af9d with SMTP id q15-20020ac24a6f000000b004f14796af9dmr368674lfp.66.1684476625093;
        Thu, 18 May 2023 23:10:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ70WUeL+ehYQZQqJj5xUXc07VEKwj9D2G6swDClBdNkNpsI+Kdj+0moOsROpcwejciYFlGpiA==
X-Received: by 2002:ac2:4a6f:0:b0:4f1:4796:af9d with SMTP id q15-20020ac24a6f000000b004f14796af9dmr368661lfp.66.1684476624741;
        Thu, 18 May 2023 23:10:24 -0700 (PDT)
Date: Fri, 19 May 2023 02:10:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230519020737-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230330225834.506969-9-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 08/11] transport-pci: Introduce virtio extended capability

On Fri, Mar 31, 2023 at 01:58:31AM +0300, Parav Pandit wrote:
> PCI device configuration space for capabilities is limited to only 192
> bytes shared by many PCI capabilities of generic PCI device and virtio
> specific.
> 
> Hence, introduce virtio extended capability that uses PCI Express
> extended capability.
> Subsequent patch uses this virtio extended capability.
> 
> Co-developed-by: Satananda Burla <sburla@marvell.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

So looking at this in isolation, it probably warrants an extra
github issue. So I would like to find out whether we
should introduce this capability and switch to it for new devices.

My main question is whether e.g. seabios will be able to use it.
Could you take a look at the source and let us all know?


> ---
>  transport-pci.tex | 69 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 665448e..aeda4a1 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -174,7 +174,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  the function, or accessed via the special VIRTIO_PCI_CAP_PCI_CFG field in the PCI configuration space.
>  
>  The location of each structure is specified using a vendor-specific PCI capability located
> -on the capability list in PCI configuration space of the device.
> +on the capability list in PCI configuration space of the device
> +unless stated otherwise.
>  This virtio structure capability uses little-endian format; all fields are
>  read-only for the driver unless stated otherwise:
>  
> @@ -301,6 +302,72 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  fields provide the most significant 32 bits of a total 64 bit offset and
>  length within the BAR specified by \field{cap.bar}.
>  
> +Virtio extended PCI Express capability structure defines
> +the location of certain virtio device configuration related
> +structures using PCI Express extended capability. Virtio
> +extended PCI Express capability structure uses PCI Express
> +vendor specific extended capability (VSEC). It has a below
> +layout:
> +
> +\begin{lstlisting}
> +struct pcie_ext_cap {
> +        le16 cap_vendor_id; /* Generic PCI field: 0xB */
> +        le16 cap_version : 2; /* Generic PCI field: 0 */
> +        le16 next_cap_offset : 14; /* Generic PCI field: next cap or 0 */
> +};
> +
> +struct virtio_pcie_ext_cap {
> +        struct pcie_ext_cap pcie_ecap;
> +        u8 cfg_type; /* Identifies the structure. */
> +        u8 bar; /* Index of the BAR where its located */
> +        u8 id; /* Multiple capabilities of the same type */
> +        u8 zero_padding[1];
> +        le64 offset; /* Offset with the bar */
> +        le64 length; /* Length of the structure, in bytes. */
> +        u8 data[]; /* Optional variable length data */
> +};
> +\end{lstlisting}
> +
> +This structure contains optional data, depending on
> +\field{cfg_type}. The fields are interpreted as follows:
> +
> +\begin{description}
> +\item[\field{cap_vendor_id}]
> +         0x0B; identifies a vendor-specific extended capability.
> +
> +\item[\field{cap_version}]
> +         contains a value of 0.
> +
> +\item[\field{next_cap_offset}]
> +        Offset to the next capability.
> +
> +\item[\field{cfg_type}]
> +        follows the same definition as \field{cfg_type}
> +        from the \field{struct virtio_pci_cap}.
> +
> +\item[\field{bar}]
> +        follows the same  same definition as  \field{bar}
> +        from the \field{struct virtio_pci_cap}.
> +
> +\item[\field{id}]
> +        follows the same  same definition as  \field{id}
> +        from the \field{struct virtio_pci_cap}.
> +
> +\item[\field{offset}]
> +        indicates where the structure begins relative to the
> +        base address associated with the BAR. The alignment
> +        requirements of offset are indicated in each
> +        structure-specific section that uses
> +        \field{struct virtio_pcie_ext_cap}.
> +
> +\item[\field{length}]
> +        indicates the length of the structure indicated by this
> +        capability.
> +
> +\item[\field{data}]
> +        optional data of this capability.
> +\end{description}
> +
>  \drivernormative{\subsubsection}{Virtio Structure PCI Capabilities}{Virtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabilities}
>  
>  The driver MUST ignore any vendor-specific capability structure which has
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

