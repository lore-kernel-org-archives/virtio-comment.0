Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5E314D708
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735214170; cv=none; b=IJ6FI5VpwtHF1zZF6Np4mRoqCV34WX6WMLbhxk2TxF6R8O2fRT1FwRV8RyyL+QxNkYvJ5bcDHphCyS8oVBLw7uoVrQRoZmq5ONtMYsdNkuWuwcRypelQw9X44XS7H6DMvZ4GRSoq/SRTIAs+vevOLm2Ga/7dn3cEk3ab7nopIqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735214170; c=relaxed/simple;
	bh=wPiig7BNZYRFm8da7xHbltjqWZK46pk+fxfRvzuNvWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WT/B1c2xCI4h/bJlPmSOEMlPaN+gJEvDlTUjmHu7tjUkIQ0RMwQWNYKVVJ4ZKq8Uys3PExF8xyxkmbzRsStrjKLbVPLPLSJfTrQKwhL3xj5MaFdi4Ed2z5fyw7qscIFYBzkxLgIDxpVQKSjRpX/k0Ol7OpogyXHsxiJxGt0jB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ftrWNLI/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ftrWNLI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735214167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c64OyZ9vBlvxL5IKDAAbvCtlhM6xvwB9BXuUH3HNIyU=;
	b=ftrWNLI/df+0ZcD3pdArIpclxNSDISH71e5ULgIeYy9qnnEYLJphzyf+dYQ7zjMzDn0tEj
	QiS32eXvO4eTVbQt/2Zwp+F8aysxVHJRDtrP8Ae7ghH1x7UYDDFH8UOGor3nlMs82lRaPw
	OztLP/72RS0PutGb+7PCKZWl2zuXU3Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-kWr2n7oXOc2kl7pOMZQuNg-1; Thu, 26 Dec 2024 06:56:05 -0500
X-MC-Unique: kWr2n7oXOc2kl7pOMZQuNg-1
X-Mimecast-MFC-AGG-ID: kWr2n7oXOc2kl7pOMZQuNg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43673af80a6so30297185e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 03:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735214164; x=1735818964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c64OyZ9vBlvxL5IKDAAbvCtlhM6xvwB9BXuUH3HNIyU=;
        b=Guc/izsvZJJ1jtqI1Hm2vcex2edcUsMsvHkwoZrX4KiUOPmb1izqlHG98Rs51nsMhC
         X/nczcHPhJTPIQntfoNd9abiAW7jv6py98ONEO9KCH0JV+VEpqiil/SGraUGqgg8xzW4
         cUbj7FvVCB7WVBy1nmxOrsBb/ClH3+hWqO0Fe+jEincPMInWeyhtXJhcJOwJvOLk/y0i
         JYxdJVbjQGq4ra9b3+MbKxd4vwXfD0I4eMUGmy0/cpnNo15jYE+ihnkv+gOehpbu2dmL
         Y+Cque1hZr4yKzyYZ9160zNDcnniZXKFomTVluFF0iClB5j5AwtgM19hfjvzplQdP1+h
         9JJg==
X-Gm-Message-State: AOJu0Yz0y0E+E4QKIkMINyghlkyRknLCvAobugIOkVEDSLkcvaFJs+K3
	bXa0Y2RMq5GGC4hyYVv7LcJrlHIGcwKH8ZVIFV8pYcH20MN8meQH0SwU/k0SG9uEA89tiPh5YK8
	2V20Wk+DWeEpfFKwsYhhnot5tcNsMrGkublrzY4MEExl2mxc9arV1f0HXKztOfP5l
X-Gm-Gg: ASbGnctOy562xN7gat63xQyNNo015DhBTLwpEcyg1lQCqlN8ETHLsjxTf01UliLtnfp
	UoSGwku4eGDyZzHKXrDnuIofOF8VRFCSZfW158AEb8J85fpbQP9XZamu2Rw1FpcY6dzDst6PpEf
	7bx2oamP/McGsZHxILMSbzjlXzvtGKHGYPc36Q4koFXBbR1RWxl8z6WN8NODoKefHrU+Bju68Ts
	GDYIswM2WyinzHbryKn5Cv7IuBOU9OlooH0yEMKmd5p87o=
X-Received: by 2002:a05:600c:1388:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-43668642725mr185687725e9.11.1735214163749;
        Thu, 26 Dec 2024 03:56:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuJATJtQt2CZkH07MJ+IGpoFhR/jbhmAbEr1vz01h4e+WhQTjnxaOQ5uS3L9kSjftWh80pJw==
X-Received: by 2002:a05:600c:1388:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-43668642725mr185687535e9.11.1735214163323;
        Thu, 26 Dec 2024 03:56:03 -0800 (PST)
Received: from redhat.com ([31.187.78.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b42757sm268259165e9.39.2024.12.26.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 03:56:02 -0800 (PST)
Date: Thu, 26 Dec 2024 06:55:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>, devel@daynix.com
Subject: Re: [PATCH] virtio-net: Ignore num_buffers when unused
Message-ID: <20241226064040-mutt-send-email-mst@kernel.org>
References: <20241226-reserved-v1-1-39ca566889c0@daynix.com>
 <20241226022749-mutt-send-email-mst@kernel.org>
 <20241226023128-mutt-send-email-mst@kernel.org>
 <5fe377c4-c10d-4c4d-8e8f-30420989452d@daynix.com>
 <20241226041018-mutt-send-email-mst@kernel.org>
 <452e2ba7-ef5a-4d89-8e25-93cbdf767011@daynix.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <452e2ba7-ef5a-4d89-8e25-93cbdf767011@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ihXdp697IZG-9VmDkLdchhk-YQSSdFPq-RVYe0w2fzo_1735214164
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 26, 2024 at 08:09:59PM +0900, Akihiko Odaki wrote:
> On 2024/12/26 18:13, Michael S. Tsirkin wrote:
> > On Thu, Dec 26, 2024 at 04:35:55PM +0900, Akihiko Odaki wrote:
> > > On 2024/12/26 16:32, Michael S. Tsirkin wrote:
> > > > On Thu, Dec 26, 2024 at 02:29:09AM -0500, Michael S. Tsirkin wrote:
> > > > > On Thu, Dec 26, 2024 at 02:37:17PM +0900, Akihiko Odaki wrote:
> > > > > > If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
> > > > > > sets num_buffers to zero while the specification tells to set it to one.
> > > > > > 
> > > > > > Let drivers ignore the field to make them compatible with both
> > > > > > vhost_net/QEMU and devices already compliant with the specification.
> > > > > > Also, remove statements requiring devices to set the field to one to
> > > > > > make vhost_net and QEMU compliant.
> > > > > > 
> > > > > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > > > > > ---
> > > > > >    device-types/net/description.tex | 26 +++++++++++---------------
> > > > > >    1 file changed, 11 insertions(+), 15 deletions(-)
> > > > > > 
> > > > > > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > > > > > index 76585b0..b82fe8f 100644
> > > > > > --- a/device-types/net/description.tex
> > > > > > +++ b/device-types/net/description.tex
> > > > > > @@ -683,15 +683,12 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
> > > > > >    \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
> > > > > > -The device MUST set \field{num_buffers} to the number of descriptors used to
> > > > > > -hold the incoming packet.
> > > > > > +If VIRTIO_NET_F_MRG_RXBUF was negotiated, the device MUST set
> > > > > > +\field{num_buffers} to the number of descriptors used to hold the incoming
> > > > > > +packet.
> > > > > >    The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
> > > > > >    was not negotiated.
> > > > > > -\begin{note}
> > > > > > -{This means that \field{num_buffers} will always be 1
> > > > > > -if VIRTIO_NET_F_MRG_RXBUF is not negotiated.}
> > > > > > -\end{note}
> > > > > >    \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets}
> > > > > >    \label{sec:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
> > > > > > @@ -704,9 +701,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> > > > > >    Processing incoming packets involves:
> > > > > >    \begin{enumerate}
> > > > > > -\item \field{num_buffers} indicates how many descriptors
> > > > > > -  this packet is spread over (including this one): this will
> > > > > > -  always be 1 if VIRTIO_NET_F_MRG_RXBUF was not negotiated.
> > > > > > +\item If VIRTIO_NET_F_MRG_RXBUF was negogiated, \field{num_buffers} indicates
> > > > > > +  how many descriptors this packet is spread over (including this one).
> > > > > >      This allows receipt of large packets without having to allocate large
> > > > > >      buffers: a packet that does not fit in a single buffer can flow
> > > > > >      over to the next buffer, and so on. In this case, there will be
> > > > > > @@ -717,9 +713,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> > > > > >      The other buffers will not begin with a struct virtio_net_hdr.
> > > > > >    \item If
> > > > > > -  \field{num_buffers} is one, then the entire packet will be
> > > > > > -  contained within this buffer, immediately following the struct
> > > > > > -  virtio_net_hdr.
> > > > > > +  VIRTIO_NET_F_MRG_RXBUF was not negotiated or \field{num_buffers} is one, then
> > > > > > +  the entire packet will be contained within this buffer, immediately following
> > > > > > +  the struct virtio_net_hdr.
> > > > > >    \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> > > > > >      VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> > > > > >      set: if so, device has validated the packet checksum.
> > > > > > @@ -764,9 +760,6 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> > > > > >    \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Types / Network Device / Device Operation / Processing of Incoming Packets}
> > > > > >    \label{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
> > > > > > -If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
> > > > > > -\field{num_buffers} to 1.
> > > > > > -
> > > > > >    If VIRTIO_NET_F_MRG_RXBUF has been negotiated, the device MUST set
> > > > > >    \field{num_buffers} to indicate the number of buffers
> > > > > >    the packet (including the header) is spread over.
> > > > > > @@ -863,6 +856,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
> > > > > >    This is due to various bugs in implementations.
> > > > > >    \end{note}
> > > > > > +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST ignore
> > > > > > +\field{num_buffers}.
> > > > > > +
> > > > > >    If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
> > > > > >    VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> > > > > >    rely on the packet checksum being correct.
> > > > > 
> > > > > 
> > > > > There could be drivers relying on it.
> > > > > We can add a SHOULD not and ask drivers not to look at it,
> > > 
> > > The patch adds the following statement:
> > > > If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST
> > > > ignore \field{num_buffers}.
> > > 
> > > Do you suggest changing MUST to SHOULD or rephrase other words in this
> > > statement?
> > 
> > Yes, I would change MUST to SHOULD. Basically documenting the existing
> > practice.
> > 
> > But I do not yes see why we should drop the device requirements the way you suggest.
> > We just need to fix devices, it does not seem hard.
> 
> Well, I think we have already discussed and decided not to change vhost_net:
> https://lore.kernel.org/all/CACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1YvmAr72Q@mail.gmail.com/

Looking at this spec made me realize fixing that is less risky.
I just replied on that thread and proposed a way to reduce risk
even more.
Sorry about leading you astray.

> > 
> > > > > and we should fix devices.
> > > > 
> > > > Maybe allowing 0 too is a good idea? Need to think through
> > > > implemenation concerns.
> > > > In any case, pls fix devices.
> > > 
> > > I opted allowing any values for devices based on the discussion in the
> > > following thread:
> > > https://lore.kernel.org/virtio-comment/CY8PR12MB7195E5A1D321CABBA97D3FD7DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5789536fe7405a7be18e167ff522c27333656fe9
> > > 
> > > Regards,
> > > Akihiko Odaki
> > 
> > That one asks for concrete data.
> 
> It asks concrete data that motivates requiring setting the value to zero and
> I decided removing such a requirement instead.
> 
> Regards,
> Akihiko Odaki

Same thing really.

