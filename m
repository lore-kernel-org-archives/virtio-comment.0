Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B318C33C
	for <virtio-comment@lists.linux.dev>; Thu,  5 Dec 2024 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733380162; cv=none; b=NhzkNQhjR+rmW9g3h4iRS0R4rqFXD82qjZgDTGprH87zSSAOqUi1RTAqgtTzBmtSk6URrFFPOJjbYON/rxh2ol+wr44rkDV/uQhVNtXxNZS8xQRG9Z7dGNInfD9C/upO1aro/SALYbmcXym2wZZA0i7bkfDxFkvo3fWBdqNfU+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733380162; c=relaxed/simple;
	bh=4xxD//DW2IaiP/HHU+usCYpt7f30xyXRlzH5koPBVKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ASzOBfMBiZz7wQ5ERDOxU75vH4SwjG7kGeqDILlxCWEu0JnR1/iSUNCXsJo+T6fwxNi885BM0H48eS1wQnIzz9OFQG1tOnREDq4rLhZsmND/sxykfmanzaajpg0Nuvz+Z1gUGEtuuDn5Y750Fmc9oIxcs+IoprdROfbK8NqWm0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asD+08Gv; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asD+08Gv"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7f71f2b136eso458128a12.1
        for <virtio-comment@lists.linux.dev>; Wed, 04 Dec 2024 22:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733380159; x=1733984959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbHMsoaIQdSKdXE+eH84S+NTvReS7tV9iSrGxxe+ZI0=;
        b=asD+08Gv2QT7RtzrphQ5r4Iwn3CBrPjoRTxAyStEXi+MOw7WSt4m9PaLVGpZxv22f6
         HptYI/4Ad3dL+nF6nRIQIz1/bGWQg+NVWiq5mfp5K8LG+0noZXlr4kQr2OttHb3zLMvs
         qJbjb2ft6+pu0L7Br/E20ZWxHSd+GBxB+e7mKi0NNjKghcbXkDP/sqC0LIXqKKEUXFIe
         slt+G2JM/82ogMj571MjNtv3YGBXc+2ofOuzBBmjxft0Cp0FZp/MUTB8VFKpN5Sd2L8Z
         wHLC0VoiMUbIL6Twc4wfSZxpncbDKumLh4TQ/z5nTP/sEtYq1YkawgNkXdc8K2eM2dOS
         5uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733380159; x=1733984959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbHMsoaIQdSKdXE+eH84S+NTvReS7tV9iSrGxxe+ZI0=;
        b=Tc7WlURx3pMEomk/GosZPdmxRTSYha72ImoV49C1ZfONo9mVinbBG/J6/wvBkVgP1W
         p9HJ7ai//o/qs9eMFs/bycoEt57UlvD7k2p+d/n8zQ6YizCJNgk4vtmxoAnG2zvYGYGO
         TSVVgQCaXjIK9r03dBDP7MBJFHjsL2TnGLJtJWENzBrdFtbqanqV68H7lNQWcosFLgI9
         3KCBJ6hhFJK4g6WKHCQ5Wd8l4CtDrAKl71UaaTlhigHd5pWpoWLQchiQndRKIsUdCM2C
         ZfuPTKVy6sdszUHaF67+lExoFKxPQpWnlb8XOBUO/hI77z/k6fVVJAMHFVnjlEg2AQuI
         4CEg==
X-Forwarded-Encrypted: i=1; AJvYcCW77vjU18bfrrJOl4b9Gsm978uW30FOnAy7g1hvIlYSXQysWBgx2KLxv1vCNywX/V2wnOCiz2TbuUCQY3ff5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfp1NdX6hU0JL/Vu8ZT+/m/TcIL0471HW92PXK4nJfxmLyrNjT
	3DvmXw2cm7DNGTxbhh1kEh6IKX3/bYGj5Z+zb5e5CUnPwhn59Hlw
X-Gm-Gg: ASbGncvqG8ULfKuFpjdeDiFSvNVP40NN2tb577wxZBqPQ8H2zd1ifqcEDuSHFs3jbrv
	XkjC+4H95waRQwW5JViMi6UEF502817U61vR7tz52JfYJRSUnyZuS9dCpH8l6yZzl+tIxRYojTY
	WRYlNdjWR78urxRgvUitHaKo356Y0sZbpWSXhrdaSDnujP5tYRz5+hW7i8+X5YFtDST2/dMydFm
	WoHM1vXSrNcnIoFmfdD6HWKSG+oEDwsYQka6dleHSCWxEKcMIPZyRKScobbK0Qb64+6QP/9
X-Google-Smtp-Source: AGHT+IEnC6+t66tmPOK+E4sUKTJX9fUz1kKChWTB+PcnkIhAv2xb1OF1h/ICKmdOb/I0aD1/Wfh1hg==
X-Received: by 2002:a05:6a21:32a4:b0:1d9:87e3:11f3 with SMTP id adf61e73a8af0-1e1653c5739mr14163336637.23.1733380158462;
        Wed, 04 Dec 2024 22:29:18 -0800 (PST)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29e8fe6sm529525b3a.46.2024.12.04.22.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 22:29:17 -0800 (PST)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: parav@nvidia.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v5] virtio-vsock: Add support for multi devices
Date: Thu,  5 Dec 2024 14:29:08 +0800
Message-Id: <20241205062908.4193685-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB7195365CEC62D25A06F20CA5DC482@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB7195365CEC62D25A06F20CA5DC482@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Parav,

Sorry for the late reply. I was super busy in the past few weeks. I hope
things become more regular from now on.

> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: Thursday, October 24, 2024 12:38 PM
> > 
> > This patch brings a new feature, called "multi devices", to the virtio vsock. It
> > introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a "index"
> > field to the config for the virtio vsock.
> > 
> > == Motivition ==
> > 
> > Vsock is a lightweight and widely used data exchange mechanism between
> > host and guest. Kata Containers, a secure container runtime, leverages the
> > capability to exchange control data between the shim and the kata-agent.
> > 
> > Currently, the virtio-vsock only supports one device, resulting in the following
> > limitations:
> > 
> > * Poor performance isolation: All vsock connections share the same
> > virtqueue. 
> Do you have rough estimates on how much performance is affected (or is poor) due to single queue?
> I am not familiar vsock application space. 
> It is something like 10K socket msg/sec or 10 million socket msg/sec due to single queue?

Yes, but the data shows the performance doesn't grow much. I think we can
skip the performance part for now. Here are reasons:

- The biggest motivition to make us support this feautre is mutli-backends
  support. In the Kata Containers cases, we'd like to use Transparent
  Socket Impersonation (TSI) to use virtio-vsock for data plane. The
  limitation of the single vsock device is quite clear.
- This feature gives vsock device the capability to improve performance.
  Apart from the driver side, optimizations on the VMM side are also
  required. For example, VMM spawns an exclusive thread for each vsock
  device. But we don't have enough time to do that.
- Stefano said that they have a plan to add support multi-virtqueues in the
  feature to enhance the isolation of vsock devices. We are doing the same
  thing, but with different approaches.

> > By the way, although multi-queues can solve this problem, they do
> > not conflict.
> > * Cannot enable more than one backend: Virtio-vsock, vhost-vsock, and
> > vhost-user-vsock cannot be enabled simultaneously on the transport.
> > 
> > We'd like to transfer networking data, based on TSI (Transparent Socket
> > Impersonation) technique, over vsock via the vhost-user protocol to reduce
> > overhead. However, by default, the vsock device is occupied by the kata-
> > agent, a control component for Kata Containers.
> > 
> > == Typical Usages ==
> > 
> > Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> > respectively. And the device with CID 3 is default.
> > 
> > ==== Guest -> Host ====
> > 
> > Use the device with CID 3.
> > 
> > ```c
> > fd = socket(AF_VSOCK);
> > bind(fd, 3, -1);
> > connect(fd, 2, 1234);
> > n = write(fd, buffer);
> > 
> > // or use default (no bind)
> > fd = socket(AF_VSOCK);
> > connect(fd, 2, 1234);
> > n = write(fd, buffer);
> > ```
> > 
> > Use the device with CID 4.
> > 
> > ```c
> > fd = socket(AF_VSOCK);
> > bind(fd, 4, -1);
> > connect(fd, 2, 1234);
> > n = write(fd, buffer);
> > ```
> Above and below example is not using the index that you are introducing in this patch.
> Can you please elaborate?

When we have many vsock devices, we need to know the position of those
devices. The devices are arranged in a (linked) array, see below:

```
[0]: vsock device (cid=4, index=0) <default device>
[1]: vsock device (cid=3, index=1)
```

The index is only used for determining the device position; for data
transmission, `bind`, `connect`, etc., the CID is used.

> If the binding is based on the CID, than why the new index needed?

Think about the case of using the CID to determine the device position. If
we want to change the position, we have to change the CID. If the peer
doesn't realize the change, the connection will be broken. So we have to
decouple the CID and the position, one for data transmission, one for
device management. That is why we need the index.

```
==from==
[0]: vsock device (cid=4, index=0) <default device>
[1]: vsock device (cid=3, index=1)
==to==
[0]: vsock device (cid=3, index=0) <default device>
[1]: vsock device (cid=4, index=1)
```

> Or the example is stale here in commit log?

No. It's up to date.

> 
> ==== Host -> Guest ====
> 
> The usage is no changes in this case. Send to device with CID 3.
> 
> ```c
> fd = socket(AF_VSOCK);
> connect(fd, 3, 1234);
> n = write(fd, buffer);
> ```
> 
> Send to device with CID 4.
> 
> ```c
> fd = socket(AF_VSOCK);
> connect(fd, 4, 1234);
> n = write(fd, buffer);
> ```
> 
> I've pushed a version of code for the implementation of multi devices to lkml
> [1].
> 
> [1]

[..]

> > 
> > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > ---
> >  device-types/vsock/description.tex | 46 ++++++++++++++++++++++++++++--
> >  1 file changed, 44 insertions(+), 2 deletions(-)
> > 
> > diff --git a/device-types/vsock/description.tex b/device-
> > types/vsock/description.tex
> > index 7d91d15..f2e663b 100644
> > --- a/device-types/vsock/description.tex
> > +++ b/device-types/vsock/description.tex
> > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types /
> > Socket Device / Feature bits}  \item[VIRTIO_VSOCK_F_STREAM (0)] stream
> > socket type is supported.
> >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not
> > implied.
> > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are
> > supported.
> An individual device cannot indicate what other devices are supported.
> The question is, when multiple devices are accessible to a single driver, how should driver choose which device to use?
> This is the question that driver needs to solve based on certain information.
> 
> Therefore, the only thing needed in this patch is a feature bit to say, from device point of view is:
> 
> VIRTIO_VSOCK_DEV_INDEX This feature indicates that device configuration space has device index.
> 
> And somehow application chooses which device to use to transport the vq entries.
> 
> Right?

`VIRTIO_VSOCK_F_MULTI_DEVICES` is to let driver know that the device
supports multi-devices feature: read the index field from the config space,
prepare an array to store multiple devices, deny device without the
feature, etc.

IMHO, `VIRTIO_VSOCK_F_MULTI_DEVICES` is better than
`VIRTIO_VSOCK_DEV_INDEX`.

> >  \end{description}
> > 
> >  \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device
> > / Feature bits} @@ -34,6 +35,13 @@ \subsection{Feature
> > bits}\label{sec:Device Types / Socket Device / Feature bits}
> > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> > VIRTIO_VSOCK_F_STREAM has also been negotiated.
> > 
> > +If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been registered,
> > +the driver SHOULD ignore all subsequent devices.
> > +
> At driver level in virtio spec, there is no concept of registered.
> It should be something like
> If the device index is not present, the driver SHOULD pick some default device etc.

"Pick some default device" is not much accurate. When this case happened,
it means multi-devices feature is disabled, then the driver should ignore all
subsequent devices.

Will replace the term "register", see below:

If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been present, the
driver SHOULD ignore all subsequent devices.

> > +If a device with VIRTIO_VSOCK_F_MULTI_DEVICES has been registered, the
> > +driver SHOULD accept other devices only if they expose
> > +VIRTIO_VSOCK_F_MULTI_DEVICES.
> > +
> >  \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket
> > Device / Feature bits}
> > 
> >  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
> > feature.
> > @@ -52,6 +60,7 @@ \subsection{Device configuration
> > layout}\label{sec:Device Types / Socket Device  \begin{lstlisting}  struct
> > virtio_vsock_config {
> >  	le64 guest_cid;
> > +	le16 index;
> >  };
> >  \end{lstlisting}
> > 
> > @@ -77,11 +86,36 @@ \subsection{Device configuration
> > layout}\label{sec:Device Types / Socket Device  \hline  \end{tabular}
> > 
> > +The \field{index} field indicates index of a device, and is required
> > +for each device when VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> > negotiated.
> This is not needed. A driver should be able to make choice on which device to use.

IMHO, this is necessary. It is a rule that DEVICE must provide the index if
it want to enable the multi-devices feature. It's not a rule for the
driver.

BTW, making choice on which device to use by the driver is according to
CID. The index is only used to determine position in the driver's device
list. (This is the same as the previous explanation.)

> > +The \field{index} is 16 bits in size, enabling support for up to 65,536
> > +devices.
> > +
> Bit width is visible, just mentioning maximum device size is good enough.

Will update in the next version.

> > +The source socket is allowed to not be bound to any CID. It is required
> > +for the driver to choose a CID for the socket. If
> > +VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the one and only
> > +device's CID is used. If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated,
> > +the driver uses the default device's. In this case, the driver selects
> > +the device with the lowest index as the default.
> > +
> If socket can choose the CID, why does it need new index?
> Its confusing to see relation of CID and index here.
> Can you please explain?

See "When we have many vsock devices, we...".

> > +\devicenormative{\subsubsection}{Device configuration layout}{Device
> > +Types / Socket Device / Device configuration layout}
> > +
> > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device MUST
> > offer
> > +an \field{index}, which MUST NOT be same with the \field{index} of
> > +other devices.
> > +
> > +When VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the device
> > SHOULD
> > +NOT offer an \field{index}.
> > +
> This should be MUST.

Will update.

> I don't see a need to write this.
> In other words,
> 
> If VIRTIO_VSOCK_F_DEV_INDEX is offered, field index is supported.

This part gives two rules:

- The device MUST not provide the index that has been already used.
- If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device MUST offer
  the index field (if not offered, the driver might read data outside the
  config space, as the sizes are different).

> >  \subsection{Device Initialization}\label{sec:Device Types / Socket Device /
> > Device Initialization}
> > 
> >  \begin{enumerate}
> >  \item The guest's cid is read from \field{guest_cid}.
> > 
> > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the
> > device's
> > +index will be read from \field{index}. If not, the device's index will
> > +be ignored.
> > +
> >  \item Buffers are added to the event virtqueue to receive events from the
> > device.
> > 
> >  \item Buffers are added to the rx virtqueue to start receiving packets.
> > @@ -167,6 +201,10 @@ \subsubsection{Addressing}\label{sec:Device Types
> > / Socket Device / Device Opera  consists of a (cid, port number) tuple. The
> > header fields used for this are  \field{src_cid}, \field{src_port}, \field{dst_cid},
> > and \field{dst_port}.
> > 
> > +If at least one device has negotiated VIRTIO_VSOCK_F_MULTI_DEVICES, and
> > +the source socket is not bound to any CID, then \field{src_cid} should
> > +be set to the default device's CID.
> > +
> >  Currently stream and seqpacket sockets are supported. \field{type} is 1
> > (VIRTIO_VSOCK_TYPE_STREAM)  for stream socket types, and 2
> > (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
> > 
> > @@ -233,8 +271,12 @@ \subsubsection{Receive and
> > Transmit}\label{sec:Device Types / Socket Device / De
> > 
> >  \drivernormative{\paragraph}{Device Operation: Receive and
> > Transmit}{Device Types / Socket Device / Device Operation / Receive and
> > Transmit}
> > 
> > -The \field{guest_cid} configuration field MUST be used as the source CID
> > when -sending outgoing packets.
> > +The \field{guest_cid} configuration field MUST be used as the source
> > +CID when sending outgoing packets.
> > +
> > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
> > MUST be
> > +one of the \field{guest_cid} configuration field of the multiple
> > +devices handled by the driver.
> > 
> If the guest_cid is used to distinguish between devices, why the new field index is needed?
> Can guest_cid be sufficient?

See above "When we have many vsock devices, we..." as well. If something is
not clear or incorrect, please feel free to let me know.

> >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> > unknown \field{type} value.
> > --
> > 2.34.1
> >

Thanks for your comments!

Best Regards,
Xuewei
