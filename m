Return-Path: <virtio-comment-return-8384-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA6EC47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 05:35:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 24781120D4A
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 05:35:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0984986DD3
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 05:35:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D27E5986DCF; Thu, 16 Nov 2023 05:35:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD6C1986DD0
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 05:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: NGOaUQwxPTGm9_Chb2SazA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700112856; x=1700717656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9H1zUZAiEXpPqY4Cq4E9cD5dWWBwdmnUZPW8aC0Ggw=;
        b=QWEoGvYuOE6CQCzyWpmP6W7bg0QsKGa4zy0URzfdhmRnF3w6uZVF8bWhxIBNmCO29g
         vI52ebVBQr1Irc1c/M6+3eF6dsEZtReSCz92A5yZCnuTCTkEW80scLeLnkQSD9+6c4/x
         FwZAgLx0Mpsbkss/WpIHUJ81yfMgU8uoQkrJLX5DpeWkzedV5xKIYEn3gr7L0dIlIKCc
         uLLCLwip1zW48u02jBq5gmNDVgK6enMcC2542PXLe7ByKk3JhmEMeg2lkK73WqPgA1DZ
         wozNbvJZoaVxq1A9ZgU6HR8Nf8/6CUgB6GQfhOsP2BuAwzGXLATyOKmJlf/u4IKXLR7a
         fFKA==
X-Gm-Message-State: AOJu0Yxz7ly6LPy4p3jr540nCASVbuTqY7aHFlMIc3WEbZ7Ilho6mqpN
	t7hHJMgXQ4emi3dWi/iFZHI7OTyMcKhgJ/lfJPb+vZfFp/IuUA9prd2uOk9/zsmlaE0r3IWhdGX
	gPEq2sXPHQ+ZWVZPrCwYRxtFAyE9EJaCLLzq2MYok5VhsPB3e7w==
X-Received: by 2002:ac2:55a7:0:b0:50a:40b6:2d32 with SMTP id y7-20020ac255a7000000b0050a40b62d32mr10153485lfg.54.1700112856045;
        Wed, 15 Nov 2023 21:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNGed1dwRD6JZpBOZqmvg4E9MPlvsI63jMtvMyDSxnTpT/CdCvofR+kr9mh4kMd+Uiutlecev9LnqvosA8Wao=
X-Received: by 2002:ac2:55a7:0:b0:50a:40b6:2d32 with SMTP id
 y7-20020ac255a7000000b0050a40b62d32mr10153476lfg.54.1700112855653; Wed, 15
 Nov 2023 21:34:15 -0800 (PST)
MIME-Version: 1.0
References: <8acff73199993535bb66528343681209c32b3560.1699951535.git.hengqi@linux.alibaba.com>
In-Reply-To: <8acff73199993535bb66528343681209c32b3560.1699951535.git.hengqi@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Nov 2023 13:34:04 +0800
Message-ID: <CACGkMEvCUwJ3rG5Y9cN8JY=LJM9wkXKj+HY_JVhD4oYgN2CMoQ@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3] virtio-net: support distinguishing between partial and
 full checksum

On Tue, Nov 14, 2023 at 4:49=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
> virtio-net works in a virtualized system and is somewhat different from
> physical nics. One of the differences is that to save virtio device
> resources, rx may receive packets with partial checksum. However, XDP may
> cause partially checksummed packets to be dropped. So XDP loading conflic=
ts
> with the feature VIRTIO_NET_F_GUEST_CSUM.
>
> This patch lets the device to supply fully checksummed packets to the dri=
ver.
> Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the benefits o=
f
> device verification checksum.
>
> In addition, implementation of some performant devices do not generate
> partially checksummed packets, but the standard driver still need to clea=
r
> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices enable the
> full checksum offloading, then the driver can load XDP without clearing
> VIRTIO_NET_F_GUEST_CSUM.
>
> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve the abov=
e
> situation, which provides the driver with configurable receive full check=
sum
> offload. If the offload is enabled, then the device must supply fully
> checksummed packets to the driver.
>
> Use case example:
> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and receive full checksum
> offload is enabled, after XDP processes a packet with full checksum, the
> VIRTIO_NET_HDR_F_DATA_VALID bit is still retained, resulting in the stack
> not needing to validate the checksum again. This is useful for guests:
>   1. Bring the driver advantages such as cpu savings.
>   2. For devices that do not generate partially checksummed packets thems=
elves,
>      XDP can be loaded in the driver without modifying the hardware behav=
ior.
>
> Several solutions have been discussed in the previous proposal[1].
> After historical discussion, we have tried the method proposed by Jason[2=
],
> but some complex scenarios and challenges are difficult to deal with.
> We now return to the method suggested in [1].
>
> [1] https://lists.oasis-open.org/archives/virtio-dev/202305/msg00291.html
> [2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@linux.alibab=
a.com/
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
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index aff5e08..6937a2f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -122,6 +122,8 @@ \subsection{Feature bits}\label{sec:Device Types / Ne=
twork Device / Feature bits
>      device with the same MAC address.
>
>  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
> +
> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets with ful=
l checksum.
>  \end{description}
>
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k Device / Feature bits / Feature bit requirements}
> @@ -136,6 +138,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM and=
 VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
>
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> @@ -398,6 +401,58 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>  A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
>  everything else.
>
> +\subsubsection{Driver Handles Fully Checksummed Packets}\label{sec:Devic=
e Types / Network Device / Device Initialization / Driver Handles Fully Che=
cksummed Packets}
> +
> +The VIRTIO_NET_F_GUEST_CSUM feature indicates that the driver can handle
> +partially or fully checksummed packets from the device. When the
> +driver only expects fully checksummed packets, the VIRTIO_NET_F_GUEST_FU=
LL_CSUM
> +feature can be negotiated if the device offers it.
> +Then the driver only handles packets with full checksum.
> +
> +By negotiating the VIRTIO_NET_F_GUEST_FULL_CSUM feature, the driver can
> +benefit, for example, from the device's ability to calculate and validat=
e the checksum
> +in scenarios where partially checksummed packets are not compatible.

Not a native speaker, but I think it's not about compatibility. Maybe
we can just drop the "in scenarios ..."?

> +
> +Delivering fully checksummed packets rather than partially
> +checksummed packets incurs additional overhead for the device.
> +As a result, receive full-checksum offload (meaning the driver only hand=
les
> +packets with full checksum) is disabled by default \ref{sec:Device Types=
 / Network Device
> +/ Device Operation / Control Virtqueue / Offloads State Configuration}.
> +
> +Receive full-checksum offload can be enabled if the driver successfully
> +sends the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with the
> +VIRTIO_NET_F_GUEST_FULL_CSUM bit set.
> +
> +\drivernormative{\subsubsection}{Driver Handles Fully Checksummed Packet=
s}{sec:Device Types / Network Device / Device Initialization / Driver Handl=
es Fully Checksummed Packets}
> +
> +The driver MUST NOT enable receive full-checksum offload for which
> +VIRTIO_NET_F_GUEST_FULL_CSUM has not been negotiated.
> +
> +\devicenormative{\subsubsection}{Driver Handles Fully Checksummed Packet=
s}{sec:Device Types / Network Device / Device Initialization / Driver Handl=
es Fully Checksummed Packets}
> +
> +Initially (before the device successfully receives any
> +VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with the VIRTIO_NET_F_GUEST_F=
ULL_CSUM
> +bit set) receive full-checksum offload MUST be disabled.

This seems duplicated with the above

"
+As a result, receive full-checksum offload (meaning the driver only handle=
s
+packets with full checksum) is disabled by default \ref{sec:Device
Types / Network Device
+/ Device Operation / Control Virtqueue / Offloads State Configuration}.
"

> +
> +Upon the device reset, the device MUST disable receive full-checksum off=
load.
> +
> +If VIRTIO_NET_F_GUEST_FULL_CSUM has been negotiated and receive full-che=
cksum
> +offload has not been enabled, the device MUST NOT perform any of the
> +functionality provided by VIRTIO_NET_F_GUEST_FULL_CSUM.

Well the control offload semantic explains this by itself, so I don't
think we need to repeat it here.

> +
> +If a partially checksummed packet is received by the device, the device =
MUST
> +calculate full checksum for the packet and then supply it to the driver
> +\ref{sec:Device Types / Network Device / Device Operation / Packet Trans=
mission}.

This seems another duplication as no matter what kind of packet is
received the full checksum should be calculated.

> +
> +If receive full-checksum offload has been enabled, the device MUST NOT s=
et
> +the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} and MUST supply a
> +fully checksummed packet to the driver.
> +
> +If receive full-checksum offload has been enabled and \field{gso_type}
> +differs from VIRTIO_NET_HDR_GSO_NONE,

Any reason why VIRTIO_NET_HDR_GSO_NONE differs from others?

> then the device MUST NOT set
> +the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} and MUST calculate
> +full checksum for the packet and then supply it to the driver.

I think we need to clarify:

1) when the packet has full checksum, we set DATA_VALID but not NEEDS_CSUM?
2) when the packet has partial checksum, we set NEEDS_CSUM for sure,
but a conditional DATA_VALID?

Thanks


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

