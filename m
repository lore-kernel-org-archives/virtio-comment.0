Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D0E32C8B
	for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742958011; cv=none; b=FqtGyXfwJntQlQEfAPOvm19CsJAouCUHWeVgJn1P0DKCg6UM9ax2VryYcFYCBWtosA4OlJaFJlh0Y5a94tf9hf8dQJ8r9qg0J7sFqsXcPZAtsBQ2LIO3xdlTVXa6Qe/8erU/toJDdgSrZ6/k1iUXauCFP+YyzJJpBldRKYjV4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742958011; c=relaxed/simple;
	bh=jThaFqpxh6n3H99LnsjneRbxudaY5R8WF8zltjv9vxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFNv91iTYOZaSDN0bPa8PmkgHyi/aUJuJub76CKF0dhgoVUumZV2tdzUce1z1lzLyVHZM5Hzb/OKZUeTzo6LoMaQTmzCAfCRmGbbCqzcBKvAPXHB1mtTTt/begMaPB/4rlKvJJtraqxqL/g0ANuEXct9OrKrOdZ2nH52bnb5eTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt5aeZO0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt5aeZO0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22409077c06so140156755ad.1
        for <virtio-comment@lists.linux.dev>; Tue, 25 Mar 2025 20:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742958008; x=1743562808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hp3qXQoGgV38cJOCwy8DoP98vs60YbQHhFic2/GshXw=;
        b=Gt5aeZO0JTkVrkNnYmTnffMapf8SbdHp50UCyxnlIM3eSreyMejYJy9jzBQ9CMJTZm
         4I84a03W41DmbnUXR4BgoOMdMv/zX3f08+65TtQGHJG29iIn0USb7mJOxIHZcsMPrkXJ
         JoabRQLLjOgNEZ8mBdF5kGR49jlloDAHZJRYIrNyg3CUcauPcryMXCok9zYKzfgJlqMZ
         iCPLYZdthfYRmTPNOR3AZbEPTvIsbRT2e4JvmxJQ01N12pEzDEr8Gn9P73hPGkGNsslL
         2f0gfCJd/J/UGn5Pj99jU3rvrkKQ3Yrbb0szYim+Cug7wsSJjnSCk1prxWtPW3hDEdew
         10Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742958008; x=1743562808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hp3qXQoGgV38cJOCwy8DoP98vs60YbQHhFic2/GshXw=;
        b=l4okz8nOGJy8JWZ6lB50bMOh9u74XkFnu+KDl5MAjhmxOz3ud3WU+VHLhnGAsRMD3q
         AmBa93KWGOGlc6v1RSiapx9qWYQXDSQ8EgjLGOFkiohePUPV1vgR8/KyAppSoKBg5RKI
         JEvN+KfRJMcO+9ND2U8+NIJoQ2Ps6xCpidG8PLIcJG33V+PWyBT3FfO8e5tNpj5w3k4y
         bVlY9vtbZ2Tp0Xgb7zhCgyqYD1fWgmAzMmnustUR6z3ZId6aiUpTfMRSeFwmc/+VQ4gP
         vUGVN4AW09ZdHCYXVkjAKkj1vET9sfZkQ25YddbuAF6Eg0wzZEX5ccxluiiLrjWkGfJd
         PN5g==
X-Forwarded-Encrypted: i=1; AJvYcCURhN2chtb7ybFh1+09xVDQEaZEppASIk7eeshx9cTf6Rt1LvfDyxTcGeATPTaB0daF1GSYRwuMhkpXStw5FQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9EcK3nKMtvw8DNiuZ5beHRjzcNC173ZdEL6Rc+M5SWPK5Gb2r
	h2YZ39xPBHJSqj8yNyhdts/hbqSfNOdFBEsjTscaT06JsAaVM4Fs
X-Gm-Gg: ASbGncuxen+kdQ4IA3XMVxeLWW1jAKz34ADmgz9Chl1906GjuUfMWqbmKWHMVx6QnAy
	6RQICdmA1YGSMvMyVSf9bPCS3/LNkImz3h7I0cIMYg5VezmBYZq1bqjG2RSZfAv+9r/4j2aEK4P
	oICM9E9kkLWenHHyL66fcXJfxm2XhWAfgGH/IZ74OTquCEvDqLlv1Vv4iNaCw9ngUTZ+IPuaP3E
	Er7NQ4QfL1JfFoWfGAbiWqD2JaFHmb3740sCV3M73oPt1PGKtboplj3Gb0RUvBiT78iVa8ueOW3
	YKSSc9rvlCKLIdfnc4rqfO4ekr5jtezEpqPE8naG15/KuKv1MvY0c6v9R3iatKGhWB4=
X-Google-Smtp-Source: AGHT+IHc6zFLG+pDMLddKm7subdww0VCmbGEmpYMyxtBNlv+N1Zb7PsjT/vYxKmAhjVasdvn0g8wPw==
X-Received: by 2002:a05:6a20:a126:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-1fe42f35a89mr34779032637.13.1742958008321;
        Tue, 25 Mar 2025 20:00:08 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa92dfsm10939285b3a.5.2025.03.25.20.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 20:00:07 -0700 (PDT)
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
Date: Wed, 26 Mar 2025 10:59:52 +0800
Message-Id: <20250326025952.2027968-1-niuxuewei.nxw@antgroup.com>
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
> 
> > and another to a user process via vhost-user-vsock.
> 
> So to recap, one device would be used only to communicate with the VMM, 
> and the other device to communicate with other external processes, 
> right?
> 
> Do you have any other use cases?
> 
> >
> >Apart from that, a side gain is that theoretically the performance might be
> >improved since each device has its own queue. But it varies depending on
> >the implementation.
> 
> This though might be easier to implement supported multi-queue in the 
> device, instead of adding n devices to the VM.

How to specify virtqueue for a connection?

For example, I have a higher priority connection, and some of lower
connections. How to route the higher one to vq0 group (including tx and
rx), and route the lower to vq1?

I think it could be easier to be achieved with multi-device feature.

Thanks,
Xuewei

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
> 
> Thanks,
> Stefano
> 
> >+one. If more than one device is present, the driver SHOULD use the default
> >+device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
> >+the \field{guest_cid} of the only available device.
> >
> > A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> > unknown \field{type} value.
> >-- 
> >2.34.1
