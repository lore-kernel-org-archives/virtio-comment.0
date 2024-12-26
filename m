Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D354819AD89
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735204436; cv=none; b=V3UnGTEPX3hCfPVSfymcVF5Rw6cmTAn13w/grjbPq2qEgkRefwUbzNGf2iNlmIJTgWKVdqwS5wLsFo0Fq98H9mpiyeuGJ8qhQVhhl5/bLzjfiO1GJGRINzMIFEA2IUXsVN/ODtAF5xjC/fpMSgGA69uvBsTiyLlDT9n+vue8E3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735204436; c=relaxed/simple;
	bh=sImNhrJwLr+tm9Ee8HWmtBqhY1dkX2Q+54Y+HrR4XBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HcNdxbNTSx13b481Str1R9HT+EfBaBkNffEMcONwY3X3ToqOtagG0+PoufGzAIVoubp4xZcs/HubgsxbkGv+hh/KuNk7xXwecwpzMiRhJOV1N8ERmOpxuU8gvMQ/LlJVvlYbmn4Mj8iZ/JsxkvPg7FaZww6KL0NZBW9f9UB7J3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ytl2UD8K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ytl2UD8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735204433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tj8BoOX7ByM6Xb6riTlT3yr+xYq+d8Phqg56+ttfmz4=;
	b=Ytl2UD8KjBNhDWDTBzWiv4Z5mlAuMP3DskHkcDCGn760SiwPnaoD8bIZMUyn734TQiTVk8
	D8POtkdTriSxmeTCS0YeTUIZ80Yqo0mUbCtOpH6s3+ta/E9D19onXfvqNcoz0jIY3HUmUc
	XOlP87x6Pp4kBVzUBmGiAK7MnbLluMI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-mhhndlAsM86JxkyAiqyrcg-1; Thu, 26 Dec 2024 04:13:52 -0500
X-MC-Unique: mhhndlAsM86JxkyAiqyrcg-1
X-Mimecast-MFC-AGG-ID: mhhndlAsM86JxkyAiqyrcg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38629a685fdso2636324f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 01:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735204431; x=1735809231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj8BoOX7ByM6Xb6riTlT3yr+xYq+d8Phqg56+ttfmz4=;
        b=qD0oLtIEkSGM+Pmd83pVkEbo61ePZ/Tvnt4mSOUhzs8ft1x8TSu3LUZVrLMz42JOf2
         gP9Y4fShvz3B9aeYoquXbGg1qgXBJyAFOLh9vOhzzlx1e5xPim4bw1PXQ8OgBxAljVvd
         RlnlcLrVz783sAGXAwdif3jfB9ZTh/OMOlTJsTxZI3JFUafrzT11coKI19GhlH1iKkEM
         VMKlsxxVhn7YZWrAHEyqMP8uvw0cyoF9clwmgndjm97lLGrGbRx5K2oDXsOiGRAvTVa1
         I1IsijNnPv36nBmS9U51ZuQDCD7gnGOzJxFg36e9VmCbdaZ4uiGg1rgyKXbf52i5MlJs
         A8EQ==
X-Gm-Message-State: AOJu0YxAsyTWAvjMls8ZoHoBMkqLp2dGFIvOUanK8899Zcf+7Q1lPDpq
	S8gzV959H2br47S66E9tdN9xdnIm7OuwVwo2k7wju/k4o2btRIL3sUiqmevCciQO9dXtl9EISTn
	FAXc/WoY7QW+hpueDHtPkqAXnxtBgeLCI0HlAjaNIhuCX+wSoyycd9/32scv0+lKO
X-Gm-Gg: ASbGncuektsKsgphTGh1OdgUUN3wfnJP9DhUHJ2jwLqwJC+S13YEacXaXGZoXR9+t5b
	dgX9U3fXH+VNqH62Y5JConddcX11zNYzI2PN8SxHpRd5ZNv5t4gBmcI+YuKQ9lnvVFBFXqrppSZ
	tAAwaH5JujqjqMiWge0avZ+7HhaXr3W15HH59nY5qCgfOuKwhdA6svPTKLAPOj+Cx1ttyQkjchX
	zeIwN2mhFBaMI2ooKsof9mJcIue92WVx3f63cz1nMG9Z4QUgA==
X-Received: by 2002:a5d:6da4:0:b0:385:f1df:2502 with SMTP id ffacd0b85a97d-38a223ff412mr17637676f8f.36.1735204430860;
        Thu, 26 Dec 2024 01:13:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTD4sx+8c6z1mB0C+F7YVUC+dpBL0GS6fokWCRCJ8QXxVawQPuATPfjy30eIIzjEtzfasP1w==
X-Received: by 2002:a5d:6da4:0:b0:385:f1df:2502 with SMTP id ffacd0b85a97d-38a223ff412mr17637639f8f.36.1735204430294;
        Thu, 26 Dec 2024 01:13:50 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f2:9e6:f7bb:3b80:d3c1:75b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611fc762sm226056505e9.11.2024.12.26.01.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 01:13:49 -0800 (PST)
Date: Thu, 26 Dec 2024 04:13:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>, devel@daynix.com
Subject: Re: [PATCH] virtio-net: Ignore num_buffers when unused
Message-ID: <20241226041018-mutt-send-email-mst@kernel.org>
References: <20241226-reserved-v1-1-39ca566889c0@daynix.com>
 <20241226022749-mutt-send-email-mst@kernel.org>
 <20241226023128-mutt-send-email-mst@kernel.org>
 <5fe377c4-c10d-4c4d-8e8f-30420989452d@daynix.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5fe377c4-c10d-4c4d-8e8f-30420989452d@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ejcakwuY6IAeRsTGT8V2F5UCKaUs_mvq1ap030dC9JU_1735204431
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 26, 2024 at 04:35:55PM +0900, Akihiko Odaki wrote:
> On 2024/12/26 16:32, Michael S. Tsirkin wrote:
> > On Thu, Dec 26, 2024 at 02:29:09AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Dec 26, 2024 at 02:37:17PM +0900, Akihiko Odaki wrote:
> > > > If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
> > > > sets num_buffers to zero while the specification tells to set it to one.
> > > > 
> > > > Let drivers ignore the field to make them compatible with both
> > > > vhost_net/QEMU and devices already compliant with the specification.
> > > > Also, remove statements requiring devices to set the field to one to
> > > > make vhost_net and QEMU compliant.
> > > > 
> > > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > > > ---
> > > >   device-types/net/description.tex | 26 +++++++++++---------------
> > > >   1 file changed, 11 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > > > index 76585b0..b82fe8f 100644
> > > > --- a/device-types/net/description.tex
> > > > +++ b/device-types/net/description.tex
> > > > @@ -683,15 +683,12 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
> > > >   \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
> > > > -The device MUST set \field{num_buffers} to the number of descriptors used to
> > > > -hold the incoming packet.
> > > > +If VIRTIO_NET_F_MRG_RXBUF was negotiated, the device MUST set
> > > > +\field{num_buffers} to the number of descriptors used to hold the incoming
> > > > +packet.
> > > >   The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
> > > >   was not negotiated.
> > > > -\begin{note}
> > > > -{This means that \field{num_buffers} will always be 1
> > > > -if VIRTIO_NET_F_MRG_RXBUF is not negotiated.}
> > > > -\end{note}
> > > >   \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets}
> > > >   \label{sec:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
> > > > @@ -704,9 +701,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> > > >   Processing incoming packets involves:
> > > >   \begin{enumerate}
> > > > -\item \field{num_buffers} indicates how many descriptors
> > > > -  this packet is spread over (including this one): this will
> > > > -  always be 1 if VIRTIO_NET_F_MRG_RXBUF was not negotiated.
> > > > +\item If VIRTIO_NET_F_MRG_RXBUF was negogiated, \field{num_buffers} indicates
> > > > +  how many descriptors this packet is spread over (including this one).
> > > >     This allows receipt of large packets without having to allocate large
> > > >     buffers: a packet that does not fit in a single buffer can flow
> > > >     over to the next buffer, and so on. In this case, there will be
> > > > @@ -717,9 +713,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> > > >     The other buffers will not begin with a struct virtio_net_hdr.
> > > >   \item If
> > > > -  \field{num_buffers} is one, then the entire packet will be
> > > > -  contained within this buffer, immediately following the struct
> > > > -  virtio_net_hdr.
> > > > +  VIRTIO_NET_F_MRG_RXBUF was not negotiated or \field{num_buffers} is one, then
> > > > +  the entire packet will be contained within this buffer, immediately following
> > > > +  the struct virtio_net_hdr.
> > > >   \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> > > >     VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> > > >     set: if so, device has validated the packet checksum.
> > > > @@ -764,9 +760,6 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> > > >   \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Types / Network Device / Device Operation / Processing of Incoming Packets}
> > > >   \label{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
> > > > -If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
> > > > -\field{num_buffers} to 1.
> > > > -
> > > >   If VIRTIO_NET_F_MRG_RXBUF has been negotiated, the device MUST set
> > > >   \field{num_buffers} to indicate the number of buffers
> > > >   the packet (including the header) is spread over.
> > > > @@ -863,6 +856,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> > > >   This is due to various bugs in implementations.
> > > >   \end{note}
> > > > +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST ignore
> > > > +\field{num_buffers}.
> > > > +
> > > >   If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
> > > >   VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> > > >   rely on the packet checksum being correct.
> > > 
> > > 
> > > There could be drivers relying on it.
> > > We can add a SHOULD not and ask drivers not to look at it,
> 
> The patch adds the following statement:
> > If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST
> > ignore \field{num_buffers}.
> 
> Do you suggest changing MUST to SHOULD or rephrase other words in this
> statement?

Yes, I would change MUST to SHOULD. Basically documenting the existing
practice.

But I do not yes see why we should drop the device requirements the way you suggest.
We just need to fix devices, it does not seem hard.

> > > and we should fix devices.
> > 
> > Maybe allowing 0 too is a good idea? Need to think through
> > implemenation concerns.
> > In any case, pls fix devices.
> 
> I opted allowing any values for devices based on the discussion in the
> following thread:
> https://lore.kernel.org/virtio-comment/CY8PR12MB7195E5A1D321CABBA97D3FD7DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5789536fe7405a7be18e167ff522c27333656fe9
> 
> Regards,
> Akihiko Odaki

That one asks for concrete data.

-- 
MST

