Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B999D3314C3
	for <virtio-comment@lists.linux.dev>; Fri,  2 Oct 2026 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790962465; cv=none; b=Qtmtey+H/8Aab793oLhmCJc6wklLwV+YhfcIqiOnymsJyL4J8227A9ZbtJYPZb076YxXPZndazlEdpkAmIdw4x+jsvnSQzpPsgaBHX3Q2++UD9+Bxnh17+yTR44MpXzcKdwBMApo7Yq7Om6VY38NcUWEa1yn1K2N93/xrvslqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790962465; c=relaxed/simple;
	bh=qc0PZZfTJomcmBCWo9gLck/uSyVyNjlaSKpLZLyqlLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fr9f7mTFrcAxipekTP4dXc0B+iMSh10pqyxMWvA6u3QaiOccQ4L+92nl+06lidUpoRSMXwjzfaIo/gOaZc9Tpt53wug5TBDE1MTiXzp5hcIU3cpaiThzOEy1Dr4UQP2grQf9c5xPsVLESKu/zuyRmPzr93TdmHVZgycc382si50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2obmJ81; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2obmJ81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790962461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyFi2tHDA4xuWyN+IySBD5RovQZm1FtPbVE870+dHoY=;
	b=c2obmJ81tfk0bZo0W16JbIOrCIW02pXpWDPl2wEhflCHKkhHJHlnfamtwgFj6OIXnX/mq9
	t+Qft5XevT/1Xhik7SYq981/yrYA+ErOBThYL43rLU6Vez0IItEESFEyBFmKnV3nkCMfZY
	CitwYtdTAFlq3AEkcWZCrgB6tCyjCvM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-LOOggMbgPjOOhC6109IztQ-1; Fri, 02 Oct 2026 13:34:20 -0400
X-MC-Unique: LOOggMbgPjOOhC6109IztQ-1
X-Mimecast-MFC-AGG-ID: LOOggMbgPjOOhC6109IztQ_1790962459
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e65bee41aso1168415e9.0
        for <virtio-comment@lists.linux.dev>; Fri, 02 Oct 2026 10:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790962459; x=1791567259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PyFi2tHDA4xuWyN+IySBD5RovQZm1FtPbVE870+dHoY=;
        b=zdTk/XsvtKEOZya0FykShc8FOrVk8fKkb63pNLKWu8ieuMNPdffwG7AXCXSi/pTee6
         QsywwWuyWqXVc4hzUCuRRCkM0bbUPK6RQJoAJsUIeavOqeBqzpFnbGS8rO9JDc7pWVST
         QKEV2YW8WeAve2JSPKuc5ar707Q18hvAdTfdPqEGobhNHbN7A3GmR4uYAda83+uQulOm
         nIR9oPrOASCuNwAMIm53THS5X+UH3TNjoiRwECalrwj/4iZX0rf0JscKDr731Rcdk6VJ
         XMiWHtaOBYEP6/Ns0h+UQS3xAhrh6f2R7qvM2zae95Z1TGsq6M03RCZLuCWcuk8JOP9y
         8ahg==
X-Gm-Message-State: AFuF++lEwdjBNLSBe+gWtftfNkmuMfsbA+mxIzZILW2vN7UIViOIQtTK
	2/ZgsMJ09ReS4r9GqW1zIgeQT11uEwZuncvYE/AIx1e9IemFmBlaA099jxx88eFi79ckuvCVhHs
	Hicn+O1mf8vG7PMI8GCAGjhB9OkCZxeCRyZSIbSb0bTvAVrRkeJGaF/GqhIzzX5yoI29g
X-Gm-Gg: AYBFou3IslYRFsrjlGMwgkVwaxlL3989nR+SfnqYfPfNGcVMlSUAuDsgP1EgcPyuKD4
	oVQEC5whpdtHU+Jqn/yaIRA1T1FqISbsXiIi9cWmudP/hApjHkaVpBhcU5EPo1KNr7GzXtU4LiF
	xOGSLcDi5tmr+4VwmsASBRdp697kbKjq9MLV1v4yF9uJ/QsIjqjaVTZhEQOZnDQ438BxZg3HLyf
	vjauwgrw5K0vm0MOyagh1JnB6G9CAHDqH8rNA6tN0Q0YwKM0B876ROAR2iKnJt9xM59KhVNpFzy
	rab5LHgGvVx1lFPx8VK6B2h1a/Ni51hpeIKUmaVQFepk2llV6DzS1wOb01LBc4k493ZDVjM//lD
	BCLbldHX+O9oFhh6PaXJjxeLgh9pYTZM38G+cOg/Z
X-Received: by 2002:a05:600c:a11a:b0:4a0:137f:75d4 with SMTP id 5b1f17b1804b1-4a01eaf8e98mr111117205e9.2.1790962458855;
        Fri, 02 Oct 2026 10:34:18 -0700 (PDT)
X-Received: by 2002:a05:600c:a11a:b0:4a0:137f:75d4 with SMTP id 5b1f17b1804b1-4a01eaf8e98mr111116795e9.2.1790962458263;
        Fri, 02 Oct 2026 10:34:18 -0700 (PDT)
Received: from mvaralar-thinkpadx1carbongen13.rmtfr.csb ([2a0d:e487:314e:a723:8e7:a5bf:fe1c:6a10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104d58sm7424910f8f.28.2026.10.02.10.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:34:15 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:34:12 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Amanda Liem <Amanda.Liem@amd.com>
Cc: virtio-comment@lists.linux.dev, Nathaniel.McCallum@amd.com,
	parav@nvidia.com
Subject: Re: [PATCH v2] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance
 label
Message-ID: <ar_rFCrex3b9Nz6O@mvaralar-thinkpadx1carbongen13.rmtfr.csb>
References: <20260924153024.3362-1-Amanda.Liem@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260924153024.3362-1-Amanda.Liem@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oXVVrot6v_olpArTO2TUCM98gIh385R45TNCtM_ZsoY_1790962459
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 10:30:11AM -0500, Amanda Liem wrote:
> From: Nathaniel McCallum <nathaniel.mccallum@amd.com>
> 
> A guest may expect a specific set of virtio-net devices, each for a
> particular purpose. The host creates the devices, but the guest has no
> in-band way to tell which created device corresponds to which expected
> one. Device enumeration order and guest-assigned interface names do not
> carry that correspondence, and the MAC address identifies a device
> without indicating the purpose it serves.
> 
> Add an optional, feature-gated string to the network device
> configuration space: a host-provided, guest-readable label describing a
> single device instance, modeled on VIRTIO_NET_F_MTU.
> 
> A motivating use case is a confidential VM whose image author ships a
> trusted manifest describing the expected network interfaces. The host
> builds the devices according to that manifest, but the guest must
> associate each discovered device with its manifest entry before it can
> apply the intended configuration. VIRTIO_NET_F_LABEL supplies that

The manifest will tell the guest what are the expected virtio-nets that
the host shall expose?

> association: the host places the manifest name on the corresponding
> device and the guest reads it as a lookup key, checking that every
> expected name is present exactly once. The label carries no authority of
> its own - the trusted manifest decides which names are acceptable and how
> each interface is configured - so a distrusted host cannot use it to
> redirect or misconfigure the guest. The label does not authenticate the
> backing network, and that is not its purpose.
> 
> Config space is the right home for this because the label is a small,
> bounded, read-only instance property that is stable for the device
> lifetime and can be read during device initialization, without
> negotiating VIRTIO_NET_F_CTRL_VQ or standing up a control virtqueue
> solely to retrieve it. A control-virtqueue query could convey the same
> value; config space is preferred here for the static nature of the
> property and to avoid an otherwise unnecessary control-virtqueue
> dependency.
> 
> Two read-only fields are appended to struct virtio_net_config,
> present only when VIRTIO_NET_F_LABEL is negotiated: label_len
> (0..VIRTIO_NET_LABEL_MAX) and a fixed VIRTIO_NET_LABEL_MAX (64)
> octet label buffer holding length-delimited, well-formed UTF-8
> that is not NUL-terminated. A fixed buffer (not a flexible array)
> keeps future fields appendable; existing offsets are unchanged.
> 
> Device requirements: offer the bit only when the fields are
> populated; keep label_len <= MAX; emit well-formed UTF-8; keep the
> value stable for the device lifetime with no config-change
> interrupt; and never emit NUL, C0, DEL/C1, U+2028 or U+2029.
> 
> Driver requirements: do not touch the fields unless negotiated;
> read label_len first and treat a value above MAX as a device error
> with no out-of-bounds read; read exactly label_len octets; and make
> no routing, identity or trust decision from the value, derive no
> interface name from it, and assume no uniqueness or persistence.
> 
> Comparison is byte-wise and never normalized or case-folded; the
> spec guarantees no uniqueness. Bidirectional and zero-width
> characters remain permitted because their hazard is contextual; an
> informative section places sanitization at the rendering layer and
> notes that on an untrusted host the label is attacker-controlled.
> 
> The feature uses net device-specific bit 71, the next free net
> device-specific feature bit above the highest currently used (70).
> 
> Signed-off-by: Nathaniel McCallum <nathaniel.mccallum@amd.com>
> Signed-off-by: Amanda Liem <Amanda.Liem@amd.com>
> ---
> 
> Link: https://lore.kernel.org/virtio-comment/20260818170552.2127-1-Amanda.Liem@amd.com/ [v1]
> 
> v1 -> v2:
>   - Add motivation to the commit message: the problem (a guest expecting
>     specific devices has no in-band way to match created devices to what it
>     expected) and the confidential-VM manifest use case (Parav)
>   - Explain in the commit message why the label lives in config space
>     rather than being queried over a control virtqueue - a small, static,
>     read-once property that should not require negotiating CTRL_VQ (Parav)
>   - Correct the feature-bit note: bit 71 is the next free net feature bit
>     above the highest currently used (70), not '0-70 are in use'
>  acknowledgements.tex             |   1 +
>  device-types/net/description.tex | 113 +++++++++++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/acknowledgements.tex b/acknowledgements.tex
> index 9a9f8b4..3394bbc 100644
> --- a/acknowledgements.tex
> +++ b/acknowledgements.tex
> @@ -22,6 +22,7 @@ \subsection*{Participants}
>  Martin Kröning, Eonerc \newline
>  Matias Ezequiel Vara Larsen, Red Hat \newline
>  Michael S. Tsirkin, Red Hat \newline
> +Nathaniel McCallum, AMD \newline
>  Laura Loghin, Amazon \newline
>  Lei He, Bytedance \newline
>  Paolo Abeni, Red Hat \newline
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 9f85bf4..f1d1474 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -146,6 +146,12 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
>   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
>  
> +\item[VIRTIO_NET_F_LABEL(71)] The device provides a label string
> +    describing this instance. If offered by the device, the device
> +    advises the driver of a host-provided, human-readable label for
> +    this network device instance through the \field{label_len} and
> +    \field{label} configuration fields.
> +
>  \end{description}
>  
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> @@ -220,9 +226,15 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>          le16 rss_max_indirection_table_length;
>          le32 supported_hash_types;
>          le32 supported_tunnel_types;
> +        le16 label_len;
> +        u8 label[VIRTIO_NET_LABEL_MAX];
>  };
>  \end{lstlisting}
>  
> +\begin{lstlisting}
> +#define VIRTIO_NET_LABEL_MAX     64
> +\end{lstlisting}
> +
>  The \field{mac} address field always exists (although it is only
>  valid if VIRTIO_NET_F_MAC is set).
>  
> @@ -276,6 +288,42 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
>  Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
>  
> +The following two fields, \field{label_len} and \field{label}, only
> +exist if VIRTIO_NET_F_LABEL is set. Together they convey a
> +host-provided, human-readable label describing this network device
> +instance.
> +
> +\field{label_len} specifies the length, in octets, of the label
> +value, between 0 and VIRTIO_NET_LABEL_MAX inclusive.
> +

Does it make sense to allow length to be zero?

> +\field{label} contains the label value as exactly \field{label_len}
> +octets of well-formed UTF-8 text. The value is length-delimited and
> +is not NUL-terminated; octets of \field{label} beyond \field{label_len}
> +are unused and have no meaning. The remaining octets of the
> +VIRTIO_NET_LABEL_MAX-octet buffer are reserved.
> +
> +The label is descriptive only. It carries no semantics defined by
> +this specification: it does not name a network, identify a tenant,
> +or establish trust, and the device does not guarantee that it is
> +unique or that it persists across reboot or migration. Two device
> +instances MAY present identical labels.
> +
> +Labels are compared octet-by-octet: two labels are equal if and only
> +if their \field{label_len} values are equal and their first
> +\field{label_len} octets are equal. Labels are never normalized or
> +case-folded before comparison. The UTF-8 encoding of the value and
> +the octet-wise rule for comparing values are independent: a consumer
> +that requires Unicode normalization or case-insensitive matching
> +performs it itself, and a consumer that requires labels to be unique
> +enforces uniqueness itself.
> +
> +The value MAY contain bidirectional or zero-width characters, which
> +are legitimate in many scripts. The hazard such characters pose is
> +contextual to how the value is later rendered and is addressed at the
> +rendering layer (see \ref{sec:Device Types / Network Device / Device configuration layout / Label security considerations}),
> +not by restricting the value itself; the value-level restrictions
> +below cover only context-free hazards.
> +
>  \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
>  
>  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 inclusive,
> @@ -326,6 +374,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
>  does not offer VIRTIO_NET_F_CTRL_VQ.
>  
> +The device MUST NOT offer VIRTIO_NET_F_LABEL unless it populates
> +\field{label_len} and \field{label}.
> +
> +If it offers VIRTIO_NET_F_LABEL, the device MUST set \field{label_len}
> +to between 0 and VIRTIO_NET_LABEL_MAX inclusive.
> +
> +If it offers VIRTIO_NET_F_LABEL, the device MUST set the first
> +\field{label_len} octets of \field{label} to well-formed UTF-8.
> +
> +If it offers VIRTIO_NET_F_LABEL, the device MUST NOT include in the
> +first \field{label_len} octets of \field{label} any of the following:
> +the NUL character (U+0000); any C0 control character (U+0000 to
> +U+001F); the DEL character (U+007F) or any C1 control character
> +(U+0080 to U+009F); the line separator (U+2028); or the paragraph
> +separator (U+2029).
> +
> +The device MUST NOT modify \field{label_len} or \field{label} once
> +VIRTIO_NET_F_LABEL has been negotiated; the value is stable for the
> +lifetime of the device, and the device MUST NOT signal a configuration
> +change for these fields.
> +
>  \drivernormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
>  
>  The driver MUST NOT write to any of the device configuration fields.
> @@ -367,6 +436,50 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  A driver SHOULD NOT negotiate VIRTIO_NET_F_CTRL_RX_EXTRA if it
>  does not negotiate VIRTIO_NET_F_CTRL_VQ.
>  
> +The driver MUST NOT read \field{label_len} or \field{label} unless
> +VIRTIO_NET_F_LABEL has been negotiated.
> +
> +If the driver negotiates VIRTIO_NET_F_LABEL, it MUST read
> +\field{label_len} before reading \field{label}, and it MUST treat a
> +\field{label_len} greater than VIRTIO_NET_LABEL_MAX as a device error

What is the state of the device if label_len is bigger than
VIRTIO_NET_LABEL_MAX? How this error shall be handled?

> +and MUST NOT read \field{label} beyond VIRTIO_NET_LABEL_MAX octets.
> +
> +If the driver reads \field{label}, it MUST read exactly
> +\field{label_len} octets.
> +
> +The driver MUST NOT make any routing, identity, or trust decision
> +based on \field{label}, MUST NOT derive the network interface name
> +from it, and MUST NOT assume that the value is unique or that it
> +persists across reboot or migration.
> +
> +\subsubsection{Label security considerations}\label{sec:Device Types / Network Device / Device configuration layout / Label security considerations}
> +
> +\begin{note}
> +This section is informative.
> +
> +The label is supplied by the host and is not measured. Whether it can
> +be trusted is a property of the deployment, not of the field. Where the
> +host is part of the guest's trusted computing base (a conventional
> +virtual machine), the value may be used as provided. Where the host is
> +outside that boundary (for example, a confidential virtual machine
> +whose memory and execution are protected from the host), the label is
> +attacker-controlled: on its own it is evidence of nothing. It carries
> +weight only insofar as the guest corroborates it against state the host
> +cannot influence; how to corroborate it, and how far to trust the
> +result, are concerns of the guest's design and are out of scope here.
> +This specification only defines how the value is conveyed; trust
> +decisions are made by software layered above the driver.
> +
> +Any layer that renders the label to a text sink sanitizes it first: it
> +drops control and separator characters and renders the value in
> +isolation so that bidirectional formatting characters within it cannot
> +reorder surrounding text. The value-level restrictions on the device
> +(above) remove only context-free hazards; bidirectional and zero-width
> +characters remain permitted because their hazard depends on the
> +rendering context and is therefore addressed where the value is
> +rendered.
> +\end{note}
> +
>  \subsubsection{Legacy Interface: Device configuration layout}\label{sec:Device Types / Network Device / Device configuration layout / Legacy Interface: Device configuration layout}
>  \label{sec:Device Types / Block Device / Feature bits / Device configuration layout / Legacy Interface: Device configuration layout}
>  When using the legacy interface, transitional devices and drivers
> -- 
> 2.34.1
> 
> 

