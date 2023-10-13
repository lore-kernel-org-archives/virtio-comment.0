Return-Path: <virtio-comment-return-7702-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B9DCDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 02:01:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F07678C128
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 02:01:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D89D198683C
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 02:01:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C2E169842E5; Fri, 13 Oct 2023 02:01:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B2B2B986835
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 02:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Qh3mPahnNiCR5nAPL0NT2Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697162466; x=1697767266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xzGsnQMH9d9s+aLn/0lOGTUL0c6iShTBy/uq+uz08g=;
        b=HhUroRugzE3buVKqE/tcGCivXlYYE+1hP++LjcwNqDboxUJKAagQMJrOmfPRCGnCzD
         XcT9iULPc1p+m1nkE5CEJB3X1KbipzLVoZUslmqHygCiseskPPb8NtwVq1Yt+LeyaAJ9
         C3Mw57Qja6rKpwyWpdu3Ipim0y286p7TeknVfCHJolBAEVKKGsTIWu+y1S3hEbnAvMfG
         dW8MstXpGmU8abJhet0xdMdgVNQuBNeMOHf2GTQerpoj34Z+3eNPk8C3Gv6FbkleHY0q
         wLTgkRmGslPcEQpJoqlG8XurCzYWsLGu9xisvKlGRiiJT5v5nDudtHhCzWFSMBkmioSl
         4LEQ==
X-Gm-Message-State: AOJu0Yz/s+Yylcs7tP0YTYkgztdvvIP/CmssNd4nn1zF06Lqplb3g0DV
	YjSl9DXqVpCjZFxxZGgJAzkVuKdnQRgrD1D30iUUFLaEDt17Z1u8YD79QVBarOe3m4ur+HqayEW
	BaL0QIa4jTt1Fqy/0wO+d6w9lnYMTNX+/5aAVADtRVfPgNNJG0w==
X-Received: by 2002:a05:6512:745:b0:503:2e6:685e with SMTP id c5-20020a056512074500b0050302e6685emr18503755lfs.14.1697162465950;
        Thu, 12 Oct 2023 19:01:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHWofZC/dALjzfSWuqPGb5YD5uF6FEiXxIkOljmfilDTbMM2TurU2WEoiCVEmTHGiQ2IEL9oq/3XNUite0RXQ=
X-Received: by 2002:a05:6512:745:b0:503:2e6:685e with SMTP id
 c5-20020a056512074500b0050302e6685emr18503748lfs.14.1697162465572; Thu, 12
 Oct 2023 19:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <40b847baf9158cac8c23cb97dd643f768e3a6e05.1697006458.git.hengqi@linux.alibaba.com>
In-Reply-To: <40b847baf9158cac8c23cb97dd643f768e3a6e05.1697006458.git.hengqi@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Oct 2023 10:00:51 +0800
Message-ID: <CACGkMEtWifs4gwU83-_x_5xKysVpyEsvxT0dcTOyPeOQGVVu-w@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH] virtio-net: support distinguishing
 between partial and full checksum

On Wed, Oct 11, 2023 at 2:43=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
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
> In addition, implementation of some performant devices do not generate pa=
rtially
> checksummed packets, but the standard driver still need to clear
> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices negotiate the
> new feature provided by this patch, then the driver can load XDP.
>
> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve the abov=
e
> situation, which forces the device to supply fully checksummed packets
> to the driver.
>
> Use case example:
> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and after XDP processes a p=
acket

I believe this feature needs to be turned on dynamically after XDP is
enabled via control offloads instead of trying to negotiating it from
the probe?

> with full checksum, the VIRTIO_NET_HDR_F_DATA_VALID bit is still retained=
,
> resulting in the stack not needing to validate the checksum again. This i=
s
> useful for guests with performant devices: e.g. bringing the driver advan=
tages
> such as cpu savings.
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
>  device-types/net/description.tex | 38 +++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 76585b0..a63d497 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Netw=
ork Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (50)] Driver handles packets with ful=
l checksum.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash fo=
r encapsulated packets.
>
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notificat=
ion coalescing.
> @@ -133,6 +135,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM.
>
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> @@ -390,6 +393,11 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>  \ref{sec:Device Types / Network Device / Device Operation /
>  Processing of Incoming Packets}~\nameref{sec:Device Types /
>  Network Device / Device Operation / Processing of Incoming Packets} belo=
w.
> +
> +\item The VIRTIO_NET_F_GUEST_FULL_CSUM feature indicates that the driver=
 handles
> +  packets with full checksum and does not handle packets with partial ch=
ecksum,
> +  which means that partially checksummed packets can not be received by =
the driver
> +  and the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} can not be se=
t by the device.
>  \end{enumerate}
>
>  A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
> @@ -720,7 +728,8 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
>    \field{num_buffers} is one, then the entire packet will be
>    contained within this buffer, immediately following the struct
>    virtio_net_hdr.
> -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> +\item If the VIRTIO_NET_F_GUEST_CSUM feature (regardless of whether
> +  VIRTIO_NET_F_GUEST_FULL_CSUM was negotiated) was negotiated, the
>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>    set: if so, device has validated the packet checksum.
>    In case of multiple encapsulated protocols, one level of checksums
> @@ -744,7 +753,8 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
>    number of coalesced TCP segments in \field{csum_start} field and
>    number of duplicated ACK segments in \field{csum_offset} field
>    and sets bit VIRTIO_NET_HDR_F_RSC_INFO in \field{flags}.
> -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> +\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated but the
> +  VIRTIO_NET_F_GUEST_FULL_CSUM feature was not negotiated, the
>    VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} can be
>    set: if so, the packet checksum at offset \field{csum_offset}
>    from \field{csum_start} and any preceding checksums
> @@ -802,8 +812,9 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
>  device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>  \field{gso_type}.
>
> -If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> -device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> +If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated but
> +the VIRTIO_NET_F_GUEST_FULL_CSUM feature has not been negotiated,
> +the device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in

So FULL_CSUM is mutually exclusive with GUEST_GSO_XXX?

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

