Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0BEAFA
	for <virtio-comment@lists.linux.dev>; Wed, 23 Apr 2025 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745387212; cv=none; b=Wjfi9H2iZ5K/zKaV0mLs5x+8qbuSMbyJcRW0Z4rS3xm4pbtiUzCTh7W2zkp8/SW1VByNigaTIDr5Hc+PgaqqXoir8TfUwHG5OVRTlP8/Yg1Z/W6VMZySr0sipXc/2Gjao4UfrBnHVcP/IBxbnkM1fmu+3EbIC1+1EVElGvhNkrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745387212; c=relaxed/simple;
	bh=NpE+W5b7R2uhbgyHnL02aseqWBT5zqd/Bv4pKRuiJTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YRjfnFWcsv7g118oDTw3WTTsbZyrZOFClI/Wg3C9MnBrUwdd7f2eMrwJMptYHdvDdVdTYGHkoQrhUCZ+Afjvw3UStXhXCrTc/zlpsc/Dk4PQGTKPI8g6/xf+s+3JyQsXIcnvjQD29Vc1/rT0gYLFEY7C15gDH4kGhq5TDXvuoHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XHJ2Lofg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XHJ2Lofg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745387209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=88hLvcofmKFAuD+bbQlF3x2xByf1R/Em20bqtMy7n7s=;
	b=XHJ2Lofg1b+NizBt57I32Sa0HkChAb9FdMvp6H8j7vA5QxZNyG/mYoQvdLEDgdHW7HdUxa
	sIx8t7SjUynkiuX/kRFXIUU5VAoKTSsgKYF8DNYzVOC3uEdxoiAmc1HXO5Gx65nUeEmox8
	hCvhGJYF7yDWfce+MjC+gvXdKh5DO78=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-x9TssonVPJ-TTKkuyzRFow-1; Wed, 23 Apr 2025 01:46:47 -0400
X-MC-Unique: x9TssonVPJ-TTKkuyzRFow-1
X-Mimecast-MFC-AGG-ID: x9TssonVPJ-TTKkuyzRFow_1745387206
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so24169285e9.2
        for <virtio-comment@lists.linux.dev>; Tue, 22 Apr 2025 22:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745387206; x=1745992006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88hLvcofmKFAuD+bbQlF3x2xByf1R/Em20bqtMy7n7s=;
        b=mqEat1+eRijUPAjtwzrNH8NBICABR3CGx0xm80XtMvISXuG6qibQqNUWONMBsB/cGQ
         p4V0YVaBlLeLtALK1J2UOuDBGRuL2BiKmXgEVpyGOoDYqdOb9925XChCiIRRTtDlsaZD
         u7QKw7DgocNV/ysZI/n/FPZy3x2Y87i79ck8QYTKsmmvrgGafzBKL4CSqbyDjAA6ACGx
         ANUS4NFkPHNxf48RR9GgsG5nH741/oIMjg9rpqjAXi0EdUARum0cYH6t+dlgebQJe7JJ
         tBXnVvc6U08KukyvoxsNbUDIkUohvBgiJqmJYxG2U/FNqnI+d2JAxE03cGuU38Wm+jUm
         k87Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUUl6nJQHNiaEjNNXnvCEOcjtHT4lDgVooU86rV095KbIqZbl/4AiuQb6eHnFpqGoJMLaP96urnO1jWzF6yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIGek56qGQPX8YTKHEcjzIvXpl3X17/p1bttTmO19QboWON71s
	b+WqP0BFEktiATQ7sBJrNollD/PMWSfLKJNViEZJYIo4oQv6QnOii84yURkKdNfwy38OwzlJXkb
	xPRx5W3NFF1sFA6sgj9fcx6uW+repAAp5+CcRG98rU6XBeD5Bq8SP5kjr9PsZBVnq
X-Gm-Gg: ASbGncslpbTvF8p6zwgnVUAwdDvr7puA8VOGrmFPZxVqdnMxIHWr59ZHQ91OXiDN76L
	sHZdzoLuc6/6zGtvCnjWXd0G0rtz+eN166P0GVwA0p8zq3VcnWQuvofA8wEHZEg0R6qevx+eF64
	CHUR0m27gAUOyiuEpVSqoIsvyPOgvDNC5/Q0pNosIwaANxRQKSWD5vT8+vp2c82d2y3FTVLYHXF
	xkTl2y+91u5iFQEopREQnEiHHLYrU8db8gyk3mUPhNDRboH/xdLYgqoL6wJwVIVvoth76gBH0LX
	axSSZw==
X-Received: by 2002:a05:600c:138e:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4406ac1ff50mr148008155e9.29.1745387206372;
        Tue, 22 Apr 2025 22:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2OJqRt2JXgQmiqvYSyTv5dTglrFptDuXXuBhwJ8wNmvm0yVEpDWdumn9XsumDsj387ENy0w==
X-Received: by 2002:a05:600c:138e:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4406ac1ff50mr148007935e9.29.1745387206090;
        Tue, 22 Apr 2025 22:46:46 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d38118sm12347595e9.31.2025.04.22.22.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 22:46:45 -0700 (PDT)
Date: Wed, 23 Apr 2025 01:46:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
	cohuck@redhat.com, mvaralar@redhat.com,
	Jason Wang <jasowang@redhat.com>, shahafs@nvidia.com,
	Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250423014257-mutt-send-email-mst@kernel.org>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4piEGT_VvkYf0u4fO4eSqt0la3HqXlNbKtmKHiNpLig_1745387206
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 22, 2025 at 07:49:41PM +0200, Paolo Abeni wrote:
> On 1/26/25 7:20 AM, Parav Pandit wrote:
> > @@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
> >  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
> >  
> >  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS contexts.
> > +
> > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive GSO packets
> > +  carried by a UDP tunnel.
> > +
> > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver handles packets
> > +  carried by a UDP tunnel with partial csum for the outer header.
> > +
> > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive GSO packets
> > +  carried by a UDP tunnel.
> > +
> > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
> > +  carried by a UDP tunnel with partial csum for the outer header.
> >  \end{description}
> 
> I'm finally trying to finalize the implementation and I must admit I
> underlooked the implication of using features bit >= 64.
> 
> AFAICS all the virtio drivers in the Linux kernel and qemu assume that
> the features can be represented with a single u64.
> 
> Supporting the above requires major reworks in both user-space and
> kernel space. At least on the kernel side a similar rework (extending
> the _netdev_ features field) has proven to be complex enough to defeat
> any implementation attempts for years and in the end it was dismissed in
> favor of lower bits reuse.
> 
> I'm wondering if we could reconsider using reserved bits here?
> 
> Thanks!
> 
> Paolo

:(

It's been there for 2 months now.

And if you want to avoid using all bits > 63 then it's even more of
a mess, you need to move VIRTIO_NET_F_RSS_CONTEXT which has been
there for a year and a half.

I'm afraid we'll have to bite the bullet.

-- 
MST

