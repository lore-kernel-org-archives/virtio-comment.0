Return-Path: <virtio-comment-return-8773-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA96C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 16:36:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4CF28613CA
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 16:36:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A92C986513
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 16:36:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 09D3798648B; Mon, 11 Dec 2023 16:36:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE27F986492
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Dec 2023 16:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -qXP1KR6MNecsjgrCDl17w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312556; x=1702917356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIqWejpY5JiKW4m/3SO/oD1ck5/2bQg9Dbsb4J9rKI0=;
        b=WpO/V0DJmtwh2zNqhcPNfDkuL3udP5YwL3N5bRwZzAd4h2MOXxh37GtN5XILL6ioUk
         PaL48LQp+AbcAddt/WFnkSBQoeHc1rjUG/OQOH0anyavjnlIA0Hua74dAR6w2k3DSspu
         SmxRV5zL8Ci67DupQWHe7MYzZ8UrHBAlibgZTZcUZDMIeynUP7SG31KqTK/P/Ps9UaLM
         64xYS0GrKiNqvQRS7OyoIMMEiTpIOj2QH0C/ukHcZYIBBmu/kjMZp5hAOzOhZyFI+f5m
         4SOY/GYR7XpIWK0ehJ1g2uwsGNlgmT/ZYlIRz0AUehHLcoTLjQkv43aqQP1T7ldsat42
         sZMA==
X-Gm-Message-State: AOJu0YwJyzbTNoSmqLEJMaSwpbf39LgWUazNv3qs3CFtEL1c/R/T3mhZ
	VYu7HIHDS0tJKT5JBoRiteO/7ObL4khyvFyWCGwQUkYyh0YxH+JmUWvI8+Z7sjD4n/MPAvskGeb
	1qPQhAjv0yCEOffGunDXA+5lR9piMHDzhuA==
X-Received: by 2002:a05:600c:6c7:b0:40b:5e21:d345 with SMTP id b7-20020a05600c06c700b0040b5e21d345mr2418804wmn.78.1702312555675;
        Mon, 11 Dec 2023 08:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE58kvhjFH3jxuF6IY2aHocXVqMWU8xeQQAwxIXur9IlZQQTOJGLf4pd++btQTVVIFzHvQLBQ==
X-Received: by 2002:a05:600c:6c7:b0:40b:5e21:d345 with SMTP id b7-20020a05600c06c700b0040b5e21d345mr2418799wmn.78.1702312555258;
        Mon, 11 Dec 2023 08:35:55 -0800 (PST)
Date: Mon, 11 Dec 2023 11:35:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20231211110350-mutt-send-email-mst@kernel.org>
References: <959e1a7ccdfffaaadd865a627924cf492ce22bfa.1702277523.git.hengqi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <959e1a7ccdfffaaadd865a627924cf492ce22bfa.1702277523.git.hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v5] virtio-net: device does not deliver partially
 checksummed packet and may validate the checksum

On Mon, Dec 11, 2023 at 05:11:59PM +0800, Heng Qi wrote:
> virtio-net works in a virtualized system and is somewhat different from
> physical nics. One of the differences is that to save virtio device
> resources, rx may receive partially checksummed packets. However, XDP may
> cause partially checksummed packets to be dropped.
> So XDP loading currently conflicts with the feature VIRTIO_NET_F_GUEST_CSUM.
> 
> This patch lets the device to supply fully checksummed packets to the driver.
> Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the benefits of
> device validation checksum.
> 
> In addition, implementation of some performant devices always do not generate
> partially checksummed packets, but the standard driver still need to clear
> VIRTIO_NET_F_GUEST_CSUM when XDP is there.


> 
> A new feature VIRTIO_NET_F_GUEST_FULLY_CSUM is added to solve the above
> situation, which provides the driver with configurable offload.
> If the offload is enabled, then the device must deliver fully
> checksummed packets to the driver and may validate the checksum.
> 
> Use case example:
> If VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated and the offload is enabled,
> after XDP processes a fully checksummed packet, the VIRTIO_NET_HDR_F_DATA_VALID bit
> is retained if the device has validated its checksum, resulting in the guest
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
> v4->v5:
> - Remove the modification to the GUEST_CSUM.
> - The description of this feature has been reorganized for greater clarity.
> 
> v3->v4:
> - Streamline some repetitive descriptions. @Jason
> - Add how features should work, when to be enabled, and overhead. @Jason @Michael
> 
> v2->v3:
> - Add a section named "Driver Handles Fully Checksummed Packets"
>   and more descriptions. @Michael
> 
> v1->v2:
> - Modify full checksum functionality as a configurable offload
>   that is initially turned off. @Jason
> 
>  device-types/net/description.tex        | 74 +++++++++++++++++++++++--
>  device-types/net/device-conformance.tex |  1 +
>  device-types/net/driver-conformance.tex |  1 +
>  introduction.tex                        |  3 +
>  4 files changed, 73 insertions(+), 6 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index aff5e08..ab6c13d 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -122,6 +122,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>      device with the same MAC address.
>  
>  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
> +
> +\item[VIRTIO_NET_F_GUEST_FULLY_CSUM (64)] Device delivers fully checksummed packets
> +    to the driver and may validate the checksum.
>  \end{description}

I propose
VIRTIO_NET_F_GUEST_CSUM_COMPLETE
instead.


>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> @@ -136,6 +139,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_FULLY_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.




>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> @@ -398,6 +402,58 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>  A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
>  everything else.
>  
> +\subsubsection{Device Delivers Fully Checksummed Packets}\label{sec:Device Types / Network Device / Device Initialization / Device Delivers Fully Checksummed Packets}
> +
> +If the feature VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated, the driver can
> +benefit from the device's ability to calculate and validate the checksum.
> +
> +If the feature VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated,
> +the device behaves as follows:
> +\begin{itemize}
> +  \item The device delivers a fully checksummed packet to the driver rather than a partially checksummed packet.

where does "partially checksummed packet" come from?
I think it comes from:

   The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
  checksummed packets can be received, and if it can do that then
  the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, 
  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4
  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features described above.
  See \ref{sec:Device Types / Network Device / Device Operation /


so that one needs to be updated too.


> +Partially checksummed packets come from TCP/UDP protocols \ref{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}.
> +  \item The device may validate the packet checksum before delivering it.
> +If the packet checksum has been verified, the VIRTIO_NET_HDR_F_DATA_VALID bit
> +in \field{flags} is set: in case of multiple encapsulated protocols, one
> +level of checksums has been validated (Just like VIRTIO_NET_F_GUEST_CSUM does.).
> +  \item The device can not set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags}.
> +\end{itemize}
> +
> +Note that packet types that the driver or device can recognize and the device
> +may verify will not change due to the additional negotiated VIRTIO_NET_F_GUEST_FULLY_CSUM.
> +These remain consistent with VIRTIO_NET_F_GUEST_CSUM.

This part is confusing. "change" and "remain" makes no sense for someone reading
the spec text as opposed to reviewing the patch.
also it does not matter whether VIRTIO_NET_F_GUEST_FULLY_CSUM
is negotiated right? it only matters whether it is enabled.


> +Specific transport protocols that may have VIRTIO_NET_HDR_F_DATA_VALID set
> +in \field{flags} include TCP, UDP, GRE (Generic Routing Encapsulation),
> +and SCTP (Stream Control Transmission Protocol).
> +A fully checksummed packet's checksum field for each of the above protocols
> +is set to a calculated value that covers the transport header and payload
> +(TCP or UDP involves the additional pseudo header) of the packet.
> +
> +Delivering fully checksummed packets rather than partially
> +checksummed packets incurs additional overhead for the device.
> +The overhead varies from device to device, for example the overhead of
> +calculating and validating the packet checksum is a few microseconds
> +for a hardware device.

wow really is that standard? There are devices that deliver the whole
packet in a few microseconds. Maybe "for some hardware devices"?

> +
> +The feature VIRTIO_NET_F_GUEST_FULLY_CSUM has a corresponding offload \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration},
> +which when enabled means that the device delivers fully checksummed packets
> +to the driver and may validate the checksum.
> +The offload is disabled by default.

This is unusual, unlike any other offload. So needs to be stressed
more.  And what does "default" mean here?
E.g. "Note: unlike other offloads, this offloads is disabled
even after VIRTIO_NET_F_GUEST_FULLY_CSUM has been negotiation.
The offload has to be enabled ... "


> +
> +The driver can enable the offload by sending the
> +VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with the
> +VIRTIO_NET_F_GUEST_FULLY_CSUM bit set when, for example,
> +eXpress Data Path (XDP) \hyperref[intro:xdp]{[XDP]} is functioning.

It is not worth adding a spec link just to provide an example.
If you really want to provide it:
"eXpress Data Path (XDP) in Linux is active".

But this is the problem this patch does not solve in my opinion.
A device might actually provide a full checksum 
at negligeable extra cost and driver will still keep it off by default.
So it slows device down - when does it make sense to enable this feature? 
Just giving an example of XDP is not sufficient.



> +
> +\drivernormative{\subsubsection}{Device Delivers Fully Checksummed Packets}{sec:Device Types / Network Device / Device Initialization / Device Delivers Fully Checksummed Packets}
> +
> +The driver MUST NOT enable the offload for which VIRTIO_NET_F_GUEST_FULLY_CSUM has not been negotiated.

what does "the offload for which" mean here?
and how is this special for VIRTIO_NET_F_GUEST_FULLY_CSUM?

> +\devicenormative{\subsubsection}{Device Delivers Fully Checksummed Packets}{sec:Device Types / Network Device / Device Initialization / Device Delivers Fully Checksummed Packets}
> +
> +Upon the device reset, the device MUST disable the offload.
> +

reset has nothing to do with it I think. it's about feature negotiation.


>  \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
>  
>  Packets are transmitted by placing them in the
> @@ -723,7 +779,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>    \field{num_buffers} is one, then the entire packet will be
>    contained within this buffer, immediately following the struct
>    virtio_net_hdr.
> -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> +\item If the VIRTIO_NET_F_GUEST_CSUM feature (regardless of whether
> +  VIRTIO_NET_F_GUEST_FULLY_CSUM was negotiated) was negotiated, the
>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>    set: if so, device has validated the packet checksum.
>    In case of multiple encapsulated protocols, one level of checksums
> @@ -747,7 +804,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>    number of coalesced TCP segments in \field{csum_start} field and
>    number of duplicated ACK segments in \field{csum_offset} field
>    and sets bit VIRTIO_NET_HDR_F_RSC_INFO in \field{flags}.
> -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> +\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated but the
> +  VIRTIO_NET_F_GUEST_FULLY_CSUM feature was not negotiated, the
>    VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} can be
>    set: if so, the packet checksum at offset \field{csum_offset}
>    from \field{csum_start} and any preceding checksums
> @@ -805,8 +863,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>  \field{gso_type}.
>  
> -If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> -device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> +If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated but
> +the VIRTIO_NET_F_GUEST_FULLY_CSUM feature has not been negotiated,
> +the device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags}, if so:
>  \begin{enumerate}
>  \item the device MUST validate the packet checksum at
> @@ -826,7 +885,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  been negotiated, the device MUST set \field{gso_type} to
>  VIRTIO_NET_HDR_GSO_NONE.
>  
> -If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, then
> +If the VIRTIO_NET_F_GUEST_FULLY_CSUM feature has not been negotiated and
> +\field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, then
>  the device MUST also set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags} MUST set \field{gso_size} to indicate the desired MSS.
>  If VIRTIO_NET_F_RSC_EXT was negotiated, the device MUST also
> @@ -842,7 +902,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  not less than the length of the headers, including the transport
>  header.
>  
> -If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> +If the VIRTIO_NET_F_GUEST_CSUM feature (regardless of whether
> +VIRTIO_NET_F_GUEST_FULLY_CSUM has been negotiated) has been negotiated, the
>  device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
>  \field{flags}, if so, the device MUST validate the packet
>  checksum (in case of multiple encapsulated protocols, one level
> @@ -1633,6 +1694,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_UFO        10
>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
> +#define VIRTIO_NET_F_GUEST_FULLY_CSUM 64
>  
>  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
>   #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
> diff --git a/device-types/net/device-conformance.tex b/device-types/net/device-conformance.tex
> index 52526e4..43b3921 100644
> --- a/device-types/net/device-conformance.tex
> +++ b/device-types/net/device-conformance.tex
> @@ -16,4 +16,5 @@
>  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
> +\item \ref{devicenormative:Device Types / Network Device / Device Initialization / Device Delivers Fully Checksummed Packets}
>  \end{itemize}
> diff --git a/device-types/net/driver-conformance.tex b/device-types/net/driver-conformance.tex
> index c693c4f..c9b6d1b 100644
> --- a/device-types/net/driver-conformance.tex
> +++ b/device-types/net/driver-conformance.tex
> @@ -16,4 +16,5 @@
>  \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
>  \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
>  \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
> +\item \ref{drivernormative:Device Types / Network Device / Device Initialization / Device Delivers Fully Checksummed Packets}
>  \end{itemize}
> diff --git a/introduction.tex b/introduction.tex
> index cfa6633..fc99597 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -145,6 +145,9 @@ \section{Normative References}\label{sec:Normative References}
>      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
>      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
>          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> +	\phantomsection\label{intro:xdp}\textbf{[XDP]} &
> +    eXpress Data Path(XDP) provides a high performance, programmable network data path in the Linux kernel.
> +	\newline\url{https://prototype-kernel.readthedocs.io/en/latest/networking/XDP/}\\
>  \end{longtable}
>  
>  \section{Non-Normative References}
> -- 
> 2.19.1.6.gb485710b


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

