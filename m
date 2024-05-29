Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740713DDAE
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983322; cv=none; b=EuF/4F3O0oUK9FxGKLcob7rqL0jKYj2qH5LhcMUXMkGXyUiOKW8AJPM2AoYa80lYE61PoPkRgdRNll0QQxz2Crp1hG67cIoUqwxAKEecMq3BYglLJou//Axzt5CzwahKdgkcPvT4waZ//MAX0R+S/g2zyXr2MxgoXhwNexurxSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983322; c=relaxed/simple;
	bh=zc/gOP6ygL5ak9Jstkt1hRu+fq9tAe2znLcAtvoI6qc=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=gnn6Aqs6tpKry2O2IgT/v4yXvFyrHxeE70oFG1qeFWOlNE7NPtt8nIwZySOHtBxTjgRdGlHtXgsj9oCj01cCnfbZaiukzvKG0m09VSWj+i1WPFOOsOw8I0+bjcDu+zs40jNw6TYGKfWe8u9bHqmmI5wQiK34stOXOdkAuLLpzM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rMFic9uT; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rMFic9uT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1716983311; h=Message-ID:Subject:Date:From:To;
	bh=6kOfCUBEgxJm1eIjvmxou6lc+bGT6Ak68y1jXX/iXM8=;
	b=rMFic9uT2GsS3s1H6g777ZpnHhkAWWhalYcghf+pY5cLJFP2lkPfKT5doAhFSLRorUWYx+S5xFSXzY0inefuJpRCUTEwTYSfcgdL4lDsNmdsGxl3xi/pskvYBSlc4NmlRaoYiTeSx8HPTPrH2MwfyaO07duVtan0atfpZWe0Daw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032014031;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W7Tiyh2_1716983309;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0W7Tiyh2_1716983309)
          by smtp.aliyun-inc.com;
          Wed, 29 May 2024 19:48:30 +0800
Message-ID: <1716983303.9073324-3-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5 3/3] virtio-net: Annotate virtio_net_hdr as field
Date: Wed, 29 May 2024 19:48:23 +0800
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
 <20240521122303.2004122-4-parav@nvidia.com>
In-Reply-To: <20240521122303.2004122-4-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Tue, 21 May 2024 15:23:03 +0300, Parav Pandit <parav@nvidia.com> wrote:
> At several places struct virtio_net_hdr missed out the field
> annotation. Add it.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


> ---
>  device-types/net/description.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 38992b0..e65cdd5 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -437,11 +437,11 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
>
>  \subsubsection{Legacy Interface: Device Operation}\label{sec:Device Types / Network Device / Device Operation / Legacy Interface: Device Operation}
>  When using the legacy interface, transitional devices and drivers
> -MUST format the fields in struct virtio_net_hdr
> +MUST format the fields in \field{struct virtio_net_hdr}
>  according to the native endian of the guest rather than
>  (necessarily when not using the legacy interface) little-endian.
>
> -The legacy driver only presented \field{num_buffers} in the struct virtio_net_hdr
> +The legacy driver only presented \field{num_buffers} in the \field{struct virtio_net_hdr}
>  when VIRTIO_NET_F_MRG_RXBUF was negotiated; without that feature the
>  structure was 2 bytes shorter.
>
> @@ -735,7 +735,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>    chains them together to form a single packet in a way similar to
>    how it would store it in a single buffer spread over multiple
>    descriptors.
> -  The other buffers will not begin with a struct virtio_net_hdr.
> +  The other buffers will not begin with a \field{struct virtio_net_hdr}.
>
>  \item If
>    \field{num_buffers} is one, then the entire packet will be
> @@ -2416,7 +2416,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>
>  When using legacy interfaces, transitional drivers which have not
>  negotiated VIRTIO_F_ANY_LAYOUT MUST use a single descriptor for the
> -struct virtio_net_hdr on both transmit and receive, with the
> +\field{struct virtio_net_hdr} on both transmit and receive, with the
>  network data in the following descriptors.
>
>  Additionally, when using the control virtqueue (see \ref{sec:Device
> --
> 2.34.1
>
