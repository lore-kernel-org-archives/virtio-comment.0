Return-Path: <virtio-comment-return-8941-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBB2C47077
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 03:36:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6FBB72AFFC
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 03:36:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 52DA9986636
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 03:36:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 34DF4986556; Tue, 16 Jan 2024 03:36:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1EE33986561
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 03:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R611e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W-kfX9B_1705376159;
Message-ID: <1705376090.3631244-1-xuanzhuo@linux.alibaba.com>
Date: Tue, 16 Jan 2024 11:34:50 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: <shahafs@nvidia.com>,
 <xuanzhuo@linux.alibaba.com>,
 <yuri.benditovich@daynix.com>,
 Parav Pandit <parav@nvidia.com>,
 <virtio-comment@lists.oasis-open.org>,
 <mst@redhat.com>,
 <cohuck@redhat.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-3-parav@nvidia.com>
In-Reply-To: <20240115093141.3539316-3-parav@nvidia.com>
Subject: [virtio-comment] Re: [PATCH v2 2/2] virtio-net: Clarify the size of the struct virtio_net_hdr for tx

On Mon, 15 Jan 2024 11:31:41 +0200, Parav Pandit <parav@nvidia.com> wrote:
> The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
> However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it was
> not clarified that the size of the struct virtio_net_hdr on the packet
> transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
> negotiated.
>
> Explicitly clarify this.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
> Signed-off-by: Parav Pandit <parav@nvidia.com>
>
> ---
> changelog:
> v0->v1:
> - addressed comments from Xuan to rewrite tx normative
> ---
>  device-types/net/description.tex | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 53a56ee..e2de016 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -528,6 +528,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>
>  \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
>
> +The driver MUST use the same size of the field \field{struct virtio_net_hdr}
> +for transmit and receive packet buffers.

s/field/structure/ ?

Thanks.


> +
>  The driver MUST set \field{num_buffers} to zero.
>
>  If VIRTIO_NET_F_CSUM is not negotiated, the driver MUST set
> --
> 2.34.1
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

