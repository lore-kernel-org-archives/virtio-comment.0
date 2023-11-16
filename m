Return-Path: <virtio-comment-return-8386-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44416C47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:18:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7B524157EA9
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:18:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58837986DD9
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:18:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 419C9986DD0; Thu, 16 Nov 2023 06:18:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32806986DD1
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 06:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -es-65MfMDKbSL0ye1L80Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700115490; x=1700720290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgvWE2JU+kgEUaO+QRguingofPYLNuvOlFD98d5oRQ4=;
        b=BXpfq77QjPzvfKUAnQ3Il/BvUpiL/SolClPXwbUThDyvhr0JiqhYTNFnjWpYCFsqBy
         kjavNH39xknoS4bPmiX0Fo626cVpM22cxB46QPMqCGIFqApsf75kzXqX1F19EtZYReoe
         K21TaYzTS/bgj132HYZ8gpsVl2vJpBof4s7JNBNBub0LP7RQwo6icx7kGPVpOypN/sLG
         sqIZEv0FMTUjNwGoPAAK/SBRRIQdqGRhd3FzXZOmEOi0cwtUICfBBMpBkDOfOUZ6gRNN
         z8wcizS6BdswzMt3+6Hk72wt4ObYuJ+kMFwT5K6K5r3SeAJLVLe3e1+60SopG/Mg4RfL
         RJXw==
X-Gm-Message-State: AOJu0Yykh6wiMFktAr/JW4if9JA03wCdXxnZqtbRBtrKI5KkMofecWX3
	mNJ4qTeA680ndJIu1JnQv/xf9rRq01eca4Zy0Bpj1k+DzjrvbmjqQ1L2ZdFfnaEFiAQPnCuHQJ3
	O30jh91cKNhOe2Z8dNHUj14gLfvb2tpWUNw==
X-Received: by 2002:a05:600c:5008:b0:409:136:469f with SMTP id n8-20020a05600c500800b004090136469fmr10977730wmr.38.1700115490468;
        Wed, 15 Nov 2023 22:18:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKa97goxTSiMxzkhvzG0bFV7bBwXpmUFAwYAiElZCZLn2f8BGN6XuQOvqi8jZLtIU9klJk8A==
X-Received: by 2002:a05:600c:5008:b0:409:136:469f with SMTP id n8-20020a05600c500800b004090136469fmr10977710wmr.38.1700115490008;
        Wed, 15 Nov 2023 22:18:10 -0800 (PST)
Date: Thu, 16 Nov 2023 01:18:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20231116010720-mutt-send-email-mst@kernel.org>
References: <8acff73199993535bb66528343681209c32b3560.1699951535.git.hengqi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <8acff73199993535bb66528343681209c32b3560.1699951535.git.hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3] virtio-net: support distinguishing between partial
 and full checksum

On Tue, Nov 14, 2023 at 04:49:45PM +0800, Heng Qi wrote:
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
> v2->v3:
> - Add a section named "Driver Handles Fully Checksummed Packets"
>   and more descriptions. @Michael
> 
> v1->v2:
> - Modify full checksum functionality as a configurable offload
>   that is initially turned off. @Jason
> 
>  device-types/net/description.tex        | 73 +++++++++++++++++++++++--
>  device-types/net/device-conformance.tex |  1 +
>  device-types/net/driver-conformance.tex |  1 +
>  3 files changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index aff5e08..6937a2f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -122,6 +122,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>      device with the same MAC address.
>  
>  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
> +
> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets with full checksum.
>  \end{description}
>  
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> @@ -136,6 +138,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
>  
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.



Apparently this is just to make the patch a bit smaller so you do not
have to find all instances of VIRTIO_NET_F_GUEST_CSUM and replace them
with "VIRTIO_NET_F_GUEST_CSUM or VIRTIO_NET_F_GUEST_FULL_CSUM".

But, this is actually a problem : we have places in spec which only
say VIRTIO_NET_F_GUEST_CSUM but actually mean "VIRTIO_NET_F_GUEST_CSUM
negotiated and not disabled by VIRTIO_NET_F_CTRL_GUEST_OFFLOADS".

So this just makes no sense to me. We have:
\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial checksum.


and here apparently when you have driver that handles packets with partial checksum
*and* packets with full checksum then this means that no, it does not
handle packets with partial checksum.
It might look ok when you just look at the patch but when people read
the full spec this is just confusing.



Let me try: in fact VIRTIO_NET_F_GUEST_CSUM now means "driver handles
packets with checksum (partial or full)"? Even with no features checksum can cover
all of the packet nothing prevents that.

So now we have a new flag that means
"driver can only handle fully checksummed packets".






> @@ -398,6 +401,58 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>  A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
>  everything else.
>  
> +\subsubsection{Driver Handles Fully Checksummed Packets}\label{sec:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
> +
> +The VIRTIO_NET_F_GUEST_CSUM feature indicates that the driver can handle
> +partially or fully checksummed packets from the device. When the
> +driver only expects fully checksummed packets, the VIRTIO_NET_F_GUEST_FULL_CSUM
> +feature can be negotiated if the device offers it.
> +Then the driver only handles packets with full checksum.
> +
> +By negotiating the VIRTIO_NET_F_GUEST_FULL_CSUM feature, the driver can
> +benefit, for example, from the device's ability to calculate and validate the checksum
> +in scenarios where partially checksummed packets are not compatible.
> +
> +Delivering fully checksummed packets rather than partially
> +checksummed packets incurs additional overhead for the device.
> +As a result, receive full-checksum offload (meaning the driver only handles
> +packets with full checksum) is disabled by default \ref{sec:Device Types / Network Device
> +/ Device Operation / Control Virtqueue / Offloads State Configuration}.
> +
> +Receive full-checksum offload can be enabled if the driver successfully
> +sends the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with the
> +VIRTIO_NET_F_GUEST_FULL_CSUM bit set.

But how much is this "additional overhead" and how does driver know when
this should be enabled as opposed to just disabling checksum offload
completely?


> +
> +\drivernormative{\subsubsection}{Driver Handles Fully Checksummed Packets}{sec:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
> +
> +The driver MUST NOT enable receive full-checksum offload for which
> +VIRTIO_NET_F_GUEST_FULL_CSUM has not been negotiated.

I don't understand what this is saying.  We need to come up with a way
to document this all without inventing terms like "full-checksum offload".

IIUC all this does is basically require that checksum covers all of the
packet.

-- 
MST


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

