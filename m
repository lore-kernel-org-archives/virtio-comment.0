Return-Path: <virtio-comment-return-8939-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBD6C3DA79
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 16:44:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 89E2C8746B
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 16:44:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A18998657E
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 16:44:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4D6D79863E1; Mon, 15 Jan 2024 16:44:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E2709863E6
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 Jan 2024 16:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: yaMkHFCUMZagG2ulBd13-A-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
 mst@redhat.com
Cc: shahafs@nvidia.com, xuanzhuo@linux.alibaba.com,
 yuri.benditovich@daynix.com, Parav Pandit <parav@nvidia.com>
In-Reply-To: <20240115093141.3539316-2-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 15 Jan 2024 17:44:03 +0100
Message-ID: <87r0iimtrg.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text

On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:

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
>
> ---
> changelog:
> v1->v2:
> - addressed comments from Cornelia
> - rephrase buffer size wording without explicit length of virtio_net_hdr
>   at 3 places.
> - replaced otherwise to ', otherwise'
> - rephrase non normative to write as driver normative
> ---
>  device-types/net/description.tex | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index aff5e08..53a56ee 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -657,10 +657,13 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>  If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
>  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6
>  features are used, the maximum incoming packet
> -will be to 65550 bytes long (the maximum size of a
> -TCP or UDP packet, plus the 14 byte ethernet header), otherwise
> -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
> -making for 65562 or 1526 bytes.
> +will be 65589 bytes long (14 bytes of Ethernet header, plus 40 bytes of
> +the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
> +extension header), otherwise 1514 bytes.

Hm, I wonder if we should still mention that

"\field{struct virtio_net_header} will be prepended to this, which is
either 20 or 12 bytes long, depending on whether
VIRTIO_NET_F_HASH_REPORT is negotiated or not."

> +When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
> +size is either 65601 or 1526 bytes.
> +When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
> +size is either 65609 or 1534 bytes.
>  
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>  
> @@ -669,18 +672,24 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>    \begin{itemize}
>      \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
>  	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
> -      the receive queue(s) with buffers of at least 65562 bytes.
> +      the receive queue(s) with buffers of at least 65609 bytes if
> +      VIRTIO_NET_F_HASH_REPORT is negotiated, and of at least 65601 bytes if not.
>      \item Otherwise, the driver SHOULD populate the receive queue(s)
> -      with buffers of at least 1526 bytes.
> +      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
> +      is negotiated, and of at least 1526 bytes if not.
>    \end{itemize}
>  \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
> -least the size of the struct virtio_net_hdr.
> +least size of \field{struct virtio_net_hdr},
> +i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
>  \end{itemize}
>  
>  \begin{note}
>  Obviously each buffer can be split across multiple descriptor elements.
>  \end{note}
>  
> +The driver MUST consider size of field \field{struct virtio_net_hdr}
> +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
> +

Requiring the driver to consider the size of something to be its actual
size seems a bit odd :) I don't think we need this, as the length can be
derived from looking at the definitions, and is already spelled out
explicitly, if you consider my suggestion above.


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

