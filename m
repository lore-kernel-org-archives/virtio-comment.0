Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44105C8FE
	for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979035; cv=none; b=DAJOPQNFErx49Zv46fr2J6xRREC9jh0y9MDPOq9+ePXzRl1EVEO3aZVc7FGeunFxF/e20tUg5m8BGY8PYzJg5/EGQX6zejBOqkkPhQPdGFfwWorwcphKzMG2wflb8FS6KzQJ+jjD1Np2e5buS8c7C/SubHa2cMLyohaigqnxgZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979035; c=relaxed/simple;
	bh=5DxdXCscwDSdaEnjUZnaage81foEM4wQzT8AZTeR2qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fczz0zanxrHMTa6cpJFZ0v8YJ2x+q7EUlgXnRCz2il4zTkXyl3ztVVTOwj5rbA4KvJ1glIMxJC4DlzHJvCexMAh4PEzjg9SNEinwqytKLA2yqFEtZ/1DJj99JbdMmertCvJg+QEf4o5PHL6VtIGVLGnDrrbwqaiGujDajRlLTXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TV3RNbUT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TV3RNbUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742979032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVFZ0yNI+Rwc8UHocmR+RenGpQk8RfqaRvuMLXDJxHA=;
	b=TV3RNbUTo8lM9us/W/KDS/x+54TESty55Clv92QrH/0gGjoWUfY4SF2Jk/UNelSE8mSLKs
	rHlnaz1shDXj0JwZ2hedmdvQ8fUe9l4nAAnj5L4RGE9HLNB1rO8/usU3ZlCTsJ90asp3sK
	obPtvOPmTnDmvQldrsBx0I3J/+UWxW0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-tRI_V66dM2GpVEOVreK-9Q-1; Wed, 26 Mar 2025 04:50:30 -0400
X-MC-Unique: tRI_V66dM2GpVEOVreK-9Q-1
X-Mimecast-MFC-AGG-ID: tRI_V66dM2GpVEOVreK-9Q_1742979029
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf446681cso36619185e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 01:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742979029; x=1743583829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tVFZ0yNI+Rwc8UHocmR+RenGpQk8RfqaRvuMLXDJxHA=;
        b=B8lyFHy9NtCUOZZy971ibic9nuciYaC5AYxW8UfkeKDFKgIaISVzNb0pH4P+Cg/Cy1
         h1gwKbXlPQmPE5eQR2Ua3tvUbrnU7NtqQ7At09sDUDKT2JDoXwXq/2VubUS3OJ0P/AC+
         lCpw9TFdNKM17+xcxhCNrw5LS/co3BzHiMyD9qh+8o40cvtoN4NpPYq9vPPivyeFHsaX
         tzL24XjyRoktkPhPbvxdFGaWICLA+kTINn7fPkMUbd2FF/q+AERXVzoDgkhnzbiGjiRw
         SKqK9lVEiDyXw3rk0na3nIwQ5ZKU0QwHOYgBh3CM6BaEx0zi200R2Ic/wQtMgVUbDhPR
         Q5TA==
X-Forwarded-Encrypted: i=1; AJvYcCXA49yp80EI3cL3UWAfYYSFgv6Giwcn1iqVEpdI8PrSOnXJ5FlPVX5Uv0p52acjkJXYLgdPYijQAogqzXn8XQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNW/eqh3LcMy/eS6/gOuv542hx22lKnKAFBbsebOcG5qSizWe1
	/iYJDsvJ4EXcjt8+7rwzDICcIGjZOr19M79A+jenoP2DEdG3MkSbN9d1JX+54yEl6wRyf08fNRS
	/4Py63G8qknWmJbhm3MOTaBOCsu5mKYgVaE9rziSNSIPxZ5r/K20SHr8WABXfH9sC
X-Gm-Gg: ASbGnctisZHWRy7y2T/ucblH846UqX8pREUIMSBmpncUt/o+4J9Um5elI5llRgc/dBV
	+GHDz01h5WxpQ7Vvdo6kBp8F4LhvcLDr4ff51c2M68AGBUJsnUUtKIDV9IP4GiaBb1XShmd9cbD
	1Jc75uDGKsE8QylyiBjbyTToGx3kOUkPP/ElOpdeupE8E3QzjRUt0AykioHzh1hw2DkYmZM5qe0
	lMnGk1RyxubheWJrA19anc8QSQNSCKBlvDAJd4RmP7BtlbH89bcOKhqpwTI7T1egR2/DuTzBXRj
	O5x7+f2VkqdjYWH4DSHYLfq6cCtJlMVHdWx3szZQX+xC0AJcTCvHlrwxJQgbT29T
X-Received: by 2002:a05:600c:1d95:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43d50a4b226mr209010325e9.29.1742979029186;
        Wed, 26 Mar 2025 01:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgAs4ymad/q+WmHBIhO9YLR4WfeQ1bEwcWgZk8+LTlWOsrItfRvhjXYBuDW3TTdZE1JSdr9g==
X-Received: by 2002:a05:600c:1d95:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43d50a4b226mr209009925e9.29.1742979028610;
        Wed, 26 Mar 2025 01:50:28 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd27980sm178736265e9.21.2025.03.26.01.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:50:27 -0700 (PDT)
Date: Wed, 26 Mar 2025 09:50:23 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Message-ID: <7o7pkrmbwp6zyybgqqliybesezk2zpnopwwgzlbfpnw2m7relz@mxyhzve6lote>
References: <h5vwvrs7gsnkyw3vmkumhbtuqdecfmksnwlvfmxr62t2lhz3hc@lpinl24bwkte>
 <20250325031946.1934483-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250325031946.1934483-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ffltxnGMB5NX19Kb72gOMZF8hJundt3fo3mSKHdlCj8_1742979029
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
>> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
>> >This patch brings a new feature, called "multi devices", to the virtio
>> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
>> >"device_order" field to the config for the virtio vsock.
>> >
>> >== Motivition ==
>> >
>> >Vsock is a lightweight and widely used data exchange mechanism between host
>> >and guest. Currently, the virtio-vsock only supports one device, resulting
>> >in the inability to enable more than one backend. For instance, two devices
>> >are required: one to transfer data to the VMM via virtio-vsock,
>>
>> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
>> communicate with the hypervisor, but in virtio-vsock we never supported
>> it. Could this be the use case?
>>
>> We could in this way add a new feature for those devices that
>> communicate only with the VMM, where the CID of the VM is quite useless.
>> So instead of having multiple CIDs per VM, we could continue to have a
>> single CID, but the transport could support 2 devices, one to
>> communicate with the VMM (CID = 0) and one to communicate with the host
>> apps (CID = 2).
>>
>> Maybe this is orthogonal to this proposal, though, because it might
>> still make sense to have multiple vsock devices, even though it's not
>> very clear to me.
>
>In terms of the current situation, two devices are enough.
>
>We are the team of Kata Containers, so we are focusing on cloud-native
>computing. What I mentioned below might be beyond the scope of the virtio
>spec, just for your reference.
>
>The background is that the architecture of proxy mesh has been evolved over
>the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
>
>Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
>both host and guest network stacks. It is possible to establish a fast path
>between the pod and the proxy.
>
>When we have multiple networks, it is intuitive to have multiple NICs. So
>does vsock.

Be careful though, we don't want to complicate vsock to become like a 
NIC.

>
>When multiple networks are availble, it means that it is possible to have
>multiple proxies(i.e. user processes). In this case, two devices are not
>enough. This feature makes vsock more flexible and scalable.

This is a good point, but I really don't understand why a VM should have 
multiple CIDs assigned.

>
>Looks like you don't like the design of multiple devices. May I ask why? Is
>it too heavy for you?

Yes, I am concerned that we are over complicating vsock.
Since AF_VSOCK already defines an address to communicate with the 
hypervisor, why can't the device that ends up in the VMM (TSI) use that?

I believe that having multiple devices only introduces a complication in 
the user. What source device/CID should the user use and for what 
reason?

All this should be hidden and especially in your case, this is already 
easily done by using VMADDR_CID_HYPERVISOR to communicate with the VMM 
and VMADDR_CID_HOST to communicate with applications in the host. So 
maybe we only need to handle 2 device types in the driver, without 
adding this functionality but just introducing a new device type (via a 
feature) that handles VMADDR_CID_HYPERVISOR, so that the driver knows 
that at most it can have 2 devices, one for the VMM and one for the 
host.

>
>> > and another to a user process via vhost-user-vsock.
>>
>> So to recap, one device would be used only to communicate with the VMM,
>> and the other device to communicate with other external processes,
>> right?
>>
>> Do you have any other use cases?
>>
>> >Apart from that, a side gain is that theoretically the performance might be
>> >improved since each device has its own queue. But it varies depending on
>> >the implementation.
>>
>> This though might be easier to implement supported multi-queue in the
>> device, instead of adding n devices to the VM.
>
>I think multi-queue and multi-device are independent of each other, just
>like what network devices do. A single vsock device can be considered as a
>group of queues (if multi-queue is supported), and it can be assigned a
>thread to handle the traffic.

That's right
    multi-queue -> performance
    multi-device -> more addresses

And that's where I worry, why complicate vsock to get more addresses for 
a VM?

>
>So I accepted Parav's sugguestion, mentioned it as a side gain.
>
>> >== Typical Usages ==
>> >
>> >Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
>> >respectively. And the device with CID 3 is default.
>> >
>> >Connect to the host using the device with CID 3.
>> >
>> >```c
>> >// use default one (no bind)
>> >fd = socket(AF_VSOCK);
>> >connect(fd, 2, 1234);
>> >n = write(fd, buffer);
>> >
>> >// or bind explicitly
>> >fd = socket(AF_VSOCK);
>> >bind(fd, 3, -1);
>> >connect(fd, 2, 1234);
>> >n = write(fd, buffer);
>> >```
>> >
>> >Connect to the host using the device with CID 4.
>> >
>> >```c
>> >// must bind explicitly as the device with CID 4 is not default.
>> >fd = socket(AF_VSOCK);
>> >bind(fd, 4, -1);
>> >connect(fd, 2, 1234);
>> >n = write(fd, buffer);
>> >```
>> >
>> >The first version of multi-devices implementation is available at [1].
>> >
>> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
>> >
>> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>> >---
>> > device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
>> > 1 file changed, 28 insertions(+), 2 deletions(-)
>> >
>> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>> >index 7d91d15..7d0cfe4 100644
>> >--- a/device-types/vsock/description.tex
>> >+++ b/device-types/vsock/description.tex
>> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
>> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is supported.
>> > \end{description}
>> >
>> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>> >@@ -34,6 +35,12 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>> > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
>> > VIRTIO_VSOCK_F_STREAM has also been negotiated.
>> >
>> >+The driver SHOULD ignore devices that do not have
>> >+VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
>> >+
>> >+The driver SHOULD ignore all subsequent devices if a device without
>> >+VIRTIO_VSOCK_F_MULTI_DEVICES is present.
>> >+
>> > \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>> >
>> > The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
>> >@@ -52,6 +59,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> > \begin{lstlisting}
>> > struct virtio_vsock_config {
>> > 	le64 guest_cid;
>> >+	le16 device_order;
>> > };
>> > \end{lstlisting}
>> >
>> >@@ -77,11 +85,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> > \hline
>> > \end{tabular}
>> >
>> >+The \field{device_order} is used to identify the default device. Up to
>> >+65,535 devices can be supported due to the size.
>> >+
>> >+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> >+
>> >+The device MUST provide a distinct \field{device_order} if
>> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
>> >+
>> >+\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> >+
>> >+The driver MUST treat the device with the lowest \field{device_order} as
>> >+the default device.
>> >+
>> > \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
>> >
>> > \begin{enumerate}
>> > \item The guest's cid is read from \field{guest_cid}.
>> >
>> >+\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
>> >+order will be read from \field{device_order}.
>> >+
>> > \item Buffers are added to the event virtqueue to receive events from the device.
>> >
>> > \item Buffers are added to the rx virtqueue to start receiving packets.
>> >@@ -233,8 +257,10 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
>> >
>> > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>> >
>> >-The \field{guest_cid} configuration field MUST be used as the source CID when
>> >-sending outgoing packets.
>> >+If \field{src_cid} is missing in outgoing packets, the driver MUST assign
>>
>> I think here we have to define what the driver does, since the driver
>> has to populate that field, how is it missing?
>>
>> Maybe we are confusing interaction with user space, so we should say
>> something like, “If the source socket is not bound to any source CID,
>> the driver MUST assign ...”
>
>Will do.
>
>> >+one. If more than one device is present, the driver SHOULD use the default
>> >+device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
>> >+the \field{guest_cid} of the only available device.
>> >
>> > A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
>> > unknown \field{type} value.
>> >--
>> >2.34.1
>
>[1]: https://istio.io/latest/blog/2022/introducing-ambient-mesh/
>[2]: https://github.com/containers/libkrun?tab=readme-ov-file#networking
>
>Thanks,
>Xuewei
>

