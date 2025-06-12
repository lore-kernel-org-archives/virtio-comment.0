Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C584BE5E
	for <virtio-comment@lists.linux.dev>; Thu, 12 Jun 2025 03:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749698928; cv=none; b=W3XVqaQ17pheIRXeOWJvidU3n8uWtJURtaKMRa7Cs3gglIiN0gj8+a2i7+8H8M56CqcxcFd5jfBpBrjYMFLvt0keWgZq/HUuxRSHq146J/koAz2eDkUdimSJS3gTSNbOJE7Z9AefqTIvTP94gZ09GI1uW6CZQ9b8S6FGbQBOrxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749698928; c=relaxed/simple;
	bh=CvfBbPcRJFKsGoC4msV1uSMbRkU79ZgC8uBBmU+Wh9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oJFF2GF8flrl6lqmZw8RrmJC4hVksDVHCOEvREOYyxYg6HCk3Hmomg2rKowiqk6m615L0pPp4ZAiP2Vl99sgD+7a+6gZ8VLSPCGRb0E8OHR+an1+ArhvT5FTXVPz5BgNP4Ino3tq3bTL2oLpt4jQuBwcQbubs74z7B1AxplxfsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8z3cY9+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8z3cY9+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso729963b3a.2
        for <virtio-comment@lists.linux.dev>; Wed, 11 Jun 2025 20:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749698924; x=1750303724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TBVaZFsQvcyttW8wOtJS+IvHfA/TuxWUnJSXmoRXoA=;
        b=m8z3cY9+oXtaRZ8tSK7ri8V2m+fDUu6RrqgwEQnf9lcwkTU1VPY6eF0hBBR9IziSC4
         zkrltDq8/dG0VWdAIpjcDxNVuT00Nz53vTO6ol0kpjAUu6wSaAuIUI6/c4zv8gTYMKiI
         qJEgqgYyrb4rETROh/E8v/+W2LTUlhBDuTQHqTdDbCpFn8Vlp0CP95GGMV0nDYoL8CZX
         16w/3Oy/m9gdHwsIPg0kp85HxlXsfjozV0IL6WCqvKqZhxELGIaQFhebe37QJmW/ANib
         7yfc7RPK/rdkzlPL7yjppoU5kIVLHkc14NgTqrTovMCrNHXAqZZA1KHK64FcE6yKoMKd
         3ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749698924; x=1750303724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TBVaZFsQvcyttW8wOtJS+IvHfA/TuxWUnJSXmoRXoA=;
        b=norjYCrm3lgnlftaOIr+F0EDgru06SjBG/ymXwF6XzhJKk8FCOgGtQPSpP5qy8TPGS
         j5eEhAhbwY81X2nSMLimHA/LNn10MGfKp0+SpbcKvVImq9hPz3c3uzdVcwkjgI4Gf/eu
         cllantAEnJQFMDY19tX8yY3UDOLxKMRfuJb3whcEfpKQWceAJfCjyoV4AVq+JXKbwk5K
         9lDC6soFQWIYP1b8cvLXGcSl5vl5Ift7DAJB3qPO1PZ6wxwuMNh+kz8mUDYQgm0qrisU
         3M34B0kB0vc8Lqd0zFiJTfGioAL6Y/gk1gjihBAGtPA9/qYYcqCYixC3iZgKq0ufGMlb
         exng==
X-Forwarded-Encrypted: i=1; AJvYcCUsIkU9JICuvxDdNVbJbpYqV5zrxl/jlnn9cVyHIkuwp/Gv7yeV4g8ckbuLIrAEHPNeZ5zGJSgJRcQ4tNDNNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr48viz2H2taXkuZIF3qK7bo1q9Pzu964wMQTLXP+nyh7kWN0K
	iqTsJOpaNzavMNVlNI5xrIZFCfeyI+RD6NbT7bN/2Z1fdSIPOOWO5GU8
X-Gm-Gg: ASbGncsqhc7BAQRi8B+wKggk3sVP289ISGWBDlZsAxunq4xj7fRFIvwVXX9jgOMLNFc
	6SJYViGGzXytMzf6A5FTnQieMc0O9w+OVYuMoFMgwbq8JBkMXhHsnI8Og94CFxWWgaDMeeHZf3c
	IRPZgaATgtDca+k2kO9VjoDHjBdId17Dv8SCw5mt0fBVcK2DRDvZac6VAMmAw1Nv4Id4ZL95bg+
	5j7z4ZqXnztYg2CCCE1TO/xhigfI69Ig/59K0vLbwswjTGMOpb9UVJ90vcwrPpVKoybHB7Dci+5
	4ELjKJ7tnRXQyE3GjmF3BFp8t2X33pHxI6Pz2cESxHXsujoq46CC75j7P0PfCqwBofdcNERVUcv
	sxEqGWLW/
X-Google-Smtp-Source: AGHT+IEXP5O4aQf+9Tf+3oF0yag8f4pO80kv4XNn3NwtxeQ8Kcb4I22dUzo/f7k3VpY4kgN+da68vw==
X-Received: by 2002:a05:6a00:8cb:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-7487c31bda1mr2277894b3a.15.1749698923437;
        Wed, 11 Jun 2025 20:28:43 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74880a3e580sm359612b3a.179.2025.06.11.20.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 20:28:42 -0700 (PDT)
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
Date: Thu, 12 Jun 2025 11:28:32 +0800
Message-Id: <20250612032832.942414-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611133631-mutt-send-email-mst@kernel.org>
References: <20250611133631-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Mon, May 19, 2025 at 05:37:36PM +0800, Xuewei Niu wrote:
> > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > "device_order" field to the config for the virtio vsock.
> > > > 
> > > > == Motivition ==
> > > > 
> > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > in the inability to enable more than one backend. For instance, two devices
> > > > are required: one to transfer data to the VMM via virtio-vsock, and another
> > > > to a user process via vhost-user-vsock.
> > > > 
> > > > Apart from that, a side gain is that theoretically the performance might be
> > > > improved since each device has its own queue. But it varies depending on
> > > > the implementation.
> > > > 
> > > > == Typical Usages ==
> > > > 
> > > > Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> > > > respectively. And the device with CID 3 is default.
> > > > 
> > > > Connect to the host using the device with CID 3.
> > > > 
> > > > ```c
> > > > // use default one (no bind)
> > > > fd = socket(AF_VSOCK);
> > > > connect(fd, 2, 1234);
> > > > n = write(fd, buffer);
> > > > 
> > > > // or bind explicitly
> > > > fd = socket(AF_VSOCK);
> > > > bind(fd, 3, -1);
> > > > connect(fd, 2, 1234);
> > > > n = write(fd, buffer);
> > > > ```
> > > > 
> > > > Connect to the host using the device with CID 4.
> > > > 
> > > > ```c
> > > > // must bind explicitly as the device with CID 4 is not default.
> > > > fd = socket(AF_VSOCK);
> > > > bind(fd, 4, -1);
> > > > connect(fd, 2, 1234);
> > > > n = write(fd, buffer);
> > > > ```
> > > > 
> > > > The first version of multi-devices implementation is available at [1].
> > > > 
> > > > v6 -> v7:
> > > > - Addresses minor review comments from Stefano.
> > > > 
> > > > [1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> > > > 
> > > > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > > > ---
> > > >  device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
> > > >  1 file changed, 28 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> > > > index 7d91d15..392dc76 100644
> > > > --- a/device-types/vsock/description.tex
> > > > +++ b/device-types/vsock/description.tex
> > > > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > > >  \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> > > >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> > > >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> > > > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is supported.
> > > >  \end{description}
> > > >  
> > > >  \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> > > > @@ -34,6 +35,12 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > > >  VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> > > >  VIRTIO_VSOCK_F_STREAM has also been negotiated.
> > > >  
> > > > +The driver SHOULD ignore devices that do not have
> > > > +VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
> > > > +
> > > > +The driver SHOULD ignore all subsequent devices if a device without
> > > > +VIRTIO_VSOCK_F_MULTI_DEVICES is present.
> > > > +
> > > 
> > > all this is really vague. any better way to put it?
> > > 
> > > what are subsequent devices? if the feature has been negotiated where?
> > > what does ignore mean? you can not know features without interacting
> > > with the device.
> > 
> > The original idea is: Some devices have enabled the multi-devices feature,
> > while others have not, and this situation is unacceptable.
> > 
> > The driver determines the states based on the first device present in the
> > guest.
> > 
> > There are two possible cases:
> > 
> > - If the first device has negotiated the multi-devices feature, then the
> > driver considers the multi-devices feature as enabled. Then, the driver will
> > ignore all devices that do not negotiate the feature.
> > - If the first device has not negotiated, it indicates that the multi-devices
> > feature is disabled. Consequently, the driver will ignore any subsequent
> > devices.
> > 
> > ====
> > 
> > Here is the revised version:
> > 
> > To ensure consistency, all devices MUST have the same multi-devices feature
> > status; a mix of enabled and disabled devices is not acceptable. The driver
> > determines whether the multi-devices feature is enabled based on the first
> > device present in the guest: if the first device has negotiated the
> > feature, the driver enables it and ignores any devices that have not; if
> > the first device has not negotiated the feature, the driver treats the
> > feature as disabled and ignores any subsequent devices.
> > 
> > Does this look better to you?
> 
> I can't say I like this, since it is not clear what does "first device
> present" mean. Also, it is not clear what does "ignores" mean.
> 
> 
> I propose instead simply specifying something like this for devices:
> 
> 
> 	All socket devices used with a specific driver MUST be consistent
> 	with respect to offering VIRTIO_VSOCK_F_MULTI_DEVICES.
> 	In other words, either all of the devices offer VIRTIO_VSOCK_F_MULTI_DEVICES or
> 	none of them do.
> 
> 
> And similarly for drivers:
> 
> 	When used with multiple socket devices, a driver MUST be consistent
> 	with respect to negotiating VIRTIO_VSOCK_F_MULTI_DEVICES.
> 	In other words, either the driver negotiates VIRTIO_VSOCK_F_MULTI_DEVICES
> 	with all of the devices, or with none of them.
> 
> 
> There is no need to specify behaviour when spec is violated.

Will do in the next.

Thanks,
Xuewei

> > > >  \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> > > >  
> > > >  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
> > > > @@ -52,6 +59,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > > >  \begin{lstlisting}
> > > >  struct virtio_vsock_config {
> > > >  	le64 guest_cid;
> > > > +	le16 device_order;
> > > >  };
> > > >  \end{lstlisting}
> > > >  
> > > > @@ -77,11 +85,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > > >  \hline
> > > >  \end{tabular}
> > > >  
> > > > +The \field{device_order} is used to identify the default device.
> > > 
> > > no explanation what is the default device.
> > > is it just for the cid?
> > 
> > Yes.
> > 
> > It is allowed to not specify the local CID for a socket. In this case, the
> > driver will use the default device's CID as the local CID for the socket.
> > 
> > The details are listed in the "Receive and Transmit" section, where you
> > left a comment.
> > 
> > > > Up to
> > > > +65,535 devices can be supported due to the size.
> > > 
> > > can be -> are
> > > drop "due to the size".
> > 
> > Will do in the next version.
> > 
> > > > +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > > > +
> > > > +The device MUST provide a distinct \field{device_order} if
> > > > +VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
> > > 
> > > distinct to what?
> > 
> > In the scope of the guest VM, the device_order should be unique. This means
> > that the device_order should be distinct for each device.
> > 
> > > > +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > > > +
> > > > +The driver MUST treat the device with the lowest \field{device_order} as
> > > > +the default device.
> > > > +
> > > >  \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> > > >  
> > > >  \begin{enumerate}
> > > >  \item The guest's cid is read from \field{guest_cid}.
> > > >  
> > > > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
> > > > +order will be read from \field{device_order}.
> > > > +
> > > >  \item Buffers are added to the event virtqueue to receive events from the device.
> > > >  
> > > >  \item Buffers are added to the rx virtqueue to start receiving packets.
> > > > @@ -233,8 +257,10 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> > > >  
> > > >  \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> > > >  
> > > > -The \field{guest_cid} configuration field MUST be used as the source CID when
> > > > -sending outgoing packets.
> > > > +If the source socket is not bound to any source CID, the driver MUST assign
> > > > +one. If more than one device is present, the driver SHOULD use the default
> > > > +device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
> > > > +the \field{guest_cid} of the only available device.
> > > 
> > > why did you drop requirement about outgoing packets?
> > 
> > The driver prefers to use the CID provided by the user. That is, if the
> > user binds to a source CID, the driver will use it and does not need to do
> > anything. If not, the driver will use one from the configuration.
> > 
> > Thanks,
> > Xuewei
> > 
> > > >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> > > >  unknown \field{type} value.
> > > > -- 
> > > > 2.34.1
