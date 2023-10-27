Return-Path: <virtio-comment-return-7994-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8D1C25B67
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 07:40:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B89AC2B37D
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 07:40:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 936E6986A92
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 07:40:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7B754986A89; Fri, 27 Oct 2023 07:40:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67425986A8A
	for <virtio-comment@lists.oasis-open.org>; Fri, 27 Oct 2023 07:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5cR0JMNpP9Wu6nnN1Qub4w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698392395; x=1698997195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAr/7Yr2Um6dGph1lChujQNmceCXY18StOUdkufiJGY=;
        b=CjPQnpwqO9DpVswfIa/zA0Ca/ReZ5t0TqhkdlcQHA2RPCNFAGbUQ95bziXpl859xue
         jab0BLzzJ81jz7tvc3H+e4e6pYlBsd2ZgVd2F4LvFeIGDLsOSy2yV0l07VRdtOJXb3Wu
         YbaSvWFyvSojeIg/M4EBFmabC+ktbTHlyZEZBHqgT/P01oxYnwHzZPwWNbRpPPKVpbGp
         5pfFB733iKN2WUawc1PleH2S10MynS/9fR86vNQjXwKAXsAqYaIsDYzngtOQKRKivX7Z
         gjOn5Cfe17GyStX2PRqdH2HvQsD8WQ/Qyi/NJ3n+mcR8xqIl6eW/vyGd55LEo7/imUXR
         mDAQ==
X-Gm-Message-State: AOJu0YxjPFYjReDCAppQGmqTylbEcIM5wabWfKgaf1db1qmUeHWp1Ubj
	gN221BVVSm+06hKDTjQy/WYh24GErNrtXsHeYG3M+IlbZxbZoZqdpwLTrGhygSuHFh8y5BUgVnf
	+AW8LOUkV41VHF4Zs47b1lD5yJzUiKAbE1Q==
X-Received: by 2002:a17:907:a0a:b0:9bf:b129:5984 with SMTP id bb10-20020a1709070a0a00b009bfb1295984mr1200819ejc.77.1698392394874;
        Fri, 27 Oct 2023 00:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoy36cx5Amj0WMAYk6fdmOHBjhscjFB1DpuAIuqUuhDWivW+V6136wGbmXpBEdZnPWUjNSIQ==
X-Received: by 2002:a17:907:a0a:b0:9bf:b129:5984 with SMTP id bb10-20020a1709070a0a00b009bfb1295984mr1200806ejc.77.1698392394448;
        Fri, 27 Oct 2023 00:39:54 -0700 (PDT)
Date: Fri, 27 Oct 2023 03:39:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Parav Pandit <parav@nvidia.com>
Message-ID: <20231027032707-mutt-send-email-mst@kernel.org>
References: <fac1080d10df30450e889379b8da2a6db6523c23.1697695970.git.hengqi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <fac1080d10df30450e889379b8da2a6db6523c23.1697695970.git.hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: support distinguishing
 between partial and full checksum

On Thu, Oct 19, 2023 at 02:17:20PM +0800, Heng Qi wrote:
> virtio-net works in a virtualized system and is somewhat different from
> physical nics. One of the differences is that to save virtio device
> resources, rx may receive packets with partial checksum. However, XDP may
> cause partially checksummed packets to be dropped. So XDP loading conflicts
> with the feature VIRTIO_NET_F_GUEST_CSUM.
> 
> This patch lets the device to supply fully checksummed packets to the driver.
> Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the benefits of
> device verification checksum.
> 
> In addition, implementation of some performant devices do not generate
> partially checksummed packets, but the standard driver still need to clear
> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices enable the
> full checksum offloading, then the driver can load XDP without clearing
> VIRTIO_NET_F_GUEST_CSUM.
> 
> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve the above
> situation, which provides the driver with configurable receive full checksum
> offload. If the offload is enabled, then the device must supply fully
> checksummed packets to the driver.
> 
> Use case example:
> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and receive full checksum
> offload is enabled, after XDP processes a packet with full checksum, the
> VIRTIO_NET_HDR_F_DATA_VALID bit is still retained, resulting in the stack
> not needing to validate the checksum again. This is useful for guests:
>   1. Bring the driver advantages such as cpu savings.
>   2. For devices that do not generate partially checksummed packets themselves,
>      XDP can be loaded in the driver without modifying the hardware behavior.
> 
> Several solutions have been discussed in the previous proposal[1].
> After historical discussion, we have tried the method proposed by Jason[2],
> but some complex scenarios and challenges are difficult to deal with.
> We now return to the method suggested in [1].
> 
> [1] https://lists.oasis-open.org/archives/virtio-dev/202305/msg00291.html
> [2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@linux.alibaba.com/
> 
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
> v1->v2:
>     1. Modify full checksum functionality as a configurable offload
>        that is initially turned off. @Jason
> 
>  device-types/net/description.tex | 54 ++++++++++++++++++++++++++++----
>  1 file changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 76585b0..3c34f27 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>  
> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (50)] Driver handles packets with full checksum.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash for encapsulated packets.
>  
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notification coalescing.
> @@ -133,6 +135,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
>  
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.

What about all of these:

device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.



can TSO/UFO/USO work with VIRTIO_NET_F_GUEST_FULL_CSUM as opposed to VIRTIO_NET_F_GUEST_CSUM?


> @@ -390,6 +393,13 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>  \ref{sec:Device Types / Network Device / Device Operation /
>  Processing of Incoming Packets}~\nameref{sec:Device Types /
>  Network Device / Device Operation / Processing of Incoming Packets} below.
> +
> +\item The VIRTIO_NET_F_GUEST_FULL_CSUM feature indicates that the driver handles
> +  packets with full checksum and does not handle packets with partial checksum,


So we need to change definition of VIRTIO_NET_F_GUEST_CSUM then.


Also this is not exactly right. As defined driver must be able to handle
partial checksum too.


How about this:

- change definition above to just "Driver handles packets with full checksum."

- if VIRTIO_NET_F_GUEST_FULL_CSUM is set but VIRTIO_NET_F_GUEST_CSUM is
  clear driver requires full checksum

- if VIRTIO_NET_F_GUEST_FULL_CSUM is clear but VIRTIO_NET_F_GUEST_CSUM is
  set driver supports partial checksum

- if VIRTIO_NET_F_GUEST_FULL_CSUM and VIRTIO_NET_F_GUEST_CSUM are
  set then the behavior is as you describe: VIRTIO_NET_F_GUEST_CSUM
  takes preference, but you can disable it with VIRTIO_NET_F_CTRL_GUEST_OFFLOADS
  if that is supported.


> +  which means that partially checksummed packets can not be received by the driver
> +  and the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} can not be set by the device.
> +  The driver can send the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command to control
> +  the receive full checksum offload state.


I don't like it that we are coming with "offload state" here that isn't
explained anywhere. Let's try to make this offload more like
other existing offloads.

I find it is also confusing to say "receive full checksum offload has
been enabled". It is more that driver handles packets with full checksum.

>  \end{enumerate}
>  
>  A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
> @@ -720,7 +730,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>    \field{num_buffers} is one, then the entire packet will be
>    contained within this buffer, immediately following the struct
>    virtio_net_hdr.
> -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> +\item If the VIRTIO_NET_F_GUEST_CSUM feature (regardless of whether
> +  VIRTIO_NET_F_GUEST_FULL_CSUM was negotiated) was negotiated, the
>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>    set: if so, device has validated the packet checksum.
>    In case of multiple encapsulated protocols, one level of checksums
> @@ -744,7 +755,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>    number of coalesced TCP segments in \field{csum_start} field and
>    number of duplicated ACK segments in \field{csum_offset} field
>    and sets bit VIRTIO_NET_HDR_F_RSC_INFO in \field{flags}.
> -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> +\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated but the
> +  VIRTIO_NET_F_GUEST_FULL_CSUM feature was not negotiated, the
>    VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} can be
>    set: if so, the packet checksum at offset \field{csum_offset}
>    from \field{csum_start} and any preceding checksums
> @@ -802,8 +814,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>  \field{gso_type}.
>  
> -If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> -device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> +If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated but
> +the VIRTIO_NET_F_GUEST_FULL_CSUM feature has not been negotiated,
> +the device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags}, if so:
>  \begin{enumerate}
>  \item the device MUST validate the packet checksum at
> @@ -819,11 +832,38 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  	fully checksummed packet;
>  \end{enumerate}
>  
> +The driver MUST NOT enable receive full checksum offload for which
> +VIRTIO_NET_F_GUEST_FULL_CSUM has not been negotiated.
> +
> +Initially (before the device receives any VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET
> +command carrying the VIRTIO_NET_F_GUEST_FULL_CSUM feature parameter) receive
> +full checksum offload MUST be disabled.
> +
> +Upon the device reset, the device MUST disable receive full checksum offload.
> +
> +If VIRTIO_NET_F_GUEST_FULL_CSUM has been negotiated and receive full checksum
> +offload has not been enabled, the device MUST NOT perform any of the
> +functionality provided by VIRTIO_NET_F_GUEST_FULL_CSUM.
> +
> +If receive full checksum offload has been enabled, the device MUST NOT set
> +the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} and MUST supply a
> +fully checksummed packet to the driver.
> +
> +If a partially checksummed packet is received by the device, the device MUST
> +calculate full checksum for the packet and then supply it to the driver
> +\ref{sec:Device Types / Network Device / Device Operation / Packet Transmission}.
> +
>  If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options have
>  been negotiated, the device MUST set \field{gso_type} to
>  VIRTIO_NET_HDR_GSO_NONE.
>  
> -If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, then
> +If receive full checksum offload has been enabled and \field{gso_type}
> +differs from VIRTIO_NET_HDR_GSO_NONE, then the device MUST NOT set
> +the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} and MUST calculate
> +full checksum for the packet and then supply it to the driver.
> +
> +If the VIRTIO_NET_F_GUEST_FULL_CSUM feature has not been negotiated and
> +\field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, then
>  the device MUST also set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags} MUST set \field{gso_size} to indicate the desired MSS.
>  If VIRTIO_NET_F_RSC_EXT was negotiated, the device MUST also
> @@ -839,7 +879,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  not less than the length of the headers, including the transport
>  header.
>  
> -If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> +If the VIRTIO_NET_F_GUEST_CSUM feature (regardless of whether
> +VIRTIO_NET_F_GUEST_FULL_CSUM has been negotiated) has been negotiated, the
>  device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
>  \field{flags}, if so, the device MUST validate the packet
>  checksum (in case of multiple encapsulated protocols, one level
> @@ -1624,6 +1665,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_TSO6       8
>  #define VIRTIO_NET_F_GUEST_ECN        9
>  #define VIRTIO_NET_F_GUEST_UFO        10
> +#define VIRTIO_NET_F_GUEST_FULL_CSUM  50
>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
>  
> -- 
> 2.19.1.6.gb485710b
> 
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 


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

