Return-Path: <virtio-comment-return-8877-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928DDC4706F
	for <virtio-comment@archiver.kernel.org>; Tue,  2 Jan 2024 01:58:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F068D2AF84
	for <virtio-comment@archiver.kernel.org>; Tue,  2 Jan 2024 01:58:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D1545986499
	for <virtio-comment@archiver.kernel.org>; Tue,  2 Jan 2024 01:58:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B6A8A986148; Tue,  2 Jan 2024 01:58:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6A749863AF
	for <virtio-comment@lists.oasis-open.org>; Tue,  2 Jan 2024 01:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 7Of1TDywOTCSjBma9rYYMA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704160701; x=1704765501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbsKUw5CxEDb85ffLYLxebJvr4OO9wzNWPfiGQrwI80=;
        b=cB8CKaAOtz+9eYde9ovSZKZ7zTOrIaSsFVk8ei3q7Ug3cKXmvNRcni131uLBp1iCp3
         okaEJvY+L/fWTIWx95NsnG7XBzaim8kgRw+c5yC5CkIRe/+EapyBelc/Y6EG+msDZrMt
         WPZgLRgGRCLEJ3mkonBJvadg/oXNgrzyuYsfv20cnRr2t9cQjtQxXSpS/52e909POy8I
         d9Y6qDPlzR0ryB+dX+yd8EBrH6q/Azdc8wE1qAjpUDs1tqIeDuGVkorjMHUfoOfc6y+k
         NjmwjssmhAYUIVETnQaMqFcFvxxTxrL6V2qzUBU8rW94VhAHT+YxEGQfocav6pFatbcJ
         03IA==
X-Gm-Message-State: AOJu0Yz+BGYh9rf3QXkDzDkzj1VMrIvb8Akp1hAfNtFzsR8bdSetoHRW
	oYo3FJAYBKFoj2a8cvR6RWTQ1tlWuCGjf6n2XJ2Ji9fIlYZ61jljNvEpAsNOK7NxyrPUKXbOs0a
	THtixBYUfKG1EA6qv+dwBLrPrTXY8J9FE81kqLz1baobIRGuaHNr+nDjlVw==
X-Received: by 2002:a05:6a20:2714:b0:196:5ffb:10d6 with SMTP id u20-20020a056a20271400b001965ffb10d6mr5846966pze.50.1704160701576;
        Mon, 01 Jan 2024 17:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2gstwaFLG4digfHrCcgi4gXRE/PGrmmKEzWOVbOOjz3uug0USO0oPvMVVLuRzK8BjAZdSE9dXUUJxR+3UtZM=
X-Received: by 2002:a05:6a20:2714:b0:196:5ffb:10d6 with SMTP id
 u20-20020a056a20271400b001965ffb10d6mr5846957pze.50.1704160701091; Mon, 01
 Jan 2024 17:58:21 -0800 (PST)
MIME-Version: 1.0
References: <1703749573-2786-1-git-send-email-hengqi@linux.alibaba.com> <1703749573-2786-3-git-send-email-hengqi@linux.alibaba.com>
In-Reply-To: <1703749573-2786-3-git-send-email-hengqi@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 2 Jan 2024 09:58:09 +0800
Message-ID: <CACGkMEuTay71sxburhdzYW37XianBt2FBx30Vt9W87=DzgXR2g@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v7 2/2] virtio-net: device does not deliver partially
 checksummed packet and may validate the checksum

On Thu, Dec 28, 2023 at 3:46=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
> virtio-net works in a virtualized system and is somewhat different from
> physical nics. One of the differences is that to save virtio device
> resources, rx may receive partially checksummed packets. However, XDP may
> cause partially checksummed packets to be dropped.
> So XDP loading currently conflicts with the feature VIRTIO_NET_F_GUEST_CS=
UM.
> When XDP is loaded, the offload of VIRTIO_NET_F_GUEST_CSUM is disabled
> (to disable the tx checksum offload).
>
> In addition, implementation of some performant devices always do not gene=
rate
> partially checksummed packets, but the standard driver still cannot load =
XDP
> when VIRTIO_NET_F_GUEST_CSUM is there.
>
> This patch lets the device to supply fully checksummed packets to the dri=
ver.
>
> A new feature VIRTIO_NET_F_GUEST_FULLY_CSUM is added to solve the above
> situation, which provides the driver with configurable offload.
> If the offload is enabled, then the device must deliver fully

For offload, did you mean rx csum offload?

> checksummed packets to the driver and may validate the checksum.
>
> Use case example:
> If VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated and the offload is enabled=
,
> after XDP processes a fully checksummed packet, the VIRTIO_NET_HDR_F_DATA=
_VALID bit
> is retained if the device has validated its checksum, resulting in the gu=
est
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
> v6->v7:
> - FULLY_CSUM no longer depends on GUEST_CSUM.
> - The description related to DATA_VALID has nothing to do with
>   whether GUEST_CSUM is negotiated or not. @Jason
>
> v5->v6:
> - Rewrite and clarify patch description. @Michael
>
> v4->v5:
> - Remove the modification to the GUEST_CSUM. @Jason
> - The description of this feature has been reorganized for greater clarit=
y. @Michael
>
> v3->v4:
> - Streamline some repetitive descriptions. @Jason
> - Add how features should work, when to be enabled, and overhead. @Jason =
@Michael
>
> v2->v3:
> - Add a section named "Driver Handles Fully Checksummed Packets"
>   and more descriptions. @Michael
>
> v1->v2:
> - Modify full checksum functionality as a configurable offload
>   that is initially turned off. @Jason
>
>  device-types/net/description.tex        | 68 +++++++++++++++++++++++++++=
+++---
>  device-types/net/device-conformance.tex |  1 +
>  2 files changed, 64 insertions(+), 5 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index a5210f2..d4a7329 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -122,6 +122,9 @@ \subsection{Feature bits}\label{sec:Device Types / Ne=
twork Device / Feature bits
>      device with the same MAC address.
>
>  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
> +
> +\item[VIRTIO_NET_F_GUEST_FULLY_CSUM (64)] Device delivers fully checksum=
med packets
> +    to the driver and may validate the checksum.
>  \end{description}
>
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k Device / Feature bits / Feature bit requirements}
> @@ -136,6 +139,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_FULLY_CSUM] Requires VIRTIO_NET_F_CTRL_GUEST_OF=
FLOADS.
>
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> @@ -383,7 +387,8 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Network Device / Dev
>  the same system might not need checksumming at all, nor segmentation,
>  if both guests are amenable.}
>     The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
> -  checksummed packets can be received, and if it can do that then
> +  checksummed packets can be received (provided that the offload of
> +  VIRTIO_NET_F_GUEST_FULLY_CSUM is disabled), and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
>    VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4
>    and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features =
described above.
> @@ -398,6 +403,55 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>  A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
>  everything else.
>
> +\subsubsection{Device Delivers Fully Checksummed Packets}\label{sec:Devi=
ce Types / Network Device / Device Initialization / Device Delivers Fully C=
hecksummed Packets}
> +
> +If the feature VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated, the driver c=
an
> +benefit from the device's ability to calculate and validate the checksum=
.
> +
> +If the feature VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated
> +and its offload is enabled, the device behaves as follows:
> +\begin{itemize}
> +  \item The device delivers a fully checksummed packet to the driver rat=
her than a partially checksummed packet.
> +Partially checksummed packets come from TCP/UDP protocols \ref{devicenor=
mative:Device Types / Network Device / Device Operation / Processing of Pac=
kets}.
> +  \item The device may validate the packet checksum before delivering it=
.
> +If the packet checksum has been verified, the VIRTIO_NET_HDR_F_DATA_VALI=
D bit
> +in \field{flags} is set: in case of multiple encapsulated protocols, one
> +level of checksums has been validated.
> +  \item The device can not set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \f=
ield{flags}.
> +\end{itemize}

I may miss something, but this seems the existing behaviour of the
devices regardless of FULLY_CSUM?

> +
> +The packet types that the device recognizes and can verify are independe=
nt of
> +whether the offload of VIRTIO_NET_F_GUEST_FULLY_CSUM is enabled.

Right, so I don't see why this became part of this patch.

> +
> +Specific transport protocols that may have VIRTIO_NET_HDR_F_DATA_VALID s=
et
> +in \field{flags} include TCP, UDP, GRE (Generic Routing Encapsulation),
> +and SCTP (Stream Control Transmission Protocol).
> +A fully checksummed packet's checksum field for each of the above protoc=
ols
> +is set to a calculated value that covers the transport header and payloa=
d
> +(TCP or UDP involves the additional pseudo header) of the packet.
> +
> +Delivering fully checksummed packets rather than partially
> +checksummed packets incurs additional overhead for the device.
> +The overhead varies from device to device, for example the overhead of
> +calculating and validating the packet checksum is a few microseconds
> +for some hardware devices.
> +
> +The feature VIRTIO_NET_F_GUEST_FULLY_CSUM has a corresponding offload \r=
ef{sec:Device Types / Network Device / Device Operation / Control Virtqueue=
 / Offloads State Configuration},
> +which when enabled means that the device delivers fully checksummed pack=
ets
> +to the driver and may validate the checksum.
> +\begin{note}

This is the functional equivalent to disable GUEST_CSUM. So I guess
what I'm missing is the difference between:

1) enable FULLY_CUSM

and

2) disable GUEST_CSUM

It looks to me 1) try to keep e.g HW_GRO (GUEST_TSOX) work? Note that
GRO produce partial csum usually, not sure it can work correctly.

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

