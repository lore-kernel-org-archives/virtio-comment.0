Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E7617F39A
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983286; cv=none; b=JaEfeCOOXbkELMrq+dfxpjtrSTO/ktPJxdek7egj/MAkaOTXSY39G+VL4ds68RAZdBXxQMh7SYx2hcHZlCfqcpHV9ItcAXzLHv+3/3a1L2V643SbfewW7P+q94LJl9NMn8lxxMa98LGeBe274P+o/Ay9yYXPXO/4IrQ3tn/IP5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983286; c=relaxed/simple;
	bh=iKqgzfGITBjgkloSjJA+ZUmlbpCJHsVWKyc3bHarv/I=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=ZBzwo8b5vsZ57BOhQxUaGCTdCNaAiBTLAG9IFZGFNZzRZqxYQHS89aI9R18j4PWEVA4AZVYghL2BxSi/OdKU0a9DfmNMq2HVlF5Ufyo9acqoqUML2whrUfU8T2x9CllrzNAixMMwjR9BYbG5VXRvCx/ChtqbRxtv8rW+ro3eIKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=WOCimG/t; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="WOCimG/t"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1716983275; h=Message-ID:Subject:Date:From:To;
	bh=rVjG9eBUWKhsqPtL1ixuQl2cOqEbz6n6Sm0yDxp3pnI=;
	b=WOCimG/t1kFnSnrJ+JdgOEpBKKR+dk2be7dQJWpcU+T+4K+jGwexH60TQx1gqrxUlgMuBvYiktsbFCEyfmZ2VTBqFQDQwo5yEqF/W4QiK/vxQWTdeW9sP68IiQswZiCutCWxeu5+p2t2xluW6VsN/nie2N/RaZVn/O8BGfWIowE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R771e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033068173054;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W7TnK3-_1716983274;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0W7TnK3-_1716983274)
          by smtp.aliyun-inc.com;
          Wed, 29 May 2024 19:47:55 +0800
Message-ID: <1716983261.4072354-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5 2/3] virtio-net: Clarify the size of the struct virtio_net_hdr for tx
Date: Wed, 29 May 2024 19:47:41 +0800
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
 <20240521122303.2004122-3-parav@nvidia.com>
In-Reply-To: <20240521122303.2004122-3-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Tue, 21 May 2024 15:23:02 +0300, Parav Pandit <parav@nvidia.com> wrote:
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

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


>
> ---
> changelog:
> v2->v3:
> - rephrase tx to refer to the rx side virtio_net_hdr consideration
> - addressed comments from Xuan
> - replaced 'field' with 'structure'
> v0->v1:
> - addressed comments from Xuan to rewrite tx normative
> ---
>  device-types/net/description.tex | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 0753ba8..38992b0 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -531,6 +531,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>
>  \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
>
> +For the transmit packet buffer, the driver MUST use the size of the
> +structure \field{struct virtio_net_hdr} same as the receive packet buffer.
> +
>  The driver MUST set \field{num_buffers} to zero.
>
>  If VIRTIO_NET_F_CSUM is not negotiated, the driver MUST set
> --
> 2.34.1
>
