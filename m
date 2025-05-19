Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE0726B96B
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647470; cv=none; b=prOwoW6H0oFskeQC6oP+oP0ApXv2bZHkAxcRp1R57ui0K21G30qgb6De263Qb9udxs8JapC7vKCTlQwyx8H8ONZwpQZRBN/KeeyRhI7go3ej9Rk6K24vHCeh6r0y4d5RUpH873FZ0fexA4tLMiQOD01iICxBU2rpKfRWoDXQ7F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647470; c=relaxed/simple;
	bh=JBxqzcSBZSFLj9HX/GYntFSsCpj8bbhFdZPekl4m3NA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OuxNtBz3IxPSfIEPBkDIFMbQ8yJ9KTMx6pY7e49AYhMxY1yBxGlBD/QMpPuB59WoLpuwi0phIICoU1B5Fq5zxA5MjVnraFYAbtehkZERt6D38pEwqKonrkKetSt+jlWcnVA8Zz+DQuhCGMUyG2Xm7swgmTFa8q4bulATx9q0UB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcWlJVqA; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcWlJVqA"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30ea7f78337so1438875a91.2
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 02:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747647467; x=1748252267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=if1FLfCBDe/YBKbsx0v0GkkXmZHToHPMrDZ3opJyFIk=;
        b=hcWlJVqAXAshrw/OK1PZ7fei0eI6dZE5dFcYKO2Zn+BQbKlcJH2T2egxGyAqobXZvW
         za9y5IlPis8574Bbfsfb5hzCYOSwBKBFMRyeT8E5MToNHEW1Zms+OEuLFb9qDQVUw6Cl
         n/3/JGpUFNDaU/my7tEvcJQn6+hPw+7/rCAH+mleKXTxf5djWwRCGmNhH1b2TWA/CX3A
         SIECZu8KXhfG/2VQ9c7c7jZPtGuMes4D4K+NUxnwmynJ+c2DFPEYAXsslpwbXb28dc01
         POzgDw5E1kVsQCwiIDysgEmQK1giTG20BxQVJfBdoR2HKuK/vCsW6pWHKmP5OWix7IB4
         3KRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647467; x=1748252267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=if1FLfCBDe/YBKbsx0v0GkkXmZHToHPMrDZ3opJyFIk=;
        b=oDaW3i3H8ySnqHZa1CQf6rtOSVQutNETq1oH2Is4JmJeFPZhoFdMNnWNJCE/UjOFjf
         6K/8tegj1MefPsI8ZzOFhfU1YFtipqQEs8zkOULbSG/9dB5jd1qIwpHWmHTqA+aNsOBq
         ILWG8vI2fImPYlGTEaZT3USbKNmLrQgumKOCona6t51YftKORNq1eMWS0KbFKfiHrCMF
         ZlxRCHblu0o2UoOzyZIGWZXMX1/gf7OFrcGULFPScwDn+gkEDIc1Ghu2xsHQgU5qV7p0
         SRKpjzyb9d7eZaJydqWiby6BuChEy5WzZcJ6rZHP6ZDN1HLTMkNaOaYYwN8II13/fNR9
         b30Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjUmaPHjRaXYjkNLVKtCHey8gen76C2cRSZU8FmwHqX0ztcrOLyFsn6Z8uty/a8AD81xTE8q+P6i+j3URBPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaIghWyTpT9VScK7/qU7DXAvgk3naa9PTnrTnRml0E4Mjaedk+
	8R2OPt1KfPjJtFOlyKWxsX+BSubuyc2z5/b31Nx1KZOFtoieCJCg96x83EEpnugh9Hs=
X-Gm-Gg: ASbGncv4cYPNtLHxRXRoir7tyn2erc2zpEUdPzE/RUYYkU6Z0ZLEY/qfd68I8BcXTQK
	dM6LQ6hZ/f1QsAri4RET6dX2F670F3e3yXThY71x4qGkNmUBBM26GfdgqFKtzfUFo+gllLmlaBK
	O+o6WmAHhFmo7F+BoH/Mlr5K7m6jjKZbvEaW3NVZDFQBFmgwTxjJdMysTyTOmH2zvmvTDYY+IcV
	NKKYmm2hmqHaHt1Yr6pTCXK+41JWx7nqN1wi8SaA1xMNkSyCdZWuK2ZdRM9c/LEqiz5WZvt320z
	JcEOpOt+uOg9nsGh8ySFg2hZY4bTW3wyHbIEyNrOflZ3ZI85vX+cwSJY8GEY8v343wdtUxX0mg=
	=
X-Google-Smtp-Source: AGHT+IEPilt8LMk2r5HoLgk/zb1rPBZTBm1XCVrYpH+XzYP5PR0H8slfc1BqiAfMFE38068mLpDshw==
X-Received: by 2002:a17:90b:4f4c:b0:309:ebe3:1ef9 with SMTP id 98e67ed59e1d1-30e830ebf54mr20496885a91.12.1747647467120;
        Mon, 19 May 2025 02:37:47 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401768sm9979353a91.3.2025.05.19.02.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:37:46 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: mst@redhat.com
Cc: fupan.lfp@antgroup.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Mon, 19 May 2025 17:37:36 +0800
Message-Id: <20250519093736.3076953-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250518174619-mutt-send-email-mst@kernel.org>
References: <20250518174619-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > This patch brings a new feature, called "multi devices", to the virtio
> > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > "device_order" field to the config for the virtio vsock.
> > 
> > == Motivition ==
> > 
> > Vsock is a lightweight and widely used data exchange mechanism between host
> > and guest. Currently, the virtio-vsock only supports one device, resulting
> > in the inability to enable more than one backend. For instance, two devices
> > are required: one to transfer data to the VMM via virtio-vsock, and another
> > to a user process via vhost-user-vsock.
> > 
> > Apart from that, a side gain is that theoretically the performance might be
> > improved since each device has its own queue. But it varies depending on
> > the implementation.
> > 
> > == Typical Usages ==
> > 
> > Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> > respectively. And the device with CID 3 is default.
> > 
> > Connect to the host using the device with CID 3.
> > 
> > ```c
> > // use default one (no bind)
> > fd = socket(AF_VSOCK);
> > connect(fd, 2, 1234);
> > n = write(fd, buffer);
> > 
> > // or bind explicitly
> > fd = socket(AF_VSOCK);
> > bind(fd, 3, -1);
> > connect(fd, 2, 1234);
> > n = write(fd, buffer);
> > ```
> > 
> > Connect to the host using the device with CID 4.
> > 
> > ```c
> > // must bind explicitly as the device with CID 4 is not default.
> > fd = socket(AF_VSOCK);
> > bind(fd, 4, -1);
> > connect(fd, 2, 1234);
> > n = write(fd, buffer);
> > ```
> > 
> > The first version of multi-devices implementation is available at [1].
> > 
> > v6 -> v7:
> > - Addresses minor review comments from Stefano.
> > 
> > [1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> > 
> > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > ---
> >  device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
> >  1 file changed, 28 insertions(+), 2 deletions(-)
> > 
> > diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> > index 7d91d15..392dc76 100644
> > --- a/device-types/vsock/description.tex
> > +++ b/device-types/vsock/description.tex
> > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> >  \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is supported.
> >  \end{description}
> >  
> >  \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> > @@ -34,6 +35,12 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> >  VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> >  VIRTIO_VSOCK_F_STREAM has also been negotiated.
> >  
> > +The driver SHOULD ignore devices that do not have
> > +VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
> > +
> > +The driver SHOULD ignore all subsequent devices if a device without
> > +VIRTIO_VSOCK_F_MULTI_DEVICES is present.
> > +
> 
> all this is really vague. any better way to put it?
> 
> what are subsequent devices? if the feature has been negotiated where?
> what does ignore mean? you can not know features without interacting
> with the device.

The original idea is: Some devices have enabled the multi-devices feature,
while others have not, and this situation is unacceptable.

The driver determines the states based on the first device present in the
guest.

There are two possible cases:

- If the first device has negotiated the multi-devices feature, then the
driver considers the multi-devices feature as enabled. Then, the driver will
ignore all devices that do not negotiate the feature.
- If the first device has not negotiated, it indicates that the multi-devices
feature is disabled. Consequently, the driver will ignore any subsequent
devices.

====

Here is the revised version:

To ensure consistency, all devices MUST have the same multi-devices feature
status; a mix of enabled and disabled devices is not acceptable. The driver
determines whether the multi-devices feature is enabled based on the first
device present in the guest: if the first device has negotiated the
feature, the driver enables it and ignores any devices that have not; if
the first device has not negotiated the feature, the driver treats the
feature as disabled and ignores any subsequent devices.

Does this look better to you?

> >  \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >  
> >  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
> > @@ -52,6 +59,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >  \begin{lstlisting}
> >  struct virtio_vsock_config {
> >  	le64 guest_cid;
> > +	le16 device_order;
> >  };
> >  \end{lstlisting}
> >  
> > @@ -77,11 +85,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >  \hline
> >  \end{tabular}
> >  
> > +The \field{device_order} is used to identify the default device.
> 
> no explanation what is the default device.
> is it just for the cid?

Yes.

It is allowed to not specify the local CID for a socket. In this case, the
driver will use the default device's CID as the local CID for the socket.

The details are listed in the "Receive and Transmit" section, where you
left a comment.

> > Up to
> > +65,535 devices can be supported due to the size.
> 
> can be -> are
> drop "due to the size".

Will do in the next version.

> > +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > +
> > +The device MUST provide a distinct \field{device_order} if
> > +VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
> 
> distinct to what?

In the scope of the guest VM, the device_order should be unique. This means
that the device_order should be distinct for each device.

> > +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > +
> > +The driver MUST treat the device with the lowest \field{device_order} as
> > +the default device.
> > +
> >  \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> >  
> >  \begin{enumerate}
> >  \item The guest's cid is read from \field{guest_cid}.
> >  
> > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
> > +order will be read from \field{device_order}.
> > +
> >  \item Buffers are added to the event virtqueue to receive events from the device.
> >  
> >  \item Buffers are added to the rx virtqueue to start receiving packets.
> > @@ -233,8 +257,10 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> >  
> >  \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> >  
> > -The \field{guest_cid} configuration field MUST be used as the source CID when
> > -sending outgoing packets.
> > +If the source socket is not bound to any source CID, the driver MUST assign
> > +one. If more than one device is present, the driver SHOULD use the default
> > +device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
> > +the \field{guest_cid} of the only available device.
> 
> why did you drop requirement about outgoing packets?

The driver prefers to use the CID provided by the user. That is, if the
user binds to a source CID, the driver will use it and does not need to do
anything. If not, the driver will use one from the configuration.

Thanks,
Xuewei

> >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> >  unknown \field{type} value.
> > -- 
> > 2.34.1
