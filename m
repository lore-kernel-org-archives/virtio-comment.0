Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904365;
	b=dXwgeCjldCB0rJQ9GPx8wpwzjlc1fW8e2rHR2KiB4zXxSYfCrUKHZtoCsZ3DirJyumqv
	 qPslPW58GLdGdoXGbTDYITsRKW6NDHLK5rRVFOUS7zWdN929/s4n9nRi3MZryCQ/6g3iO
	 fOZRmbviZ6xDIBIWrpWKTY3TbxMSLInHliHGZK2fPSGjZ4xkml5ZTNRBSIkh+BuvaEc0h
	 g9BRfobbrXy7yThHpwvrku3aychWzF0LS06W5j2KBr7lI4sQfZAZxR/VF5nqwFaNIu87a
	 efX/JGllwyVY9HhGUu/yiMAldcoC1HE/ntny/EH4fG3wpdFlXhepu4FPSIPK6gLrq+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904365;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=Xy0aek8Nmw084Xuw1AoE+QyTdfY6qhhsJiBYmWAmqjY=;
	b=L+XdiTu29pfYVykdME8uLmuRHC3erVf3vlFPNjZOeajlAZicU85t8G0wK77+RctJTKOo
	 i43O55SGbBmpf6e/w+TjzfD0UEm1j9r+wgwm1TogjHCLw+KD+DE15UXZ4CqwdI6f6Fs7h
	 JzpF91HViCFcVXShxWP//C45QIRXAvWdSQZsRePbGQmjSeCPK3Ov8LKpmocnh692yRY76
	 G9SqTXohSCSwQsz5C6EgtG6iux1qy9IdWYJWjVr/voCL7gGKecx6QsdWMd9HdWsfVkTQR
	 VlKA02JiQkRP9PjwobtSBC4Tyf4pFSKZjc04OFA+Br91JyO49d0ynycgVVTOVjnFnrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RSvuyAZ3;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670B606A326
	for <virtio-comment@lists.linux.dev>; Thu,  5 Nov 2026 18:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E670B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RSvuyAZ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793904363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy0aek8Nmw084Xuw1AoE+QyTdfY6qhhsJiBYmWAmqjY=;
	b=RSvuyAZ36m53n1ZQxR3JTn1B+zl8rv2g0o5Owv2SteVAY2OeYcP3KfK88nhPX54l7ZkQCi
	xNFB1TbC+DTtXPxsP+y5Hr7e9/F/VhGAtH+lgcbcDmF96d+ou9FMJ2Ny61xVOTAbwzgvn1
	akDeziDgXUJLA/W/YdvwLWnXYNrF9yU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-WXmr4AdhOFuvRj_v55l2uQ-1; Thu, 05 Nov 2026 13:46:02 -0500
X-MC-Unique: WXmr4AdhOFuvRj_v55l2uQ-1
X-Mimecast-MFC-AGG-ID: WXmr4AdhOFuvRj_v55l2uQ_1793904361
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49953abe51fso17835195e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 05 Nov 2026 10:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904361; x=1794509161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xy0aek8Nmw084Xuw1AoE+QyTdfY6qhhsJiBYmWAmqjY=;
        b=ItlKQOtlAdM5y9PcVVXJCdNDTc9K2F69TjRSu7lPQXeF4SqzU4xQNE9wU0RIZU9Kvy
         53v7wt9lVChMWKyJb8ilfIIS0EumebZcz3ozWbS/N/rLTmUGX9L3EpUGbbHZ8Ni574m+
         sgJaTFo7yc7G2zuKAuGFLvtx+lXERm1RVmSTbLiFwtHdr4+6JABz4h43mn/NCcB8X5LW
         uv+faw4s0l8Qu2ed81AJXTIrEragROboM6MY2l7fQjZ3ORlHwknw5m3QkFheW/mOxWUY
         w+3A6s8x/C8Ok+ezzyEbTVMucJ2dhkhMYgH1X+30K2JxiJl/0V/Nqlok0/WqyMcQP7Mv
         Hf8Q==
X-Gm-Message-State: APuU4Z9xmK8fEOr3w/wGJYjV2m+VLCsUWM0i5hP9nV+P0kCL8zpR3cyC
	y2SmYZXB2hWUVzhyNFTGt0IqRYfqTvTvYRw2o6pHCCQjpErBFDqJM01fvCCf9jzpm+pLgvbI4ni
	u6gac6shogaLOu4zPRsVU/XzcT/3IkDeBeCAFOyivI7ney7iWEqEwFTbhLqZu6IKa4qig
X-Gm-Gg: AYBFou3naDvkLXQJA2Ycu+AFmt/u9SsbLiezD0jCZ4NpuKX7e4XInLk+prWk9TDcsDF
	cWtdppNYxjTHAy2Sy6T+nq6rY062xUhOHBecEAIMp0b3u5PIaC1m14H2t4gPNqiTvVgUDsJDBFL
	W88gmuWH61n0xp9HM7z4zaHxquNPmP/l6DGoOYHVvu0yprsw6pMc8gTcbI2ivNhFc9rGBPL3Klu
	te0HKu+xc3dQoqPzoCcOWobtsvPUub1lfgLiJR2VPuaWdy5wbXB8Z5UGugKjVfuUGA0wqhs4xBz
	YZk+VbwGZvJuiUhzJZ7gvTTnNeNLRfhlNM7clVK0NK3XuzTkYnUsMg+NnOCfasOchACqoryJh/C
	BmKlFvKMiVx9XK3teSd1/EInyL641Y3sO7vGn80QNUg==
X-Received: by 2002:a05:600c:1910:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4b6de4a6b88mr49325e9.14.1793904360633;
        Thu, 05 Nov 2026 10:46:00 -0800 (PST)
X-Received: by 2002:a05:600c:1910:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4b6de4a6b88mr48845e9.14.1793904360008;
        Thu, 05 Nov 2026 10:46:00 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1401:db00:7367:7b9e:e66f:2b7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm89633045e9.10.2026.11.05.10.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:45:59 -0800 (PST)
Date: Thu, 5 Nov 2026 13:45:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Amanda Liem <Amanda.Liem@amd.com>
Cc: virtio-comment@lists.linux.dev, mvaralar@redhat.com, parav@nvidia.com,
	nathaniel.mccallum@amd.com
Subject: Re: [PATCH v4] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance
 label
Message-ID: <20261105133905-mutt-send-email-mst@kernel.org>
References: <20261105174308.11982-1-Amanda.Liem@amd.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261105174308.11982-1-Amanda.Liem@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vuay3BSSTXQ3iDvg8hCYJj02CGht7cFkThaKw0R1FbY_1793904361
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2026 at 11:43:07AM -0600, Amanda Liem wrote:
> From: Nathaniel McCallum <nathaniel.mccallum@amd.com>
> 
> Add an optional, feature-gated label to the virtio-net device
> configuration space: a short, read-only string describing a single device
> instance. This field is modeled on VIRTIO_NET_F_MTU - it is static and
> read at device initialization, without a control virtqueue.
> 
> Two read-only fields are appended to struct virtio_net_config, present
> only when VIRTIO_NET_F_LABEL (net feature bit 71) is negotiated: label_len
> (1..VIRTIO_NET_LABEL_MAX) and a fixed VIRTIO_NET_LABEL_MAX (64) octet
> label buffer holding length-delimited, well-formed UTF-8 that is not
> NUL-terminated. Two reserved octets follow, keeping a later appended field
> 64-bit aligned. A fixed buffer (not a flexible array) keeps future fields
> appendable; existing offsets are unchanged.
> 
> A guest with several virtio-net devices uses the label to find which one
> plays a role it requires - for example the device that receives inbound
> connections on port 443 from the internet, which it cannot tell from the
> device itself. The label names an out-of-band contract the guest expects.
> The guest matches the presented label against the one the contract calls
> for, so the label only locates a device and conveys no trust. A wrong
> label can only deny the guest its device, a denial of service that is
> always possible. It cannot make the guest trust a device the contract
> would reject. A contract and its enforcement are outside the scope of this
> specification.
> 
> Signed-off-by: Nathaniel McCallum <nathaniel.mccallum@amd.com>
> Signed-off-by: Amanda Liem <Amanda.Liem@amd.com>
> ---
> 
> Link: https://lore.kernel.org/virtio-comment/20260818170552.2127-1-Amanda.Liem@amd.com/ [v1]
> Link: https://lore.kernel.org/virtio-comment/20260924153024.3362-1-Amanda.Liem@amd.com/ [v2]
> Link: https://lore.kernel.org/virtio-comment/20261027154836.13778-1-Amanda.Liem@amd.com/ [v3]
> 
> v1 -> v2: add motivation and config-space-vs-CVQ rationale; fix the
>   feature-bit note (Parav)
> v2 -> v3: require label_len 1..MAX; spell out the over-length error as a
>   device error with FAILED (Matias)
> v3 -> v4:
>   - Reframe: explain the purpose - the label names an out-of-band contract
>     the guest expects and matches against to find its device - and that the
>     label conveys no trust and need not be unique (Michael)
>   - Drop the acknowledgements.tex change (Michael)
>   - Remove "host" from the spec text; the device provides the label
>     (Michael)
>   - Pad struct virtio_net_config with 2 reserved octets so a field
>     appended after the label stays 64-bit aligned (Michael)
>   - Reword the comparison text as driver-side matching, drop "consumer"
>     (Michael)
>   - Note identical labels may occur in the same guest or in different
>     guests (Matias)
>   - Remove the informative security-considerations note; its one normative
>     rule (no routing/identity/trust decision from the label) already lives
>     in the driver requirements (Michael, Matias)
>  device-types/net/description.tex | 92 ++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 9f85bf4..e8419f7 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -146,6 +146,12 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
>   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
>  
> +\item[VIRTIO_NET_F_LABEL(71)] The device provides a label for this
> +    device instance through the \field{label_len} and \field{label}
> +    configuration fields. A driver uses the label to identify which
> +    device matches a value it expects. The label is human-readable, and
> +    its meaning is defined outside this specification.
> +
>  \end{description}
>  
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> @@ -220,9 +226,16 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>          le16 rss_max_indirection_table_length;
>          le32 supported_hash_types;
>          le32 supported_tunnel_types;
> +        le16 label_len;
> +        u8 label[VIRTIO_NET_LABEL_MAX];
> +        u8 padding[2];
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
> @@ -276,6 +289,45 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
>  Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
>  
> +The following fields, \field{label_len}, \field{label}, and
> +\field{padding}, only exist if VIRTIO_NET_F_LABEL is set.
> +\field{label_len} and \field{label} together convey a human-readable
> +label that identifies this device instance, which a driver matches
> +against a value it expects.
> +
> +\field{label_len} specifies the length, in octets, of the label
> +value, between 1 and VIRTIO_NET_LABEL_MAX inclusive. A device with no
> +label for an instance does not offer VIRTIO_NET_F_LABEL for that
> +instance rather than offering an empty value.
> +
> +\field{label} contains the label value as exactly \field{label_len}
> +octets of well-formed UTF-8 text. The value is length-delimited and
> +is not NUL-terminated; octets of \field{label} beyond \field{label_len}
> +are unused and have no meaning. The remaining octets of the
> +VIRTIO_NET_LABEL_MAX-octet buffer are reserved.
> +
> +\field{padding} has no meaning and is reserved for future use. This is
> +set to zero by the device. It keeps a field appended after \field{label}
> +64-bit aligned.
> +
> +The specification defines no semantics for the label: it does not
> +name a network, identify a tenant, or establish trust, and the device
> +does not guarantee that it is unique or that it persists across reboot
> +or migration.

migration?

> Two device instances can present identical labels,
> +whether in the same guest or in different guests.
> +
> +A driver that matches the label against a value it expects compares
> +the two octet-by-octet: they are equal if and only if they have the
> +same length and the same octets.

seems to imply the driver will not parse it in any way?

> The device does not normalize or
> +case-fold the value, so a driver that needs Unicode normalization or
> +case-insensitive matching performs that itself.

then this one suddenly implies it might?

> +
> +The value can contain bidirectional or zero-width characters, which
> +are legitimate in many scripts. The device does not emit control or
> +separator characters, but a driver that displays the label can render
> +it in isolation so that any bidirectional characters cannot reorder
> +surrounding text.
> +
>  \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
>  
>  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 inclusive,
> @@ -326,6 +378,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
>  does not offer VIRTIO_NET_F_CTRL_VQ.
>  
> +The device MUST NOT offer VIRTIO_NET_F_LABEL unless it populates
> +\field{label_len} and \field{label}.
> +
> +If it offers VIRTIO_NET_F_LABEL, the device MUST set \field{label_len}
> +to between 1 and VIRTIO_NET_LABEL_MAX inclusive.
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
> @@ -367,6 +440,25 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  A driver SHOULD NOT negotiate VIRTIO_NET_F_CTRL_RX_EXTRA if it
>  does not negotiate VIRTIO_NET_F_CTRL_VQ.
>  
> +The driver MUST NOT read \field{label_len} or \field{label} unless
> +VIRTIO_NET_F_LABEL has been negotiated.
> +
> +If the driver negotiates VIRTIO_NET_F_LABEL, it MUST read
> +\field{label_len} before reading \field{label}. A compliant device
> +sets \field{label_len} within range, so a \field{label_len} greater
> +than VIRTIO_NET_LABEL_MAX indicates a device error: the driver MUST NOT
> +read \field{label} beyond VIRTIO_NET_LABEL_MAX octets, MUST NOT use the
> +label value,

then why read at all?

> and SHOULD set the FAILED \field{device status} bit (see
> +\ref{sec:Basic Facilities of a Virtio Device / Device Status Field}).
> +
> +If the driver reads \field{label}, it MUST read exactly
> +\field{label_len} octets.

why not less? in fact > VIRTIO_NET_LABEL_MAX above is an exception.

> +
> +The driver MUST NOT make any routing, identity, or trust decision
> +based on \field{label},

why not, if the device is trusted?

> MUST NOT derive the network interface name
> +from it,

so what *is* it good for? for example, u give example for port 443.
so why should it not call this device internet0?

> and MUST NOT assume that the value is unique or that it
> +persists across reboot or migration.

migration?

> +
>  \subsubsection{Legacy Interface: Device configuration layout}\label{sec:Device Types / Network Device / Device configuration layout / Legacy Interface: Device configuration layout}
>  \label{sec:Device Types / Block Device / Feature bits / Device configuration layout / Legacy Interface: Device configuration layout}
>  When using the legacy interface, transitional devices and drivers
> -- 
> 2.34.1

