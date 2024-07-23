Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E90D1509AE
	for <virtio-comment@lists.linux.dev>; Tue, 23 Jul 2024 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721741467; cv=none; b=VKvmnUJlK2XtbW3LEqYJmhIHbE0tUIaZQUSgy2n74eOpfWLZDK12CNCjDGKqByIrhtCu3LoxaOVqyTbzY1uVBQBwdOJ5/Dr18HfdJKKn+qchMKrc5NaF8zHtO0Zxl3s2vvWZyhxrSXfkh8qbGVLrDps0aY4MhGiyMLJUBC6rGDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721741467; c=relaxed/simple;
	bh=PQ7z7vgXS6G6x9o3htB1Ww0eNHfXO9pNb7ItmdYGBIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qHN10wZxi8zKOrMNV2i81y4Stusx2D8A/TyOcyK5qIqMOQ2bK1Aa7cFaA+6EcgkfVWXhZSs8D3ap44TXaPPyISzb9Fdnux9cer3WCRTVY4PfQTlpo9V4JA2v/jXG73Y1g90gHIIai98cP56iASBXlEZ5lM77+x51woCMMtu4k/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZKFFklp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZKFFklp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721741463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hkfzEfrlcx6ZHCkbAl0kjDhPqHYBamTpYw/A9IjcFzs=;
	b=PZKFFklpFvQrzzPPOZKQOLi90l0mzrOvR8OWo6KZF6YgtJOodytwyxsQd5vazESPNOhb1W
	+2pIs4PZePOjoMm3HAadw3Kpf5Z4Tv4iQPG9WkV+tt1Fn9ujjHhKSjMxG4kH5rtlUOyPQQ
	mXgNDfx/KQe42y0D6Azx3L3uqtX+Zbw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-NOgOeyvEOpqs-XFg7ittUQ-1; Tue, 23 Jul 2024 09:31:02 -0400
X-MC-Unique: NOgOeyvEOpqs-XFg7ittUQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-426703ac88dso37830635e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 23 Jul 2024 06:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741460; x=1722346260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkfzEfrlcx6ZHCkbAl0kjDhPqHYBamTpYw/A9IjcFzs=;
        b=SD+G2aMT1aoh03gEy5tB4mZXg2lcR4MJU4Joj/6iAKkIKbiASwvbw5lnTsBCmTpqg2
         /C1jR+mHtRL6hxt3Rw07zh+a6ZUxhOy2bN+nnC2mNBn69dNZ59i41ewnyIwZiwQJhwCo
         qYHoIec1X38/KvOmgvTZmnLL6W2TM0Fda1bVHba9eK47WQIFozX3JOYw+fewzOaNry/j
         1H6yDnTg/rOsp3yhkvOxEKdo5uPBlvZKcpT2Up0GrLHHqmhl+QK8dgwkWPpqZNLfaWXn
         G88qj4lityAE+KMjBFRdkA7/3zXKQBVjjjTxbHzhuIDhkaATAbtwDwCBiLafmdXKUWVO
         iYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOIlLPCRl6S5uhuATOz8rnaidGxnKPxrl+EbcsROaZjOJm8gbgVTKNHnVnQCmPmxRapDBx5CRpsfLq97pWPdOccGHxWv3nKurBIrj49gY=
X-Gm-Message-State: AOJu0Ywo52kfjLiU9s4d73p3Uou9+z0CSdyg+CChyCtAVonH4eGpZk7d
	ZZjgFv99is9a2pGmnNYtQHP1sah7ku/YwxjZX5Bhz0sL/tftwBdutgglV4bu/XUNx23IstZMJ1l
	6y9U34PK+lm7h1aCeyXA1GYCitEMJtM3sp4yNmMa+yADc9p1F9jm9C15iRgCDctAtDawlc5mB
X-Received: by 2002:a05:600c:4689:b0:426:591d:adb6 with SMTP id 5b1f17b1804b1-427dc573e73mr60399335e9.35.1721741460288;
        Tue, 23 Jul 2024 06:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvXnFpMkQhRTlQKX8gHkKTasMjHgEkZCdVDoXnmKGGBbdY4pwZei695ALBA9xnAEwoT20W8Q==
X-Received: by 2002:a05:600c:4689:b0:426:591d:adb6 with SMTP id 5b1f17b1804b1-427dc573e73mr60398965e9.35.1721741459315;
        Tue, 23 Jul 2024 06:30:59 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:440:9c9a:ffee:509d:1766:aa7f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a3c09csm201579595e9.9.2024.07.23.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:30:58 -0700 (PDT)
Date: Tue, 23 Jul 2024 09:30:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: sgarzare@redhat.com, fupan.lfp@antgroup.com,
	virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [RFC PATCH v4] virtio-vsock: Add support for multi devices
Message-ID: <20240723092623-mutt-send-email-mst@kernel.org>
References: <20240723130059.3123011-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240723130059.3123011-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2024 at 09:00:59PM +0800, Xuewei Niu wrote:
> This patch brings a new feature, called "multi devices", to the virtio
> vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> "index" field to the config for the virtio vsock.
> 
> I've pushed a version of code for the implementation of multi devices to
> lkml [1]. You might also refer to a google doc [2] for multi devices
> details regarding motivation, implementation, use cases, etc.
> 
> [1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> [2] https://docs.google.com/document/d/14RUDEesi86EBZigVxxFsjxAl2OslPFplLyXMHiyDgYs/edit?usp=sharing
>

I expect to see explanation about motivation and design here, inline.
We can't have a discussion in google docs, and doing this goes against
the TC bylaws.

 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> ---
> v4 -> v3:
> - Add some explanations about the default device.
> - Add a device normative section in the "Device configuration layout",
>   which includes the rules for the "index" field.
> - Revise descriptions of the default src_cid (thanks to Stefano).
> 
> v2 -> v3:
> - Merge the two commits into one.
> - Add some descriptions regarding the "index" field: the default device and
>   the type.
> - Add some descriptions about how multi devices are initialized in the
>   Device Initialization.
> 
> v1 -> v2:
> - Rename the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES".
> - Remove description from the relationship clarification.
> - Remove implementation details from commit message and documentation.
> - Rename the field from `order` to `index`.
> - Rewrite the introduction about the `index` field.
> - Add a case for sending message from the guest.
> ---
>  device-types/vsock/description.tex | 45 ++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> index 7d91d15..5a10ae1 100644
> --- a/device-types/vsock/description.tex
> +++ b/device-types/vsock/description.tex
> @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>  \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
>  \end{description}
>  
>  \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> @@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>  \begin{lstlisting}
>  struct virtio_vsock_config {
>  	le64 guest_cid;
> +	le16 index;
>  };
>  \end{lstlisting}
>  
> @@ -77,11 +79,41 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>  \hline
>  \end{tabular}
>  
> +The \field{index} field indicates index of a device, and is required for
> +each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> +negotiated. The size of the \field{index} is 16 bits which supports up to
> +65,536 devices.
> +
> +The device with the lowest index is considered as the default device. There
> +was only one device before the multi-device feature was supported. When the
> +multi-device feature is enabled (VIRTIO_VSOCK_F_MULTI_DEVICES has been
> +negotiated), the default device can be thought of as the device. It is used
> +to maintain compatibility with applications that are not yet ready to
> +support this feature.
> +
> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> +
> +The \field{index}es don't have to be continuous. For instance, three
> +devices with \field{index} 1, 2 and 5 respectively are acceptable.
> +
> +The \field{index}es cannot have conflicts. For instance, three devices with
> +\field{index} 1, 1 and 5 respectively are prohibited.
> +
>  \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
>  
>  \begin{enumerate}
>  \item The guest's cid is read from \field{guest_cid}.
>  
> +\item Check for multi devices support:
> +\begin{itemize}
> +    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
> +    the device's index will be read from \field{index}, and the driver will
> +    allow multi devices.
> +    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated, the
> +    device's index will be ignored, and the driver will deny the second and
> +    subsequent devices.
> +\end{itemize}
> +
>  \item Buffers are added to the event virtqueue to receive events from the device.
>  
>  \item Buffers are added to the rx virtqueue to start receiving packets.
> @@ -167,6 +199,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>  consists of a (cid, port number) tuple. The header fields used for this are
>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>  
> +When the driver supports multiple devices (feature
> +VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting socket is not
> +bound to any specific address, then \field{src_cid} should be assigned with
> +the CID of the default device.
> +
>  Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>  for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
>  
> @@ -233,8 +270,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
>  
>  \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>  
> -The \field{guest_cid} configuration field MUST be used as the source CID when
> -sending outgoing packets.
> +The \field{guest_cid} configuration field of one device MUST be used as the
> +source CID when sending outgoing packets. When the
> +VIRTIO_VSOCK_F_MULTI_DEVICES feature is not negotiated, there is only one
> +device. When this feature has been negotiated, either use the
> +\field{guest_cid} of the device specified by the user, or use that of the
> +default device.
>  
>  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
>  unknown \field{type} value.

I can't say I understand what this text is saying.
For example does index do anything besides selecting the default
device? How does this interact with cid?
If I have the time, I might read the patch and the doc later,
but spec has to stand on its own.

-- 
MST

