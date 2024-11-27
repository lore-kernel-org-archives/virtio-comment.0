Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F3A95E
	for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732700895; cv=none; b=A0FlppcYGnYKx/e3qUwv7hCJRNHczuE01ZpWHKupw2YrCZm6XlOl5IwKcVaes46hghlIMyauO/yFOi9+tmJ8D8dUF7wYVEDTNcwkJwIAQdMmPadkTCZCEmWfP4derLifw3Gd7c0qFS5RTGeGNf0+zeG0S2JgXl4d7vHUYsCm6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732700895; c=relaxed/simple;
	bh=1OklbZ4ZcZhZf9HwiDX3RWCOfRn5uWiWET71ElJExww=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qQIu1/ZghG7A01SnuuChjBwPggGOH/OqZ55DkWON54p9GWuFKLYPZw5iHWGsINvNwDrQrx9AifJubu2g71kTj35E971D+4wfZuv/kSPiGbon6evA+rFhHR5AqCkwkD8n/1bXgYi0t9K1IKVUNgToypzHHoztj/28gaeLU5EzVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EoG24R1M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EoG24R1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732700892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+ldeG/CzBzKX9S+SKa2+8f4ya2+OBeiWqQGSqQLin4=;
	b=EoG24R1MCKt93HaGm8YB1kslzy/j49eZvWfrOvppT/156Yjrf7ndlqN5CGPMb7G2TlPyFD
	qMndougJE4UEe68QAS30zZ2IXJT1FrFFYbNmrFNFQKBeLWY1fGbzHSN3ZVhuHrrzZN9G3R
	6BJjaENt1r+oM7izePJQv0Q3Ksp7f9Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-ZYF2gAo4Mg-wD5qVefcWdA-1; Wed, 27 Nov 2024 04:48:11 -0500
X-MC-Unique: ZYF2gAo4Mg-wD5qVefcWdA-1
X-Mimecast-MFC-AGG-ID: ZYF2gAo4Mg-wD5qVefcWdA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-434a9dce888so4926835e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 01:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732700890; x=1733305690;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+ldeG/CzBzKX9S+SKa2+8f4ya2+OBeiWqQGSqQLin4=;
        b=Xh+TdrA9UD0F7V3Cqp+u6jdLTSfnYSDE3A5LvXp2kwp/+6hMt/6nLqL8/ZVm44DiHf
         aEK8FI0tXDKqlAZN2ia4UenT/UaqOuIOmR6TCvAA/NZzEgm7X4mP/Xe0Tvsl6aJSM5PW
         iMKZiIBNpClBlBoh4nDkpRuQYx6+rwYXLoCBQ0UcTAdzdbdUt6OluEa8vBP8L83NKogC
         Kx+BI0FxA90pGEdJaSAMMPIrH7gKqsOF2CdFsOSoYi2okXwId9J90ZKGHEdiHi8I96kt
         2J1v6C2sMWqAGAKn0cvHj7LG6DM2pak2aWXVbYL+OIzT7WGX86wI5MDV+AyAoND+cFq2
         kI7g==
X-Gm-Message-State: AOJu0YwjYHBPfwWWg8YBi/mU1aEOcVtj+gxhZP0JVUZVhe1UGk9DngwV
	qIfzrHDLLsdDYe0GZp7xJjN4//rolvsi4NP59O20A8ARfBryMLAvpX05pXCfpoD+g+KDwKK2NoL
	D0/s56J1V2LAFSNqyKapUCECt8w9R5Dac2b6IscFwdQNNpKH9orE/uUgrLads+gQ1cgrEOKOnur
	xabc29VXHKYWfpnkwLkxu9xQsMGpUyAcTJTBKEqQoq0tB1/A==
X-Gm-Gg: ASbGncslzMbjcbihvJp5bhM45ECqDNUAjoFDsOilyd/pzqsFnEv4Sw9iELICNpBpfh7
	2DoHlrF3mDheLmdFQ6LLvAb588ZFeDmudSwxwGo6xCBeW3rpY9goXwp2Gmsgv1hv0IlOdoXKng4
	ODHBTokzPA1VvkYZAs1aBARh5yZm1wRIqvPGRCa1wLUR/zTyN0dWvFg8MKP8w6vhUkzgnJ6SH1p
	EOKX5rW6aa5nUh93zyRWdZDs9rP1bYkQbIWuyTSqghNsRWpBb1fIdsazsTmwBW5HNYcZXweHmcO
X-Received: by 2002:a05:600c:3b88:b0:434:a04f:2557 with SMTP id 5b1f17b1804b1-434a9db86dfmr20588545e9.4.1732700889644;
        Wed, 27 Nov 2024 01:48:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoi78n8ggj28eY9Twd6m4pkDxVAgNT9kOLsFIWARvuaZxnDMMuOCFIS9QbZJVxc5anqNcBZQ==
X-Received: by 2002:a05:600c:3b88:b0:434:a04f:2557 with SMTP id 5b1f17b1804b1-434a9db86dfmr20588185e9.4.1732700889079;
        Wed, 27 Nov 2024 01:48:09 -0800 (PST)
Received: from [192.168.88.24] (146-241-60-32.dyn.eolo.it. [146.241.60.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7f79c8sm15522285e9.40.2024.11.27.01.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 01:48:08 -0800 (PST)
Message-ID: <fe15607a-1431-438d-956b-bfec70e94507@redhat.com>
Date: Wed, 27 Nov 2024 10:48:07 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/4] virtio-net: define UDP tunnel offload
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1732699986.git.pabeni@redhat.com>
In-Reply-To: <cover.1732699986.git.pabeni@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w4Aqf4j7I8mL4XiYk4ux_BemyjzDO1Gy3M7pkBQtUCw_1732700890
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/24 10:36, Paolo Abeni wrote:
> UDP tunnel usage is ubiquitous in container deployment, and the ability
> to offload UDP encapsulated GSO traffic impacts greatly the performances
> and the CPU utilization of such use cases.
> 
> This series includes:
> - clarifications on the current semantic of NEEDS_CSUM offload
> (patch 1) and DATA_VALID offload (patch 2) to make later changes easier
> to follow,
> - new features definition to handle both UDP tunnel segmentation
> offload (patch 3).
> - new features definition to handle UDP tunnel outer checksum offload
> (patch 4).
> 
> A PoC implementation is available here:
> 
> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v10/
> https://github.com/pabeni/qemu/tree/virtio_tunnel_gso_v9
> 
> Note that both implementations has not been updated since the previous
> iteration, since there are no additional functional changes in v11.
> 
> Changes from v10:
> - added patch 2
> - clarified only a single encapsulation level is supported (patch 3)
> - s/TCP or UDP GSO packets/GSO packets/ (patch 3)
> - 'to the outer UDP pseudo header' -> 'to the outer UDP pseudo header
>   checksum' (patch 4)
> https://lore.kernel.org/virtio-comment/cover.1731084277.git.pabeni@redhat.com/

As a reference this is the complete diff from v10:
---
diff --git a/device-types/net/description.tex
b/device-types/net/description.tex
index 2d15ca8..efb543f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -412,6 +412,10 @@ \subsection{Device Initialization}\label{sec:Device
Types / Network Device / Dev
   offload, when the outer header does not require checksumming - e.g.
   the outer UDP checksum is zero - by negotiating the
   VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
+  GSO over UDP tunnels packets carry two sets of headers: the outer ones
+  and the inner ones. The outer transport protocol is UDP, the inner
+  could be either TCP or UDP. Only a single level of encapsulation
+  offload is supported.

 \item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver can
   additionally use TCP segmentation or UDP segmentation on top of UDP
@@ -792,17 +796,17 @@ \subsubsection{Packet
Transmission}\label{sec:Device Types / Network Device / De
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
 in \field{gso_type} according to the inner network header protocol type
-to request TCP or UDP GSO packets over UDPv4 or UDPv6 tunnel
-segmentation, otherwise the driver MUST NOT set either the
+to request GSO packets over UDPv4 or UDPv6 tunnel segmentation,
+otherwise the driver MUST NOT set either the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
 in \field{gso_type}.

-When requesting TCP or UDP GSO segmentation over UDP tunnel, the driver
MUST SET the
+When requesting GSO segmentation over UDP tunnel, the driver MUST SET the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit if the inner network header is
IPv4, i.e. the
 packet is a TCPv4 GSO one, otherwise, if the inner network header is
IPv6, the driver
 MUST SET the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit.

-The driver MUST NOT send to the device TCP or UDP GSO packets over UDP
tunnel
+The driver MUST NOT send to the device GSO packets over UDP tunnel
 requiring segmentation and outer UDP checksum offload, unless both the
 VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and
VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM features
 are negotiated, in which case the driver MUST set either the
@@ -812,7 +816,7 @@ \subsubsection{Packet Transmission}\label{sec:Device
Types / Network Device / De

 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM is not negotiated, the driver
MUST not set
 the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and
-MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
+MUST NOT send to the device GSO packets over UDP tunnel
 requiring segmentation and outer UDP checksum offload.

 The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
@@ -892,7 +896,7 @@ \subsubsection{Packet Transmission}\label{sec:Device
Types / Network Device / De
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
 the driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
 \field{flags}, if so the driver MUST set the packet outer UDP header
checksum
-to the outer UDP pseudo header.
+to the outer UDP pseudo header checksum.

 \begin{note}
 calculating a ones' complement checksum from \field{outer_th_offset}
@@ -1148,10 +1152,10 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network

 \begin{note}
 If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
-bit are set in \field{gso_type}, the \field{csum_start} field refers to
+bit are set in \field{gso_type}, the \field{csum_start} field refers to
 the inner transport header offset (see Packet Transmission point 1).
 If the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags} is set both
-the inner and the outer header checksums have been validated by
+the inner and the outer header checksums have been validated by
 VIRTIO_NET_HDR_F_NEEDS_CSUM, otherwise only the inner transport header
 checksum has been validated.
 \end{note}
@@ -1228,7 +1232,7 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network
 	fully checksummed packet;
 \end{enumerate}

-The device MUST NOT send to the driver TCP or UDP GSO packets
encapsulated in UDP
+The device MUST NOT send to the driver GSO packets encapsulated in UDP
 tunnel and requiring segmentation offload, unless the
 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is negotiated, in which case the
device MUST set
 the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
@@ -1238,7 +1242,7 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network
 require checksum offload.

 If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has not been
negotiated,
-the device MUST NOT send the driver TCP or UDP GSO packets encapsulated
in UDP
+the device MUST NOT send the driver GSO packets encapsulated in UDP
 tunnel and requiring segmentation and outer checksum offload.

 If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options
have
@@ -1269,8 +1273,9 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network
 checksum. If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has
 been negotiated, and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit set in
 \field{flags}, both the outer UDP checksum and the inner transport
-checksum have been validated, otherwise only one level of checksums
-(the outer one in case of tunnels) has been validated.
+checksum have been validated.
+Otherwise level of checksum is validated: in case of multiple
+encapsulated protocols the outermost one.

 If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,

