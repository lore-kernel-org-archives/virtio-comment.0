Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1541F37B3
	for <virtio-comment@lists.linux.dev>; Fri, 27 Dec 2024 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735306951; cv=none; b=YldA33AKDQtpxG7zMbXQDwhnd35OI1rTEznjWAo0IEQp3XMcNPez1+1EIowx8mDSGsJ3Q8XTTqQxLWyf/1IRCIr35kFdKp/CDuie2PKVhSqeH/Bs5AJ5x+FryACXlDXLfsZRawOvaMmuRTuimb02yWrEEi6e7XZboCZ+XdcXcPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735306951; c=relaxed/simple;
	bh=THYN2pfkB6VpP/IduURHO1dlgGGwa7JXfI4MbRUc6rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=VCTorN0G6Ai6OTGuP+STKoMPNn5nx0U5fdXA4JDwS6RnGZTYZOeFy3GGPD2Y4R7ZVda7NYsmsGJOyzMt6TtcTzJ+K4oR7tjm6R7Jh5MZy5g7ko2c+CpnEPnsFz6tsrvnIIavx6ArM6ywPvG8m/6eRLfvBV7O0c1eKklGuNtHNd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c5BtW2DA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c5BtW2DA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735306948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=42wvMwoEfsx+gpcoo5Rh5bUNr+9IxQYUWlyL1saR91E=;
	b=c5BtW2DAFV1N6yovGdl8i2kR7ooKVruDxoQ5Tr94r9v9tgwfMW7/U6UPDSGRzT3rrBzeFk
	Bj4NuvEVj4HqLOzvzi03Gh4PZK7uGgR8tTFzGoRFcm5Z8YykAJj5DcH77HI0rZf2OWiiNO
	Q8kfEdo+fYr7DTy5NLtIEKCAxpsBvwA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-M4YtvjSnNj2ALPo9sUPhcQ-1; Fri, 27 Dec 2024 08:42:27 -0500
X-MC-Unique: M4YtvjSnNj2ALPo9sUPhcQ-1
X-Mimecast-MFC-AGG-ID: M4YtvjSnNj2ALPo9sUPhcQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385e1339790so4587059f8f.2
        for <virtio-comment@lists.linux.dev>; Fri, 27 Dec 2024 05:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735306945; x=1735911745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42wvMwoEfsx+gpcoo5Rh5bUNr+9IxQYUWlyL1saR91E=;
        b=eWeCV3CahwEYo1BzFfPPznchoEIK/dd9BkDOBSBKeHZ09VUZ7MZboEpO7gtCYbB82A
         mQ7f7KUHejPzIdCFZ7SkAYdM38RrC7Pj+UpFiSgTx8JcIWVHcmauA8AnkzqK2bPJfrZ+
         3fYZNT8Gi1ej76div75GGWqxsSqt/BOZhQ27JXXdo4vy1+r2w53zBxbt4IMo/J0aMId8
         NjxczylWMCT6E/nq9QX+J5KGFwV69bR4BNeB88h0moVFIdjO7IlHoYUSMpdK+1VVHVrw
         wxVeO+cYYaDCMT12URvJ9DU8vxhZkqQu1FM5Gc2wjVww2gnV12Uw+MDOy7C9A6GmYzTZ
         ChUA==
X-Gm-Message-State: AOJu0Yw1haJwpErX1fs6MOiE2/nMzQtcAsFlaoteDewuoG46ZJR8X+ki
	HAn1rnqhUZhDpQXXq6x+NExK4uRHV6FaSfjALKVpzyVssAq0byiNowEB0+inb45sOalj1TxaHQ6
	WxV7BGuEU8Y5HtcBDHVM0sedpS3h11uw8QDNd45fkVCAuzSxQb44LtyIQaiL1WDl6ACHh4UTH
X-Gm-Gg: ASbGncsOV/iLoq6cGBpttgPtfJoIqcvhTLRnb6fbJnmpDWFe3vvReZGE/P/YnQfiUr6
	fDC2SLciXn5giCk8EfDuakFTyvY6PPBEORfCRRoXy++2w9VSg7ZMpVdTizBm2HpclyHNgHtINHS
	RC33iu5IGZkuwcjtS5lIpjiaUHAH9WvsWJMl1JuESoevtincElnwY/bQPGtXnfqhkkpXGMCbUij
	NC7wOFJ8tQkpqwQf50+emw/ZUXvIp1ec5m8SVQKWCuWReV6
X-Received: by 2002:a5d:5e09:0:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-38a223f7548mr24378346f8f.38.1735306945049;
        Fri, 27 Dec 2024 05:42:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGA8hjOqgY/LDG0K+Z1vqBdE84RPnwCVf4sB06qqOsQ+W++7Z2SlVcy3EOoxpTx5kSI57r7xQ==
X-Received: by 2002:a5d:5e09:0:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-38a223f7548mr24378330f8f.38.1735306944711;
        Fri, 27 Dec 2024 05:42:24 -0800 (PST)
Received: from redhat.com ([176.12.185.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219578sm268776305e9.20.2024.12.27.05.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:42:23 -0800 (PST)
Date: Fri, 27 Dec 2024 08:42:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>, devel@daynix.com
Subject: Re: [PATCH v2] virtio-net: Ignore num_buffers when unused
Message-ID: <20241227084118-mutt-send-email-mst@kernel.org>
References: <20241227-reserved-v2-1-de9f9b0a808d@daynix.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241227-reserved-v2-1-de9f9b0a808d@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xioC1SJYQgc8UlMa6i2d64RbYvUJje3YwZisnuZtftU_1735306946
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 27, 2024 at 01:08:50PM +0900, Akihiko Odaki wrote:
> If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
> leaves num_buffers uninitialized while the specification tells to set it
> to one.
> 
> Let drivers ignore the field to make them compatible with
> vhost_net/QEMU, in a way similar to hdr_len field, which is also
> marked as unreliable due to implementation bugs.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> Changes in v2:
> - Corrected the change description to tell vhost_net and QEMU leaves
>   num_buffers uninitialized where it used to tell they set it to zero.
> - Restored statements that require devices to set num_buffers to one.
> - Link to v1: https://lore.kernel.org/r/20241226-reserved-v1-1-39ca566889c0@daynix.com
> ---
>  device-types/net/description.tex | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 76585b0..70c8b31 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -863,6 +863,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  This is due to various bugs in implementations.
>  \end{note}
>  
> +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST ignore
> +\field{num_buffers}.
> +\begin{note}
> +This is due to bugs in implementations.
> +\end{note}
> +
>  If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
>  VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>  rely on the packet checksum being correct.


should

we can not post factum make existing previously compliant drivers non-complient

> ---
> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> change-id: 20241226-reserved-d5960f173223
> 
> Best regards,
> -- 
> Akihiko Odaki <akihiko.odaki@daynix.com>

