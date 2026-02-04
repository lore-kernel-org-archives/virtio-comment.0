Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A31CF7D5
	for <virtio-comment@lists.linux.dev>; Wed,  4 Feb 2026 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770170739; cv=none; b=sYq6TBgoRuZ2dxljxtuehvnxazRJuBojJPt7Ce6+1SeO+Hp1bSOwr+d1s7Dd2RnNrMf8L6mX/QPI8ojMbQBQslpV9MZmDeCx0O9PeQxmQCR+uaoWGC5C1dIbGhlKLQh/xEwDwSRrTsdE2v2F0NqaDPZmy4UYuKcMi81Aj1fHWhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770170739; c=relaxed/simple;
	bh=jnkCe2WclzbiWbmise1gexIT/OW4Gc8ZCDW53vEOelM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BB01YB5pQCKk8vw/718Guwloe2m3GyZSUYv8/OmmXEEkvpHYXHnHe/cnBkhkQM6Mi/S/62fRyRX8kr/AGkHK/Uf0m0fuooZ8e2wiIWbjrinYGu9D1CaEjJA7PFg6p6KEGQoxAy9D5aVW16AV4fJ1IM69oY1WOERUlcnXHdichcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HkJdDXPZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HkJdDXPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770170736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kEseKV+iQoOWEpk0L41jiQ+m4ssaTHUZw50/aQNbwHY=;
	b=HkJdDXPZgFc0loQLxCTt6miBVabykWnuM96x+fVSr03x5hQzCJFAIgaajsrekFekTnIbK0
	lx8HcNCR54iEHfxkojPxqTSfhjsrwIqwJrw3iKX/kyzyYocwe5LRFdMnNHk1zctODANtPa
	/ZPkGnn33jANuTHRuclMNkQ/mpW5zXw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-6-BFGRSCOviHEQN2uyytXA-1; Tue, 03 Feb 2026 21:05:35 -0500
X-MC-Unique: 6-BFGRSCOviHEQN2uyytXA-1
X-Mimecast-MFC-AGG-ID: 6-BFGRSCOviHEQN2uyytXA_1770170734
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7701b6353so63095075ad.3
        for <virtio-comment@lists.linux.dev>; Tue, 03 Feb 2026 18:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770170734; x=1770775534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kEseKV+iQoOWEpk0L41jiQ+m4ssaTHUZw50/aQNbwHY=;
        b=E+6pBOWVENAy8DuaSR1/BrEEw+MLN0JEWQcKi7BZgRU/A9JOdB+9uYZFyYIwzBwzG1
         hkGqFssGNXXadZ8fQ2NuA5YBgqvTUH9yJ231kVaQNaWdsn3G1CwEqt+NFJl1uJvTiXOM
         +ym2LLwptqEKGsfWv1wZWAxpbgWEG2RzK46ms7MtFxwpELWWM7N9HDAkvZV2LJN9IJk9
         R1FQCqHMyvzVCUewbdDukI8rSu2/AYtrTti6q7MIBZtmvvnOJhAdA/6SnMkAuMnVXnLU
         wk5R/OnYmzzQRniGY+/RLQ24DxtDH56/vxG+7b6ylUPbiNSD31jg8hvD91yYHqk22PTf
         IlBA==
X-Forwarded-Encrypted: i=1; AJvYcCVH0GP1vYuRRCwPNMz7ej0BLVZp9TCijVY6fsnjGcrQ74TV8o6qW0mCEkjpg9Z1C8+6hSW+N5JSe5GPru7q+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8EeMe8eib4YcCz4aJROgzZLMjdVTK93jLqmmRxTKNDKA9lvm1
	32+LUbVyDoXJ082RZQvPZiWYqDnA0wppd/L5yQPU5KvgO4VRLxckF9rRMeEY8hr9h/Cm8WYR+RN
	Cqk4/z0yCJrs/qIfvF5Wgz15sZPz+GWNTyGetQ2cJcpvnv5xxqb2D1GP7/IeWm2CkcZVzPL45W5
	iv9TJJ7TXsf0ZBwoNLdAew7t9SEmgoGtC2MJ/+kQZ8ylA=
X-Gm-Gg: AZuq6aJMOMlX48nRZhf5lyD3ptYgPmHgGfBgw0DqxdgwOsyLq/ljmgInBpndeEFABt5
	1BLg7wTu2SwbV0NarVBPRuHVRGa7FcXV6paXDsZ5JkuxwBXQ9e0dlaH9VrABsuCT1gKTT0nxvGZ
	IPXlIEIoQnOACHKd/k4AuLXCNix6ftz0YeRAQ/ifvTNIbeZQ5O8AaAFvyJyJeMJOh5U/0=
X-Received: by 2002:a17:903:191:b0:2a7:8bf3:5677 with SMTP id d9443c01a7336-2a9341371b8mr12528055ad.59.1770170734058;
        Tue, 03 Feb 2026 18:05:34 -0800 (PST)
X-Received: by 2002:a17:903:191:b0:2a7:8bf3:5677 with SMTP id
 d9443c01a7336-2a9341371b8mr12527655ad.59.1770170733604; Tue, 03 Feb 2026
 18:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203162134.2765-1-chia-yu.chang@nokia-bell-labs.com> <20260203162134.2765-2-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260203162134.2765-2-chia-yu.chang@nokia-bell-labs.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 4 Feb 2026 10:05:22 +0800
X-Gm-Features: AZwV_QhpfOlArF4qVZkWJ_mbxqh_54ScP-hvgaFIHrubaewqgommc1JsJK35eaU
Message-ID: <CACGkMEuN2=bK5X43Dd4mx3eV8zTujPH6amOVYXR1=atd6SDb3g@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] virtio-net: Clarify ECN and GSO_ECN descriptions
To: chia-yu.chang@nokia-bell-labs.com
Cc: parav@nvidia.com, virtio-comment@lists.linux.dev, mst@redhat.com, 
	cohuck@redhat.com, mvaralar@redhat.com, xuanzhuo@linux.alibaba.com, 
	eperezma@redhat.com, ij@kernel.org, ncardwell@google.com, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XxtZllazhRGgxS4n70kgUthbM_S1va9_ZI1QaEMhHAE_1770170734
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 12:21=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> The existing specification that describing VIRTIO_NET_F_*_ECN and
> VIRTIO_NET_HDR_GSO_ECN can be misinterpreted as reffering to the IP ECN
> field. In reality, VIRTIO_NET_HDR_GSO_ECN corresponds to the TCP CWR flag
> and indicates that segment offload must follow the rules defined in
> RFC3168 Section 6.1.2: the first emitted segment retains the CWR flag,
> and all subsequent segments must clear it.
>
> This patch updates ECN feature descriptions and the transmit/receive
> requirements to accurately reflect the intended behavior explicitly
> specified in RFC3168.
>
> For detailed requirements, see RFC3168:
> https://datatracker.ietf.org/doc/html/rfc3168
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 35 +++++++++++++++++---------------
>  introduction.tex                 |  3 +++
>  2 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index da9ff17..0da8f9f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / Netw=
ork Device / Feature bits
>
>  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
>
> -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with the CWR fl=
ag set
> +    and follow the requirements of the CWR bit described in
> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC31=
68]}.
>
>  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
>
> @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types / Netw=
ork Device / Feature bits
>
>  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
>
> -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with the CWR fl=
ag set
> +    and follow the requirements of the CWR bit described in
> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC31=
68]}.
>
>  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
>
> @@ -729,9 +733,10 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>      header (ie. MSS).
>
>    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> -    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> -    indicates that the TCP packet has the ECN bit set\footnote{This case=
 is not handled by some older hardware, so is called out
> -specifically in the protocol.}.
> +    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type} indicates that th=
e TCP packet
> +    has the CWR flag set and follows the requirements of the CWR flag de=
scribed in
> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC31=
68]}.
> +    \footnote{This case is not handled by some older hardware, so is cal=
led out specifically in the protocol.}.
>     \end{itemize}
>
>  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure and the
> @@ -828,10 +833,9 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
>
>  The driver SHOULD NOT send to the device TCP packets requiring segmentat=
ion offload
> -which have the Explicit Congestion Notification bit set, unless the
> -VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
> -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> -\field{gso_type}.

I wonder if it's better to have some compatibility description here
instead of removing the old ECN completely.

> +which need to follow the CWR flag requirements described in ``Section 6.=
1.2. The TCP Sender''
> +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN=
 feature is
> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN=
 bit in \field{gso_type}.
>
>  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUN=
NEL_IPV6 bit
> @@ -1168,9 +1172,9 @@ \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device Types / Network
>  \end{enumerate}
>
>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> -and ECN features enable receive checksum, large receive offload and ECN
> -support which are the input equivalents of the transmit checksum,
> -transmit segmentation offloading and ECN features, as described
> +and ECN features enable receive checksum, large receive offload and RFC3=
168
> +ECN support which are the input equivalents of the transmit checksum,
> +transmit segmentation offloading and RFC3168 ECN features, as described
>  in \ref{sec:Device Types / Network Device / Device Operation /
>  Packet Transmission}:
>  \begin{enumerate}
> @@ -1273,10 +1277,9 @@ \subsubsection{Processing of Incoming Packets}\lab=
el{sec:Device Types / Network
>  the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
>
>  The device SHOULD NOT send to the driver TCP packets requiring segmentat=
ion offload
> -which have the Explicit Congestion Notification bit set, unless the
> -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
> -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> -\field{gso_type}.
> +which need to follow the CWR flag requirements described in ``Section 6.=
1.2. The TCP Sender''
> +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_EC=
N feature is
> +negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN=
 bit in \field{gso_type}.
>
>  If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
>  set the \field{outer_nh_offset} to nonzero value to indicate outer netwo=
rk header offset,
> diff --git a/introduction.tex b/introduction.tex
> index 9a9cbde..ddbad93 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -186,6 +186,9 @@ \section{Normative References}\label{sec:Normative Re=
ferences}
>         \phantomsection\label{intro:UTC-SLS}\textbf{[UTC-SLS]} &
>      UTC with Smoothed Leap Seconds (UTC-SLS)
>         \newline\url{https://www.cl.cam.ac.uk/~mgk25/time/utc-sls/}\\
> +       \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) =
to IP'', September 2001.
> +       \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
>  \end{longtable}
>
>  \section{Non-Normative References}
> --
> 2.34.1
>

Thanks

