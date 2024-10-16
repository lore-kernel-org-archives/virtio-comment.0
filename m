Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A31AF0DF
	for <virtio-comment@lists.linux.dev>; Wed, 16 Oct 2024 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072447; cv=none; b=pKDrcADxkbb7FrwDUhR/vTVCBPnImJUwg1CkCk0YU3TmpM1xjwhdWn7ZpuoUYJBBE2rvDVRMBO2Yx09xndlvyappfa5bhJ1IyKK22lMHR5nGwnhZ1WQZTqSbe6pPYvGx9GPzFGLWQyCq4ap8gJLRNqYL2u2UWMv1vhLjUXaG438=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072447; c=relaxed/simple;
	bh=ZVBUThWubmRhWqH3l8/A2h1sClHIgOv+MKvCS/N8LXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iMilwVBy9YavsRFus/l6YGkNSXjfnUT0ZWBa1yV/HYIm+8Jq4nZnYbAu4qzR4h/Z25flPB+wmbfCA1MPc+9mSIDi0yRg1t5kdQfEqLErUDs3jVZE9tP5l8Sh2+XK1ojtDl8EnvrGau331gPFheVvOvLHAmWktanzXXZamifvx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyFSaUD6; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyFSaUD6"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ea0ff74b15so3880744a12.3
        for <virtio-comment@lists.linux.dev>; Wed, 16 Oct 2024 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729072444; x=1729677244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytHYvLov74FsnpSpPDPj0tWiDLA6ZmQKInaXStj+Vno=;
        b=RyFSaUD60OiWYLvacI4bk8IXMMfta72uFEdyClCX7ajngtMbKmvVS1a+bJiBRArqWZ
         kiAqaWhovq09JKP7Dw0Wj1aqVASrona6norgUYGdMv/1xRvsl6dxCTvkoP9u09xYEYbt
         WJBNpHOh+q2QUvGuia2uq5eFNsIFG7KsnNjaNk3vY12+AjN3K4oQij7WDOam2R7u2sfm
         ynfER8nAgRsQUgsq0ev4gNl622nYAyMKwOfY8CJtrLdvJJkIEaSh/kww0JTXvGMu+1iy
         xFm17ZwUbdoE/W33UhTdI3Fp+0F+pkC+wT5Ap+YWoPoWemS5kaDA/ssL0pXiO0Ynnlko
         Ob/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072444; x=1729677244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytHYvLov74FsnpSpPDPj0tWiDLA6ZmQKInaXStj+Vno=;
        b=P2xDZcrSQKuPQUO0ufPATCfm/QFbJa9fEfb3EFGDs5bfRT7gCFJPITqQPoSDGhWEYI
         QEIQ/v+kgyUtWVIfyV+nkOgo7AU52I2cS41jX9CfQzVQOyK6z1Efkp4NAIEkml0fzPDI
         /22pJh6KnmAor4/5tzqROhHzCGX4p/EfdRTP4qpi5gFrft8uRJZMTstSBTMlIBFUj76y
         EG2prjRKN9oaAzQFQj6k4wE/LamPZviqjgeOtVUqp7O4xppDdZfyQs0rCSvDcbD3NgKn
         9vjQF620jKf6ehC8yG36phICPTqmfazUKksJq2A81vERO7CAyINODJXJaSSJ9CIpLhcb
         W4mg==
X-Forwarded-Encrypted: i=1; AJvYcCU3UnXO5Wr1iQMVcqQTrB64mOi5K1iYJgpLBjjwa0sUfc3kD2GiUAhdFq1U+FHIuH7C/u6hSsGr/coLVED3JQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxTnHC3oGlDWl+Nur8uXY7+XhN7TDpZ4iMoHj7L/WxflqkOhF8
	KZRDcpahH9ItGIAOMX28IUPvq7TpAFc8y1cGRQ6vkF8g4kp+raBz
X-Google-Smtp-Source: AGHT+IHdVDRtPs/peZeU1oau5HD4LXFY62LFnaUXJOfaLiODoLLxkuj5kGVVmIEJfs47GGvvlf6G0A==
X-Received: by 2002:a05:6a20:cd92:b0:1d2:e94d:6e6d with SMTP id adf61e73a8af0-1d905f80bdemr4282039637.45.1729072444097;
        Wed, 16 Oct 2024 02:54:04 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6ba33csm2863185a12.17.2024.10.16.02.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:54:03 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	virtio-comment@lists.linux.dev
Subject: Re: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Date: Wed, 16 Oct 2024 17:53:54 +0800
Message-Id: <20241016095354.90313-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <oa3vk2dtqj33rowzehcvxvyb7rmkxb73ilggeicyqy4d5ezml2@frcvynoyxrub>
References: <oa3vk2dtqj33rowzehcvxvyb7rmkxb73ilggeicyqy4d5ezml2@frcvynoyxrub>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Sat, Oct 12, 2024 at 05:36:21PM +0800, Xuewei Niu wrote:
> >> On Mon, Sep 09, 2024 at 04:51:50PM GMT, Xuewei Niu wrote:
> >> >Hi Stefano,
> >> >
> >> >Thanks for your constructive comments and hope you had a nice vacation ;)
> >> >
> >> >I responded to some comments before proceeding to the next version. PTAL!
> >> >
> >> >Thanks,
> >> >Xuewei
> >> >
> >> >> Hi,
> >> >> sorry for the delay, I was on vacation.
> >> >
> >> >> On Tue, Aug 13, 2024 at 04:14:46PM GMT, Xuewei Niu wrote:
> >> >> >This patch brings a new feature, called "multi devices", to the virtio
> >> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and
> >> >> >a
> >> >> >"index" field to the config for the virtio vsock.
> >> >> >
> >> >> >== Motivition ==
> >> >> >
> >> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> >> >> >and guest. Kata Containers, a secure container runtime, leverages the
> >> >> >capability to exchange control data between the shim and the kata-agent.
> >> >> >
> >> >> >Currently, the virtio-vsock only supports one device, resulting in the
> >> >> >following limitations:
> >> >> >
> >> >> >* Poor performance isolation: All vsock connections share the same
> >> >> >virtqueue. By the way, although multi-queues can solve this problem, they
> >> >> >do not conflict.
> >> >> >* Cannot enable more than one backend: Virtio-vsock, vhost-vsock, and
> >> >> >vhost-user-vsock cannot be enabled simultaneously on the transport.
> >> >> >
> >> >> >We’d like to transfer networking data, based on TSI (Transparent Socket
> >> >> >Impersonation) technique, over vsock via the vhost-user protocol to reduce
> >> >> >overhead. However, by default, the vsock device is occupied by the
> >> >> >kata-agent, a control component for Kata Containers.
> >> >> >
> >> >> >== Typical Usages ==
> >> >> >
> >> >> >Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> >> >> >respectively. And the device with CID 3 is default.
> >> >> >
> >> >> >==== Guest -> Host ====
> >> >> >
> >> >> >Use the device with CID 3.
> >> >> >
> >> >> >```c
> >> >> >fd = socket(AF_VSOCK);
> >> >> >bind(fd, 3, -1);
> >> >> >connect(fd, 2, 1234);
> >> >> >n = write(fd, buffer);
> >> >> >
> >> >> >// or use default (no bind)
> >> >> >fd = socket(AF_VSOCK);
> >> >> >connect(fd, 2, 1234);
> >> >> >n = write(fd, buffer);
> >> >> >```
> >> >> >
> >> >> >Use the device with CID 4.
> >> >> >
> >> >> >```c
> >> >> >fd = socket(AF_VSOCK);
> >> >> >bind(fd, 4, -1);
> >> >> >connect(fd, 2, 1234);
> >> >> >n = write(fd, buffer);
> >> >> >```
> >> >> >
> >> >> >==== Host -> Guest ====
> >> >> >
> >> >> >The usage is no changes in this case. Send to device with CID 3.
> >> >> >
> >> >> >```c
> >> >> >fd = socket(AF_VSOCK);
> >> >> >connect(fd, 3, 1234);
> >> >> >n = write(fd, buffer);
> >> >> >```
> >> >> >
> >> >> >Send to device with CID 4.
> >> >> >
> >> >> >```c
> >> >> >fd = socket(AF_VSOCK);
> >> >> >connect(fd, 4, 1234);
> >> >> >n = write(fd, buffer);
> >> >> >```
> >> >> >
> >> >> >I've pushed a version of code for the implementation of multi devices to
> >> >> >lkml [1].
> >> >> >
> >> >> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> >> >> >
> >> >> >Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> >> >>
> >> >> mmm, why there is my S-o-b here?
> >> >
> >> >Lol. I've replaced some of descriptions with your version. So should I keep this s-o-b?
> >>
> >> Commonly S-o-b is to be put only if the person concerned specifies you
> >> to put it. In this case it's your work, I just made suggestions and you
> >> don't need to put my S-o-b ;-)
> >
> >Okay. Will update.
> >
> >> >
> >> >> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >> >> >---
> >> >> > device-types/vsock/description.tex | 45 ++++++++++++++++++++++++++++--
> >> >> > 1 file changed, 43 insertions(+), 2 deletions(-)
> >> >> >
> >> >> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> >> >> >index 7d91d15..5a10ae1 100644
> >> >> >--- a/device-types/vsock/description.tex
> >> >> >+++ b/device-types/vsock/description.tex
> >> >> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> >> >> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> >> >> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> >> >> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> >> >> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
> >> >>
> >> >> I'd follow the the other features with something like:
> >> >> "\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are supported."
> >> >>
> >> >> > \end{description}
> >> >> >
> >> >> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >> >> >@@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> >> > \begin{lstlisting}
> >> >> > struct virtio_vsock_config {
> >> >> > 	le64 guest_cid;
> >> >> >+	le16 index;
> >> >> > };
> >> >> > \end{lstlisting}
> >> >> >
> >> >> >@@ -77,11 +79,41 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> >> > \hline
> >> >> > \end{tabular}
> >> >> >
> >> >> >+The \field{index} field indicates index of a device, and is required for
> >> >> >+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> >> >>
> >> >> what about "when the VIRTIO_VSOCK_F_MULTI_DEVICES feature is negotiated" ?
> >> >>
> >> >> >+negotiated. The size of the \field{index} is 16 bits which supports up to
> >> >> >+65,536 devices.
> >> >>
> >> >> What about "The \field{index} is 16 bits in size, enabling support for
> >> >> up to 65,536 devices."
> >> >
> >> >I'll update in v5.
> >> >
> >> >> >+The device with the lowest index is considered as the default device. There
> >> >> >+was only one device before the multi-device feature was supported. When the
> >> >> >+multi-device feature is enabled (VIRTIO_VSOCK_F_MULTI_DEVICES has been
> >> >> >+negotiated), the default device can be thought of as the device. It is used
> >> >> >+to maintain compatibility with applications that are not yet ready to
> >> >> >+support this feature.
> >> >>
> >> >> IMHO this part is not very clear.
> >> >> I would try to explain what index is only for when
> >> >> VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, something like that:
> >> >>
> >> >>    If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the index of multiple
> >> >>    devices managed by the driver is used by the driver to choose the
> >> >>    default device when the source socket is not bound to any CID. In this
> >> >>    case, the driver uses the device with the lowest index as the default.
> >> >>
> >> >> I'm not sure if we need to add a specific paragraph to explain that
> >> >> part better.
> >> >
> >> >I'd like to tell the users that what will happen if they don't update their
> >> >vsock apps. But your version is more concise and clear.
> >> >
> >> >I think we don't need to do that, since we'll elaborate the details about
> >> >the default device in the "Device Operation: Receive and Transmit".
> >> >
> >> >Wdyt?
> >>
> >> Okay, let's try, I'll check the final result.
> >>
> >> >
> >> >> >+
> >> >> >+\devicenormative{\subsubsection}{Device configuration layout}{Device
> >> >> >Types / Socket Device / Device configuration layout}
> >> >> >+
> >> >> >+The \field{index}es don't have to be continuous. For instance, three
> >> >> >+devices with \field{index} 1, 2 and 5 respectively are acceptable.
> >> >> >+
> >> >> >+The \field{index}es cannot have conflicts. For instance, three devices with
> >> >> >+\field{index} 1, 1 and 5 respectively are prohibited.
> >> >>
> >> >> A normative section should use SHOULD, MAY, MUST. Please take a look at
> >> >> the other normative sections.
> >> >>
> >> >> Should we add a line here in the normative section to specify that the
> >> >> driver must use the device with the lowest index as the default?
> >> >
> >> >I will update it as follows in v5.
> >> >
> >> >```
> >> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >> >
> >> >The device MAY make \field{index}es discontinuous.
> >> >
> >> >The device MUST use a different \field{index}.
> >>
> >> I think in both we need to talk about multiple devices, not the single
> >> device.
> >
> >Yes, I think I am talking about multiple devices. I'd like to point out that the
> >indexes must be unique but could be discontinuous.
> >
> >What about the following?
> >
> >```
> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >
> >The device MUST offer a unique \field{index}. The \field{index}es among all
> >devices MAY be discontinuous.
> >```
> 
> I think we should emphasize that this is only true when 
> VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated. Also we should better say 
> what we mean by unique, i.e., that index can be assigned to one device 
> when there are more than one.
> 
> Thanks,
> Stefano

I updated it with emphasizing the condition of VIRTIO_VSOCK_F_MULTI_DEVICES
and the meaning of "unique", as follows:

```
The device MUST offer an \field{index}, which MUST NOT be same with the
\field{index} of other devices, when VIRTIO_VSOCK_F_MULTI_DEVICES is
negotiated.

The device SHOULD NOT offer an \field{index} when
VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated.
```

Does this look good to you?

Thanks,
Xuewei

> >
> >> >
> >> >\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >> >
> >> >The driver MUST use the device with the lowest index as the default.
> >>
> >> IMHO "default" here is not clear, so something like, “as default device
> >> for outgoing connections”
> >
> >Will update.
> >
> >> Thanks,
> >> Stefano
> >>
> >> >```
> >> >
> >> >Looks good to you?
> >> >
> >> >> >+
> >> >> > \subsection{Device Initialization}\label{sec:Device Types / Socket
> >> >> > Device / Device Initialization}
> >> >> >
> >> >> > \begin{enumerate}
> >> >> > \item The guest's cid is read from \field{guest_cid}.
> >> >> >
> >> >> >+\item Check for multi devices support:
> >> >> >+\begin{itemize}
> >> >> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
> >> >> >+    the device's index will be read from \field{index}, and the driver will
> >> >> >+    allow multi devices.
> >> >> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated, the
> >> >> >+    device's index will be ignored, and the driver will deny the 
> >> >> >second and
> >> >> >+    subsequent devices.
> >> >> >+\end{itemize}
> >> >> >+
> >> >> > \item Buffers are added to the event virtqueue to receive events from the device.
> >> >> >
> >> >> > \item Buffers are added to the rx virtqueue to start receiving packets.
> >> >> >@@ -167,6 +199,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> >> >> > consists of a (cid, port number) tuple. The header fields used for this are
> >> >> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> >> >> >
> >> >> >+When the driver supports multiple devices (feature
> >> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting socket is not
> >> >>
> >> >> s/transmitting/source
> >> >
> >> >I'll update in v5.
> >> >
> >> >> >+bound to any specific address, then \field{src_cid} should be assigned with
> >> >> >+the CID of the default device.
> >> >> >+
> >> >> > Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> >> >> > for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for
> >> >> > seqpacket socket types.
> >> >> >
> >> >> >@@ -233,8 +270,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> >> >> >
> >> >> > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> >> >> >
> >> >> >-The \field{guest_cid} configuration field MUST be used as the source CID when
> >> >> >-sending outgoing packets.
> >> >> >+The \field{guest_cid} configuration field of one device MUST be used as the
> >> >> >+source CID when sending outgoing packets. When the
> >> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature is not negotiated, there is only one
> >> >> >+device. When this feature has been negotiated, either use the
> >> >> >+\field{guest_cid} of the device specified by the user, or use that of the
> >> >> >+default device.
> >> >>
> >> >> We can skip the one device part, I would rephrase it to something like this:
> >> >>
> >> >> The \field{guest_cid} configuration field MUST be used as the source CID when
> >> >> sending outgoing packets.
> >> >> When the VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
> >> >> MUST be one of the \field{guest_cid} configuration field of the multiple
> >> >> devices handled by the driver.
> >> >
> >> >I'll update in v5.
> >> >
> >> >> Thanks,
> >> >> Stefano
> >> >>
> >> >> >
> >> >> > A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> >> >> > unknown \field{type} value.
> >> >> >--
> >> >> >2.34.1
> >> >> >
> >> >
> >
> >Regards,
> >Xuewei
> >
