Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0918136E18
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983614; cv=none; b=DRBjygy0mgTkk+5wQi1MFN9DWzrFTeOfoaTfdM13ZUXtCCc3y4n6tGa+tB+yA5hkvC/lFVr8KVbT9EfYmT238EpY3YcegDOPeaiKdeI8Mima4T96q2yJoC0J5227EGe0XY/6ii1qrHheCFaiCySqeddQUmf2GSw2yrpLl5jVp40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983614; c=relaxed/simple;
	bh=1rEjH+T7aFsdY+bkcKRdtSOdgp80ay5wi8Oo84Cvqs0=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=fAbpxIGJJb8ul50lSkA73LvMV76rp2L86Dq3clMvYbmcc3HBkfJ0YpCTeDP8jSNIvIg9KN91ZzyJi2OwgwaRG8EACimqyqVCY0CAY+7QckzN6dSTIztNuJP8JHd20gfZ9xhJYTjDApzSFcdURddFxgdAAxuFzi9wgDvHzTq5eZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=XqsZG11w; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="XqsZG11w"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1716983604; h=Message-ID:Subject:Date:From:To;
	bh=VIBaUg+DaYJtQlmYndulFPUGEFP8Pz6U8pQKCJyOI+s=;
	b=XqsZG11wA2vKYUM/IIBaK7Dfs9XlmpvHQ/fFjHkdjfIFYeevW2FpeKcp/m1qrQqPUa+82YN5ABFuJZSpLyST0ar8FRp3yZJ6NS0ppUUhYPeqZMJnfetZj98E5BCvPXn2EGVGrrnAlZJE/r98ptNu/8qNnWNB/Kf269ffhdF4agE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045046011;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W7TWPp2_1716983603;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0W7TWPp2_1716983603)
          by smtp.aliyun-inc.com;
          Wed, 29 May 2024 19:53:23 +0800
Message-ID: <1716983399.5245068-4-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5 1/3] virtio-net: Fix receive buffer size calculation text
Date: Wed, 29 May 2024 19:49:59 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: <shahafs@nvidia.com>,
 <xuanzhuo@linux.alibaba.com>,
 <yuri.benditovich@daynix.com>,
 Parav Pandit <parav@nvidia.com>,
 <virtio-comment@lists.linux.dev>,
 <mst@redhat.com>,
 <cohuck@redhat.com>
References: <20240521122303.2004122-1-parav@nvidia.com>
 <20240521122303.2004122-2-parav@nvidia.com>
In-Reply-To: <20240521122303.2004122-2-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Tue, 21 May 2024 15:23:01 +0300, Parav Pandit <parav@nvidia.com> wrote:
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
> v3->v4:
> - addressed comments from Cornelia
> - rephrase for virtio_net_hdr size calculation
> v2->v3:
> - addressed comments from Cornelia
> - added virtio_net_hdr inclusion description in buffer size calculation text
> v1->v2:
> - addressed comments from Cornelia
> - rephrase buffer size wording without explicit length of virtio_net_hdr
>   at 3 places.
> - replaced otherwise to ', otherwise'
> - rephrase non normative to write as driver normative
> ---
>  device-types/net/description.tex | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 61cce1f..0753ba8 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -660,10 +660,15 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
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
> +When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
> +size is either 65601 or 1526 bytes accounting for 20 bytes of
> +\field{struct virtio_net_hdr} followed by receive packet.
> +When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
> +size is either 65609 or 1534 bytes accounting for 12 bytes of
> +\field{struct virtio_net_hdr} followed by receive packet.
>
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>
> @@ -672,18 +677,25 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
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
> +When calculating the size of \field{struct virtio_net_hdr}, the driver
> +must consider all the fields inclusive up to \field{padding_reserved},

MUST?

Beside this.

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


> +i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
> +
>  If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
>  that will be used SHOULD be populated with receive buffers.
>
> --
> 2.34.1
>
