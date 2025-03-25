Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45A313D8A0
	for <virtio-comment@lists.linux.dev>; Tue, 25 Mar 2025 03:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742872820; cv=none; b=fVdFsTqVUBLlln3S0XREWzFttZFMJISot/AgqSl3nMy8Dc9jIQ6lGni+qSIX3qK+AdNWwQ6UX5fbIgJPO4ZnD3DITUTEqwILMkKpCo928AxWpkFHyW2QokY0jUzsF9Ii2KqOLmDvngDd0GQHfniuwBGCepCH/g5WQ+LDxqWyX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742872820; c=relaxed/simple;
	bh=sxV+Wdx0nyrxLrKX7EZmETI3TgWDnJMIpnQJi5pVqdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBeKLKKq9QgPRZI+jk8Ow27Zh0eYd0XW0UOTi5exJ+pV+cl5qDTxTXljWAHBZt6UPRak6nRnnKZqbclzQSMdJI05SNmRXED4OqNAg64L9zeQwG3eKhzmhJApPTqTPxJcFxg3tR5OXuxhKiKXYgZfo8wHKTqcq1z3IAPEnZ+e1n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhno9hWC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhno9hWC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-225df540edcso118161875ad.0
        for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 20:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742872818; x=1743477618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS4PFp/Z2gK1VjiGoOuexiADWbCuZpo9M2b5QYeiEYQ=;
        b=bhno9hWCE+ABCAmcuIW9xS2FK8lPhRIIWzGg2TX+NsoP5cSBalSiy5oFite7YJQN65
         Jr/EnRa+UPlW5c3RTQluV0itpvUcWkiger1Ks0y1taupvjurhzsbbK3NXGqeLOQXEgIE
         8gf5SmYMgRf2PCPXMpC0b+rms2I4ycq7BbesIiqSBQZTK1U/UFxEgjUaFG1mWcVBOGpv
         ha3VCv9aKkIoJ7S5xjMjU3wEdfr+LaQ2AIvPZLFe5AA23qB4+RRqXWxCZjCIVNFnPKmx
         cbwYXTeVxqPaL0+gGU9LAHB0DE1rKbiWOj90m44NavWHlTVtKke5XgBivf29AKGh189l
         upFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742872818; x=1743477618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS4PFp/Z2gK1VjiGoOuexiADWbCuZpo9M2b5QYeiEYQ=;
        b=jqsJxsEgC4YiFBv/ceJqvbCbQb3djeTGc0fyA3Sh4DIz6sJAY9aPpcMA0P6J7JMKGE
         HcmVhIinFd9xsxtjwoJfz8HHagIFFm9z6LRMuLKIaNMvkdYKyb0AA1Xpina4LaxAq9zy
         aFOCAW0HrQpHpB84YmPrjh+ct2ETicJpiQwwb0VxzK1X3X3BrRzqC/plH/z3c7s7WT8d
         yxMOXV0pOmlhwZTEYBclxlt63PrtVT3A5Y7w/rjm6ks02HbXECPNy2u0jwXj7+YMbGI3
         gBdbQdvK0Ge7lGAnBRpl3SNsMsjrRdEcKril9/+gqldeKcsJ388ryxvGUEdoqX+xswT6
         w8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnntOK+klNaw9L/mFAsGtq5Bokl6ZamiGuaXalLBgKkgQrTjb99civFz5JiichFA6/Ju1iVB50+gNaeG2RMg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw1+XColSTzRH6yAA08EH4ixr3JphDFLFsPLPZDyudHy/1QDF9
	eunmS1mhXrfG21gTivTiwMJJUJNBG1K6d71uRvYa54vBx9kT5T8U
X-Gm-Gg: ASbGncuWhkrKu9kAEoW/aSHJJMAB2gpoxiXY6tbkhsuZHBA9Nu1JC7ALKgNnZb/qwAs
	/oAnN0JDh7nCnmgbFnIEx33ANSXYIw8lfHo91RhbIgw01+MKYjTheHBQClcxYKVOgw8OQTNec11
	Qqxm1f2qPDZ+3u6WBfloWTuF0f7WftbbUBjQRLRjkHTLe55lG5gqwG4o2+jnkwkpRS4SWETc9PT
	j9fhXNKkySb5YQt0VZlUmoYJxEK6FRvEDdXLkFkMYtJcDM+F7PNk7tRqWWHZpLOExvEU/GWAvnW
	/y1OWQBmILBiDUg/mnB0vrG94ccZppApbdPMohDqq3QtlocTQOiHJNdURYUMNZh/rYY=
X-Google-Smtp-Source: AGHT+IFCPp80ullWIrYouVHAmZseNOiq2ANzAPr3uyqPNOQOmBQ12CRu+EBxANN1AI6dtaDTfDp6jw==
X-Received: by 2002:a05:6a00:2e26:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-7377a1de977mr34477592b3a.12.1742872817696;
        Mon, 24 Mar 2025 20:20:17 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa92dfsm8829906b3a.5.2025.03.24.20.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 20:20:17 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Date: Tue, 25 Mar 2025 11:19:46 +0800
Message-Id: <20250325031946.1934483-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <h5vwvrs7gsnkyw3vmkumhbtuqdecfmksnwlvfmxr62t2lhz3hc@lpinl24bwkte>
References: <h5vwvrs7gsnkyw3vmkumhbtuqdecfmksnwlvfmxr62t2lhz3hc@lpinl24bwkte>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
> >This patch brings a new feature, called "multi devices", to the virtio
> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> >"device_order" field to the config for the virtio vsock.
> >
> >== Motivition ==
> >
> >Vsock is a lightweight and widely used data exchange mechanism between host
> >and guest. Currently, the virtio-vsock only supports one device, resulting
> >in the inability to enable more than one backend. For instance, two devices
> >are required: one to transfer data to the VMM via virtio-vsock,
> 
> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to 
> communicate with the hypervisor, but in virtio-vsock we never supported 
> it. Could this be the use case?
> 
> We could in this way add a new feature for those devices that 
> communicate only with the VMM, where the CID of the VM is quite useless.  
> So instead of having multiple CIDs per VM, we could continue to have a 
> single CID, but the transport could support 2 devices, one to 
> communicate with the VMM (CID = 0) and one to communicate with the host 
> apps (CID = 2).
> 
> Maybe this is orthogonal to this proposal, though, because it might 
> still make sense to have multiple vsock devices, even though it's not 
> very clear to me.

In terms of the current situation, two devices are enough.

We are the team of Kata Containers, so we are focusing on cloud-native
computing. What I mentioned below might be beyond the scope of the virtio
spec, just for your reference.

The background is that the architecture of proxy mesh has been evolved over
the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).

Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
both host and guest network stacks. It is possible to establish a fast path
between the pod and the proxy.

When we have multiple networks, it is intuitive to have multiple NICs. So
does vsock.

When multiple networks are availble, it means that it is possible to have
multiple proxies(i.e. user processes). In this case, two devices are not
enough. This feature makes vsock more flexible and scalable.

Looks like you don't like the design of multiple devices. May I ask why? Is
it too heavy for you?

> > and another to a user process via vhost-user-vsock.
> 
> So to recap, one device would be used only to communicate with the VMM, 
> and the other device to communicate with other external processes, 
> right?
> 
> Do you have any other use cases?
> 
> >Apart from that, a side gain is that theoretically the performance might be
> >improved since each device has its own queue. But it varies depending on
> >the implementation.
> 
> This though might be easier to implement supported multi-queue in the 
> device, instead of adding n devices to the VM.

I think multi-queue and multi-device are independent of each other, just
like what network devices do. A single vsock device can be considered as a
group of queues (if multi-queue is supported), and it can be assigned a
thread to handle the traffic.

So I accepted Parav's sugguestion, mentioned it as a side gain.

> >== Typical Usages ==
> >
> >Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> >respectively. And the device with CID 3 is default.
> >
> >Connect to the host using the device with CID 3.
> >
> >```c
> >// use default one (no bind)
> >fd = socket(AF_VSOCK);
> >connect(fd, 2, 1234);
> >n = write(fd, buffer);
> >
> >// or bind explicitly
> >fd = socket(AF_VSOCK);
> >bind(fd, 3, -1);
> >connect(fd, 2, 1234);
> >n = write(fd, buffer);
> >```
> >
> >Connect to the host using the device with CID 4.
> >
> >```c
> >// must bind explicitly as the device with CID 4 is not default.
> >fd = socket(AF_VSOCK);
> >bind(fd, 4, -1);
> >connect(fd, 2, 1234);
> >n = write(fd, buffer);
> >```
> >
> >The first version of multi-devices implementation is available at [1].
> >
> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> >
> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >---
> > device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
> > 1 file changed, 28 insertions(+), 2 deletions(-)
> >
> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> >index 7d91d15..7d0cfe4 100644
> >--- a/device-types/vsock/description.tex
> >+++ b/device-types/vsock/description.tex
> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is supported.
> > \end{description}
> >
> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >@@ -34,6 +35,12 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> > VIRTIO_VSOCK_F_STREAM has also been negotiated.
> >
> >+The driver SHOULD ignore devices that do not have
> >+VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
> >+
> >+The driver SHOULD ignore all subsequent devices if a device without
> >+VIRTIO_VSOCK_F_MULTI_DEVICES is present.
> >+
> > \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >
> > The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
> >@@ -52,6 +59,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > \begin{lstlisting}
> > struct virtio_vsock_config {
> > 	le64 guest_cid;
> >+	le16 device_order;
> > };
> > \end{lstlisting}
> >
> >@@ -77,11 +85,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > \hline
> > \end{tabular}
> >
> >+The \field{device_order} is used to identify the default device. Up to
> >+65,535 devices can be supported due to the size.
> >+
> >+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >+
> >+The device MUST provide a distinct \field{device_order} if
> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
> >+
> >+\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >+
> >+The driver MUST treat the device with the lowest \field{device_order} as
> >+the default device.
> >+
> > \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> >
> > \begin{enumerate}
> > \item The guest's cid is read from \field{guest_cid}.
> >
> >+\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
> >+order will be read from \field{device_order}.
> >+
> > \item Buffers are added to the event virtqueue to receive events from the device.
> >
> > \item Buffers are added to the rx virtqueue to start receiving packets.
> >@@ -233,8 +257,10 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> >
> > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> >
> >-The \field{guest_cid} configuration field MUST be used as the source CID when
> >-sending outgoing packets.
> >+If \field{src_cid} is missing in outgoing packets, the driver MUST assign
> 
> I think here we have to define what the driver does, since the driver 
> has to populate that field, how is it missing?
> 
> Maybe we are confusing interaction with user space, so we should say 
> something like, “If the source socket is not bound to any source CID, 
> the driver MUST assign ...”

Will do.

> >+one. If more than one device is present, the driver SHOULD use the default
> >+device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
> >+the \field{guest_cid} of the only available device.
> >
> > A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> > unknown \field{type} value.
> >-- 
> >2.34.1

[1]: https://istio.io/latest/blog/2022/introducing-ambient-mesh/
[2]: https://github.com/containers/libkrun?tab=readme-ov-file#networking

Thanks,
Xuewei
