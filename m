Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89F725A646
	for <virtio-comment@lists.linux.dev>; Sun, 26 Jan 2025 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737883194; cv=none; b=TXjFSpCdOt6LFnDQpwQVFCZU0gSrcYwPWhR3f76XfGY8jzk7gd6AQRwee5X2fz22rnv/URTWLilD+7k5vCzS27n6JlLJ9Q4e+sWNmv0BKquxx+Tgy6v5PZVaGTFQ0YHupHvxFnAoikoDILghzixht32dtEHmrxyBVqZuhoMz310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737883194; c=relaxed/simple;
	bh=MX3yvAXy+nFdldrFRroAllgfZETfzoNdmAMLeATt6OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IiAcmjeXo40nTeN/CRFDOKck5p6pbMDilsyO9/5DIO0XUc4gxyJwlO8yBnzMc1Po1uQAq5o4w7YVoxCJ8/qS4JvXwqDVFnRB+UuShFUp33iWNAGvI73qmJIv+lZIsiRfVzif5wWWpYyYKnHvky9ui7mVUBHXSV1xIeNdw3Klq+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V/OB8vAr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V/OB8vAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737883191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt/QDppz4THWA0ub94cNS23cMlVVWuYJ91pliI658BA=;
	b=V/OB8vArXoYFhlvRC0WWLQ6fGq0s2RufopGTf0lq50VCLLHkDvymwyy/RTVLuT9NTs6EIx
	AWjRunCH6B34v1uCyzRqRBPfyYuoDP31IM8RKslpKrU+Q+xuAjXxxuKEOVMMdqjQH+wKea
	A15CoamlJMGBYr4xYCiGEnMp4hSU6Yo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-IRGM0t4pMLmGigIHvu5rrQ-1; Sun, 26 Jan 2025 04:19:49 -0500
X-MC-Unique: IRGM0t4pMLmGigIHvu5rrQ-1
X-Mimecast-MFC-AGG-ID: IRGM0t4pMLmGigIHvu5rrQ
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38bf4913659so2765682f8f.1
        for <virtio-comment@lists.linux.dev>; Sun, 26 Jan 2025 01:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737883188; x=1738487988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zt/QDppz4THWA0ub94cNS23cMlVVWuYJ91pliI658BA=;
        b=aiGVYLakibX4VGKK7mPukHuzFfLN8NubNx1qtKd8Az5aTcruMVOyuec8Ho1cxKO/ln
         Xx5jfwRP2WQtFQ27pIe3LTV9gcBAUTS5kB+LERKDBufVuKzhSlh1fO51knhFPK72vGwe
         gpl4PvS4769Bp1Rtrw+sfek7u3nJMKGWN48ir3MCoQ7amKoo6wq0qjIwJuGD4weJz9/V
         DK0LtXaPvzQ4FKiYhg6NYoJn/iE2tkRsg3EvHp7Eswo9MzMljmFeKO7fUlRxrtOQI9hR
         /8teySIiHj8rTQ/8Q4peyow7hc+j+Q8pZNq2Ae30qlRiCwLkpZR2H2FGTkoHz31KLNIr
         +6/A==
X-Gm-Message-State: AOJu0YwMuYk6GEd1O+xgmyrmvTsFKY2sH02S0as8Bpct+xGqHGWJTE5j
	IFvkdqctyFQk0CBoyjup505a+6RKYFI1pIRWRY87q/5WEJ7PmeUEgvJRUd+7SVQcCaTFfSwaFhN
	9CryCwl26gohdjJq+oEKvOZRSVvp62MWycmjfWQineWyl26e45muNlES6plR76Olj
X-Gm-Gg: ASbGncu8e3lzXJX4biB34rFXg2RCi+sLnwfsaZdBU/Szhj6T11ekYgjf3vExm7KPLoe
	bQsb18QGx0UOKeXNiMDBqPuoaNwf0H6ojP84kX2zso3jXBXrsslBw+bwfQqpKo3kTc/H6BpgDk9
	J41qO5v959qgCTR5bdeMZvk9KmXqVWS9rpDTxD6Z6tIHTyUws/HM2sLA0jpYdGr5oBZhtDR5rc6
	MxXAYf8RhptMgllgFhRUs4m2wukZArtHegoarLOq0xKxbxjWpwUbcctFCzlzxZwiRYpi94rAkQ=
X-Received: by 2002:a5d:64a1:0:b0:386:3262:28c6 with SMTP id ffacd0b85a97d-38bf5677c09mr32803590f8f.5.1737883188456;
        Sun, 26 Jan 2025 01:19:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4C7gg4iFVjgJ1/hIhGv/96KX1kN22H8BnFkeYBuLTv1iuyl6X0khnFC8ZCne7T9BlcGn1hA==
X-Received: by 2002:a5d:64a1:0:b0:386:3262:28c6 with SMTP id ffacd0b85a97d-38bf5677c09mr32803572f8f.5.1737883188050;
        Sun, 26 Jan 2025 01:19:48 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:443:5f4e:8fd1:d298:3d75:448e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4295sm7807434f8f.91.2025.01.26.01.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 01:19:47 -0800 (PST)
Date: Sun, 26 Jan 2025 04:19:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250126041732-mutt-send-email-mst@kernel.org>
References: <20250126062058.13695-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250126062058.13695-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nb8TikRyk-LCD004T2I1yIjFiSS9Vc1kbjipZxE8fXk_1737883188
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 26, 2025 at 08:20:58AM +0200, Parav Pandit wrote:
> Listed patches in the fixes tag, incorrectly used the reserved feature bits.
> Fix them to use the well defined device specific range.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/212
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/213
> Fixes: 8cd457d8aa82 ("virtio-net: define UDP tunnel segmentation offload feature")
> Fixes: 3fea589bd7c6 ("virtio-net: define UDP tunnel checksum offload feature")


Well the hashes will be wrong I think.
So, we can do the ballot for this fixup, and wait with
applying the patches until that new ballot completes.
Or we can do a completely new ballot.

> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 
> ---
> changelog:
> v0->v1:
> - added Cornelia's reviewed-by
> - added github issue number
> - skipped Paolo's suggestion to modify 'le64 offloads' as its only 64-bits
>   and new feature bits are in > 64 bits range
> ---
>  device-types/net/description.tex | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index efb543f..b546cd7 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,18 +88,6 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>  
> -\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive GSO packets
> -  carried by a UDP tunnel.
> -
> -\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (47)] Driver handles packets
> -  carried by a UDP tunnel with partial csum for the outer header.
> -
> -\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive GSO packets
> -  carried by a UDP tunnel.
> -
> -\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (49)] Device handles packets
> -  carried by a UDP tunnel with partial csum for the outer header.
> -
>  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
>      to the driver through the control virtqueue.
>  
> @@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
>  
>  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS contexts.
> +
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive GSO packets
> +  carried by a UDP tunnel.
> +
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver handles packets
> +  carried by a UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive GSO packets
> +  carried by a UDP tunnel.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
> +  carried by a UDP tunnel with partial csum for the outer header.
>  \end{description}
>  
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> -- 
> 2.34.1

