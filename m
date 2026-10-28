Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199769;
	b=3NQnzVtHQ01QukCQVyXXccQqaJhyb8E+yRxrt4k3TOlWZRai6JGlLjsotuC/75emTNOz
	 TEg27LiifqJgWyO/V0UKJ3O0wYX0y6EGkkHBXEwGwi+3KKH5cmNDKV6UU5IdQqgDuKJGN
	 0sKdQQGn++9nFweg/KehScYxqtQgerU8sf3hw+Qfo7MIa7N6fC/MEwPZm9CYYge/nCSdd
	 JrCFuuCitQQZhCQ68h48hLTVA7qwwjtvSnV6VyP9rNeF5x4REK08Y5lMjeZqpCsKPGk1s
	 c0HiDxQXkevEhOiXi92HIaotFm+rfWPJi2Q8HpH0ZSWdHIjenarPXKUl0DNPp0Jwovg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199769;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=mY5+cxgUHFqfY07kdF5qJiM6oMsbKF0h+DaCa4zg/FE=;
	b=JJ9EBfUQAiTLSMXgdrR32yXOWVA6Xo3uCQaLrqHsImYIRZDyjpHgru/8oE6dj4bqX5iw
	 pkSd3QvZccIhvjor+3jEB2vSZrCcbgVf7xV/NOLj7PkBIFklZrjTCQPa8BUQdY7hUAEI2
	 3bM42jMHD0mDzcbRWJ+vItXOtEwKMlbmkSfTONhzBbZ66XLPEOe0d0Op60nFVJ7gdwkn4
	 fU1UlAe638aioO2bbmaXOv6RxLkxFRyOUQj4+qFIm6GDMUl/PWvWlvKQq1ar3YrGpd+St
	 o2kf0hpoFRmvdYHfwp2C84jK+I6+72DT0jQ9DmF7DXRuoA2A2Nd/5zR6oIWlZrREhrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RYkNuGUu;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6CA606A31C
	for <virtio-comment@lists.linux.dev>; Wed, 28 Oct 2026 15:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B6CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RYkNuGUu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793199767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mY5+cxgUHFqfY07kdF5qJiM6oMsbKF0h+DaCa4zg/FE=;
	b=RYkNuGUuUWezKk/LajIdLZqhHVZd9k6UgwRiohRVcMUtbu+zxt6LpP5I4axFQbwkNBHYQ5
	QSTWAfTzC24TGWNpW/tkYGmh8FnljH7zeeSBDVj69q7J1mZRXXxOmxC+kR79QQe01J1M8Q
	GwdPBGbJ67aUk4vhwOM1O/7aiyEnKbY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-QTbTOzPLP3CXM0lCTZOQtw-1; Wed, 28 Oct 2026 11:02:45 -0400
X-MC-Unique: QTbTOzPLP3CXM0lCTZOQtw-1
X-Mimecast-MFC-AGG-ID: QTbTOzPLP3CXM0lCTZOQtw_1793199764
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a20a40d3e9so8559655e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 28 Oct 2026 08:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199764; x=1793804564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mY5+cxgUHFqfY07kdF5qJiM6oMsbKF0h+DaCa4zg/FE=;
        b=0Sz6A99N8urLL1IF/fumxMqMmZpQWTRQf/aagR7KTFwmhdVoG9FIlyxCLSonY838YU
         lUvxLFTGm70oFYuaFLpTOLhuKu0xIFVlPyYhtk24oEWAEQZlfKnDQU4xblaGmPsDHJLe
         h2GuAVg+8k2Wfs7zovRZdYNrlgIHggFFsSVcUKj808bC1qrXxfgNJP3rOu9I91XRhGE8
         jL81Co+siBXNUtUPYZxY7Az1FFx1DP/eVrsWiopXHxdi45lTXbr/oGWHBplcSUDyN16x
         2Jf/MApb25LwFKEMav74AXHHYTXUu0aQLWZqnUxW8H52PQ+8+IkTs5cqg6gKlpB9gv/4
         Wkpg==
X-Gm-Message-State: AFq9FYLiDSbfnswwomRM76ostMYogTX3fBusbz11FR8u6rkQcRMp1G9B
	hYVNFYO+sT6ZTnEB7Y78ZHoJok6jt9ZAWK74PPqK3KcqX5CigzeZ1EK2dZsxLJebslriOZndeVs
	s2oA//6giy44y9HD02NVO9L9tl92HItR3stonAPC5SnXN001MLaIWbf0tLHcBobwSVdTt
X-Gm-Gg: AYBFou16q8zHHNsCcwOhP2L8sNKBxUrMtlD0zUYFXLNwQwD0sCkPOKQCbxwyjEgsW1B
	As0abnf7WB8l/XPxtJ8NwxsFp+zMLiGkJKmhUR/7nBoqQHi7AH3DZmNS5JDjZPD2KAw88lTp1Bm
	AadjU/4N8oM1JO/wKvNCUYWrhqWGcl0Q7qNHXv+Tjs599iAkV0KG5IiNr+x0wYFLEuE8Xm1U/Vq
	QQNe691ng7PeDNl300mb5Dq/RO3fJeLWgjenG2N3yEGELjnYAlU/o4RS9JwLVrbUjJsPBxpqqmO
	8xDknX67YliSCHdXUuGIt3zk4xaNgDd2OqtZfJa4WwANCvQ0cVh/K5cP840I+Qp01o54xgVj1RZ
	DJHX0A90K43iwGrO9b96wAUMSoS8Ew7hPNW8H8qssz/WHnTzqUYQ=
X-Received: by 2002:a05:600c:83c8:b0:4a2:105f:ab88 with SMTP id 5b1f17b1804b1-4a9672f8235mr57315005e9.18.1793199764100;
        Wed, 28 Oct 2026 08:02:44 -0700 (PDT)
X-Received: by 2002:a05:600c:83c8:b0:4a2:105f:ab88 with SMTP id 5b1f17b1804b1-4a9672f8235mr57313965e9.18.1793199763417;
        Wed, 28 Oct 2026 08:02:43 -0700 (PDT)
Received: from redhat.com ([2a0d:e487:31ef:6977:e8bd:19a4:be96:dd4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm27830842f8f.43.2026.10.28.08.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:02:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 16:02:38 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Amanda Liem <Amanda.Liem@amd.com>
Cc: virtio-comment@lists.linux.dev, parav@nvidia.com,
	Nathaniel.McCallum@amd.com
Subject: Re: [PATCH v3] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance
 label
Message-ID: <auIOjo37MTluz0fv@redhat.com>
References: <20261027154836.13778-1-Amanda.Liem@amd.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261027154836.13778-1-Amanda.Liem@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1o21UXo8DXqOvwHFibnCojAECXDOtq9w8Z3_M9JguQk_1793199764
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 27, 2026 at 10:48:35AM -0500, Amanda Liem wrote:
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
> Link: https://lore.kernel.org/virtio-comment/20260924153024.3362-1-Amanda.Liem@amd.com/ [v2]
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
> 
> v2 -> v3:
>   - Require label_len to be 1..VIRTIO_NET_LABEL_MAX (was 0..): a device
>     with no label does not offer the feature rather than offering an empty
>     value (Matias)
>   - Spell out the over-length error: a label_len greater than
>     VIRTIO_NET_LABEL_MAX indicates a device error; the driver must not read
>     past MAX, must not use the value, and SHOULD set the FAILED status bit
>     (Matias)
>  acknowledgements.tex             |   1 +
>  device-types/net/description.tex | 118 +++++++++++++++++++++++++++++++
>  2 files changed, 119 insertions(+)
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
> index 9f85bf4..5ab0da6 100644
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
> @@ -276,6 +288,44 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
>  Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
>  
> +The following two fields, \field{label_len} and \field{label}, only
> +exist if VIRTIO_NET_F_LABEL is set. Together they convey a
> +host-provided, human-readable label describing this network device
> +instance.
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
> +The label is descriptive only. It carries no semantics defined by
> +this specification: it does not name a network, identify a tenant,
> +or establish trust, and the device does not guarantee that it is
> +unique or that it persists across reboot or migration. Two device
> +instances MAY present identical labels.

You meant devices that were assigned to the same guest or different guests?

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
> @@ -326,6 +376,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
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
> @@ -367,6 +438,53 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
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
> +label value, and SHOULD set the FAILED \field{device status} bit (see
> +\ref{sec:Basic Facilities of a Virtio Device / Device Status Field}).
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

Is this section important?

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

