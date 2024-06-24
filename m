Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D36FB1
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719198509; cv=none; b=Iehvk1WCJDTt3CvGSy0TdKi+CZrY0ITyaCVtpho5vhsY3owm6q1o5VhdYWHRI9RddfLPQjxlVruW9hMrUkI+pX2Qdr4w0byDv9Em03CzFj41OU132rxKftXo4cwh4OAiqT0T0fSz5VxTAHdCMBVi8mGHwx83DE2VhLE9452Sfmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719198509; c=relaxed/simple;
	bh=gIyCHMzKzhzzadSgCt9Fnz64vZVPV5tThCoHdkIz8js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6Kj0aYYEpXGgUn/D3VyCrDpyvh5wMDiQX4bZiELcBFFOvKE1QbZj0J3JOoW+Q8cFXkO674eZpUuZ/ZtZHatToGM2JnvtJA9hOmR++gRCj0c+QIE6uV519zsW91nJLgH2S/Ol33HskcZlHk4kOO9P4bC6xTNG5AkOMXMVY7opVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AjYfI4e9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AjYfI4e9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719198505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zwhuVq2sowfP9UMIchzNpgYJCgYH28beiO+aQzPrWXk=;
	b=AjYfI4e9hBrRMF83G9XxHzWK8JzLPOQU61do+Nuq2xxazryoczrAG2fakDk0MxE8eUj8pa
	614AajEsIvpIkBZNoTju06Q0cbaaCBfGhgt7jw4wGGbU9RYMajeiCwOZsFr2t4tt8AvBtf
	dyyxNKvlM6Ip1KXb8TpyP6hAC5QI7CI=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-PbqURGDQPwaz6mhp1q9MMg-1; Sun, 23 Jun 2024 23:08:07 -0400
X-MC-Unique: PbqURGDQPwaz6mhp1q9MMg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2c1a9e8d3b0so5010433a91.0
        for <virtio-comment@lists.linux.dev>; Sun, 23 Jun 2024 20:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719198486; x=1719803286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwhuVq2sowfP9UMIchzNpgYJCgYH28beiO+aQzPrWXk=;
        b=NETF6FJfgvteQhDNzORwUHed9V716zfRix/bcl3nakVS8F3ovRsDcUpL+vc3SK9ZnD
         gZEpac/w/5D9r1/D3BMSMPgCbq9l02kbvnkDL/7aSQkkGUorX9FSpsCN56NRBhSxtZXj
         f58fuUfKEIYh9/BxoCbCbvUkV3NrLl9qIrYgRLcJBpe81i9xWLx6PJo54aplktmt87WG
         OYD7OYDhoxw0uphwZsB85+Q5kc04JE+LHVeVjiBuT5wJ4BTmXVN9wUX16LTYrhnRe/Z0
         gZKjMtcXJl35nVcPGX35A/0eDyEZiLD/x43GJMhvr93Tqn9jhVhuQJh3+vTyZwUpnbRs
         EC4Q==
X-Gm-Message-State: AOJu0Yzh5lgjZNKbWlX55RWxHTDv4JwDPcF9MEN2E212+ow2G+l2Uuzq
	2kjNmoMtGn0HcCzMS6XIGZPXUWj8FzI5AlcfUmoQu4+Bqp14/+yTrCRG5CqwU/Xxammlsu9UMsA
	/GvlQUavjUfJK23hjUNFN4bkeGLgIQoRgj+Xxpub97tvrShI1ih9LSVfdszyzzNfNXGoSfWdfC9
	KSgktHe6gH+8bExrdWKixkiW/eAa0uno3vgVdH7kk=
X-Received: by 2002:a17:90b:1b0f:b0:2c8:3f5:3937 with SMTP id 98e67ed59e1d1-2c858208ff4mr3012691a91.28.1719198486057;
        Sun, 23 Jun 2024 20:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlIuAqEVk3oKQP8HYZgJGULz3n5KB2e4NNsDyzT5xkvQcp94ZhNPWJrDUMMO3UOAILfBb/M9K9dd2MsWIlEG8=
X-Received: by 2002:a17:90b:1b0f:b0:2c8:3f5:3937 with SMTP id
 98e67ed59e1d1-2c858208ff4mr3012677a91.28.1719198485481; Sun, 23 Jun 2024
 20:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
In-Reply-To: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 24 Jun 2024 11:07:54 +0800
Message-ID: <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 6:52=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
> UDP tunnel. It can be negotiated on both the host and guest sides.
>
> UDP tunnel usage is ubiquitous in container deployment, and the ability
> to offload UDP encapsulated GSO traffic impacts greatly the performances
> and the CPU utilization of such use cases.
>
> One constraint addressed here is that the virtio side (either device or
> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> completely the inner and outer headers offset - to allow for later GSO.
>
> To accommodate such need, new optional fields are introduced in the
> virtio_net header: outer_th_offset, inner_protocol, inner_mac_offset,
> inner_nh_offset. They map directly to the corresponding header
> information. The inner transport header is implied by the (inner)
> checksum offload.

Does this mean csum_start in the vnet header actually?

>
> The checksum offload for the outer header is negotiated with a separate
> feature and only for GSO over UDP tunnel packets. Computing the outer
> header checksum is cheap: due to the inner checksum only data in between
> the outer and the inner transport header must be accounted[1].
>
> The GSO over UDP tunnels packets are allowed even when the outer header
> csum offload is not supported, if the outer UDP header has zero csum
> or the GSO packet size is an integer multiple of the gso_size. In such
> later case the outer UDP header checksum can be computed independently
> prior to the segmentation step, do to [1].
>
> Migration for GSO_UDP_TUNNEL-enabled-VMs should be managed alike other
> types of GSO offload: VMs that has negotiated UDP tunnel GSO and
> checksum offload could be migrated only on hosts supporting such
> features.
>
> Note that there is no concept of UDP tunnel type negotiation (e.g.
> vxlan, geneve, vxlan-gpe, etc.). That is intentional because:
> - given the information carried by the guest or host kernel, it's
>   impossible to probe reliably the UDP tunnel type. Specifically, the
>   outer UDP port numbers give a hint, but peers could use nonstandard
>   ones.
> - all the existing UDP tunnel protocols behave the same way WRT GSO
>   offload, carrying an immutable header on top of the outer transport
>   one.
> - if a new UDP tunnel protocol, carring packet dependant information
>   alike the inner packet length or csum should surface in the future,
>   the host and guest kernels will need explicit support for it,
>   including new, different GSO features. Additional virtio support
>   should be designed separately.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
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
>  device-types/net/description.tex | 248 ++++++++++++++++++++++++++++++-
>  1 file changed, 240 insertions(+), 8 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 76585b0..d6f9f79 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,18 @@ \subsection{Feature bits}\label{sec:Device Types / Net=
work Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (47)] Driver can receive GSO pac=
kets
> +  carried by an UDP tunnel.
> +
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM (48)] Driver handles packets
> +  carried by an UDP tunnel with partial csum for the outer header.

Could we separate the outer csum into another patch to converge sooner?

> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GSO pack=
ets
> +  carried by an UDP tunnel.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM (50)] Device handles packets
> +  carried by an UDP tunnel with partial csum for the outer header.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash fo=
r encapsulated packets.
>
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notificat=
ion coalescing.
> @@ -133,12 +145,18 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST_TSO=
4, VIRTIO_NET_F_GUEST_TSO6,
> +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.

For "or" I think you meant "and" actually?

> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_GUEST_UD=
P_TUNNEL_GSO
>
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4,=
 VIRTIO_NET_F_HOST_TSO6,
> +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.

Same here.

> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_HOST_UDP_=
TUNNEL_GSO
>
>  \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
> @@ -375,6 +393,16 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>    TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
>    (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) featu=
res.
>
> +\item If any TCP or UDP segmentation feature is negotiated, a driver can
> +  use TCP segmentation or UDP segmentation on top of UDP encapsulation
> +  offload, when the outer header does not require checksumming,
> +  by negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
> +
> +\item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver can
> +  additionally use TCP segmentation or UDP segmentation on top of UDP
> +  encapsulation with the outer header requiring checksum offload,
> +  negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature.
> +
>  \item The converse features are also available: a driver can save
>    the virtual device some work by negotiating these features.\note{For e=
xample, a network packet transported between two guests on
>  the same system might not need checksumming at all, nor segmentation,
> @@ -382,8 +410,10 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>     The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
>    checksummed packets can be received, and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> -  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4
> -  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features =
described above.
> +  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4,
> +  VIRTIO_NET_F_GUEST_USO6, VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
> +  VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM are the input equivalents of
> +  the features described above.
>    See \ref{sec:Device Types / Network Device / Device Operation /
>  Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
>  Device / Device Operation / Setting Up Receive Buffers} and
> @@ -407,12 +437,14 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Network Device / Device O
>  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> +#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8

Not a native speaker but following the name style does
_F_UDP_TUNNEL_NEEDS_CSUM sounds better here?

>          u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE        0
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
>  #define VIRTIO_NET_HDR_GSO_UDP         3
>  #define VIRTIO_NET_HDR_GSO_TCPV6       4
>  #define VIRTIO_NET_HDR_GSO_UDP_L4      5
> +#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL 0x40
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
>          u8 gso_type;
>          le16 hdr_len;
> @@ -423,6 +455,10 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Network Device / Device O
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> +        le16 outer_th_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        le16 inner_protocol;    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        le16 inner_mac_offset;  (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>  };
>  \end{lstlisting}
>
> @@ -480,6 +516,8 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
>  followed by the TCP header (with the TCP checksum field 16 bytes
>  into that header). \field{csum_start} will be 14+20 =3D 34 (the TCP
>  checksum includes the header), and \field{csum_offset} will be 16.
> +If the given packets has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set,
> +the above checksum fields refer to the inner header checksum.

Rethink of the design here, I have one dumb question:

A simple csum_start/csum_offset can work for GSO without tunneling.
Any reason a inner_csum_start/inner_csum_offset (or simply introduce a
copies of other gso related fields in the existing vnet header for
outer packet) can't work for tunneling GSO? I feel if we need to do
thing differently it might a hint of bugs for existing GSO
definitions.

>  \end{note}
>
>  \item If the driver negotiated
> @@ -516,6 +554,59 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  specifically in the protocol.}.
>     \end{itemize}
>
> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure,
> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates th=
at
> +  the GSO protocol is encapsulated in an UDP tunnel. If the outer UDP he=
ader
> +  requires checksumming, the driver must have additionally negotiated th=
e
> +  VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature and offloaded the outer chec=
ksum
> +  accordingly.
> +  The other tunnel-related fields indicate how to replicate the inner pa=
cket
> +  header to cut it into smaller packets:
> +
> +  \begin{itemize}
> +  \item \field{outer_th_offset} field indicates the outer transport head=
er within
> +      the packet. Note that differs from \field{csum_start} as the latte=
r
> +      points to the inner transport header within the packet.
> +
> +  \item \field{inner_protocol} field indicates the ethernet type of the =
inner
> +      protocol.
> +
> +  \item \field{inner_mac_offset} field indicates the inner mac header wi=
thin the packet
> +
> +  \item \field{inner_nh_offset} field indicates the inner network header=
 within
> +      the packet
> +  \end{itemize}

Should we add some words to here to clarify the segmetiaon offload
done here is protocol independent as Willem suggested like PISO:

https://www.opencompute.org/w/index.php?title=3DCore_Offloads#Protocol_Inde=
pendent_Segmentation_Offload

> +
> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM fea=
ture,
> +  the transimitted packet is a GSO one encapsulated in an UDP tunnel, an=
d
> +  the outer UDP header requires checksumming, the driver can skip it:
> +
> +  \begin{itemize}
> +  \item \field{flags} has the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM set,
> +
> +  \item \field{outer_th_offset} correspond to the outer checksum start a=
nd
> +      implies the outer checksum offset: the outer transport header is U=
DP,
> +      so the outer checksum offset is 6.
> +
> +  \item The outer UDP checksum field in the packet is set to the sum
> +    of the UDP pseudo header, so that replacing it by the ones'
> +    complement checksum of the outer UDP header and payload will give th=
e
> +    correct result.
> +  \end{itemize}
> +
> +\begin{note}
> +  Transmitting GSO packets carried by UDP tunnel is still possible even =
without
> +  the outer UDP header checksum offload:
> +  \begin{itemize}
> +    \item when the outer UDP checksum is not required, that is, when the=
 outer UDP
> +      checksum is zero.
> +    \item when the GSO packet size is equal to a multiple of \field{gso_=
size}. In such
> +      case the outer UDP checksum is indepenent from the actual packet c=
ontents and
> +      the driver computes the individual segment full outer UDP checksum=
 prior
> +      to the segmentation itself.
> +  \end{itemize}
> +\end{note}
> +
>  \item \field{num_buffers} is set to zero.  This field is unused on trans=
mitted packets.
>
>  \item The header and packet are added as one output descriptor to the
> @@ -557,6 +648,34 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>  \field{gso_type}.
>
> +The driver MUST NOT send to the device TCP or UDP GSO packets over UDP t=
unnel
> +requiring segmentation offload, unless the VIRTIO_NET_F_HOST_UDP_TUNNEL_=
GSO is
> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_UDP=
_TUNNEL
> +bit in the \field{gso_type}.
> +
> +The driver MUST NOT send to the device TCP or UDP GSO packets over UDP t=
unnel
> +requiring segmentation and outer UDP checksum offload, unless both the
> +VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM f=
eatures
> +are negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO=
_UDP_TUNNEL
> +bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit=
 in the \field{flags}.
> +
> +If VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM is not negotiated, the driver MUST =
not set
> +the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and, in ca=
se of GSO
> +packets carried over an UDP tunnel, MUST either supply the full checksum=
 for the
> +outer UDP header to the device or such checksum MUST be zero.
> +
> +\begin{note}
> +Is possible to supply the full checksum for the outer UDP header for
> +GSO packets over UDP tunnel, only when the GSO packet size is an integer
> +multiple of \field{gso_size}.

I may miss something but any reason we need this?

> +\end{note}
> +
> +The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL together with
> +VIRTIO_NET_HDR_GSO_UDP.
> +
> +The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \field{=
flags}
> +without setting the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO bit in \field{gso_t=
ype}.
> +
>  If the VIRTIO_NET_F_CSUM feature has been negotiated, the
>  driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags}, if so:
> @@ -598,6 +717,45 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>         header.
>  \end{itemize}
>

[...]

Thanks

