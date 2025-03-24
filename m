Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A425D55A
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824302; cv=none; b=O4yKdLh4YgbQomGesEa+fOq2XpakL7GtdLMKKg23kxDZ/ZmG2exstU61WTz80u0OpZIDtS7mtlcSm8dIPJQQDeOOM7DVc0iyl876ejBOmjm2Y3GFec2oi5pXexmrmwX5Q0Z+9d4+JlKssZtrtwIc6Zph+sKYrdMy75QBPgqUkmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824302; c=relaxed/simple;
	bh=BA9mAAhtEucG3TnG+UyWVvdMM6Owf6FsqXy0UCRHv/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ezTMQdZj/cpB0KBrt04etzk/c1nT1kXEBxi1RpidcrhB+0pOQ3XvuVVTtMkHCqZj6OaVlCdZmZJffhB/tYVQTpV6XOMROARNS2BBMbHtElgHYf8ferc905nGCq49gXDOg8a6dSnxn6W7cbIrV2lOpZIl+K9du9TysUqBSxLoLzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fX3bo4GR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fX3bo4GR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742824299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kx62/dNi6SDaFIgG9Pla8t8SQ4VDex8JClA6dIpEnhE=;
	b=fX3bo4GRJjLu/QJE/enbCg2h9E6/umH3iUSnNU911mY36XRVSHEXAyRp7m4rKoW4sUJHDI
	HGB90w65bmjDSw8uwlVR0jIyX60tlrtSphNr2YFww/miVE1R+c/85AEGNSqLDQlMPOrqrc
	h5HIyQDrA/rhHaS4G8UDzeV0XunQMr0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-hpwRbh4xMBa1PvLGfUi_ZA-1; Mon, 24 Mar 2025 09:51:37 -0400
X-MC-Unique: hpwRbh4xMBa1PvLGfUi_ZA-1
X-Mimecast-MFC-AGG-ID: hpwRbh4xMBa1PvLGfUi_ZA_1742824297
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so17798265e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 06:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824296; x=1743429096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kx62/dNi6SDaFIgG9Pla8t8SQ4VDex8JClA6dIpEnhE=;
        b=hV+lzqlZ+Ikf/ViUFALBP+Kldfm67vgvydtoeWQbsfRcHOprCMBo2FeBxQhswQrKXm
         GGTKl9UcjUokzY2IMT1WB//d3JRLv74TC3U2fUJYYuIcKFC4rwPmfb8osojhhof70E4S
         TCSkKUEHRWcz4f7NZRIhzHbxWKuEEVZfOyq9uzcLFEHYl4IAD/L5CXfm3g+bwL2N3pub
         7L6NGuYH2j1o70Z68WaVzk9ySH62riy6QPcNeb8vKFStRYevp1oBX1N9bEfATP+mAByN
         fswTxaLHWto74S7YQQhJcKWEe1LJPB+jQ6JZO7DPAOc4XLsVXaZb98IN9QHotl4qwzT8
         aCzg==
X-Forwarded-Encrypted: i=1; AJvYcCW+ea7FQ4/2RRnel/dZjDzU0cO6W7mA3FZEUSgBrmCdm2PIGmzw1EcXFiKWF2Wf2p7qGwnZa910ONcL7uefCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlbTnl3QD12aTkuPGN/MGB4RCpJqAGG7ywJsI2UONq32TjZYox
	HyWhJIk6C4qggYrXip8zR8YwQSFTgUND6EtD7KMFMoJsa7n91PchU7UDxrF2WK25oqi6hJvnB5l
	0O94vz0HeqNNgRpOtbJPUo3NlsMPYzsWGib3Mmxlit6lpdSVxrgRfpLNO3qPIK0U/
X-Gm-Gg: ASbGncvhoVodSneQW+1h3IK16moNI7qxShuV2H+Pm0vsn0j0FmUTHjs5BIDFN0KlVet
	IGI72HtbnAThnd1enNiCkXi4GyeVIB6vPsF5qxHUmorLteo8se7nVQXe27dZyyo+gwlZbLtNG44
	K66IGLk4GINFOA5uBdAX9FXfTGO8t3JALjwIk/9vwAgbqXD4OhiMHNPQeCGEX70H+z0hdIJ2cef
	rENOeSl3I0rL/2mEpJ+4S2ywxtB5erRtTHX0z/iCGf4pIv54Dnhm4Y0KBcI5gAx3XP3nwZ93ilk
	5XOIEEX4NfEjE/gJqUvD+ezEJxWAm2IK4YyFcvEyCLJWGmamECBeT0Ioomal5PAc
X-Received: by 2002:a5d:64e5:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-3997f932cc8mr12434037f8f.43.1742824296421;
        Mon, 24 Mar 2025 06:51:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2etnusgkE8HQe3O17zTVQZkih0resMyBA2B+/seTKdvbZnc7PPxVVMkP8QS9SkL13rvzenQ==
X-Received: by 2002:a5d:64e5:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-3997f932cc8mr12433999f8f.43.1742824295789;
        Mon, 24 Mar 2025 06:51:35 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65e0sm11235059f8f.61.2025.03.24.06.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:51:35 -0700 (PDT)
Date: Mon, 24 Mar 2025 14:51:31 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: parav@nvidia.com, mst@redhat.com, fupan.lfp@antgroup.com, 
	virtio-comment@lists.linux.dev, Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Message-ID: <h5vwvrs7gsnkyw3vmkumhbtuqdecfmksnwlvfmxr62t2lhz3hc@lpinl24bwkte>
References: <20250324064335.1845722-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250324064335.1845722-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pqe0T9NihR9arcJdxDmvYHiaQkHjteUECqTHt9MnrTs_1742824297
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
>This patch brings a new feature, called "multi devices", to the virtio
>vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
>"device_order" field to the config for the virtio vsock.
>
>== Motivition ==
>
>Vsock is a lightweight and widely used data exchange mechanism between host
>and guest. Currently, the virtio-vsock only supports one device, resulting
>in the inability to enable more than one backend. For instance, two devices
>are required: one to transfer data to the VMM via virtio-vsock,

Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to 
communicate with the hypervisor, but in virtio-vsock we never supported 
it. Could this be the use case?

We could in this way add a new feature for those devices that 
communicate only with the VMM, where the CID of the VM is quite useless.  
So instead of having multiple CIDs per VM, we could continue to have a 
single CID, but the transport could support 2 devices, one to 
communicate with the VMM (CID = 0) and one to communicate with the host 
apps (CID = 2).

Maybe this is orthogonal to this proposal, though, because it might 
still make sense to have multiple vsock devices, even though it's not 
very clear to me.

> and another to a user process via vhost-user-vsock.

So to recap, one device would be used only to communicate with the VMM, 
and the other device to communicate with other external processes, 
right?

Do you have any other use cases?

>
>Apart from that, a side gain is that theoretically the performance might be
>improved since each device has its own queue. But it varies depending on
>the implementation.

This though might be easier to implement supported multi-queue in the 
device, instead of adding n devices to the VM.

>
>== Typical Usages ==
>
>Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
>respectively. And the device with CID 3 is default.
>
>Connect to the host using the device with CID 3.
>
>```c
>// use default one (no bind)
>fd = socket(AF_VSOCK);
>connect(fd, 2, 1234);
>n = write(fd, buffer);
>
>// or bind explicitly
>fd = socket(AF_VSOCK);
>bind(fd, 3, -1);
>connect(fd, 2, 1234);
>n = write(fd, buffer);
>```
>
>Connect to the host using the device with CID 4.
>
>```c
>// must bind explicitly as the device with CID 4 is not default.
>fd = socket(AF_VSOCK);
>bind(fd, 4, -1);
>connect(fd, 2, 1234);
>n = write(fd, buffer);
>```
>
>The first version of multi-devices implementation is available at [1].
>
>[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
> 1 file changed, 28 insertions(+), 2 deletions(-)
>
>diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>index 7d91d15..7d0cfe4 100644
>--- a/device-types/vsock/description.tex
>+++ b/device-types/vsock/description.tex
>@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
>+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is supported.
> \end{description}
>
> \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>@@ -34,6 +35,12 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> VIRTIO_VSOCK_F_STREAM has also been negotiated.
>
>+The driver SHOULD ignore devices that do not have
>+VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
>+
>+The driver SHOULD ignore all subsequent devices if a device without
>+VIRTIO_VSOCK_F_MULTI_DEVICES is present.
>+
> \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>
> The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
>@@ -52,6 +59,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> \begin{lstlisting}
> struct virtio_vsock_config {
> 	le64 guest_cid;
>+	le16 device_order;
> };
> \end{lstlisting}
>
>@@ -77,11 +85,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> \hline
> \end{tabular}
>
>+The \field{device_order} is used to identify the default device. Up to
>+65,535 devices can be supported due to the size.
>+
>+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>+
>+The device MUST provide a distinct \field{device_order} if
>+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
>+
>+\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>+
>+The driver MUST treat the device with the lowest \field{device_order} as
>+the default device.
>+
> \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
>
> \begin{enumerate}
> \item The guest's cid is read from \field{guest_cid}.
>
>+\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
>+order will be read from \field{device_order}.
>+
> \item Buffers are added to the event virtqueue to receive events from the device.
>
> \item Buffers are added to the rx virtqueue to start receiving packets.
>@@ -233,8 +257,10 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
>
> \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>
>-The \field{guest_cid} configuration field MUST be used as the source CID when
>-sending outgoing packets.
>+If \field{src_cid} is missing in outgoing packets, the driver MUST assign

I think here we have to define what the driver does, since the driver 
has to populate that field, how is it missing?

Maybe we are confusing interaction with user space, so we should say 
something like, “If the source socket is not bound to any source CID, 
the driver MUST assign ...”

Thanks,
Stefano

>+one. If more than one device is present, the driver SHOULD use the default
>+device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
>+the \field{guest_cid} of the only available device.
>
> A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> unknown \field{type} value.
>-- 
>2.34.1
>

