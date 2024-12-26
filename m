Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F397B79CD
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735198340; cv=none; b=b9VLeovrnA1iC7SqkXWi1E3fbixXdUJy2se9lR9ZTBv4PSBroCwahGgXTXb47tuqD/M+eEsZQ2R3+ssBLspjuKIRPpBT4kbj3wtkjuETdIU1xkFxV2LAHhBXZmtRSAUo9z2f/fD+0+eBbMTYbM3xiwpQzDlCO2uLQ16+QGTDLxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735198340; c=relaxed/simple;
	bh=hWQLtKFyaRBPFJhyI2D2khYebjH0EwCWjZcmUGBidI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pfqJG5e436CYQAPBAQWNVXQlKMh/+kasom+T3AULSYn2tbSpvLjUzgEB1+Cd5+Vs4nK0HO0aiyjeO9qSwNTXqWWVOYIIdZuBZp3pbuxAjYb427mFhMrsu6Ayy+BhrDtsiVsOEyuwlvjMcTj5++L4h5jAyKq3PQr22K+BNiTioUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EbpWdIQ7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EbpWdIQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735198335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHS+qmDppOWjtK0+/EsDy6bc3oTfSGPtRSgMA4acOd4=;
	b=EbpWdIQ7Z9yYuuaPGDVkESuYFhT9Xy2jVd5YDYXmCxco8Njhv0ZxRlNuG6o+w5LAQ368nD
	8N3IOw/Q6dWJtEw63vSoYZgG+Hjt48kRaCA6TpMmWRSkZVfxoTL1xoJQfckbqMxu7/TXs1
	OW8KrmPXdAcFO7f8l6VkxHfVyoqycgI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-hK5BVZwIOou507ik88dFAw-1; Thu, 26 Dec 2024 02:32:14 -0500
X-MC-Unique: hK5BVZwIOou507ik88dFAw-1
X-Mimecast-MFC-AGG-ID: hK5BVZwIOou507ik88dFAw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-436225d4389so33232265e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 23:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735198333; x=1735803133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHS+qmDppOWjtK0+/EsDy6bc3oTfSGPtRSgMA4acOd4=;
        b=v83KPAoQmqsqQ+1k/0ug8H/omLG1NU1zTe+EJYQdphK6AZOMycG6BfsgTp+oDTIJOr
         aFCVklqtS844QC1y9bCI5qYDqcZeRYn8xMSWody7Gnv9HHneqMbesZEytQhqPyx3uIL6
         vMAglc4lKvyKYN3FVAy+BVjNwtS+mEAI9ZL+TFzqv3HAHsnsau6uOpWP6pBPo/BLfHwH
         I6n4ay4oTeHNj5P/al8oQl8CSy032pl9PzZL5XPeAu+DEYwVv7XTs/5z+W8y9vnc8olu
         U5ERrZMMH4segbXVIEnGx1B7XXVNemv4rlkZjzQXBZA6dai19tHpgJk483nAsrSl3ZvQ
         H+fA==
X-Gm-Message-State: AOJu0YzvtKlQYfBj8T9VZL6Ne+sB+Rw3acc//4NOvDxY0M374qsvE9BM
	dPZubfXPVU4a4pLAF/KME/GzsA19WyqnPJux2ZvS8Z18DzkjBcfZbPBBm32a9ziKCmJixrRD95c
	IzWowTZNtpQ6aOT5jjQO2OehV1S6uEVD4JOl7ywluCdiJ+fa63Hwv8vunzDyUWWsj
X-Gm-Gg: ASbGncvX14d1G4Bz1ZPs1gh8z+/1CaxypBS6uyX/gfa7hp5E3eVSC2cHeMS/OMGJNjM
	KgEmhCoxitYSBDP7kpQIlwy4grw1lS13+aL8bIn4Bc9F1ptBp+8BXj4NOrvO/z8B9eKmckhGqnu
	Jc1FRwrPOTtMljqiNUEjuX75+znCMr8Rc6hFh+00PAll1PHW1iwnXXYt9f/I5FdWKzVgX+FaYgL
	S1xM9SuG9hgPiIv1ZR3pmhKUsSh8fGGh6NJE34iq6bPo73Fiw==
X-Received: by 2002:a05:600c:4f89:b0:431:15f1:421d with SMTP id 5b1f17b1804b1-4365fc09731mr199931935e9.16.1735198333235;
        Wed, 25 Dec 2024 23:32:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPc1KcZoo2pm8iZ8oHXuEEOm3kgdE7waVrocgswjfjTrhiRfOWnibw0WAkQnxcpNtuKhDmZg==
X-Received: by 2002:a05:600c:4f89:b0:431:15f1:421d with SMTP id 5b1f17b1804b1-4365fc09731mr199931775e9.16.1735198332863;
        Wed, 25 Dec 2024 23:32:12 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f2:9e6:f7bb:3b80:d3c1:75b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e219sm19014223f8f.84.2024.12.25.23.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 23:32:11 -0800 (PST)
Date: Thu, 26 Dec 2024 02:32:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>, devel@daynix.com
Subject: Re: [PATCH] virtio-net: Ignore num_buffers when unused
Message-ID: <20241226023128-mutt-send-email-mst@kernel.org>
References: <20241226-reserved-v1-1-39ca566889c0@daynix.com>
 <20241226022749-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241226022749-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mV7z6pg34-CnFccJDTQB0cMwumG279cCYkjXL0BeAuw_1735198333
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 26, 2024 at 02:29:09AM -0500, Michael S. Tsirkin wrote:
> On Thu, Dec 26, 2024 at 02:37:17PM +0900, Akihiko Odaki wrote:
> > If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
> > sets num_buffers to zero while the specification tells to set it to one.
> > 
> > Let drivers ignore the field to make them compatible with both
> > vhost_net/QEMU and devices already compliant with the specification.
> > Also, remove statements requiring devices to set the field to one to
> > make vhost_net and QEMU compliant.
> > 
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > ---
> >  device-types/net/description.tex | 26 +++++++++++---------------
> >  1 file changed, 11 insertions(+), 15 deletions(-)
> > 
> > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > index 76585b0..b82fe8f 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -683,15 +683,12 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
> >  
> >  \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
> >  
> > -The device MUST set \field{num_buffers} to the number of descriptors used to
> > -hold the incoming packet.
> > +If VIRTIO_NET_F_MRG_RXBUF was negotiated, the device MUST set
> > +\field{num_buffers} to the number of descriptors used to hold the incoming
> > +packet.
> >  
> >  The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
> >  was not negotiated.
> > -\begin{note}
> > -{This means that \field{num_buffers} will always be 1
> > -if VIRTIO_NET_F_MRG_RXBUF is not negotiated.}
> > -\end{note}
> >  
> >  \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets}
> >  \label{sec:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
> > @@ -704,9 +701,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> >  Processing incoming packets involves:
> >  
> >  \begin{enumerate}
> > -\item \field{num_buffers} indicates how many descriptors
> > -  this packet is spread over (including this one): this will
> > -  always be 1 if VIRTIO_NET_F_MRG_RXBUF was not negotiated.
> > +\item If VIRTIO_NET_F_MRG_RXBUF was negogiated, \field{num_buffers} indicates
> > +  how many descriptors this packet is spread over (including this one).
> >    This allows receipt of large packets without having to allocate large
> >    buffers: a packet that does not fit in a single buffer can flow
> >    over to the next buffer, and so on. In this case, there will be
> > @@ -717,9 +713,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> >    The other buffers will not begin with a struct virtio_net_hdr.
> >  
> >  \item If
> > -  \field{num_buffers} is one, then the entire packet will be
> > -  contained within this buffer, immediately following the struct
> > -  virtio_net_hdr.
> > +  VIRTIO_NET_F_MRG_RXBUF was not negotiated or \field{num_buffers} is one, then
> > +  the entire packet will be contained within this buffer, immediately following
> > +  the struct virtio_net_hdr.
> >  \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> >    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> >    set: if so, device has validated the packet checksum.
> > @@ -764,9 +760,6 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> >  \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Types / Network Device / Device Operation / Processing of Incoming Packets}
> >  \label{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
> >  
> > -If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
> > -\field{num_buffers} to 1.
> > -
> >  If VIRTIO_NET_F_MRG_RXBUF has been negotiated, the device MUST set
> >  \field{num_buffers} to indicate the number of buffers
> >  the packet (including the header) is spread over.
> > @@ -863,6 +856,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> >  This is due to various bugs in implementations.
> >  \end{note}
> >  
> > +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST ignore
> > +\field{num_buffers}.
> > +
> >  If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
> >  VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> >  rely on the packet checksum being correct.
> 
> 
> There could be drivers relying on it.
> We can add a SHOULD not and ask drivers not to look at it,
> and we should fix devices.

Maybe allowing 0 too is a good idea? Need to think through
implemenation concerns.
In any case, pls fix devices.


> 
> > ---
> > base-commit: b495841a8e80d12c1130f8868f4128866291142d
> > change-id: 20241226-reserved-d5960f173223
> > 
> > Best regards,
> > -- 
> > Akihiko Odaki <akihiko.odaki@daynix.com>

