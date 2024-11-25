Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2488D2941C
	for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 02:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732503055; cv=none; b=d/ywZwfE3X0gtkOMZ7T/afPwzGtAE+BJ8BzEXve2g65ZSzDSNDl34+0XMquWcl507bEqa05NJ4XPusE/j2IJauNUoJ4TCsDZaK1umwIO/3dM/Z+9SBeVvikwMRW7b7ldfDW63RdYJGbRyorSLhlZW+M7moHM4tLgE3okAapvzfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732503055; c=relaxed/simple;
	bh=ciq2TNRFjq1MuX+zU9MRxvZHQChk9uRQCTbeCt+klGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHkc4zhf2oIQG5dcFaM+cX9Qgn1Rrc3QS472YQLDN/OZE2FdEn5Q0bofRc5ZtZBsTpd1Ul/0qM21kg1MdhZr62ATA80V35Nrj1VCJQudBWWuIgRHZpohVL5m2MjLCc3dwush7wF0b+NWW/NP+/SP6NMAyMahlvjBLmHnn4ZTzb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMt8bNS4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMt8bNS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732503051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEgwGUlLYLCKjm412xDNZmcmWm3oeW9vy9eetVsfvuo=;
	b=IMt8bNS4xt8tuOq7KUuEhOo5kkred8UFw9aH+kg95eiQ9SAQO1ma44dC32co6dPkmGwgFM
	kCR8ed3Yei5Pma0K8w+aCJSB3Ebia398RE1ng9mSPEFM6jNgwcKDXIEEB9QVuILeAB96ld
	uWLIOyv80XDO8l/v6no/FF5eS4/tbxI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-qYS_X_VpObuHGvC6bWSjsQ-1; Sun, 24 Nov 2024 21:50:49 -0500
X-MC-Unique: qYS_X_VpObuHGvC6bWSjsQ-1
X-Mimecast-MFC-AGG-ID: qYS_X_VpObuHGvC6bWSjsQ
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ea46465ce4so4985862a91.2
        for <virtio-comment@lists.linux.dev>; Sun, 24 Nov 2024 18:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732503048; x=1733107848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEgwGUlLYLCKjm412xDNZmcmWm3oeW9vy9eetVsfvuo=;
        b=kZU2EjxjNDlTlTTS7ox2jIvJEWuD7+pCLyTezDChjgpIE0AXirGgflEdvDRXodWpkt
         AusrQ08Bmj9H8WEhntSFu3cL5sXffgpECoxc0wdG3pGfne7+B3Ln5v5sK/Zwy8zphUke
         1m4txFl0fjBYU5rOryq7jaRVlG4YUn5rJfvUksTLYuwo/CgDYQQQzEzVG7XdcBwzG3h0
         VjQfnDDxkDYqQm81I7xm1MZvY/eykrdJVqjSkEun0TZ2xpREpCN23jeT/qzY74K7ZaKW
         l/ItUAzIDtR7LU7T8zimEhWulSolrA4O6tm8EwhXA1FRSUWFPgJzrxn9MQrHURbsp44x
         +e2Q==
X-Gm-Message-State: AOJu0YzI7KSKkp9lBip8Ggk1C9he8mnYEb7iFKiqpfldKINnnGgobMUP
	QjTx+qXEypNHmAfFmqUcKB1ut2anTWhd70EEjU3e9Gf7VJQClZFVkZFn5hH4iLt2XCtFXPr3CiK
	Fd15n8fXVcKo+7zbfzF19uCH04kikXNhx/fiQZlurMjb5jvqIqMpwDgekcES1/iqIqFjcCJfk8z
	Q7oVqojL5f5y2RqYe/FPNthMV79DTEsuRo7Y8Juenh9AMcKYB5QA==
X-Gm-Gg: ASbGncuTMrGUqpiqRDs26rQOAQAyz52aDwSitf/6a97yw5Fm2elVFdUsaPLocZYzbVd
	ClmeGWTVTSEX9UWFzUm/hnc7EhC9EFCxE
X-Received: by 2002:a17:90b:3b46:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-2eb0e02b647mr13847834a91.4.1732503047639;
        Sun, 24 Nov 2024 18:50:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFehwqHVEzjTjUTsDUSHaSqsp4lHWlA7i8YUR+8uPuVCgMCOyqaqfecVOJtb19gn6dodBU9RvPvLJfOQup40QA=
X-Received: by 2002:a17:90b:3b46:b0:2ea:83a0:47a5 with SMTP id
 98e67ed59e1d1-2eb0e02b647mr13847812a91.4.1732503047010; Sun, 24 Nov 2024
 18:50:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1731084277.git.pabeni@redhat.com> <c35d4e23bc260494a54f79479b8b722755bad66f.1731084277.git.pabeni@redhat.com>
In-Reply-To: <c35d4e23bc260494a54f79479b8b722755bad66f.1731084277.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 25 Nov 2024 10:50:34 +0800
Message-ID: <CACGkMEs17PaqS2LmJo=DeB3eDF9EzzAfshPGvveEZ4xiEe4sgQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] virtio-net: define UDP tunnel segmentation
 offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 905satZAjeTVqnRda01hPWuB-2v5J1qmxfYs4HRFYzc_1732503049
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 12:53=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunnel.
> They can be negotiated on both the host and guest sides.
>
> One constraint addressed here is that the virtio side (either device or
> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> completely the inner and outer headers offset - to allow for later GSO.
>
> To accommodate such need, new fields are introduced in the virtio_net
> header: outer_th_offset and inner_nh_offset.
> They map directly to the corresponding header information. The inner
> transport header is implied by the (inner) checksum offload.
>
> Those fields are required because a virtio device H/W implementation
> performing segmentation for UDP tunneled packet will need to touch
> the outer transport protocol (for the UDP length filed), the
> inner network protocol (for the total length field, in the IPv4
> case).
>
> Note that segmentation will additionally need to touch
> the outer network protocol and the inner transport protocol. The first
> is implied/easily found with trivial parsing, the latter is identified
> by the existing csum_start field.
>
> Note that there is no concept of UDP tunnel type negotiation (e.g.
> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
> can perform segmentation for every possible UDP-tunnel given the
> specified new fields.
> In the reverse direction, if a virtio device H/W implementation receives
> some traffic for an unknown or unsupported UDP tunnel, it will simply
> not aggregate the wire packet in a GSO one.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
> v9 -> v10:
>  - mandate DATA_VALID and VIRTIO_NET_HDR_F_NEEDS_CSUM as mutually exclusi=
ve
>    for GSO over UDP tunnels packets.
>  - clarified that hdr_len includes the inner transport header for GSO ove=
r
>    UDP tunnels packets
>  - highlighted that csum_offset refers to the inner header in a specific
>    note
>
> v8 -> v9:
>  - rebased on top of virtio-1.4, changed udp-tunnel features number
>    to avoid conflicts/duplications
>  - fixed typos:
>    VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV4 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IP=
V4
>    VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV6 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IP=
V6
>  - specified strict validation on RX side (both driver and device)
>    for UDP tunneled packet: NEEDS_CSUM and plain GSO are mandatory for UD=
P
>    tunnel GSO packets. The driver is not allowed to set DATA_VALID for UD=
P
>    tunnel GSO packets, the driver can set both DATA_VALID & NEEDS_CSUM.
>
> v7 -> v8:
>  - dropped 'Note that' in note
>  - NOT set neither A nor B -> NOT set either A or B
>  - specify that 'gso_partial' needs uh->len set to the wire one
>
> v6 -> v7:
>  - replaced inner_protocol_type with VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 &=
&
>    VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
>  - UDP_TUNNEL now depends on all the TCP and USO segmentation features
>  - reworded the 'VIRTIO_NET_HDR_GSO_UDP_TUNNEL' bit driver normative
>  - specified that  csum_start/offset points to the inner header in the
>    driver normative, too
>  - new fields presence depends on either VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO=
 or
>    VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
>  - e.g. ->  i.e.
>  - zero -> positive zero (0x0)
>  - checksumming -> checksum validation
>  - explain why we the outer UDP csum can be precomputed only
>    when the GSO packet length is a multiple of gso_size
>  - added an example note for the tunnel-related fields value
>  https://lore.kernel.org/virtio-comment/cover.1722252302.git.pabeni@redha=
t.com/T/#t
>
> v5 -> v6:
>  - split in 2 patches
>  - dropped the unneeded outer_mh_offset field
>  https://lore.kernel.org/virtio-comment/56ccba136272593d0d2af0303600c06f2=
6bd84a1.1718621522.git.pabeni@redhat.com/
>
> v4 -> v5:
>  - add separate negotiation for UDP_TUNNEL_CSUM
>  - much more verbose specification of outer csum handling
>  - UDP_TUNNEL_CSUM requires GSO_UDP_TUNNEL
>  https://lore.kernel.org/virtio-comment/cb89d3d6b6a7e4a7f13e60dd3fded5e95=
0727890.1716448766.git.pabeni@redhat.com/
>
> v3 -> v4:
>  - new virtio_net_hdr fields depends on F_HOST_UDP_TUNNEL_GSO or
>    F_GUEST_UDP_TUNNEL_GSO (Stefano)
>  - Extended the changelog to answer Jason's questions.
>  - Clarified outer csum handling (Jason)
>  https://lore.kernel.org/virtio-dev/f0bf2db203f8061a3ecb50b7a48cf26d8f3c7=
f68.1716193086.git.pabeni@redhat.com
>
> v2 -> v3:
>  - UDP_TUNNEL -> UDP_TUNNEL_GSO
>  - add explicit fields for the inner meta-data
>  - more verbose changelog
>  https://lists.oasis-open.org/archives/virtio-dev/202206/msg00026.html
>
> v1 -> v2:
>  - explicitly state that the outer header probing is mandatory
>  - explicitly state that GSO_UDP is not allowed with GSO_UDP_TUNNEL
>  - clarify hdr_len usage
>  - clarify UDP_TUNNEL_CSUM bit usage
>  - fix a few typos
>  https://lists.oasis-open.org/archives/virtio-dev/202205/msg00037.html
> ---
>  device-types/net/description.tex | 219 +++++++++++++++++++++++++++++--
>  1 file changed, 211 insertions(+), 8 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 3099c6f..0279568 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,12 @@ \subsection{Feature bits}\label{sec:Device Types / Net=
work Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive GSO pac=
kets
> +  carried by a UDP tunnel.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive GSO pack=
ets
> +  carried by a UDP tunnel.
> +
>  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level sta=
tistics
>      to the driver through the control virtqueue.
>
> @@ -138,12 +144,16 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST_TSO=
4, VIRTIO_NET_F_GUEST_TSO6,
> +   VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6.
>
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4,=
 VIRTIO_NET_F_HOST_TSO6
> +   and VIRTIO_NET_F_HOST_USO.
>
>  \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
> @@ -381,6 +391,13 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>    TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
>    (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) featu=
res.
>
> +\item If the VIRTIO_NET_F_HOST_TSO6, VIRTIO_NET_F_HOST_TSO4 and VIRTIO_N=
ET_F_HOST_USO
> +  segmentation features are negotiated, a driver can
> +  use TCP segmentation or UDP segmentation on top of UDP encapsulation
> +  offload, when the outer header does not require checksumming - e.g.
> +  the outer UDP checksum is zero - by negotiating the
> +  VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
> +
>  \item The converse features are also available: a driver can save
>    the virtual device some work by negotiating these features.\note{For e=
xample, a network packet transported between two guests on
>  the same system might not need checksumming at all, nor segmentation,
> @@ -388,8 +405,9 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Network Device / Dev
>     The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
>    checksummed packets can be received, and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> -  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4
> -  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features =
described above.
> +  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4,
> +  VIRTIO_NET_F_GUEST_USO6 and VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
> +  are the input equivalents of the features described above.
>    See \ref{sec:Device Types / Network Device / Device Operation /
>  Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
>  Device / Device Operation / Setting Up Receive Buffers} and
> @@ -451,6 +469,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>  #define VIRTIO_NET_HDR_GSO_UDP         3
>  #define VIRTIO_NET_HDR_GSO_TCPV6       4
>  #define VIRTIO_NET_HDR_GSO_UDP_L4      5
> +#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
> +#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
>          u8 gso_type;
>          le16 hdr_len;
> @@ -461,6 +481,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>  };
>  \end{lstlisting}
>
> @@ -518,6 +540,10 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  followed by the TCP header (with the TCP checksum field 16 bytes
>  into that header). \field{csum_start} will be 14+20 =3D 34 (the TCP
>  checksum includes the header), and \field{csum_offset} will be 16.
> +If the given packet has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or th=
e
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set,
> +the above checksum fields refer to the inner header checksum, see
> +the example below.
>  \end{note}
>
>  \item If the driver negotiated
> @@ -534,6 +560,9 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
>      \field{hdr_len} indicates the header length that needs to be replica=
ted
>      for each packet. It's the number of bytes from the beginning of the =
packet
>      to the beginning of the transport payload.
> +    If the \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 b=
it or
> +    VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, \field{hdr_len} accounts=
 for
> +    all the headers up to and including the inner transport.
>      Otherwise, if the VIRTIO_NET_F_GUEST_HDRLEN feature has not been neg=
otiated,
>      \field{hdr_len} is a hint to the device as to how much of the header
>      needs to be kept to copy into each packet, usually set to the
> @@ -554,6 +583,39 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  specifically in the protocol.}.
>     \end{itemize}
>
> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure and the
> +  \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> +  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, the GSO protocol is encaps=
ulated
> +  in a UDP tunnel.
> +  The outer UDP header must not require checksum validation, i.e. the ou=
ter UDP
> +  checksum must be a positive zero (0x0) as defined in UDP RFC 768.
> +  The other tunnel-related fields indicate how to replicate the packet
> +  headers to cut it into smaller packets:
> +
> +  \begin{itemize}
> +  \item \field{outer_th_offset} field indicates the outer transport head=
er within

Do we need to clarify if "outer" here means outmost? Or we are
assuming a 1 level of encapsulation here. We probably need more
clarification in either cases.

> +      the packet. This field differs from \field{csum_start} as the latt=
er
> +      points to the inner transport header within the packet.
> +
> +  \item \field{inner_nh_offset} field indicates the inner network header=
 within
> +      the packet.
> +  \end{itemize}
> +
> +\begin{note}
> +For example, consider a partially checksummed TCP (IPv4) packet carried =
over a
> +Geneve UDP tunnel (again IPv4) with no tunnel options. The
> +only relevant variable related to the tunnel type is the tunnel header l=
ength.
> +The packet will have a 14 byte outer ethernet header, 20 byte outer IP h=
eader
> +followed by the 8 byte UDP header (with a 0 checksum value), 8 byte Gene=
ve header,
> +14 byte inner ethernet header, 20 byte inner IP header
> +and the TCP header (with the TCP checksum field 16 bytes
> +into that header). \field{csum_start} will be 14+20+8+8+14+20 =3D 84 (th=
e TCP
> +checksum includes the header), \field{csum_offset} will be 16.
> +\field{inner_nh_offset} will be 14+20+8+8+14 =3D 62, \field{outer_th_off=
set} will be
> +14+20+8 =3D 42 and \field{gso_type} will be
> +VIRTIO_NET_HDR_GSO_TCPV4 | VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 =3D 0x21
> +\end{note}
> +
>  \item \field{num_buffers} is set to zero.  This field is unused on trans=
mitted packets.
>
>  \item The header and packet are added as one output descriptor to the
> @@ -598,6 +660,29 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>  \field{gso_type}.
>
> +If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUN=
NEL_IPV6 bit
> +in \field{gso_type} according to the inner network header protocol type
> +to request TCP or UDP GSO packets over UDPv4 or UDPv6 tunnel
> +segmentation, otherwise the driver MUST NOT set either the
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUN=
NEL_IPV6 bit
> +in \field{gso_type}.
> +
> +When requesting TCP or UDP GSO segmentation over UDP tunnel,

I wonder if we can just remove this as

1) if we want to support other type of GSO in the future, we need to
add those types back to here
2) it only matters with the inner network protocol type

Other looks good.

Thanks

