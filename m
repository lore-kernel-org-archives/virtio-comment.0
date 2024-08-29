Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9D1B86D9
	for <virtio-comment@lists.linux.dev>; Thu, 29 Aug 2024 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935510; cv=none; b=jEAVZDz/w1W489h/P523JI15Kvsld/Yu7V4Sn5KEYifwVArjzPqLZvUM26/AW0n5vO/g757HIool7wbtw8e1L4RGNxIZKv8PZJLN0y8M1udi7fj+Epvc+AwqmUZrdv4iBj0jmHCLP7gcTRP/y099v8QH2j03HXGUTIOUbyu1X1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935510; c=relaxed/simple;
	bh=Nboph9j6sMMUl/V4vkDq1jQwS8EJM5EKyiuKGWo8unM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cUBhpxAfX2saoMnxLuFTY+ZanaiDOBK56kLi8Em2vgmSQHAw/TJ8FAJRwbB07OLPSEVvQ3sLmUi+8Fch4OlvqRnaGuJzTdh0SymPZAC9ls0e+6vf1Yt0yHffob632vfOvdgpEvI7CwsailOBFAJHUKIzyAjUTibrtgUw2wxaorA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d1RAc4AJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1RAc4AJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724935506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUpisIDA4go3ldrEnp5HXp1YKU8acUAWDQ1n3mGvTvY=;
	b=d1RAc4AJkXeGVdc3NefjQOSI78VzseTAC44Dbxq567TxCXBWdCjlxIrGFkGEwIQG64uZGf
	lwx9+1fa/HpI5RlDGl+HCWFSxYZE2w5kd4Taekn8slEkd9rJt5xb/jZ7c0jKNNFQhWcdfC
	YNldHbum3KVlVXWvHE3zNR3KR44Bq3o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-McrbrAqWOmGwTbXnNzOaCg-1; Thu, 29 Aug 2024 08:45:05 -0400
X-MC-Unique: McrbrAqWOmGwTbXnNzOaCg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5becfc1e5cdso451047a12.1
        for <virtio-comment@lists.linux.dev>; Thu, 29 Aug 2024 05:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724935504; x=1725540304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUpisIDA4go3ldrEnp5HXp1YKU8acUAWDQ1n3mGvTvY=;
        b=g1eTsTFU+swq/t7eKhh9u3wOduDVptw6/Z0lL/LKZYuqaYhG8xkr5knf8vaV+Cgy0u
         08N+FE4gVTs6yLSKm3KmJs5/fDcY7oyX2HLqc9hxyaIVSsqsqA2m0zpjcDiwtw0s1coH
         dFcympYSwCmrNJJCI4TJ0+kDzM9Q/QK33guCBzTTExFoarrT0BPBgIDNkYr5mZ8MlJWZ
         nzk4SmHHNd6xmTfqBeF13evFZUKpAbuyzZPSzsA/8cmaT8c2PqmtYegamPKQAxp4+Uf4
         kwLlYi8mdUi2R0a+eWM/++pk34r27xkClvUXuZxqQufp5MuBvXca400VIY+84LRorclb
         X/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWIzmjmSObsg9l4UI+fXIOojoGLlKzag2i5tEd1dL0eS1ur6mj0T1JvhFyGxD8scP06Eka9ppqf9AmnHSabGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb6oZJYihAMmdzTMuf34suJeDJHsLiY3mrvE9J/nfuByQLhWkK
	HVDfaGQknJ7GFMDw2+J/vye3NUDj4KBqdaz17GUvVfoiwuz7PShu8BTitSrlm65hKSiufXuygnA
	dA3/mqQi33uAGAwsqcFNP+IGXwFnWfTygrm8eMDwROv+0V9V2HxOfElkI2XAoRj1B
X-Received: by 2002:a05:6402:358d:b0:5c2:18fd:8a27 with SMTP id 4fb4d7f45d1cf-5c21ed8e59emr2445197a12.25.1724935504090;
        Thu, 29 Aug 2024 05:45:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElP1qWAOYxuS0upiA0VWFq/avaAej+keHo9LL6Paw6yzIyn+k6SA/7HnOdDIR9eNntLA/Z4g==
X-Received: by 2002:a05:6402:358d:b0:5c2:18fd:8a27 with SMTP id 4fb4d7f45d1cf-5c21ed8e59emr2445061a12.25.1724935503215;
        Thu, 29 Aug 2024 05:45:03 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.99.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ce4f47sm672458a12.88.2024.08.29.05.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:45:02 -0700 (PDT)
Date: Thu, 29 Aug 2024 14:44:59 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, fupan.lfp@antgroup.com, virtio-comment@lists.linux.dev, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Message-ID: <r6nrxdgajmzpun3sfqfqtvh3en3r4samuac2o7tczq35geuju4@6nchpg2l2qz7>
References: <20240813081446.2711296-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240813081446.2711296-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,
sorry for the delay, I was on vacation.

On Tue, Aug 13, 2024 at 04:14:46PM GMT, Xuewei Niu wrote:
>This patch brings a new feature, called "multi devices", to the virtio
>vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and 
>a
>"index" field to the config for the virtio vsock.
>
>== Motivition ==
>
>Vsock is a lightweight and widely used data exchange mechanism between host
>and guest. Kata Containers, a secure container runtime, leverages the
>capability to exchange control data between the shim and the kata-agent.
>
>Currently, the virtio-vsock only supports one device, resulting in the
>following limitations:
>
>* Poor performance isolation: All vsock connections share the same
>virtqueue. By the way, although multi-queues can solve this problem, they
>do not conflict.
>* Cannot enable more than one backend: Virtio-vsock, vhost-vsock, and
>vhost-user-vsock cannot be enabled simultaneously on the transport.
>
>We’d like to transfer networking data, based on TSI (Transparent Socket
>Impersonation) technique, over vsock via the vhost-user protocol to reduce
>overhead. However, by default, the vsock device is occupied by the
>kata-agent, a control component for Kata Containers.
>
>== Typical Usages ==
>
>Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
>respectively. And the device with CID 3 is default.
>
>==== Guest -> Host ====
>
>Use the device with CID 3.
>
>```c
>fd = socket(AF_VSOCK);
>bind(fd, 3, -1);
>connect(fd, 2, 1234);
>n = write(fd, buffer);
>
>// or use default (no bind)
>fd = socket(AF_VSOCK);
>connect(fd, 2, 1234);
>n = write(fd, buffer);
>```
>
>Use the device with CID 4.
>
>```c
>fd = socket(AF_VSOCK);
>bind(fd, 4, -1);
>connect(fd, 2, 1234);
>n = write(fd, buffer);
>```
>
>==== Host -> Guest ====
>
>The usage is no changes in this case. Send to device with CID 3.
>
>```c
>fd = socket(AF_VSOCK);
>connect(fd, 3, 1234);
>n = write(fd, buffer);
>```
>
>Send to device with CID 4.
>
>```c
>fd = socket(AF_VSOCK);
>connect(fd, 4, 1234);
>n = write(fd, buffer);
>```
>
>I've pushed a version of code for the implementation of multi devices to
>lkml [1].
>
>[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
>
>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

mmm, why there is my S-o-b here?

>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> device-types/vsock/description.tex | 45 ++++++++++++++++++++++++++++--
> 1 file changed, 43 insertions(+), 2 deletions(-)
>
>diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>index 7d91d15..5a10ae1 100644
>--- a/device-types/vsock/description.tex
>+++ b/device-types/vsock/description.tex
>@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
>+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.

I'd follow the the other features with something like:
"\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are supported."

> \end{description}
>
> \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>@@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> \begin{lstlisting}
> struct virtio_vsock_config {
> 	le64 guest_cid;
>+	le16 index;
> };
> \end{lstlisting}
>
>@@ -77,11 +79,41 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> \hline
> \end{tabular}
>
>+The \field{index} field indicates index of a device, and is required for
>+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been

what about "when the VIRTIO_VSOCK_F_MULTI_DEVICES feature is negotiated" ?

>+negotiated. The size of the \field{index} is 16 bits which supports up to
>+65,536 devices.

What about "The \field{index} is 16 bits in size, enabling support for
up to 65,536 devices."

>+
>+The device with the lowest index is considered as the default device. There
>+was only one device before the multi-device feature was supported. When the
>+multi-device feature is enabled (VIRTIO_VSOCK_F_MULTI_DEVICES has been
>+negotiated), the default device can be thought of as the device. It is used
>+to maintain compatibility with applications that are not yet ready to
>+support this feature.

IMHO this part is not very clear.
I would try to explain what index is only for when 
VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, something like that:

   If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the index of multiple
   devices managed by the driver is used by the driver to choose the
   default device when the source socket is not bound to any CID. In this
   case, the driver uses the device with the lowest index as the default.

I'm not sure if we need to add a specific paragraph to explain that
part better.

>+
>+\devicenormative{\subsubsection}{Device configuration layout}{Device 
>Types / Socket Device / Device configuration layout}
>+
>+The \field{index}es don't have to be continuous. For instance, three
>+devices with \field{index} 1, 2 and 5 respectively are acceptable.
>+
>+The \field{index}es cannot have conflicts. For instance, three devices with
>+\field{index} 1, 1 and 5 respectively are prohibited.

A normative section should use SHOULD, MAY, MUST. Please take a look at
the other normative sections.

Should we add a line here in the normative section to specify that the 
driver must use the device with the lowest index as the default?

>+
> \subsection{Device Initialization}\label{sec:Device Types / Socket 
> Device / Device Initialization}
>
> \begin{enumerate}
> \item The guest's cid is read from \field{guest_cid}.
>
>+\item Check for multi devices support:
>+\begin{itemize}
>+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
>+    the device's index will be read from \field{index}, and the driver will
>+    allow multi devices.
>+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated, the
>+    device's index will be ignored, and the driver will deny the second and
>+    subsequent devices.
>+\end{itemize}
>+
> \item Buffers are added to the event virtqueue to receive events from the device.
>
> \item Buffers are added to the rx virtqueue to start receiving packets.
>@@ -167,6 +199,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> consists of a (cid, port number) tuple. The header fields used for this are
> \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>
>+When the driver supports multiple devices (feature
>+VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting socket is not

s/transmitting/source

>+bound to any specific address, then \field{src_cid} should be assigned with
>+the CID of the default device.
>+
> Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for 
> seqpacket socket types.
>
>@@ -233,8 +270,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
>
> \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>
>-The \field{guest_cid} configuration field MUST be used as the source CID when
>-sending outgoing packets.
>+The \field{guest_cid} configuration field of one device MUST be used as the
>+source CID when sending outgoing packets. When the
>+VIRTIO_VSOCK_F_MULTI_DEVICES feature is not negotiated, there is only one
>+device. When this feature has been negotiated, either use the
>+\field{guest_cid} of the device specified by the user, or use that of the
>+default device.

We can skip the one device part, I would rephrase it to something like this:

The \field{guest_cid} configuration field MUST be used as the source CID when
sending outgoing packets.
When the VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
MUST be one of the \field{guest_cid} configuration field of the multiple
devices handled by the driver.

Thanks,
Stefano

>
> A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> unknown \field{type} value.
>-- 
>2.34.1
>

