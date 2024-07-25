Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12484405
	for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 02:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721874361; cv=none; b=W92k0vO16Ld+/E2A1s5DntKTHPnZlk7OXu6KnmEDxcMJ4gf1Nr/kvhlGGucFLXUcBoN7r+f392HWgGIJwTUX/7DblPXdnoxC11marvAjlNvWrb3s8iNcvcPs0J23L3GaCfC7OiVf0ImZjUHVyacGEsnw1N61qYgotmP0h9hukyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721874361; c=relaxed/simple;
	bh=rBmKIEIThSbbyQwABDOvuXLGw/GOxG/cFinf+O8KI74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R95SnH6XSNwZKRn1GldJUY7e2A6pZjalue24cexlkU9UfQeRqnV7qNNuG17e95Rc5A/hyB3vLQo+9zoN3F2xKcgHUlrJFn1GPalV2eCSvkmKU5lQVHYmAUWq/JCx8KHXkXAdI8NREzZzoaBdqSDdGiF0RDQD4yBOBrC6lNmfekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DU+BUHFu; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DU+BUHFu"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-260fed6c380so198430fac.1
        for <virtio-comment@lists.linux.dev>; Wed, 24 Jul 2024 19:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721874359; x=1722479159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPZwBOhsCa5LrsNxlWKRpSG0OFgyNZk+fslXC2ZbkcQ=;
        b=DU+BUHFuxGuBW+s9oShGI1dk0y8TVKxGhJ1CFKGosToX/2WT2CVyascXYa+n6QmPeZ
         WDL/bR8AAMgYohlAdvSixtLhyHMAM28BM8S6X45y9leMk0xk2UatQrFJNxoqmbA4YSp7
         LfnQItIVl5FG+D/eMHGunrlUNnRjlHH0284l6zATsBlW+9F0M0eJbMfyRgJfoRlyaKQc
         nXqEvUTqTaqZ7VvmCcNb72Uoz9OpcX0dbKkYP7eqczxdZFxT7fQ0etycsdkOZK1uijpj
         KLiegROgmC0gzxutwJrd3bsvn5pIx8F6/k3Q3ZJ9ArRy/14tJjSbw+TqeiwHlRqwsB7R
         VZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721874359; x=1722479159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPZwBOhsCa5LrsNxlWKRpSG0OFgyNZk+fslXC2ZbkcQ=;
        b=rdUvZTSkJV+fuzo5yTbgzwdUg7EPTR2i/YswLrA4asYCr4MCbUpjbfE8X8ndrxIWeL
         4UZnBFsoEIR6OOFtid8rwI9uyu6m0y75ICQcD3SORK6iR2ngQVWh3aDAQydA2T/S3SGP
         Xe27VH45jBxfiWhgCemBeYLG2tNLRu1xJbX+uHDNg0N3Xp9TpnCKAVS4r/WKG3Sz1e28
         IegA0e9jAzQClGY/9yrPsysCquTC8WTcu4Hn+GSSu4gt8IP0TRLh4Q92XxEvBkfEzkVe
         3ZbAseT6JV9GVwhvxkQkiUxYLzfZ/AHMA8PwCtypdvaHsDjujto8TQov+wWp0XnxGCoZ
         Brow==
X-Forwarded-Encrypted: i=1; AJvYcCXauVW8hPL6H5DxkMylhS67JV6aCHv74SCUoPz5I13EJazDhGG0Z57Q5CckGn9LYm8RXZmh75B+Ae3B2w5G4olFDQlgDFJ4eYlbgIcTEkI=
X-Gm-Message-State: AOJu0YxYqRJz8lm618DFneXWidUItkU+e8j/G2mGinsOYPfHMPA3GMhI
	vu/QZUSc8FxQm9MigorqqvFtCRwO4JkhwxtKdPCDgOGcrlUEwYEP
X-Google-Smtp-Source: AGHT+IEVSxNTvCBMWj/agSh1QvlyUqDt6d1UwCf6BnzU44dC3HZxIjcYGwG16MXcBW0GJ+EQP9eiKQ==
X-Received: by 2002:a05:6870:8321:b0:260:f883:95f9 with SMTP id 586e51a60fabf-266ede876b6mr678761fac.42.1721874358550;
        Wed, 24 Jul 2024 19:25:58 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e122esm237773b3a.14.2024.07.24.19.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 19:25:58 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: mst@redhat.com
Cc: fupan.lfp@antgroup.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [RFC PATCH v4] virtio-vsock: Add support for multi devices
Date: Thu, 25 Jul 2024 10:25:46 +0800
Message-Id: <20240725022546.3288895-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723092623-mutt-send-email-mst@kernel.org>
References: <20240723092623-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > This patch brings a new feature, called "multi devices", to the virtio
> > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > "index" field to the config for the virtio vsock.
> > 
> > I've pushed a version of code for the implementation of multi devices to
> > lkml [1]. You might also refer to a google doc [2] for multi devices
> > details regarding motivation, implementation, use cases, etc.
> > 
> > [1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> > [2] https://docs.google.com/document/d/14RUDEesi86EBZigVxxFsjxAl2OslPFplLyXMHiyDgYs/edit?usp=sharing
> >
> 
> I expect to see explanation about motivation and design here, inline.
> We can't have a discussion in google docs, and doing this goes against
> the TC bylaws.

Okay. I'll elaborate on them in the v5.

> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > ---
> > v4 -> v3:
> > - Add some explanations about the default device.
> > - Add a device normative section in the "Device configuration layout",
> >   which includes the rules for the "index" field.
> > - Revise descriptions of the default src_cid (thanks to Stefano).
> > 
> > v2 -> v3:
> > - Merge the two commits into one.
> > - Add some descriptions regarding the "index" field: the default device and
> >   the type.
> > - Add some descriptions about how multi devices are initialized in the
> >   Device Initialization.
> > 
> > v1 -> v2:
> > - Rename the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES".
> > - Remove description from the relationship clarification.
> > - Remove implementation details from commit message and documentation.
> > - Rename the field from `order` to `index`.
> > - Rewrite the introduction about the `index` field.
> > - Add a case for sending message from the guest.
> > ---
> >  device-types/vsock/description.tex | 45 ++++++++++++++++++++++++++++--
> >  1 file changed, 43 insertions(+), 2 deletions(-)
> > 
> > diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> > index 7d91d15..5a10ae1 100644
> > --- a/device-types/vsock/description.tex
> > +++ b/device-types/vsock/description.tex
> > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> >  \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
> >  \end{description}
> >  
> >  \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> > @@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >  \begin{lstlisting}
> >  struct virtio_vsock_config {
> >  	le64 guest_cid;
> > +	le16 index;
> >  };
> >  \end{lstlisting}
> >  
> > @@ -77,11 +79,41 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >  \hline
> >  \end{tabular}
> >  
> > +The \field{index} field indicates index of a device, and is required for
> > +each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> > +negotiated. The size of the \field{index} is 16 bits which supports up to
> > +65,536 devices.
> > +
> > +The device with the lowest index is considered as the default device. There
> > +was only one device before the multi-device feature was supported. When the
> > +multi-device feature is enabled (VIRTIO_VSOCK_F_MULTI_DEVICES has been
> > +negotiated), the default device can be thought of as the device. It is used
> > +to maintain compatibility with applications that are not yet ready to
> > +support this feature.
> > +
> > +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > +
> > +The \field{index}es don't have to be continuous. For instance, three
> > +devices with \field{index} 1, 2 and 5 respectively are acceptable.
> > +
> > +The \field{index}es cannot have conflicts. For instance, three devices with
> > +\field{index} 1, 1 and 5 respectively are prohibited.
> > +
> >  \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> >  
> >  \begin{enumerate}
> >  \item The guest's cid is read from \field{guest_cid}.
> >  
> > +\item Check for multi devices support:
> > +\begin{itemize}
> > +    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
> > +    the device's index will be read from \field{index}, and the driver will
> > +    allow multi devices.
> > +    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated, the
> > +    device's index will be ignored, and the driver will deny the second and
> > +    subsequent devices.
> > +\end{itemize}
> > +
> >  \item Buffers are added to the event virtqueue to receive events from the device.
> >  
> >  \item Buffers are added to the rx virtqueue to start receiving packets.
> > @@ -167,6 +199,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> >  consists of a (cid, port number) tuple. The header fields used for this are
> >  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> >  
> > +When the driver supports multiple devices (feature
> > +VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting socket is not
> > +bound to any specific address, then \field{src_cid} should be assigned with
> > +the CID of the default device.
> > +
> >  Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> >  for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
> >  
> > @@ -233,8 +270,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> >  
> >  \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> >  
> > -The \field{guest_cid} configuration field MUST be used as the source CID when
> > -sending outgoing packets.
> > +The \field{guest_cid} configuration field of one device MUST be used as the
> > +source CID when sending outgoing packets. When the
> > +VIRTIO_VSOCK_F_MULTI_DEVICES feature is not negotiated, there is only one
> > +device. When this feature has been negotiated, either use the
> > +\field{guest_cid} of the device specified by the user, or use that of the
> > +default device.
> >  
> >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> >  unknown \field{type} value.
> 
> I can't say I understand what this text is saying.
> For example does index do anything besides selecting the default
> device? How does this interact with cid?

Q1: Does index do anything besides selecting the default device?

    As the previous discussion[1], (by the way, I'll append them to message of
    the next version as well), the functions of index except for selecting the
    default device include:

    1. It represents a sort of priority, which might be used in the future. A
    possible case: If there are two devices eligible to be selected, the
    priority is one of the selection bases.

    2. (From Stefano) This works very well with hotplung/hotunplug, since if we
    add at runtime a device that is to become the default, we don't need to
    change the configuration of the previous device.

Q2: How does this interact with cid?

    In design, the CID and the index are independent.

    The CID identifies a vsock device in the host (using vhost-vsock), and it
    can't be changed after VMM launched. Otherwise, the existing connections
    will be broken. 

    On the contrary, the scope of index is VMM. Changing it doesn't affect the
    existing connections.

> If I have the time, I might read the patch and the doc later,
> but spec has to stand on its own.

I'd appreciate it! Thanks, Michael.

> 
> -- 
> MST>

[1]: https://lore.kernel.org/virtio-comment/20240612100744.2443429-3-niuxuewei.nxw@antgroup.com/
