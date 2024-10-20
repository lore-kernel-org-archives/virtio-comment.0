Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC72260C
	for <virtio-comment@lists.linux.dev>; Sun, 20 Oct 2024 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413387; cv=none; b=qX87K+XIwsTtPz6yTWFlSnq1CH7inX+sfwDN4u4AiMMeYaopa0AjXjN1O8k597uwBM7EjZmBE8BluhxWPF+VTof0lOHKJEg4k3VXBwA1VxJxebXD8PSsqZiq3p09k23haUSN8nzKFiVFaQIXFobJi8v3mSz/0rS4nsh92D9NFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413387; c=relaxed/simple;
	bh=sglgMT4cJiHr0a0LeUneSlHXffcQmfbySXBTaWllTHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQPdk3DfrIwcdaJgnECmLji8ZgkCa9KfrvUmDiod+B3xb1FYbAhXb/aijCBLgxiBUAtzCoU6LWGw1nvNFfZIv194dT51UgySRm8G6XhPEJTvKZLOF8RD2O/B+moshNeX5JioNhiYeLejNSHuE8C2CqjNu02c1RnJQIf/DN0Fr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKV3m+wb; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKV3m+wb"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so2670098a12.0
        for <virtio-comment@lists.linux.dev>; Sun, 20 Oct 2024 01:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729413384; x=1730018184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8thhe/qSR7n33FjeV7qwXwNLqY1Yz/uvUdWOH7GcH1k=;
        b=DKV3m+wbEBl9kikpx9OiiILmGv/VbkT0Iecsc+FeqvoQIbyKh9bfSWICq0C+yV+DuD
         KIKmx3IQ+xCyG7qa2fDYygrQpt7+qw3N+YbSpCF6PHz3nR7VSMXcFq+VCZFYldygFpq7
         riwOl7109lyThqiN2Jnhxa0eR4wle2rWEJF+RxlDBARWaMIKs8+ptP2U8bjstganC+A+
         JUCYmCwaST24aDZsyWKNRjF9YLYTpQOdjsSOBn5NErskfZaByUrQR+xCh0L5CaX2ruRv
         nBhyh3yF5zT9klqQSJHLwoXIRdrlvUgJIYjfNoRtvNpBN0QIFiJYfY928o/QZyEjyhOz
         iYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729413384; x=1730018184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8thhe/qSR7n33FjeV7qwXwNLqY1Yz/uvUdWOH7GcH1k=;
        b=RjER1/Z40eBCmcbdI6FbjqL3DRLBpODsa86u5xorVfQ7ht3QveSMTi6WHVqIwwv3bE
         EID/ckUh2Tk6167zIEhZIoytCIkqChzHiWUy3L/kM3vvufbCMq3X+BeRDha6gV7WDKXF
         WGhy3kqRcaBZ4yyD7ZY5IYhdzG8FkNjm9DMek65k9FYuhc/09uwUjMsLHC1WWCmz4Vrt
         C7Y40OOH4F2zK9aVDcU+WQVVFxwsf46Iie5azKAln5f3YxmcMJK9osVYcVFQw/ckhyaj
         I1+tsC1Y4n7UezN9bOHnUSdl1isr7PPy3cVy9pDxV7FkOVeFqa80x/wUeKDgce3KCf3s
         l/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVyTzE5z7wH07sPGx0pUezhH8foo3AtM89nn8fGZUebkuC6y6O5Xf0/1vTryix/T1cU4k+OtAdS5Dw1wzPBhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlTGGV0dDReUACJQ+2AohH6UIQY7Od4NcF5nGu0tC3cNl+Ypwa
	2V+cxw00/tkaFtFrzotG+s59pB4PUqxo8CFHQ0f5aB2MFOibr5cU
X-Google-Smtp-Source: AGHT+IH3sQ/TaxkJ9x/270OVPr+TWZezTqlshVHSDv4ymmlhofkkfr47bWd2npIMmxJqi4w/iRXB2w==
X-Received: by 2002:a05:6a21:78d:b0:1d9:697:6a80 with SMTP id adf61e73a8af0-1d92c4a1d16mr12017121637.10.1729413383984;
        Sun, 20 Oct 2024 01:36:23 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1356756sm833433b3a.93.2024.10.20.01.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 01:36:23 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	virtio-comment@lists.linux.dev
Subject: Re: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Date: Sun, 20 Oct 2024 16:36:11 +0800
Message-Id: <20241020083611.598017-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <wo2m5mkxpjx4flwbbyutlhpcdsnvwxn4b73b2fmyrconhfscx6@n45dc4sepcp5>
References: <wo2m5mkxpjx4flwbbyutlhpcdsnvwxn4b73b2fmyrconhfscx6@n45dc4sepcp5>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Wed, Oct 16, 2024 at 05:53:54PM +0800, Xuewei Niu wrote:
> >> On Sat, Oct 12, 2024 at 05:36:21PM +0800, Xuewei Niu wrote:
> >> >> On Mon, Sep 09, 2024 at 04:51:50PM GMT, Xuewei Niu wrote:
> >> >> >Hi Stefano,
> >> >> >
> >> >> >Thanks for your constructive comments and hope you had a nice vacation ;)
> >> >> >
> >> >> >I responded to some comments before proceeding to the next version. PTAL!
> >> >> >
> >> >> >Thanks,
> >> >> >Xuewei
> >> >> >
> >> >> >> Hi,
> >> >> >> sorry for the delay, I was on vacation.
> >> >> >
> >> >> >> On Tue, Aug 13, 2024 at 04:14:46PM GMT, Xuewei Niu wrote:
> >> >> >> >This patch brings a new feature, called "multi devices", to the virtio
> >> >> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and
> >> >> >> >a
> >> >> >> >"index" field to the config for the virtio vsock.
> >> >> >> >
> >> >> >> >== Motivition ==
> >> >> >> >
> >> >> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> >> >> >> >and guest. Kata Containers, a secure container runtime, leverages the
> >> >> >> >capability to exchange control data between the shim and the kata-agent.
> >> >> >> >
> >> >> >> >Currently, the virtio-vsock only supports one device, resulting in the
> >> >> >> >following limitations:
> >> >> >> >
> >> >> >> >* Poor performance isolation: All vsock connections share the same
> >> >> >> >virtqueue. By the way, although multi-queues can solve this problem, they
> >> >> >> >do not conflict.
> >> >> >> >* Cannot enable more than one backend: Virtio-vsock, vhost-vsock, and
> >> >> >> >vhost-user-vsock cannot be enabled simultaneously on the transport.
> >> >> >> >
> >> >> >> >We’d like to transfer networking data, based on TSI (Transparent Socket
> >> >> >> >Impersonation) technique, over vsock via the vhost-user protocol to reduce
> >> >> >> >overhead. However, by default, the vsock device is occupied by the
> >> >> >> >kata-agent, a control component for Kata Containers.
> >> >> >> >
> >> >> >> >== Typical Usages ==
> >> >> >> >
> >> >> >> >Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> >> >> >> >respectively. And the device with CID 3 is default.
> >> >> >> >
> >> >> >> >==== Guest -> Host ====
> >> >> >> >
> >> >> >> >Use the device with CID 3.
> >> >> >> >
> >> >> >> >```c
> >> >> >> >fd = socket(AF_VSOCK);
> >> >> >> >bind(fd, 3, -1);
> >> >> >> >connect(fd, 2, 1234);
> >> >> >> >n = write(fd, buffer);
> >> >> >> >
> >> >> >> >// or use default (no bind)
> >> >> >> >fd = socket(AF_VSOCK);
> >> >> >> >connect(fd, 2, 1234);
> >> >> >> >n = write(fd, buffer);
> >> >> >> >```
> >> >> >> >
> >> >> >> >Use the device with CID 4.
> >> >> >> >
> >> >> >> >```c
> >> >> >> >fd = socket(AF_VSOCK);
> >> >> >> >bind(fd, 4, -1);
> >> >> >> >connect(fd, 2, 1234);
> >> >> >> >n = write(fd, buffer);
> >> >> >> >```
> >> >> >> >
> >> >> >> >==== Host -> Guest ====
> >> >> >> >
> >> >> >> >The usage is no changes in this case. Send to device with CID 3.
> >> >> >> >
> >> >> >> >```c
> >> >> >> >fd = socket(AF_VSOCK);
> >> >> >> >connect(fd, 3, 1234);
> >> >> >> >n = write(fd, buffer);
> >> >> >> >```
> >> >> >> >
> >> >> >> >Send to device with CID 4.
> >> >> >> >
> >> >> >> >```c
> >> >> >> >fd = socket(AF_VSOCK);
> >> >> >> >connect(fd, 4, 1234);
> >> >> >> >n = write(fd, buffer);
> >> >> >> >```
> >> >> >> >
> >> >> >> >I've pushed a version of code for the implementation of multi devices to
> >> >> >> >lkml [1].
> >> >> >> >
> >> >> >> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> >> >> >> >
> >> >> >> >Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> >> >> >>
> >> >> >> mmm, why there is my S-o-b here?
> >> >> >
> >> >> >Lol. I've replaced some of descriptions with your version. So should I keep this s-o-b?
> >> >>
> >> >> Commonly S-o-b is to be put only if the person concerned specifies you
> >> >> to put it. In this case it's your work, I just made suggestions and you
> >> >> don't need to put my S-o-b ;-)
> >> >
> >> >Okay. Will update.
> >> >
> >> >> >
> >> >> >> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >> >> >> >---
> >> >> >> > device-types/vsock/description.tex | 45 ++++++++++++++++++++++++++++--
> >> >> >> > 1 file changed, 43 insertions(+), 2 deletions(-)
> >> >> >> >
> >> >> >> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> >> >> >> >index 7d91d15..5a10ae1 100644
> >> >> >> >--- a/device-types/vsock/description.tex
> >> >> >> >+++ b/device-types/vsock/description.tex
> >> >> >> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> >> >> >> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> >> >> >> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> >> >> >> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> >> >> >> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
> >> >> >>
> >> >> >> I'd follow the the other features with something like:
> >> >> >> "\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are supported."
> >> >> >>
> >> >> >> > \end{description}
> >> >> >> >
> >> >> >> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >> >> >> >@@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> >> >> > \begin{lstlisting}
> >> >> >> > struct virtio_vsock_config {
> >> >> >> > 	le64 guest_cid;
> >> >> >> >+	le16 index;
> >> >> >> > };
> >> >> >> > \end{lstlisting}
> >> >> >> >
> >> >> >> >@@ -77,11 +79,41 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> >> >> > \hline
> >> >> >> > \end{tabular}
> >> >> >> >
> >> >> >> >+The \field{index} field indicates index of a device, and is required for
> >> >> >> >+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> >> >> >>
> >> >> >> what about "when the VIRTIO_VSOCK_F_MULTI_DEVICES feature is negotiated" ?
> >> >> >>
> >> >> >> >+negotiated. The size of the \field{index} is 16 bits which supports up to
> >> >> >> >+65,536 devices.
> >> >> >>
> >> >> >> What about "The \field{index} is 16 bits in size, enabling support for
> >> >> >> up to 65,536 devices."
> >> >> >
> >> >> >I'll update in v5.
> >> >> >
> >> >> >> >+The device with the lowest index is considered as the default device. There
> >> >> >> >+was only one device before the multi-device feature was supported. When the
> >> >> >> >+multi-device feature is enabled (VIRTIO_VSOCK_F_MULTI_DEVICES has been
> >> >> >> >+negotiated), the default device can be thought of as the device. It is used
> >> >> >> >+to maintain compatibility with applications that are not yet ready to
> >> >> >> >+support this feature.
> >> >> >>
> >> >> >> IMHO this part is not very clear.
> >> >> >> I would try to explain what index is only for when
> >> >> >> VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, something like that:
> >> >> >>
> >> >> >>    If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the index of multiple
> >> >> >>    devices managed by the driver is used by the driver to choose the
> >> >> >>    default device when the source socket is not bound to any CID. In this
> >> >> >>    case, the driver uses the device with the lowest index as the default.
> >> >> >>
> >> >> >> I'm not sure if we need to add a specific paragraph to explain that
> >> >> >> part better.
> >> >> >
> >> >> >I'd like to tell the users that what will happen if they don't update their
> >> >> >vsock apps. But your version is more concise and clear.
> >> >> >
> >> >> >I think we don't need to do that, since we'll elaborate the details about
> >> >> >the default device in the "Device Operation: Receive and Transmit".
> >> >> >
> >> >> >Wdyt?
> >> >>
> >> >> Okay, let's try, I'll check the final result.
> >> >>
> >> >> >
> >> >> >> >+
> >> >> >> >+\devicenormative{\subsubsection}{Device configuration layout}{Device
> >> >> >> >Types / Socket Device / Device configuration layout}
> >> >> >> >+
> >> >> >> >+The \field{index}es don't have to be continuous. For instance, three
> >> >> >> >+devices with \field{index} 1, 2 and 5 respectively are acceptable.
> >> >> >> >+
> >> >> >> >+The \field{index}es cannot have conflicts. For instance, three devices with
> >> >> >> >+\field{index} 1, 1 and 5 respectively are prohibited.
> >> >> >>
> >> >> >> A normative section should use SHOULD, MAY, MUST. Please take a look at
> >> >> >> the other normative sections.
> >> >> >>
> >> >> >> Should we add a line here in the normative section to specify that the
> >> >> >> driver must use the device with the lowest index as the default?
> >> >> >
> >> >> >I will update it as follows in v5.
> >> >> >
> >> >> >```
> >> >> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >> >> >
> >> >> >The device MAY make \field{index}es discontinuous.
> >> >> >
> >> >> >The device MUST use a different \field{index}.
> >> >>
> >> >> I think in both we need to talk about multiple devices, not the single
> >> >> device.
> >> >
> >> >Yes, I think I am talking about multiple devices. I'd like to point out that the
> >> >indexes must be unique but could be discontinuous.
> >> >
> >> >What about the following?
> >> >
> >> >```
> >> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >> >
> >> >The device MUST offer a unique \field{index}. The \field{index}es among all
> >> >devices MAY be discontinuous.
> >> >```
> >>
> >> I think we should emphasize that this is only true when
> >> VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated. Also we should better say
> >> what we mean by unique, i.e., that index can be assigned to one device
> >> when there are more than one.
> >>
> >> Thanks,
> >> Stefano
> >
> >I updated it with emphasizing the condition of VIRTIO_VSOCK_F_MULTI_DEVICES
> >and the meaning of "unique", as follows:
> >
> >```
> >The device MUST offer an \field{index}, which MUST NOT be same with the
> >\field{index} of other devices, when VIRTIO_VSOCK_F_MULTI_DEVICES is
> >negotiated.
> 
> I'd put the condition first: When VIRTIO_VSOCK_F_MULTI_DEVICES is
> negotiated ...

Will do.

> Rereading these sentences, though, a doubt occurred to me:
> 
> What if we have multiple devices attached, but some of them have 
> VIRTIO_VSOCK_F_MULTI_DEVICES and some don't?
> 
> I think we should cover this in the spec, but I'm not sure how to handle 
> it. Maybe in this case, since without the feature we don't support, 
> devices that don't have VIRTIO_VSOCK_F_MULTI_DEVICES may be ignored, any 
> other ideas?

Yeah, nice catch here!

It would depend on the frist device:

1. The first device has negotiated VIRTIO_VSOCK_F_MULTI_DEVICES. Then,
ingore the following devices without VIRTIO_VSOCK_F_MULTI_DEVICES.
2. The first device has not negotiated VIRTIO_VSOCK_F_MULTI_DEVICES. Then,
we should consider that the multi-devices feature is disabled, and ignore
any devices that follow.

I don't know if we can unregister a device after it has been registered. If
yes, when a device with the feature enabled comes, for case 2, we could
unregister the first device and ignore devices without
VIRTIO_VSOCK_F_MULTI_DEVICES.

Thanks,
Xuewei

> 
> Thanks,
> Stefano
> >
> >The device SHOULD NOT offer an \field{index} when
> >VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated.
> >```
> >
> >Does this look good to you?
> >
> >Thanks,
> >Xuewei
> >
> >> >
> >> >> >
> >> >> >\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >> >> >
> >> >> >The driver MUST use the device with the lowest index as the default.
> >> >>
> >> >> IMHO "default" here is not clear, so something like, “as default device
> >> >> for outgoing connections”
> >> >
> >> >Will update.
> >> >
> >> >> Thanks,
> >> >> Stefano
> >> >>
> >> >> >```
> >> >> >
> >> >> >Looks good to you?
> >> >> >
> >> >> >> >+
> >> >> >> > \subsection{Device Initialization}\label{sec:Device Types / Socket
> >> >> >> > Device / Device Initialization}
> >> >> >> >
> >> >> >> > \begin{enumerate}
> >> >> >> > \item The guest's cid is read from \field{guest_cid}.
> >> >> >> >
> >> >> >> >+\item Check for multi devices support:
> >> >> >> >+\begin{itemize}
> >> >> >> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
> >> >> >> >+    the device's index will be read from \field{index}, and the driver will
> >> >> >> >+    allow multi devices.
> >> >> >> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't 
> >> >> >> >negotiated, the
> >> >> >> >+    device's index will be ignored, and the driver will deny the
> >> >> >> >second and
> >> >> >> >+    subsequent devices.
> >> >> >> >+\end{itemize}
> >> >> >> >+
> >> >> >> > \item Buffers are added to the event virtqueue to receive events from the device.
> >> >> >> >
> >> >> >> > \item Buffers are added to the rx virtqueue to start receiving packets.
> >> >> >> >@@ -167,6 +199,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> >> >> >> > consists of a (cid, port number) tuple. The header fields used for this are
> >> >> >> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> >> >> >> >
> >> >> >> >+When the driver supports multiple devices (feature
> >> >> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting socket is not
> >> >> >>
> >> >> >> s/transmitting/source
> >> >> >
> >> >> >I'll update in v5.
> >> >> >
> >> >> >> >+bound to any specific address, then \field{src_cid} should be assigned with
> >> >> >> >+the CID of the default device.
> >> >> >> >+
> >> >> >> > Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> >> >> >> > for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for
> >> >> >> > seqpacket socket types.
> >> >> >> >
> >> >> >> >@@ -233,8 +270,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> >> >> >> >
> >> >> >> > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> >> >> >> >
> >> >> >> >-The \field{guest_cid} configuration field MUST be used as the source CID when
> >> >> >> >-sending outgoing packets.
> >> >> >> >+The \field{guest_cid} configuration field of one device MUST be used as the
> >> >> >> >+source CID when sending outgoing packets. When the
> >> >> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature is not negotiated, there is only one
> >> >> >> >+device. When this feature has been negotiated, either use the
> >> >> >> >+\field{guest_cid} of the device specified by the user, or use that of the
> >> >> >> >+default device.
> >> >> >>
> >> >> >> We can skip the one device part, I would rephrase it to something like this:
> >> >> >>
> >> >> >> The \field{guest_cid} configuration field MUST be used as the source CID when
> >> >> >> sending outgoing packets.
> >> >> >> When the VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
> >> >> >> MUST be one of the \field{guest_cid} configuration field of the multiple
> >> >> >> devices handled by the driver.
> >> >> >
> >> >> >I'll update in v5.
> >> >> >
> >> >> >> Thanks,
> >> >> >> Stefano
> >> >> >>
> >> >> >> >
> >> >> >> > A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> >> >> >> > unknown \field{type} value.
> >> >> >> >--
> >> >> >> >2.34.1
> >> >> >> >
> >> >> >
> >> >
> >> >Regards,
> >> >Xuewei
> >> >
> >
