Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201AD13D29A
	for <virtio-comment@lists.linux.dev>; Sat, 12 Oct 2024 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728725797; cv=none; b=jBl6289gwYyoPTpyHm9do2+GocvQi2McdVwR/4k+0QxBL7eRLsIzaKERIdx4ed3VuKzS+wtOySlxEY1rdId1Ni66pHh2uJx+F6H/AEGH6jc6+P5QfzY+kwRmfiB2CJk3sijXh2y7m8R9eP6WpEolQKkyx94Tp0P64kUtZ5EMYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728725797; c=relaxed/simple;
	bh=gI5XV+kuOtLFU/aRGnfU3M1pFi3CA6YGId3PY209rWU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVUAKd4ejsTnpHiapr/4IzLGl9POdIOr+ZgHGhbkZ3cAnWY4953ZA/Rp4J0PfLIA+otgB+WdvomeNk3rMfyMw4BP53/hXYY88jd+oVP1jdG+U1zQpKPxWTuPM/ZMaRHcNuFLBO43c1DPX8MbNzwcm0WNEqntFm4pSgQP2IpZdfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsDl91bV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsDl91bV"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e2c6bc4840so2020708a91.2
        for <virtio-comment@lists.linux.dev>; Sat, 12 Oct 2024 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728725794; x=1729330594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSXEOsCoATa03FnwwTcrY8DbJYxH7hoYtd457rlC5SE=;
        b=CsDl91bVTvvRPElQpFV06OhNjgJbs7uwFoMA3BEEbp3JDXXW5du6XWA8M3MLIQiCwf
         wjiZmXupOOTFL9K+JZnhvTIQ07c0QNAyiL59nAKYOsrMbe+2+og55PowiLn4C8KCfjqB
         0HsKD7YjQZ7tD3n3N+5w6xdqTSTYf27v5Guae0JfiPTvgRiQyCtiJJyV5VucyLuT6SuG
         C6QfMckeUDMPTkrKLRHAdhnJOh6zaeKxA+p9gQ3ntihBlS7b1Qa/YP0DV9b+arXsQS1Q
         jvxE8XgR29GoY0K6Va24X994cHZZJPJAYS2JOWgu+4EN2PEqcCHCEF3CW/KvuPfGqVLq
         jjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728725794; x=1729330594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSXEOsCoATa03FnwwTcrY8DbJYxH7hoYtd457rlC5SE=;
        b=eqL4WAs2qkucd3pxyknwYTR2Pom+sby4ATNMcZKtJwoOj07GBJx3cCR1ZTJNmN2Htr
         QVb6eCLtH1AtLK0hEpWwxovZnd3/jjVaQE2QyYO1z1wc2mvSMNWY80QjICr6TFBnbTUi
         6kEBz1YfZkwudzGPoFF3N0Qs36XFYOceIYuwa8rWoARKNc5jP+4XcFUto6trbWe0jRSd
         vMmbfykz7JLg+iRM7kTZ3sxlDMVhpFk3feQuQrhRXWGW+6LXe/EGVExY2NSQWCB5i+Zp
         +DfTWSfZdWF4A42xBQdtxuHxE049WuzbC1ePa/lO+QPU/4ZtLoYVz3OBQ6a+zdp7Bali
         T1ew==
X-Forwarded-Encrypted: i=1; AJvYcCWDp+09YkaF0iSVW5rbuh8wLwQyzWoQmekmevkWG0Boh+2lp+KeRtmOhW/k/XCgJDUVoNEvm7Yl+64LF965Og==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzucl4nKnyaflHBipsiOSUZ8OVnUtfupo0tLH7TziyKfSziKT9n
	c2zYoH8UVcpwHTlJMzbYEQvahYRrAAtLc5oA9+LNGB5T1dc5gzsM
X-Google-Smtp-Source: AGHT+IERwvEmuFlBKK/UznqaUv7bAYPq+s6exiudLF8H+1cFO8Q1vOkDTKuZgLnN+uDcSr5wEdE3eQ==
X-Received: by 2002:a17:90a:17e2:b0:2c8:65cf:e820 with SMTP id 98e67ed59e1d1-2e3151b7869mr2705900a91.2.1728725794217;
        Sat, 12 Oct 2024 02:36:34 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2f99f61afsm2654619a91.57.2024.10.12.02.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 02:36:33 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	virtio-comment@lists.linux.dev
Subject: Re: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Date: Sat, 12 Oct 2024 17:36:21 +0800
Message-Id: <20241012093621.2966775-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pxccl5mfv7m3r4shslqusnrd3zgwlzdwo3o45fgmulahup2jjl@dtm6dbw3fl4o>
References: <pxccl5mfv7m3r4shslqusnrd3zgwlzdwo3o45fgmulahup2jjl@dtm6dbw3fl4o>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Mon, Sep 09, 2024 at 04:51:50PM GMT, Xuewei Niu wrote:
> >Hi Stefano,
> >
> >Thanks for your constructive comments and hope you had a nice vacation ;)
> >
> >I responded to some comments before proceeding to the next version. PTAL!
> >
> >Thanks,
> >Xuewei
> >
> >> Hi,
> >> sorry for the delay, I was on vacation.
> >
> >> On Tue, Aug 13, 2024 at 04:14:46PM GMT, Xuewei Niu wrote:
> >> >This patch brings a new feature, called "multi devices", to the virtio
> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and
> >> >a
> >> >"index" field to the config for the virtio vsock.
> >> >
> >> >== Motivition ==
> >> >
> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> >> >and guest. Kata Containers, a secure container runtime, leverages the
> >> >capability to exchange control data between the shim and the kata-agent.
> >> >
> >> >Currently, the virtio-vsock only supports one device, resulting in the
> >> >following limitations:
> >> >
> >> >* Poor performance isolation: All vsock connections share the same
> >> >virtqueue. By the way, although multi-queues can solve this problem, they
> >> >do not conflict.
> >> >* Cannot enable more than one backend: Virtio-vsock, vhost-vsock, and
> >> >vhost-user-vsock cannot be enabled simultaneously on the transport.
> >> >
> >> >We’d like to transfer networking data, based on TSI (Transparent Socket
> >> >Impersonation) technique, over vsock via the vhost-user protocol to reduce
> >> >overhead. However, by default, the vsock device is occupied by the
> >> >kata-agent, a control component for Kata Containers.
> >> >
> >> >== Typical Usages ==
> >> >
> >> >Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> >> >respectively. And the device with CID 3 is default.
> >> >
> >> >==== Guest -> Host ====
> >> >
> >> >Use the device with CID 3.
> >> >
> >> >```c
> >> >fd = socket(AF_VSOCK);
> >> >bind(fd, 3, -1);
> >> >connect(fd, 2, 1234);
> >> >n = write(fd, buffer);
> >> >
> >> >// or use default (no bind)
> >> >fd = socket(AF_VSOCK);
> >> >connect(fd, 2, 1234);
> >> >n = write(fd, buffer);
> >> >```
> >> >
> >> >Use the device with CID 4.
> >> >
> >> >```c
> >> >fd = socket(AF_VSOCK);
> >> >bind(fd, 4, -1);
> >> >connect(fd, 2, 1234);
> >> >n = write(fd, buffer);
> >> >```
> >> >
> >> >==== Host -> Guest ====
> >> >
> >> >The usage is no changes in this case. Send to device with CID 3.
> >> >
> >> >```c
> >> >fd = socket(AF_VSOCK);
> >> >connect(fd, 3, 1234);
> >> >n = write(fd, buffer);
> >> >```
> >> >
> >> >Send to device with CID 4.
> >> >
> >> >```c
> >> >fd = socket(AF_VSOCK);
> >> >connect(fd, 4, 1234);
> >> >n = write(fd, buffer);
> >> >```
> >> >
> >> >I've pushed a version of code for the implementation of multi devices to
> >> >lkml [1].
> >> >
> >> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> >> >
> >> >Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> >>
> >> mmm, why there is my S-o-b here?
> >
> >Lol. I've replaced some of descriptions with your version. So should I keep this s-o-b?
> 
> Commonly S-o-b is to be put only if the person concerned specifies you 
> to put it. In this case it's your work, I just made suggestions and you 
> don't need to put my S-o-b ;-)

Okay. Will update.

> >
> >> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >> >---
> >> > device-types/vsock/description.tex | 45 ++++++++++++++++++++++++++++--
> >> > 1 file changed, 43 insertions(+), 2 deletions(-)
> >> >
> >> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> >> >index 7d91d15..5a10ae1 100644
> >> >--- a/device-types/vsock/description.tex
> >> >+++ b/device-types/vsock/description.tex
> >> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> >> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> >> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> >> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> >> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
> >>
> >> I'd follow the the other features with something like:
> >> "\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are supported."
> >>
> >> > \end{description}
> >> >
> >> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >> >@@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> > \begin{lstlisting}
> >> > struct virtio_vsock_config {
> >> > 	le64 guest_cid;
> >> >+	le16 index;
> >> > };
> >> > \end{lstlisting}
> >> >
> >> >@@ -77,11 +79,41 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> > \hline
> >> > \end{tabular}
> >> >
> >> >+The \field{index} field indicates index of a device, and is required for
> >> >+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> >>
> >> what about "when the VIRTIO_VSOCK_F_MULTI_DEVICES feature is negotiated" ?
> >>
> >> >+negotiated. The size of the \field{index} is 16 bits which supports up to
> >> >+65,536 devices.
> >>
> >> What about "The \field{index} is 16 bits in size, enabling support for
> >> up to 65,536 devices."
> >
> >I'll update in v5.
> >
> >> >+The device with the lowest index is considered as the default device. There
> >> >+was only one device before the multi-device feature was supported. When the
> >> >+multi-device feature is enabled (VIRTIO_VSOCK_F_MULTI_DEVICES has been
> >> >+negotiated), the default device can be thought of as the device. It is used
> >> >+to maintain compatibility with applications that are not yet ready to
> >> >+support this feature.
> >>
> >> IMHO this part is not very clear.
> >> I would try to explain what index is only for when
> >> VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, something like that:
> >>
> >>    If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the index of multiple
> >>    devices managed by the driver is used by the driver to choose the
> >>    default device when the source socket is not bound to any CID. In this
> >>    case, the driver uses the device with the lowest index as the default.
> >>
> >> I'm not sure if we need to add a specific paragraph to explain that
> >> part better.
> >
> >I'd like to tell the users that what will happen if they don't update their
> >vsock apps. But your version is more concise and clear.
> >
> >I think we don't need to do that, since we'll elaborate the details about
> >the default device in the "Device Operation: Receive and Transmit".
> >
> >Wdyt?
> 
> Okay, let's try, I'll check the final result.
> 
> >
> >> >+
> >> >+\devicenormative{\subsubsection}{Device configuration layout}{Device
> >> >Types / Socket Device / Device configuration layout}
> >> >+
> >> >+The \field{index}es don't have to be continuous. For instance, three
> >> >+devices with \field{index} 1, 2 and 5 respectively are acceptable.
> >> >+
> >> >+The \field{index}es cannot have conflicts. For instance, three devices with
> >> >+\field{index} 1, 1 and 5 respectively are prohibited.
> >>
> >> A normative section should use SHOULD, MAY, MUST. Please take a look at
> >> the other normative sections.
> >>
> >> Should we add a line here in the normative section to specify that the
> >> driver must use the device with the lowest index as the default?
> >
> >I will update it as follows in v5.
> >
> >```
> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >
> >The device MAY make \field{index}es discontinuous.
> >
> >The device MUST use a different \field{index}.
> 
> I think in both we need to talk about multiple devices, not the single 
> device.

Yes, I think I am talking about multiple devices. I'd like to point out that the
indexes must be unique but could be discontinuous.

What about the following?

```
\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}

The device MUST offer a unique \field{index}. The \field{index}es among all
devices MAY be discontinuous.
```

> >
> >\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >
> >The driver MUST use the device with the lowest index as the default.
> 
> IMHO "default" here is not clear, so something like, “as default device 
> for outgoing connections”

Will update.

> Thanks,
> Stefano
> 
> >```
> >
> >Looks good to you?
> >
> >> >+
> >> > \subsection{Device Initialization}\label{sec:Device Types / Socket
> >> > Device / Device Initialization}
> >> >
> >> > \begin{enumerate}
> >> > \item The guest's cid is read from \field{guest_cid}.
> >> >
> >> >+\item Check for multi devices support:
> >> >+\begin{itemize}
> >> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
> >> >+    the device's index will be read from \field{index}, and the driver will
> >> >+    allow multi devices.
> >> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated, the
> >> >+    device's index will be ignored, and the driver will deny the second and
> >> >+    subsequent devices.
> >> >+\end{itemize}
> >> >+
> >> > \item Buffers are added to the event virtqueue to receive events from the device.
> >> >
> >> > \item Buffers are added to the rx virtqueue to start receiving packets.
> >> >@@ -167,6 +199,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> >> > consists of a (cid, port number) tuple. The header fields used for this are
> >> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> >> >
> >> >+When the driver supports multiple devices (feature
> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting socket is not
> >>
> >> s/transmitting/source
> >
> >I'll update in v5.
> >
> >> >+bound to any specific address, then \field{src_cid} should be assigned with
> >> >+the CID of the default device.
> >> >+
> >> > Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> >> > for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for
> >> > seqpacket socket types.
> >> >
> >> >@@ -233,8 +270,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> >> >
> >> > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> >> >
> >> >-The \field{guest_cid} configuration field MUST be used as the source CID when
> >> >-sending outgoing packets.
> >> >+The \field{guest_cid} configuration field of one device MUST be used as the
> >> >+source CID when sending outgoing packets. When the
> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature is not negotiated, there is only one
> >> >+device. When this feature has been negotiated, either use the
> >> >+\field{guest_cid} of the device specified by the user, or use that of the
> >> >+default device.
> >>
> >> We can skip the one device part, I would rephrase it to something like this:
> >>
> >> The \field{guest_cid} configuration field MUST be used as the source CID when
> >> sending outgoing packets.
> >> When the VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
> >> MUST be one of the \field{guest_cid} configuration field of the multiple
> >> devices handled by the driver.
> >
> >I'll update in v5.
> >
> >> Thanks,
> >> Stefano
> >>
> >> >
> >> > A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> >> > unknown \field{type} value.
> >> >--
> >> >2.34.1
> >> >
> >

Regards,
Xuewei
