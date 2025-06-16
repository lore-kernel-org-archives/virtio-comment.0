Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA452163B2
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061914; cv=none; b=IRyODvu7ODcVzLYLj61VAWgD+ibcehBF9PE5jl4qoYY2ee6aumD/c6Z/o+5EllxwqIK1GiI2hyBlenGPE0r71NVja/hJj+CwHN9YhhbGWPGUv1aGEOc55yIihRO3nPwAvLEEqatbQRX5SXPKte8U6AyYjws7Ek1A9QIMonQOqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061914; c=relaxed/simple;
	bh=E0pPB7hRih/44q9dBujcXmW+DjXfotNbCQzevHAdB6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uiXe/t6IQtWaXu1uTzciQK2eHcXg0iLnCuQL/AXs/4gcUaXsuPsCtNBEg+gonipr7X0QennSddwiLHqYdPeDcZhCes+O1rmlUKeRWywO4uSvePWiEbP7jKWZmbZdeGOb5vU8DT07MNPBPkvbWwwSg+//F7WqgLibGaAUwdrNIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O99WrUGo; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O99WrUGo"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c49373c15so3113706a12.3
        for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 01:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750061912; x=1750666712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIfGkMqnGC0TJslqiUbUxroNzX4DB/Iq5yiX1aGWnS0=;
        b=O99WrUGohR6e/3fT6kxCX4kRZJzUtbVFF9+2ffXG/98Kn1iQGAkYvkLxqDRPoYb2TH
         Trub9E9WEs9816P2bMGJBgywNyaHs3aXKcapeta7xNR9DN9dpvnrlzgvNmCtHtDb7FXL
         fqJDMJSoRZpfx8/qdtHCmlKZX3m/oDw9707zA9wJNUL9BcfdfxvZ5x6PZTvizRrHUkFy
         IbSb91a56pAxKCzWvdibAy2EZsgElsbjfLEWW+qvceYmNml5tEpaxJ+fnw84JOS6QbsL
         RdylW0z/82qmubXSQZq1/vv4g38hMKVIZLj5czhNBrMwC8TBe23jR+OuXbdnYj3u9rTk
         X+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061912; x=1750666712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIfGkMqnGC0TJslqiUbUxroNzX4DB/Iq5yiX1aGWnS0=;
        b=rczyPkFzsNQTmxqcjTEpjpcIt9IdnNwAaggq2RRGDXb/6GseGGg8pC8RY2YhwOS3YT
         n4vkKtZvrIrLpA7GpGLbtQSDPHwn8lQBEvDBHKmK50+GokHReGMgTz3+1NiYdj+rBboG
         X+qw/64monUCRXYio/p+g94lGF2I6cRb8/SLkN1dnHecYypf/UF1Xhbt3LIH133Cqwjg
         Sf9ObA63dooLMPj5CYpnsscACSGKIgOWobP9jvn+soS9HR+udb4uUmY7e/Dt5tfDXVti
         sEHO2BfhTHq7xSHPYrLSA0DoDDlB/bevFPyiEhbt6EiuLLruuSFDdeR2CIFIEbx4wuHs
         8+Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVRgfcJAv6bfmBs8MTzsp2Q9eu8bF+3tEc1gWtO/XX5mYJjvV9tppnWfz2jNqG5InKUXAm/bSvO769Nko/d0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyD/Pj86RF/GfvggBbeKgB1S0+Wp6prde0hdJBGDBgNNbFP8pKN
	Ap4gLRHb+kzCBv10BOsL1Nd8/p4dk+kNWt98qYAFx/weJzf3r+av5Vsn
X-Gm-Gg: ASbGncsm+C7E//QAMFYMdE7fJnIVEQy4BZqM2EaAmjNAR65q01spTfQclREGQ22yJe3
	xEZcnZh8KXRNGhv1rYvWb1Smcj9zxxb/mksEeB+ZtSAQrcPs1UYnIV/8ksXyPSxVUFSRqQ6LBnY
	tqrjvtsqGy4+zRlizCLsHsOk7jdodyqg4Sl/gzrZ6UKry1LVQrYaia0oEZjrXsZDiZ5jFyYbMER
	7P5QKdebwX63xiK2wNxSErmTO2hQP52d2Go8/nqBmS2mYn0ZSrWKKn749BV1ljd0dTQcl6ktlp9
	FJSBZtWukTp/uXFsukFNKcp72XxaUqADxxvmhrw4abdOZK6tilBuhYOpLCNWsAeIxYdKYH3VIdM
	HqhuDJKCu
X-Google-Smtp-Source: AGHT+IGBjXW1NSYRNSFZnfkNtjmPjy0mDEfwtrk4UYDybPGbJ+f6c6c0OVtfTfHXF1AvsrsEdfim1g==
X-Received: by 2002:a05:6a20:ce4a:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-21fbd634aa3mr13078065637.36.1750061911439;
        Mon, 16 Jun 2025 01:18:31 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b37ddsm6330685b3a.134.2025.06.16.01.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 01:18:30 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: parav@nvidia.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Mon, 16 Jun 2025 16:18:20 +0800
Message-Id: <20250616081820.1159352-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB7195DEF6014AD36A46C04971DC76A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB7195DEF6014AD36A46C04971DC76A@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Parav.

Thanks for your detailed comments.

> Hi Xuewei,
> 
> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: Monday, May 19, 2025 3:08 PM
> > 
> > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > This patch brings a new feature, called "multi devices", to the
> > > > virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature
> > > > bit, and a "device_order" field to the config for the virtio vsock.
> > > >
> > > > == Motivition ==
> > > >
> > > > Vsock is a lightweight and widely used data exchange mechanism
> > > > between host and guest. 
> 
> Even though it is the current use, the specification does not prevent its usage between two guests via a host.
> So we should not assume such guest <-> host communication as the only case to add new feature.
> 
> For example, in the spec only must requirement is that src_cid == config.guest_cid.
> Dst_cid can be anything, it need not be well known 0x2 (for the host).

Yes.

> With this flexibility in the spec, one can connect vsock devices with multiple different backends.
> 
> For example,
> QEMU can insert one vsock device for VM to HV communication.

It is also able to communicate with other devices on the same host, i.e.
VM-to-VM.

> A real PCI device can insert one voscket device for VM-to-VM communication bypassing a full TCP/IP stack.

AFAIK, all devices are implemented in software. Is it a real PCI HW device?
 
> This means there are two different backends.
> And these two devices should not be grouped in the use case you described.

I think one group is enough for all use cases. It is required that CIDs are
unique in global, i.e. all backends.

As your example, let me assume there are two VMs

1. VM0 (two vsock backends)
    1.1 device0 (cid=3, default), backend is host kernel (vhost-vsock);
    1.2 device1 (cid=4), backend is HV (virtio-vsock).
2. VM1
    2.1 device2 (cid=5, default), backend is host kernel (vhost-vsock).

The device0 is able to do VM0-HOST (src_cid=3, dst_cid=2) and VM0-VM1
(src_cid=3, dst_cid=5) communicatation, while the device1 is only able to
do VM0-HV (src_cid=4, dst_cid=2) communicatation.

In a word, a tuple identifies a connection.

"Refuse to connect" will be raised if the device1 attempts to connect to
the device2. "They are not in the same group" is a reasonable explaination.
Am I right?

I am not an expert in networking, so please correct me if I
misunderstood.

> So as we discussed sometime ago in thread [1], for the use case that you described, one needs the concept of a virtio device group.
> I urge you to include such basic construct to the spec, without which the group of multiple devices seems broken beginning.
> 
> I also highlighted additional use cases at [2] that will also benefit from same feature.
> And introducing generic feature is more valuable when useful to multiple device types.
> 
> [1] https://lore.kernel.org/virtio-comment/20250217071804.296893-1-niuxuewei.nxw@antgroup.com/
> [2] https://lore.kernel.org/virtio-comment/CY8PR12MB7195FD1684735ECB8D950F6FDCFB2@CY8PR12MB7195.namprd12.prod.outlook.com/
> 
> Can you please`consider revising the proposal to be more complete?

Sure thing. I'll update this part once we reach an agreement.

> And I also fully agree to Stefano suggestion to drop discussing multi-queue performance aspect here as its not related at all.
> You are addressing device selection functionality and grouping multiple devices, which cannot be solved by multi-queue.
> (unless you bring the concept of CID to queue binding).

Yes. I'll remove them in the next.

Thanks,
Xuewei

> > Currently, the virtio-vsock only supports
> > > > one device, resulting in the inability to enable more than one
> > > > backend. For instance, two devices are required: one to transfer
> > > > data to the VMM via virtio-vsock, and another to a user process via vhost-
> > user-vsock.
> > > >
> > > > Apart from that, a side gain is that theoretically the performance
> > > > might be improved since each device has its own queue. But it varies
> > > > depending on the implementation.
> > > >
> > > > == Typical Usages ==
> > > >
> > > > Assuming there are two virtio-vsock devices on the guest, with CIDs
> > > > 3 and 4 respectively. And the device with CID 3 is default.
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
> > > > [1]
> > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flo
> > > > re.kernel.org%2Fvirtualization%2F20240517144607.2595798-1-
> > niuxuewei.
> > > >
> > nxw%40antgroup.com&data=05%7C02%7Cparav%40nvidia.com%7Cb912ba8
> > a049a4
> > > >
> > 6ed8d7808dd96b8d125%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0
> > %7C638
> > > >
> > 832442724462145%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
> > dWUsIlYi
> > > >
> > OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%
> > 7C0
> > > >
> > %7C%7C%7C&sdata=AarOvDq9a3Djl7bCH2vsHGlKfEmHtvcXQGOGvXetNGo%3
> > D&reser
> > > > ved=0
> > > >
> > > > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > > > ---
> > > >  device-types/vsock/description.tex | 30
> > > > ++++++++++++++++++++++++++++--
> > > >  1 file changed, 28 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/device-types/vsock/description.tex
> > > > b/device-types/vsock/description.tex
> > > > index 7d91d15..392dc76 100644
> > > > --- a/device-types/vsock/description.tex
> > > > +++ b/device-types/vsock/description.tex
> > > > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types /
> > > > Socket Device / Feature bits}  \item[VIRTIO_VSOCK_F_STREAM (0)]
> > stream socket type is supported.
> > > >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is
> > supported.
> > > >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is
> > not implied.
> > > > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is
> > supported.
> > > >  \end{description}
> > > >
> > > >  \drivernormative{\subsubsection}{Feature bits}{Device Types /
> > > > Socket Device / Feature bits} @@ -34,6 +35,12 @@ \subsection{Feature
> > > > bits}\label{sec:Device Types / Socket Device / Feature bits}
> > > > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> > VIRTIO_VSOCK_F_STREAM has also been negotiated.
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
> > - If the first device has negotiated the multi-devices feature, then the driver
> > considers the multi-devices feature as enabled. Then, the driver will ignore
> > all devices that do not negotiate the feature.
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
> > device present in the guest: if the first device has negotiated the feature, the
> > driver enables it and ignores any devices that have not; if the first device has
> > not negotiated the feature, the driver treats the feature as disabled and
> > ignores any subsequent devices.
> > 
> > Does this look better to you?
> > 
> > > >  \devicenormative{\subsubsection}{Feature bits}{Device Types /
> > > > Socket Device / Feature bits}
> > > >
> > > >  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
> > feature.
> > > > @@ -52,6 +59,7 @@ \subsection{Device configuration
> > > > layout}\label{sec:Device Types / Socket Device  \begin{lstlisting}
> > > > struct virtio_vsock_config {
> > > >  	le64 guest_cid;
> > > > +	le16 device_order;
> > > >  };
> > > >  \end{lstlisting}
> > > >
> > > > @@ -77,11 +85,27 @@ \subsection{Device configuration
> > > > layout}\label{sec:Device Types / Socket Device  \hline
> > > > \end{tabular}
> > > >
> > > > +The \field{device_order} is used to identify the default device.
> > >
> > > no explanation what is the default device.
> > > is it just for the cid?
> > 
> > Yes.
> > 
> > It is allowed to not specify the local CID for a socket. In this case, the driver
> > will use the default device's CID as the local CID for the socket.
> > 
> > The details are listed in the "Receive and Transmit" section, where you left a
> > comment.
> > 
> > > > Up to
> > > > +65,535 devices can be supported due to the size.
> > >
> > > can be -> are
> > > drop "due to the size".
> > 
> > Will do in the next version.
> > 
> > > > +\devicenormative{\subsubsection}{Device configuration
> > > > +layout}{Device Types / Socket Device / Device configuration layout}
> > > > +
> > > > +The device MUST provide a distinct \field{device_order} if
> > > > +VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
> > >
> > > distinct to what?
> > 
> > In the scope of the guest VM, the device_order should be unique. This
> > means that the device_order should be distinct for each device.
> > 
> > > > +\drivernormative{\subsubsection}{Device configuration
> > > > +layout}{Device Types / Socket Device / Device configuration layout}
> > > > +
> > > > +The driver MUST treat the device with the lowest
> > > > +\field{device_order} as the default device.
> > > > +
> > > >  \subsection{Device Initialization}\label{sec:Device Types / Socket
> > > > Device / Device Initialization}
> > > >
> > > >  \begin{enumerate}
> > > >  \item The guest's cid is read from \field{guest_cid}.
> > > >
> > > > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the
> > > > +device's order will be read from \field{device_order}.
> > > > +
> > > >  \item Buffers are added to the event virtqueue to receive events from
> > the device.
> > > >
> > > >  \item Buffers are added to the rx virtqueue to start receiving packets.
> > > > @@ -233,8 +257,10 @@ \subsubsection{Receive and
> > > > Transmit}\label{sec:Device Types / Socket Device / De
> > > >
> > > >  \drivernormative{\paragraph}{Device Operation: Receive and
> > > > Transmit}{Device Types / Socket Device / Device Operation / Receive
> > > > and Transmit}
> > > >
> > > > -The \field{guest_cid} configuration field MUST be used as the
> > > > source CID when -sending outgoing packets.
> > > > +If the source socket is not bound to any source CID, the driver
> > > > +MUST assign one. If more than one device is present, the driver
> > > > +SHOULD use the default device's \field{guest_cid} configuration.
> > > > +Otherwise, the driver SHOULD use the \field{guest_cid} of the only
> > available device.
> > >
> > > why did you drop requirement about outgoing packets?
> > 
> > The driver prefers to use the CID provided by the user. That is, if the user
> > binds to a source CID, the driver will use it and does not need to do anything.
> > If not, the driver will use one from the configuration.
> > 
> > Thanks,
> > Xuewei
> > 
> > > >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received
> > > > with an  unknown \field{type} value.
> > > > --
> > > > 2.34.1
