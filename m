Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F5F1411CA
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 13:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235845; cv=none; b=DvaaGHv6xONeoXqfCIdnnkrasu0DIZ2ujPKD10kKJVB0fz2sciry3d/38MGXfj4Zm0uWRswIQIZHPxyE7qO+v/733/g5zUKnAFctyZ0cEfWi6qfe35WKbgoMvOioq7Bh0sWDLD5lmA4uWEA0q6bFy1e2MSk01mwK28IoTAQsA4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235845; c=relaxed/simple;
	bh=2r2fOaKAqxDJ3I6Ocnxr4WERGhUCvE5BcRumCiGZ5k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WRvHC2fNIiKRVlwMtIVXC+Cnuv4SncGyE7rhWMZa5rpdyEfuHCIU/Ma45ZiEdC/BODqwHgcVUkp+BPwxDqguIlNwE61uQ2jCRo7tFVX+qrV3jugObTXl0V0G0C6bx+c3s3QSNsDv/bxY2rgHQLh+N+3rQEZGbGZx6AbBkr5/gSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bwKV9OHG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bwKV9OHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719235841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrLnpZt7pnrbrPhrkpCmMqd4/nSV8zQPJULOP/TmprE=;
	b=bwKV9OHG+hiRRuayLYAyDFL+mabV9Ei2QeL2inCIdULpctYn9LNTtlhDljpSkCAp4F4jbj
	/8e6NPfK1cc8nSh7UBdKPcqZw5HhkFLzbXp8MZklLJY60/pv3+ElDZZ7ktg1GHJ4Iq7Gvx
	S0qudlZmmHv1E/hLjElAHA23DFUZKbo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-nJcKo01-NeGgT6Avcwfopg-1; Mon, 24 Jun 2024 09:30:40 -0400
X-MC-Unique: nJcKo01-NeGgT6Avcwfopg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a724d8c38d3so61881366b.2
        for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 06:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719235838; x=1719840638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrLnpZt7pnrbrPhrkpCmMqd4/nSV8zQPJULOP/TmprE=;
        b=ZcPBey4r9L8CTbCmxXrK4cGgx2lE4tXplTmgSkwEf7q+62FAZugvS4Xqy+/vhyUtKb
         hG4g0sRIfja5FynTCBBBnYqWU0F5+dbvjSAEecbwPmMlo6aYuFrXpm/xIjPgqTp7KLhI
         j2mDvQDb/Of+SgQbKozjyfHLmi/NTX3fMBkJuI8v07XSYWS2K3TVHADLnX/30FAVNVwp
         GHurt/dIl3pgH7yMqEIVO1xMxWGkjTSnmlEe8sqTaBuKmOrqLabti2Xe+aBcJOzV6w48
         /IqHO/G3Q6j1i9ulvGArcspmL6ej9jeDTceZgZP5/4Ajz+o6SU2H2faOThFYhfG3EMXf
         cLNg==
X-Forwarded-Encrypted: i=1; AJvYcCUuuLH1foAKbEwHm4QGy2HRQcl3YViSV0WKnBiXwOALEZgflNmDnmQVz/GDSkY6hpz5PUgaveWgRjR5rMSJnyeNC5b2sPIDXUUGcZw9Vs0=
X-Gm-Message-State: AOJu0Yw7OC+B4Fr+iQhZFolZSvpXUrgneK1F0NYyyN2wF+JSUjbYjrbj
	gPZ//6rboDXXx5PP/YABMkTE5l91brP1zkKm7aQ2+4QJZQUkTCLkqZw0gFEDb5A7mRiGU1y/z9K
	/bdle5Fe7TzhNSumpOY456FZ4q/KNyyHT/mwxr5G99/ErPDDfuSaEF6Msa4qoJ2mM
X-Received: by 2002:a17:906:350b:b0:a6f:2a43:e956 with SMTP id a640c23a62f3a-a7245c64ea5mr261017066b.74.1719235838426;
        Mon, 24 Jun 2024 06:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlTV2TEqLWoAuEd0zZGB8ewPNMCfd/Ht47FEIFp5USewA2BdDXlFa/JUFD0OznVSBpbp/bnw==
X-Received: by 2002:a17:906:350b:b0:a6f:2a43:e956 with SMTP id a640c23a62f3a-a7245c64ea5mr261014566b.74.1719235837607;
        Mon, 24 Jun 2024 06:30:37 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.216.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7244b709e2sm218646866b.191.2024.06.24.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:30:36 -0700 (PDT)
Date: Mon, 24 Jun 2024 15:30:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, fupan.lfp@antgroup.com, virtio-comment@lists.linux.dev, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [RFC PATCH v3] virtio-vsock: Add support for multi devices
Message-ID: <nlwexda7v2vo7o5c5i3ssrwj4t6vxzny63hgemwotvd7dmf3gm@cmp4jkxf4k6i>
References: <20240617015446.2723779-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240617015446.2723779-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Jun 17, 2024 at 09:54:46AM GMT, Xuewei Niu wrote:
>This patch brings a new feature, called "multi devices", to the virtio
>vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
>"index" field to the config for the virtio vsock.
>
>I've pushed a version of code for the implementation of multi devices to
>lkml [1]. You might also refer to a google doc [2] for multi devices
>details regarding motivation, implementation, use cases, etc.
>
>[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
>[2] https://docs.google.com/document/d/14RUDEesi86EBZigVxxFsjxAl2OslPFplLyXMHiyDgYs/edit?usp=sharing
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
>v2 -> v3:
>- Merge the two commits into one.
>- Add some descriptions regarding the "index" field: the default device and
>  the type.
>- Add some descriptions about how multi devices are initialized in the
>  Device Initialization.
>
>v1 -> v2:
>- Rename the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES".
>- Remove description from the relationship clarification.
>- Remove implementation details from commit message and documentation.
>- Rename the field from `order` to `index`.
>- Rewrite the introduction about the `index` field.
>- Add a case for sending message from the guest.
>---
> device-types/vsock/description.tex | 38 ++++++++++++++++++++++++++++++
> 1 file changed, 38 insertions(+)
>
>diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>index 7d91d15..190f123 100644
>--- a/device-types/vsock/description.tex
>+++ b/device-types/vsock/description.tex
>@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
>+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
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
>@@ -77,11 +79,42 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> \hline
> \end{tabular}
>
>+The \field{index} field indicates index of a device, and is required for
>+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
>+negotiated. The size of the \field{index} is 16 bits which supports up to
>+65,536 devices.
>+
>+The device with the lowest index is considered as the default device. Plus,

Should we explain what "default device" means here?

>+it works fine with hot-plug and hot-unplug. When adding a device at runtime
>+to be the default, assign it the lowest \field{index} without changing the
>+configuration of the previous device.

I'm not sure it's worthwhile here to talk about hot-plug/unplug.

>+
>+The device is responsible for populating the \field{index} field. The rules
>+for \field{index} are:
>+
>+\begin{itemize}
>+\item It doesn't have to be continuous. For instance, three devices with
>+the \field{index} 1, 2 and 5 respectively are acceptable.
>+
>+\item It cannot have conflicts. For instance, three devices with the
>+\field{index} 1, 1 and 5 respectively are prohibited.
>+\end{itemize}

Maybe we should put this second point in a normative section.

>+
> \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
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
>@@ -167,6 +200,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> consists of a (cid, port number) tuple. The header fields used for this are
> \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>
>+In the case of sending packets from the guest to its peer, if the
>+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated and the
>+\field{src_cid} isn't specified, the \field{src_cid} should be set to the

It's unclear here, can you elaborate more on what you mean?
src_cid should always be specified by the guest.

If you want to talk about the bind instead, maybe we should say
something like:
   When the driver supports multiple devices (feature
   VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting
   socket is not bound to any specific address, then src_cid should be
   assigned with the CID of the default device.

Or something like that.

>+CID of default device.
>+
> Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.

On line 234 we have the following normative:

     \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}

     The \field{guest_cid} configuration field MUST be used as the source CID when
     sending outgoing packets.

Should we extend that paragraph to specify what source CID should be
used when VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated?

Should we also considering changes in `struct virtio_vsock_event`?

Thanks,
Stefano

