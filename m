Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885D22173D
	for <virtio-comment@lists.linux.dev>; Wed, 11 Jun 2025 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664971; cv=none; b=hQ53CCP1p4zd7RnRA1cFBZrPvYHki6EBKJEUhdk6wCN/LxP4qiHLmeBoep892cONmWRj6SkyYaaLnXCtmw59jJRngbMyiDc0jFAy3lkpDCkAkJyFM8MGRay/X2684r3UMuukSPlPZ4vCkKiuMaiP32axzRHo3gPtcI8VlSI1uGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664971; c=relaxed/simple;
	bh=y9Iz0tNjhEm5DdmaiUrbEtjeJWJJFYMLNr15zAi3afY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RUVOTSysy1NdgvdOF61dzvPYc/MeOt813lgbVko9utYgqT+3Ma8y+3+Ee8xJ0DHWPPBoUy4WnQlFkDZvnifgYYzMJLEPxMazb0Lxy8NT0IpEpCv39GAipbmwiuCQfJ2eqtxqsZf8Zfs7dMubsC9cwkVG3quIVqVUrV0xWElO74A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NlZrNcLk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NlZrNcLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749664968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oRVVsYRwRKnT4t/CIsDn+AGQbzzdBPq8+s5nXDXsg4o=;
	b=NlZrNcLkzY68MYAioCqNDagcqJg0gGeKjhsQ3jij3OX8Gv/49jAW63i6H780rqTxLQYHZo
	r7rLb+bbenlH18ktbn6SwrnAb6t+4sD0gObZFPVi3Y3om5fBBRdWtaGgIaorXbt4TmIxFf
	rxjSlHnm3hq7wXHOf5gvNWSJgpve0Gg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-kZK3rcWiPbK6mwJ2GbwRsA-1; Wed, 11 Jun 2025 14:02:46 -0400
X-MC-Unique: kZK3rcWiPbK6mwJ2GbwRsA-1
X-Mimecast-MFC-AGG-ID: kZK3rcWiPbK6mwJ2GbwRsA_1749664965
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d22so210185e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 11 Jun 2025 11:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749664965; x=1750269765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRVVsYRwRKnT4t/CIsDn+AGQbzzdBPq8+s5nXDXsg4o=;
        b=cfPsyVY5Il2xFFbuM4KIoAPqB0wiw8dSfztbbo7nQGAJfsgkZoebkX9O1/XFnACejv
         Ezlx5BrxlWTOmBwgE2n7sSzw3LZp6yQvkGZQ6u4VOH93b1NP/m5dC/QfV+I27S2VI4ga
         CNf214HPZd9rT1JCNrr815/DH0GLjY6X4e23+eiQfKVEn2Uituxe16rI2+vdZ7kVWX7w
         voDKm844jx5HSIkYeZ/ug4jDQuxt1QOJGIVZN7RBBD8F4bh83EbcZoIdOo6b/rfC6Ks+
         PhK00n8/31bBR+w5N3SztbquLnfwdYhdjIA3W9dNkCnwytADLRv6B3k4wG+av+Kn/Tsy
         72Dw==
X-Forwarded-Encrypted: i=1; AJvYcCX//Zrd7ZHTjgUNzQlTY5im+si6r0t5dY5KgcMvJzbRxUK0B5toFD9ng8xMzM/WCmtI+10tuQ46Ywuc0CuEaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtc2BBS777F2EM4wQJbwXOsAbh+v4zjIz4G79SZ1z0elwYDdYZ
	4cp2AlyKkAacMSBr4e8oPxj8X0rwPHmTPeKYYXjQlcp3cY9lHg7JlLXkoz7NrSxsaUp27htVTrK
	Sbdg8UqMI5uYN/6kEtg5FlRIXJiiSy9A/BVWaewNdzdQUfkUD11CCvJEuCIQH9zm6noXO
X-Gm-Gg: ASbGncvySkraeLY4iHTD9g6Nr54BDgAP1ddIoXDzlhcxezguMy7gwZrg/V5naPReoND
	E638cxDc6hngh7y/3Xw++rcGELk9vNmslbBP4WRRoXURz6WnTV8hfxtFgrha6iyZL6juB5xblaE
	fJYLkl5LSaO10PIOAdJ9jr8BfG3uv1+EBtsVSMnctmVP/qEmqqUwcQJpw7ZtpbF2YQ3OH1AY+7h
	KgnU2AkoOI4as1Vz9M78bFQmDzicTLEtxLZDpPVj+iaAF2UAIv1s/CZF556JAhppzxouxUIaqe0
	84StWW/Eya7i63Jt
X-Received: by 2002:a05:600c:3b93:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-45324881397mr40762875e9.12.1749664965184;
        Wed, 11 Jun 2025 11:02:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG41rjmkO56wbdXoqZPzpo+112H51gM3mg6syxnB5kXKyXHfSY2c3C7De3udntQJmL8eUYXCw==
X-Received: by 2002:a05:600c:3b93:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-45324881397mr40761375e9.12.1749664963723;
        Wed, 11 Jun 2025 11:02:43 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45325141606sm29365105e9.1.2025.06.11.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:02:42 -0700 (PDT)
Date: Wed, 11 Jun 2025 14:02:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, niuxuewei.nxw@antgroup.com, parav@nvidia.com,
	sgarzare@redhat.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Message-ID: <20250611133631-mutt-send-email-mst@kernel.org>
References: <20250518174619-mutt-send-email-mst@kernel.org>
 <20250519093736.3076953-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250519093736.3076953-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _13BK73kWwIYynNmykY4_BJKLeS4zt-KiKyeFsxY_4E_1749664965
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 05:37:36PM +0800, Xuewei Niu wrote:
> > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > This patch brings a new feature, called "multi devices", to the virtio
> > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > "device_order" field to the config for the virtio vsock.
> > > 
> > > == Motivition ==
> > > 
> > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > in the inability to enable more than one backend. For instance, two devices
> > > are required: one to transfer data to the VMM via virtio-vsock, and another
> > > to a user process via vhost-user-vsock.
> > > 
> > > Apart from that, a side gain is that theoretically the performance might be
> > > improved since each device has its own queue. But it varies depending on
> > > the implementation.
> > > 
> > > == Typical Usages ==
> > > 
> > > Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> > > respectively. And the device with CID 3 is default.
> > > 
> > > Connect to the host using the device with CID 3.
> > > 
> > > ```c
> > > // use default one (no bind)
> > > fd = socket(AF_VSOCK);
> > > connect(fd, 2, 1234);
> > > n = write(fd, buffer);
> > > 
> > > // or bind explicitly
> > > fd = socket(AF_VSOCK);
> > > bind(fd, 3, -1);
> > > connect(fd, 2, 1234);
> > > n = write(fd, buffer);
> > > ```
> > > 
> > > Connect to the host using the device with CID 4.
> > > 
> > > ```c
> > > // must bind explicitly as the device with CID 4 is not default.
> > > fd = socket(AF_VSOCK);
> > > bind(fd, 4, -1);
> > > connect(fd, 2, 1234);
> > > n = write(fd, buffer);
> > > ```
> > > 
> > > The first version of multi-devices implementation is available at [1].
> > > 
> > > v6 -> v7:
> > > - Addresses minor review comments from Stefano.
> > > 
> > > [1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> > > 
> > > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > > ---
> > >  device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
> > >  1 file changed, 28 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> > > index 7d91d15..392dc76 100644
> > > --- a/device-types/vsock/description.tex
> > > +++ b/device-types/vsock/description.tex
> > > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > >  \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> > >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> > >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> > > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is supported.
> > >  \end{description}
> > >  
> > >  \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> > > @@ -34,6 +35,12 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > >  VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> > >  VIRTIO_VSOCK_F_STREAM has also been negotiated.
> > >  
> > > +The driver SHOULD ignore devices that do not have
> > > +VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
> > > +
> > > +The driver SHOULD ignore all subsequent devices if a device without
> > > +VIRTIO_VSOCK_F_MULTI_DEVICES is present.
> > > +
> > 
> > all this is really vague. any better way to put it?
> > 
> > what are subsequent devices? if the feature has been negotiated where?
> > what does ignore mean? you can not know features without interacting
> > with the device.
> 
> The original idea is: Some devices have enabled the multi-devices feature,
> while others have not, and this situation is unacceptable.
> 
> The driver determines the states based on the first device present in the
> guest.
> 
> There are two possible cases:
> 
> - If the first device has negotiated the multi-devices feature, then the
> driver considers the multi-devices feature as enabled. Then, the driver will
> ignore all devices that do not negotiate the feature.
> - If the first device has not negotiated, it indicates that the multi-devices
> feature is disabled. Consequently, the driver will ignore any subsequent
> devices.
> 
> ====
> 
> Here is the revised version:
> 
> To ensure consistency, all devices MUST have the same multi-devices feature
> status; a mix of enabled and disabled devices is not acceptable. The driver
> determines whether the multi-devices feature is enabled based on the first
> device present in the guest: if the first device has negotiated the
> feature, the driver enables it and ignores any devices that have not; if
> the first device has not negotiated the feature, the driver treats the
> feature as disabled and ignores any subsequent devices.
> 
> Does this look better to you?

I can't say I like this, since it is not clear what does "first device
present" mean. Also, it is not clear what does "ignores" mean.


I propose instead simply specifying something like this for devices:


	All socket devices used with a specific driver MUST be consistent
	with respect to offering VIRTIO_VSOCK_F_MULTI_DEVICES.
	In other words, either all of the devices offer VIRTIO_VSOCK_F_MULTI_DEVICES or
	none of them do.

And similarly for drivers:

	When used with multiple socket devices, a driver MUST be consistent
	with respect to negotiating VIRTIO_VSOCK_F_MULTI_DEVICES.
	In other words, either the driver negotiates VIRTIO_VSOCK_F_MULTI_DEVICES
	with all of the devices, or with none of them.



There is no need to specify behaviour when spec is violated.



> > >  \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> > >  
> > >  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
> > > @@ -52,6 +59,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > >  \begin{lstlisting}
> > >  struct virtio_vsock_config {
> > >  	le64 guest_cid;
> > > +	le16 device_order;
> > >  };
> > >  \end{lstlisting}
> > >  
> > > @@ -77,11 +85,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > >  \hline
> > >  \end{tabular}
> > >  
> > > +The \field{device_order} is used to identify the default device.
> > 
> > no explanation what is the default device.
> > is it just for the cid?
> 
> Yes.
> 
> It is allowed to not specify the local CID for a socket. In this case, the
> driver will use the default device's CID as the local CID for the socket.
> 
> The details are listed in the "Receive and Transmit" section, where you
> left a comment.
> 
> > > Up to
> > > +65,535 devices can be supported due to the size.
> > 
> > can be -> are
> > drop "due to the size".
> 
> Will do in the next version.
> 
> > > +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > > +
> > > +The device MUST provide a distinct \field{device_order} if
> > > +VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
> > 
> > distinct to what?
> 
> In the scope of the guest VM, the device_order should be unique. This means
> that the device_order should be distinct for each device.
> 
> > > +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > > +
> > > +The driver MUST treat the device with the lowest \field{device_order} as
> > > +the default device.
> > > +
> > >  \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> > >  
> > >  \begin{enumerate}
> > >  \item The guest's cid is read from \field{guest_cid}.
> > >  
> > > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
> > > +order will be read from \field{device_order}.
> > > +
> > >  \item Buffers are added to the event virtqueue to receive events from the device.
> > >  
> > >  \item Buffers are added to the rx virtqueue to start receiving packets.
> > > @@ -233,8 +257,10 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> > >  
> > >  \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> > >  
> > > -The \field{guest_cid} configuration field MUST be used as the source CID when
> > > -sending outgoing packets.
> > > +If the source socket is not bound to any source CID, the driver MUST assign
> > > +one. If more than one device is present, the driver SHOULD use the default
> > > +device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
> > > +the \field{guest_cid} of the only available device.
> > 
> > why did you drop requirement about outgoing packets?
> 
> The driver prefers to use the CID provided by the user. That is, if the
> user binds to a source CID, the driver will use it and does not need to do
> anything. If not, the driver will use one from the configuration.
> 
> Thanks,
> Xuewei
> 
> > >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> > >  unknown \field{type} value.
> > > -- 
> > > 2.34.1

