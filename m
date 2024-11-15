Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB681D61A1
	for <virtio-comment@lists.linux.dev>; Fri, 15 Nov 2024 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731692692; cv=none; b=YW7qmlTTrw2A/nEeyAXIAgu2OgYFBqlpkYPJBe3v3Tx67g+hOII+ROega/bDsYETJ/RUuXMWHXDm9WCyVXhLB8pkREyDq7ae2GPh9BrYBkpsgR9Zluv4PcKE8gDvAryyCMiTDoTpNfmHSXglooEKhP6fkHR3iQ67h35iPipWzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731692692; c=relaxed/simple;
	bh=u9j9jQKF+d2LrjZwv9umv07mo//oq9AI5YN5Osa+Cvg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CSgoT1W3/Ii/YYE90vYAkrTfFJuXiAv8zS8D8yEn17OnRaK7qVRdImq8JkyhMHC/Du5OTVk+zjyRo+rak01qtjhUcbx/XssM2e8ZoCJ4rmUddnCH3haGGj5xsh8ydt4hDMIgqp5VgmGrYKeFPwZyFfW1utbVls/p12FWTDn1EjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VdUQ8sGB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VdUQ8sGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731692688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1b2czIMOUssMofVQs2v0sfIWgLyy7yQeut1wTzteNY0=;
	b=VdUQ8sGB6ZwU77uhH6ZQfKzSurlCiNJn69gX0XBfVCa/ajSJK0Kg+ZjcC+GI5TPe0Vm7kv
	N5yWfd9+b/csHIBII2l5Djx46rt+E0eEFMnYxdq6Qzx9Pb2D6kGMu96MXYyAeZMXIkkyve
	cBVWW3rnf1/UZD96guuq5NVEX6Fzh00=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-Njc4ZMIOObizOVtTZxmunQ-1; Fri, 15 Nov 2024 12:44:47 -0500
X-MC-Unique: Njc4ZMIOObizOVtTZxmunQ-1
X-Mimecast-MFC-AGG-ID: Njc4ZMIOObizOVtTZxmunQ
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-539ec1a590fso1757785e87.0
        for <virtio-comment@lists.linux.dev>; Fri, 15 Nov 2024 09:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731692685; x=1732297485;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1b2czIMOUssMofVQs2v0sfIWgLyy7yQeut1wTzteNY0=;
        b=n/oLtkSQVyM05cFY505CPH8ZxXTQAByuyXff9drstxkg3r+NoYGuOAWuLzRemk1WT7
         37lAsBkitwpj6yeIo40BybYXs7cIeJ50xzWt8a06h221U4YjLnEKBNzOdDdh9mJ+1I27
         KfRLy5SJuKw2HIbHeyBdm807GztokUF9re679uoHqHlFimushkQOSQE/qYBMek8K77kT
         N8VOhIGmpXNsIXB5kbEdkug21UloyGWuTP44D7tkyC/jEnQvKU+3Ztx9newMdaQXVjzO
         N30OEDUHkDlzfxKqu0YNia0sgSsIZQ84PkHe2HtiddAAjyWYj9RCt5zZtHma5AhYQcg1
         VmRA==
X-Gm-Message-State: AOJu0Yz0fNNQIq0gVl3g3VVe0bm8BUzZF8ZEE9nIa3D/l+Bv87ZHFifT
	+CNIi8YGE8FZVt6KJyKNUPC5Jt7nXiHq9sL6HHW5JT7RIkBld9KMLnP2TNBmWImv/Ix9Ox4Q5NX
	Vzp3JtIx637WwbG4nzzMxXKw5XIY50n2bUQ1fB7JIDjlrfPHFrq/MkHKuBAe+PFX5gtiXqG1TJY
	pX9w251Pz2x5BdJGsYADEJnY6/tyxOWUws0R9+3fOtZ/ZGkTya
X-Received: by 2002:a05:6512:4012:b0:539:e4b5:10e5 with SMTP id 2adb3069b0e04-53dab2926e6mr1925855e87.9.1731692685246;
        Fri, 15 Nov 2024 09:44:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7exG9BAyRfAHCTaHp9WH3tIFoFNcB+LZbhnEbznpaj7f+pbLTCoYaH/pnVyIgsONc7Ez8wQ==
X-Received: by 2002:a05:6512:4012:b0:539:e4b5:10e5 with SMTP id 2adb3069b0e04-53dab2926e6mr1925837e87.9.1731692684583;
        Fri, 15 Nov 2024 09:44:44 -0800 (PST)
Received: from [192.168.88.24] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da280018sm64615415e9.26.2024.11.15.09.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 09:44:44 -0800 (PST)
Message-ID: <76709a7a-4c02-4bbc-b9bc-4f1105cda660@redhat.com>
Date: Fri, 15 Nov 2024 18:44:42 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] virtio-net: define UDP tunnel offload
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1731084277.git.pabeni@redhat.com>
In-Reply-To: <cover.1731084277.git.pabeni@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jdm9I5t2flaMgr70Krz8RKZ7ESYjHeY1UgF5XnJa1pc_1731692686
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/24 17:52, Paolo Abeni wrote:
> UDP tunnel usage is ubiquitous in container deployment, and the ability
> to offload UDP encapsulated GSO traffic impacts greatly the performances
> and the CPU utilization of such use cases.
> 
> This series includes:
> - a clarification on the current semantic of
> NEEDS_CSUM offload (patch 1) to make later changes easier to follow,
> - new features definition to handle both UDP tunnel segmentation
> offload (patch 2).
> - new features definition to handleUDP tunnel outer checksum offload
> (patch 2).
> 
> A PoC implementation is available here:
> 
> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v10/
> https://github.com/pabeni/qemu/tree/virtio_tunnel_gso_v9
> 
> Note that the user-space implementation has not been updated since
> the previous iteration, since the kernel changes are transparent to it.
> 
> Changes from v9:
> - added patch 1
> - clarified that 'hdr_len' accounts for the inner header for GSO over
> UDP tunnel packets
> - DATA_VALID is not be allowed for GSO over UDP tunnel packets.
> https://lore.kernel.org/virtio-comment/cover.1728029499.git.pabeni@redhat.com/

As a reference this is the cumulative diff WRT v9:

diff --git a/device-types/net/description.tex
b/device-types/net/description.tex
index 48e0f5e..7ca0fc2 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -582,6 +582,9 @@ \subsubsection{Packet Transmission}\label{sec:Device
Types / Network Device / De
     \field{hdr_len} indicates the header length that needs to be replicated
     for each packet. It's the number of bytes from the beginning of the
packet
     to the beginning of the transport payload.
+    If the \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
bit or
+    VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, \field{hdr_len}
accounts for
+    all the headers up to and including the inner transport.
     Otherwise, if the VIRTIO_NET_F_GUEST_HDRLEN feature has not been
negotiated,
     \field{hdr_len} is a hint to the device as to how much of the header
     needs to be kept to copy into each packet, usually set to the
@@ -712,8 +715,10 @@ \subsubsection{Packet
Transmission}\label{sec:Device Types / Network Device / De
 The driver MUST NOT send to the device TCP or UDP GSO packets over UDP
tunnel
 requiring segmentation and outer UDP checksum offload, unless both the
 VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and
VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM features
-are negotiated, in which case the driver MUST set the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL
-bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM
bit in the \field{flags}.
+are negotiated, in which case the driver MUST set either the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+the \field{flags}.

 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM is not negotiated, the driver
MUST not set
 the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and
@@ -738,6 +743,13 @@ \subsubsection{Packet
Transmission}\label{sec:Device Types / Network Device / De
 \item the driver MUST validate the packet checksum at
 	offset \field{csum_offset} from \field{csum_start} as well as all
 	preceding offsets;
+\begin{note}
+If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE and the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+bit are not set in \field{gso_type}, \field{csum_offset}
+points to the only transport header present in the packet, and there are no
+additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
+\end{note}
 \item the driver MUST set the packet checksum stored in the
 	buffer to the TCP/UDP pseudo header;
 \item the driver MUST set \field{csum_start} and
@@ -763,7 +775,10 @@ \subsubsection{Packet
Transmission}\label{sec:Device Types / Network Device / De
 \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
 	and \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE,
 	the driver MUST set \field{hdr_len} to a value equal to the length
-	of the headers, including the transport header.
+	of the headers, including the transport header. If \field{gso_type}
+	has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+	VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, \field{hdr_len} includes
+	the inner transport header.

 \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
 	or \field{gso_type} is VIRTIO_NET_HDR_GSO_NONE,
@@ -988,17 +1003,10 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network
 \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
   VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
   set: if so, device has validated the packet checksum.
-  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature has been negotiated,
-  and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
-  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
-  the device can additionally set the VIRTIO_NET_HDR_F_DATA_VALID bit
-  in \field{flags}, meaning that the device validated the checksum,
-  set the csum_start and csum_offset fields, but did not provide the
-  partial checksum for the transport header.
   If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been
negotiated,
   and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
   both the outer UDP checksum and the inner transport checksum
-  have been validated, otherwise only one level of checksums (the inner one
+  have been validated, otherwise only one level of checksums (the outer one
   in case of tunnels) has been validated.
 \end{enumerate}

@@ -1025,10 +1033,15 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network
   from \field{csum_start} and any preceding checksums
   have been validated.  The checksum on the packet is incomplete and
   if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in \field{flags},
-  then \field{csum_start} and \field{csum_offset} indicate how to
calculate it.
-  If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
-  bit are set, the \field{csum_start} field
-  refers to the inner transport header offset (see Packet Transmission
point 1).
+  then \field{csum_start} and \field{csum_offset} indicate how to
calculate it
+  (see Packet Transmission point 1).
+\begin{note}
+If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE and the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+bit are not set, \field{csum_offset}
+points to the only transport header present in the packet, and there are no
+additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
+\end{note}
 \item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO option was negotiated and
   \field{gso_type} is not VIRTIO_NET_HDR_GSO_NONE, the
   VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
@@ -1037,13 +1050,21 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network
   headers information.
 \item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature was
 negotiated, and
-  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set in \field{gso_type}, the
-  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} can be set:
if so,
-  the outer UDP checksum has been validated.
-  If the VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} is not set,
the UDP
-  header checksum at offset 6 from from \field{outer_th_offset}
+  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+  are set in \field{gso_type}, the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit
in the
+  \field{flags} can be set: if so, the outer UDP checksum has been
validated
+  and the UDP header checksum at offset 6 from from \field{outer_th_offset}
   is set to the outer UDP pseudo header checksum.

+\begin{note}
+If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+bit are set in \field{gso_type}, the \field{csum_start} field refers to
+the inner transport header offset (see Packet Transmission point 1).
+If the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags} is set both
+the inner and the outer header checksums have been validated by
+VIRTIO_NET_HDR_F_NEEDS_CSUM, otherwise only the inner transport header
+checksum has been validated.
+\end{note}
 \end{enumerate}

 If applicable, the device calculates per-packet hash for incoming
packets as
@@ -1148,7 +1169,9 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network
 If one of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options have
 been negotiated, the device SHOULD set \field{hdr_len} to a value
 not less than the length of the headers, including the transport
-header.
+header. If \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit
+or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, the referenced transport
+header is the inner one.

 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
@@ -1157,19 +1180,19 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network
 been negotiated, and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit set in
 \field{flags}, both the outer UDP checksum and the inner transport
 checksum have been validated, otherwise only one level of checksums
-(the inner one in case of tunnels) has been validated. \note{This implies
-that if either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+(the outer one in case of tunnels) has been validated.
+
+If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
-and the set the VIRTIO_NET_HDR_F_DATA_VALID in \field{flags} is set,
-the the VIRTIO_NET_F_GUEST_CSUM bit in \field{flags} is must be set, too}
+the device MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID bit in
+\field{flags}.

 If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated
 and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit is set or the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is set in \field{gso_type}, the
 device MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
-\field{flags}, if so and the VIRTIO_NET_F_DATA_VALID bit in \field{flags}
-is not set, the device MUST set the packet outer UDP checksum stored in the
-receive buffer to the outer UDP pseudo header.
+\field{flags}, if so the device MUST set the packet outer UDP checksum
+stored in the receive buffer to the outer UDP pseudo header.

 Otherwise, the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been
 negotiated, either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit is set or the
@@ -1212,13 +1235,15 @@ \subsubsection{Processing of Incoming
Packets}\label{sec:Device Types / Network
 the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
and any of
 the following is true:
 \begin{itemize}
-\item the VIRTIO_NET_HDR_F_NEEDS_CSUM is not set in \field{flags}
+\item the VIRTIO_NET_HDR_F_NEEDS_CSUM bit is not set in \field{flags}
+\item the VIRTIO_NET_HDR_F_DATA_VALID bit is set in \field{flags}
 \item the \field{gso_type} excluding the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
 bit and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is
VIRTIO_NET_HDR_GSO_NONE
 \end{itemize}
 the driver MUST NOT accept the packet.

-If the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags} is set,
+If the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit and the
VIRTIO_NET_HDR_F_NEEDS_CSUM
+bit in \field{flags} are set,
 and both the bits VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 and
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 in \field{gso_type} are not set,
 the driver MOST NOT accept the packet.

