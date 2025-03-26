Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5CC8C1F
	for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 10:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742983246; cv=none; b=T9uu/DhmtkN8xQTNRy/4mcvCw4k+fuIxGqrCyHHGpbxRtkB+Wh00u0W9K7xXLMPt9u7Bp8NLwjfwiZCVcaPZyEyOkFwWTvp8+FGQ9XvOhlYGZJVCwlkPbqd9cUMEqCPJJBUx8YOBVvPnNZqoYmejPxSpjMNFdPr2zWJTxgpTCFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742983246; c=relaxed/simple;
	bh=7bYxQs+L0rBju+GXTm0M2l1zzBOrYaxJLZqTWc9kTTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R2vSCd9xIbHgIioFjDO2/DY1F4KzvzV01G5jf2bcU9L57TL0RGRRL3I8CCU9AoFIe8TJqo3Pt8YJvewbPFYRKQjgW9IFakuFCiaioTJdy9uSwfHwULKlOpFtoNzSXVdJ1DuNSJNjARElwcgYPLDG82O2Aac2InyQFfTBHdA5sYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL01//QJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL01//QJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227d6b530d8so59628535ad.3
        for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 03:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742983244; x=1743588044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRSBSPqjP0NSJ2eayQ0ILrde5BB8x/0h+0hocguu/QE=;
        b=IL01//QJtm0iLO2GrUzD6PLHBrj85UzvQOtV74PyFVAaGasaE/PllxeCVPADfEBEMR
         Rm5C1qQtvcpZ1P3nSn+i6+5ISWjrCOUtHNOkYVc1kkIOxCuWAW1RRBMNJnxx04PZL+PN
         Mm0XKNEJtlHFxsfNBdQhvoRZ/CdZBSW6+1zLfWKlu5/Te3UL1ThJLGC5lqD0SOtF1rqQ
         F1BqpwzfvMPr6fEZ1+ZqESCcR97xoTrMmfKjfMHadsEVCoNP2zgOnxoy8DErjb9k0/wX
         y+Sud0+zH96pvakwL/qS1SYRdAdLfP2t3vimbgOyyaXmUqSzgexMSC7zrk0MNuubEwh8
         XeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742983244; x=1743588044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRSBSPqjP0NSJ2eayQ0ILrde5BB8x/0h+0hocguu/QE=;
        b=lE8QwK61inLYpzjjZc6y1EdBQm0PWZxEx0QQTGQwaHCaQyutTyOAuxfIpZm6LPcHD4
         gfFUpMPs7/tMI+R53D78iYSIxJ4Bkk3bUYp/kY+LOSwhYXH9kSm/FRLc1DLcNmMylHBq
         E2dNmVggGw5QQWyj4QGmrO+HssguaxwSZk/eFpMsYSgJUspCts6PxbMmRiJvlqeJPPZo
         wnC/E8if1Crbq53EgI1v7NH8gmTl4iq0yUt01tivsvLptmhm0yGZ0ncNv3HhgaJzVo4o
         WZsaxAM4OzhHa7AfEjqoMKTPw0m0fr59Um2hpQHjk3JhWP+CunTO62jYWXREXYDChJag
         xTVg==
X-Forwarded-Encrypted: i=1; AJvYcCW/po4gyHQJaAVrsu37ALTrAg4TTr8x6jb1vBbe6T0xnhUZjuM5g+P5sfI7u+nIatSMcGKhhbC0/CtCdeWABA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxah2FFD638U7lOhbJVQ0+2+VQAaeGboIg9qSul8UuLy4pntWzh
	UII2USBZp9oC4mPIX8ejU8UNLTnZDRuBorwSma+b2/1w93EzbkvK
X-Gm-Gg: ASbGncv2ApUNPzyzwwaKrf37h2Sanx+EEKxXCiJn3k7pBpgAX28p2kiFyznpFuHLZTC
	D/eM++N3u6Wui1AWKoTU3SmUAQuygEsqlH+/isMvFLn5cBrz3ULOGCnrtNsGGJEsifdmzq+7Me7
	r9f5l8Ytdud4e9WDE8J5k4TVHU465bbU2i0JjeKpsksjOKZ17LXJ4AZ2WvBxNTwRk32rS5PUjVS
	8SgN77ije5nr51awChTYpXY39vxV2b6cu2bR1OpnFvA+bdMUROVERlIAD8qxcDB+bM2YL42YKoq
	IWwc3uLeq/4mjupPa2OOERv794CpAd5o1ho2sVKKFqI04EWIyOCYceFxA8/P4ioBGFQ=
X-Google-Smtp-Source: AGHT+IFLpFQ1z9NbfriS4vrx1svaNfLr6ZSdPsp/W+5e9GyCVEhbcijH0SJruCuQaNG809nHLy+8lg==
X-Received: by 2002:a17:90b:4fc6:b0:2fe:8a84:e033 with SMTP id 98e67ed59e1d1-3030fe6a292mr30342339a91.2.1742983243612;
        Wed, 26 Mar 2025 03:00:43 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f6019c9sm11974136a91.24.2025.03.26.03.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 03:00:43 -0700 (PDT)
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
Date: Wed, 26 Mar 2025 18:00:31 +0800
Message-Id: <20250326100031.2197645-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7o7pkrmbwp6zyybgqqliybesezk2zpnopwwgzlbfpnw2m7relz@mxyhzve6lote>
References: <7o7pkrmbwp6zyybgqqliybesezk2zpnopwwgzlbfpnw2m7relz@mxyhzve6lote>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
> >> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
> >> >This patch brings a new feature, called "multi devices", to the virtio
> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> >> >"device_order" field to the config for the virtio vsock.
> >> >
> >> >== Motivition ==
> >> >
> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> >> >and guest. Currently, the virtio-vsock only supports one device, resulting
> >> >in the inability to enable more than one backend. For instance, two devices
> >> >are required: one to transfer data to the VMM via virtio-vsock,
> >>
> >> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
> >> communicate with the hypervisor, but in virtio-vsock we never supported
> >> it. Could this be the use case?
> >>
> >> We could in this way add a new feature for those devices that
> >> communicate only with the VMM, where the CID of the VM is quite useless.
> >> So instead of having multiple CIDs per VM, we could continue to have a
> >> single CID, but the transport could support 2 devices, one to
> >> communicate with the VMM (CID = 0) and one to communicate with the host
> >> apps (CID = 2).
> >>
> >> Maybe this is orthogonal to this proposal, though, because it might
> >> still make sense to have multiple vsock devices, even though it's not
> >> very clear to me.
> >
> >In terms of the current situation, two devices are enough.
> >
> >We are the team of Kata Containers, so we are focusing on cloud-native
> >computing. What I mentioned below might be beyond the scope of the virtio
> >spec, just for your reference.
> >
> >The background is that the architecture of proxy mesh has been evolved over
> >the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
> >
> >Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
> >both host and guest network stacks. It is possible to establish a fast path
> >between the pod and the proxy.
> >
> >When we have multiple networks, it is intuitive to have multiple NICs. So
> >does vsock.
> 
> Be careful though, we don't want to complicate vsock to become like a 
> NIC.
> 
> >
> >When multiple networks are availble, it means that it is possible to have
> >multiple proxies(i.e. user processes). In this case, two devices are not
> >enough. This feature makes vsock more flexible and scalable.
> 
> This is a good point, but I really don't understand why a VM should have 
> multiple CIDs assigned.

I think priority is not the biggest issue here. So let us focus on how to
route the connection to the right device among more than two devices.

Our solution uses CID as device identification. From the users'
perspective, they can direct the connection to the appropriate device by
specifying a CID in either the `connect` or `bind` syscall.

Assigning one CID to a VM looks good to me. But I am not sure how to
distinguish the devices. For example, should we expose a ioctl or a
sockopt?

Thanks,
Xuewei

> >Looks like you don't like the design of multiple devices. May I ask why? Is
> >it too heavy for you?
> 
> Yes, I am concerned that we are over complicating vsock.
> Since AF_VSOCK already defines an address to communicate with the 
> hypervisor, why can't the device that ends up in the VMM (TSI) use that?
> 
> I believe that having multiple devices only introduces a complication in 
> the user. What source device/CID should the user use and for what 
> reason?
> 
> All this should be hidden and especially in your case, this is already 
> easily done by using VMADDR_CID_HYPERVISOR to communicate with the VMM 
> and VMADDR_CID_HOST to communicate with applications in the host. So 
> maybe we only need to handle 2 device types in the driver, without 
> adding this functionality but just introducing a new device type (via a 
> feature) that handles VMADDR_CID_HYPERVISOR, so that the driver knows 
> that at most it can have 2 devices, one for the VMM and one for the 
> host.
> 
> >
> >> > and another to a user process via vhost-user-vsock.
> >>
> >> So to recap, one device would be used only to communicate with the VMM,
> >> and the other device to communicate with other external processes,
> >> right?
> >>
> >> Do you have any other use cases?
> >>
> >> >Apart from that, a side gain is that theoretically the performance might be
> >> >improved since each device has its own queue. But it varies depending on
> >> >the implementation.
> >>
> >> This though might be easier to implement supported multi-queue in the
> >> device, instead of adding n devices to the VM.
> >
> >I think multi-queue and multi-device are independent of each other, just
> >like what network devices do. A single vsock device can be considered as a
> >group of queues (if multi-queue is supported), and it can be assigned a
> >thread to handle the traffic.
> 
> That's right
>     multi-queue -> performance
>     multi-device -> more addresses
> 
> And that's where I worry, why complicate vsock to get more addresses for 
> a VM?
> 
> >
> >So I accepted Parav's sugguestion, mentioned it as a side gain.
> >
> >> >== Typical Usages ==
> >> >
> >> >Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> >> >respectively. And the device with CID 3 is default.
> >> >
> >> >Connect to the host using the device with CID 3.
> >> >
> >> >```c
> >> >// use default one (no bind)
> >> >fd = socket(AF_VSOCK);
> >> >connect(fd, 2, 1234);
> >> >n = write(fd, buffer);
> >> >
> >> >// or bind explicitly
> >> >fd = socket(AF_VSOCK);
> >> >bind(fd, 3, -1);
> >> >connect(fd, 2, 1234);
> >> >n = write(fd, buffer);
> >> >```
> >> >
> >> >Connect to the host using the device with CID 4.
> >> >
> >> >```c
> >> >// must bind explicitly as the device with CID 4 is not default.
> >> >fd = socket(AF_VSOCK);
> >> >bind(fd, 4, -1);
> >> >connect(fd, 2, 1234);
> >> >n = write(fd, buffer);
> >> >```
> >> >
> >> >The first version of multi-devices implementation is available at [1].
> >> >
> >> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> >> >
> >> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >> >---
> >> > device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
> >> > 1 file changed, 28 insertions(+), 2 deletions(-)
> >> >
> >> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> >> >index 7d91d15..7d0cfe4 100644
> >> >--- a/device-types/vsock/description.tex
> >> >+++ b/device-types/vsock/description.tex
> >> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> >> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> >> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> >> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> >> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is supported.
> >> > \end{description}
> >> >
> >> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >> >@@ -34,6 +35,12 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> >> > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> >> > VIRTIO_VSOCK_F_STREAM has also been negotiated.
> >> >
> >> >+The driver SHOULD ignore devices that do not have
> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
> >> >+
> >> >+The driver SHOULD ignore all subsequent devices if a device without
> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES is present.
> >> >+
> >> > \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >> >
> >> > The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
> >> >@@ -52,6 +59,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> > \begin{lstlisting}
> >> > struct virtio_vsock_config {
> >> > 	le64 guest_cid;
> >> >+	le16 device_order;
> >> > };
> >> > \end{lstlisting}
> >> >
> >> >@@ -77,11 +85,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> > \hline
> >> > \end{tabular}
> >> >
> >> >+The \field{device_order} is used to identify the default device. Up to
> >> >+65,535 devices can be supported due to the size.
> >> >+
> >> >+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >> >+
> >> >+The device MUST provide a distinct \field{device_order} if
> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
> >> >+
> >> >+\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >> >+
> >> >+The driver MUST treat the device with the lowest \field{device_order} as
> >> >+the default device.
> >> >+
> >> > \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> >> >
> >> > \begin{enumerate}
> >> > \item The guest's cid is read from \field{guest_cid}.
> >> >
> >> >+\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
> >> >+order will be read from \field{device_order}.
> >> >+
> >> > \item Buffers are added to the event virtqueue to receive events from the device.
> >> >
> >> > \item Buffers are added to the rx virtqueue to start receiving packets.
> >> >@@ -233,8 +257,10 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> >> >
> >> > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> >> >
> >> >-The \field{guest_cid} configuration field MUST be used as the source CID when
> >> >-sending outgoing packets.
> >> >+If \field{src_cid} is missing in outgoing packets, the driver MUST assign
> >>
> >> I think here we have to define what the driver does, since the driver
> >> has to populate that field, how is it missing?
> >>
> >> Maybe we are confusing interaction with user space, so we should say
> >> something like, “If the source socket is not bound to any source CID,
> >> the driver MUST assign ...”
> >
> >Will do.
> >
> >> >+one. If more than one device is present, the driver SHOULD use the default
> >> >+device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
> >> >+the \field{guest_cid} of the only available device.
> >> >
> >> > A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> >> > unknown \field{type} value.
> >> >--
> >> >2.34.1
> >
> >[1]: https://istio.io/latest/blog/2022/introducing-ambient-mesh/
> >[2]: https://github.com/containers/libkrun?tab=readme-ov-file#networking
> >
> >Thanks,
> >Xuewei
