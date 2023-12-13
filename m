Return-Path: <virtio-comment-return-8791-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8A4C4332F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:44:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 12A6D728CA
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:44:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E25AD9866B8
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:44:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CAEBA98669B; Wed, 13 Dec 2023 06:44:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8CDD98669C
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Dec 2023 06:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VyP5QlI_1702449864;
Message-ID: <1702449795.6038718-6-xuanzhuo@linux.alibaba.com>
Date: Wed, 13 Dec 2023 14:43:15 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: <shahafs@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 <virtio-comment@lists.oasis-open.org>,
 <mst@redhat.com>,
 <cohuck@redhat.com>
References: <20231110124040.2093394-1-parav@nvidia.com>
 <20231110124040.2093394-2-parav@nvidia.com>
In-Reply-To: <20231110124040.2093394-2-parav@nvidia.com>
Subject: Re: [virtio-comment] [PATCH 1/2] virtio-net: Fix receive buffer size calculation text

On Fri, 10 Nov 2023 14:40:39 +0200, Parav Pandit <parav@nvidia.com> wrote:
> Receive buffer size calculation is based on the following
> negotiated features.
>
> The text has wrong calculation for IPv6 and also it has missed
> VIRTIO_NET_F_HASH_REPORT.
>
> The problem of igorance of VIRTIO_NET_F_HASH_REPORT is reported
> in [1], however fix for ipv6 payload length must also be
> considered.
>
> Since for the both the fixes touching same requirements, a
> new issue is created as [2].
>
> This patch brings following fixes.
>
> 1. Fix annotating struct virtio_net_hdr as field
> 2. Fix receive buffer calculation for guest GSO cases to consider
>    ipv6 payload length
> 3. small grammar corrections for article
> 4. reword the requirement to consider the virtio_ndr_hdr which is
>    depends on the negotiated feature, hence first clarify the
>    struct virtio_net_hdr size
>
> [1] https://github.com/oasis-tcs/virtio-spec/issues/170
> [2] https://github.com/oasis-tcs/virtio-spec/issues/183
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/170
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/net/description.tex | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 96f7dc5..f5647d4 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -660,24 +660,35 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>  If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
>  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6
>  features are used, the maximum incoming packet
> -will be to 65550 bytes long (the maximum size of a
> -TCP or UDP packet, plus the 14 byte ethernet header), otherwise
> -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
> -making for 65562 or 1526 bytes.
> +will of size 65589 bytes long (14 bytes of Ethernet header, plus 40 bytes of
> +the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
> +extension header) otherwise 1514 bytes.
> +When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
> +size is either 65601 or 1526 bytes.
> +When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
> +size is either 65609 or 1534 bytes.
>
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>
> +If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the field
> +\field{struct virtio_net_hdr} is 12 bytes.
> +
> +If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field
> +\field{struct virtio_net_hdr} is 20 bytes.

For the receive side, is these needed?

Other is ok to me.

Thanks


> +
>  \begin{itemize}
>  \item If VIRTIO_NET_F_MRG_RXBUF is not negotiated:
>    \begin{itemize}
>      \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
>  	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
> -      the receive queue(s) with buffers of at least 65562 bytes.
> +      the receive queue(s) with buffers of at least 65589 bytes plus the size
> +      of the \field{struct virtio_net_hdr}.
>      \item Otherwise, the driver SHOULD populate the receive queue(s)
> -      with buffers of at least 1526 bytes.
> +      with buffers of at least 1514 bytes plus the size of the
> +      \field{struct virtio_net_hdr}.
>    \end{itemize}
>  \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
> -least the size of the struct virtio_net_hdr.
> +least the size of the \field{struct virtio_net_hdr}.
>  \end{itemize}
>
>  \begin{note}
> --
> 2.34.1
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

