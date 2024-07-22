Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427A51D696
	for <virtio-comment@lists.linux.dev>; Mon, 22 Jul 2024 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721656190; cv=none; b=EOlPidlsHtMm49NBLLooN7q+xwDGhfXeUEbpc6b4eBVz7hohialY/MckLcDfpaipYw6mmpdPg4wwmYhNbUsSFbu1g6/kqd5egjcEVwfU1WRMGaTA5yBMcaHJdEkw/qy5Z6YVgpyrwlQ5P6JXhPWPX4zxT6kNxu/8r5ZLagkeE6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721656190; c=relaxed/simple;
	bh=E95BRWuZyXTCn7NELlWnXZXlYGUcEMjafPRhkx7Pyqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YqPTj3OwLMQF3+HIWVHmFXbbd7659Et8gnMeRcHMbjV4671IJ3GwJV8KcPIqkJwB1RnduzfcoLLW+WWKNs34dwOeE7w+J0pARCk4KJ45X40IxshDzu8er4atuvjFJAkzNA+ErM2B+wZUOWJV5TU3jCEet9ZCeWWryGMxTWcpTpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QxrpvLFx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QxrpvLFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721656187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k9ckPDbpdqC9R9C27EN1XlrOjn0oAMDJjhcSfH2IJ88=;
	b=QxrpvLFx8SdDEugBH8nqiRhfQdMsvWwOQ1j4s6OLnIe/u9PMKs/MiHkN/GvLGURni30Ei9
	q8b+iPA2OaMzxNP6oPbGidrL46a7VFqXcOSEMY0giZXm/Cqzfi+6iYHl06r3JgNWNmXAef
	TD5JZPKcTYvbbhco1A9GngAIX1Tdcc8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-aBuf_cmcMbuPwNZ7jSPIZQ-1; Mon, 22 Jul 2024 09:49:45 -0400
X-MC-Unique: aBuf_cmcMbuPwNZ7jSPIZQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6b78eca5502so88680116d6.1
        for <virtio-comment@lists.linux.dev>; Mon, 22 Jul 2024 06:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721656185; x=1722260985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9ckPDbpdqC9R9C27EN1XlrOjn0oAMDJjhcSfH2IJ88=;
        b=FQK/morYDc3ZhBvDgDBl5AbqlmI2C9hYMAWlNMChL8QcwXk8DrDAis+CEh0PX/KFdN
         F/l/hOG5C6C9/XQP1A1S/wep7kDhmNz7+t/ub5aoFLSLCB0nuhTVpVZwY4tOrianPQL0
         uJsFYG9y+wxevfBmEtsx/g7bul+vg7fRZRvMcsjMq+SnsbWjV9t3DnTyNuAj0FZzClsr
         PEGxjLr/p/NTjtTnk6T8Vda07NQE3VehUrSdlmH+IHiMYNKboVKbjdrLCFF1dEX6RVNs
         NJcanZitVeppDeXRtf5Fg0qOELJttrk0J0fZ6U/0xaS4BB803Hp2jRSinYwenFqxEiZx
         D8+g==
X-Forwarded-Encrypted: i=1; AJvYcCUpcuKRrJiCsHkUQx//6Pt+KPsvlmwbvFnFDSx706SN779U/pk6mGxCR7XDQez0npVKEITt6K6nzl+Dy4rURv3FtdHQFFbgM7UaF/UZI7U=
X-Gm-Message-State: AOJu0YxeEHb1CkLzPmhmI91fKUNt5HML1teab36BIcObFz8S9cVFOveZ
	rXYtcszv0zU7wFU7EK4f2xuNibQ4AiSj9fm+E8LkwdEef0ss70XYvuxzneVhzKYHY5tEHU2lg9k
	9gak+gCKa8hTuYHfqen6TE+qsZybdM8Tqds1wMqQSZ+WKlfinIeTAeUyx5YzXeEEh
X-Received: by 2002:a05:6214:2629:b0:6b7:9583:9745 with SMTP id 6a1803df08f44-6b95b5c72b5mr129813276d6.24.1721656184782;
        Mon, 22 Jul 2024 06:49:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/qMKO5ekDb3GYytGUyk/1nPhoDyoUvjdDtAsobjuVsA2dLySczNeecKNsZDPHyaEMmnCBSQ==
X-Received: by 2002:a05:6214:2629:b0:6b7:9583:9745 with SMTP id 6a1803df08f44-6b95b5c72b5mr129813026d6.24.1721656184272;
        Mon, 22 Jul 2024 06:49:44 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-79.retail.telecomitalia.it. [82.57.51.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7ac9c364dsm35498316d6.82.2024.07.22.06.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 06:49:43 -0700 (PDT)
Date: Mon, 22 Jul 2024 15:49:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	virtio-comment@lists.linux.dev
Subject: Re: [RFC PATCH v3] virtio-vsock: Add support for multi devices
Message-ID: <gs4jl7cepqux6myrh5l66f7t3w3vbghq5bbae2vo3kqbjn7xbn@hgch6ofp7jrj>
References: <nlwexda7v2vo7o5c5i3ssrwj4t6vxzny63hgemwotvd7dmf3gm@cmp4jkxf4k6i>
 <20240709101818.2674694-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240709101818.2674694-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Jul 09, 2024 at 06:18:18PM GMT, Xuewei Niu wrote:
>Sorry for the late reply. I have a few more questions regarding your
>remarks. PTAL!
>
>> >This patch brings a new feature, called "multi devices", to the virtio
>> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
>> >"index" field to the config for the virtio vsock.
>> >
>> >I've pushed a version of code for the implementation of multi devices to
>> >lkml [1]. You might also refer to a google doc [2] for multi devices
>> >details regarding motivation, implementation, use cases, etc.
>> >
>> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
>> >[2] https://docs.google.com/document/d/14RUDEesi86EBZigVxxFsjxAl2OslPFplLyXMHiyDgYs/edit?usp=sharing
>> >
>> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>> >---
>> >v2 -> v3:
>> >- Merge the two commits into one.
>> >- Add some descriptions regarding the "index" field: the default device and
>> >  the type.
>> >- Add some descriptions about how multi devices are initialized in the
>> >  Device Initialization.
>> >
>> >v1 -> v2:
>> >- Rename the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES".
>> >- Remove description from the relationship clarification.
>> >- Remove implementation details from commit message and documentation.
>> >- Rename the field from `order` to `index`.
>> >- Rewrite the introduction about the `index` field.
>> >- Add a case for sending message from the guest.
>> >---
>> > device-types/vsock/description.tex | 38 ++++++++++++++++++++++++++++++
>> > 1 file changed, 38 insertions(+)
>> >
>> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>> >index 7d91d15..190f123 100644
>> >--- a/device-types/vsock/description.tex
>> >+++ b/device-types/vsock/description.tex
>> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
>> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
>> > \end{description}
>> >
>> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>> >@@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> > \begin{lstlisting}
>> > struct virtio_vsock_config {
>> > 	le64 guest_cid;
>> >+	le16 index;
>> > };
>> > \end{lstlisting}
>> >
>> >@@ -77,11 +79,42 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> > \hline
>> > \end{tabular}
>> >
>> >+The \field{index} field indicates index of a device, and is required for
>> >+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
>> >+negotiated. The size of the \field{index} is 16 bits which supports up to
>> >+65,536 devices.
>> >+
>> >+The device with the lowest index is considered as the default device. Plus,
>>
>> Should we explain what "default device" means here?
>
>I believe it's unnecessary because the primary function of the default
>device is to assign a source CID when the transmitting socket isn't bound.
>This will be elaborated in the subsequent section.

If you want to explain it later it's fine by me, but then here I would 
just define the field and not what it's for, because IMHO it's not clear 
to talk about default device here defining later what it means.

>
>> >+it works fine with hot-plug and hot-unplug. When adding a device at runtime
>> >+to be the default, assign it the lowest \field{index} without changing the
>> >+configuration of the previous device.
>>
>> I'm not sure it's worthwhile here to talk about hot-plug/unplug.
>
>Will remove in the v4.
>
>> >+
>> >+The device is responsible for populating the \field{index} field. The rules
>> >+for \field{index} are:
>> >+
>> >+\begin{itemize}
>> >+\item It doesn't have to be continuous. For instance, three devices with
>> >+the \field{index} 1, 2 and 5 respectively are acceptable.
>> >+
>> >+\item It cannot have conflicts. For instance, three devices with the
>> >+\field{index} 1, 1 and 5 respectively are prohibited.
>> >+\end{itemize}
>>
>> Maybe we should put this second point in a normative section.
>
>Only the second one? How about moving all of these rules to the normative
>section?

maybe yes, not sure.

>
>> >+
>> > \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
>> >
>> > \begin{enumerate}
>> > \item The guest's cid is read from \field{guest_cid}.
>> >
>> >+\item Check for multi devices support:
>> >+\begin{itemize}
>> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
>> >+    the device's index will be read from \field{index}, and the driver will
>> >+    allow multi devices.
>> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated, the
>> >+    device's index will be ignored, and the driver will deny the second and
>> >+    subsequent devices.
>> >+\end{itemize}
>> >+
>> > \item Buffers are added to the event virtqueue to receive events from the device.
>> >
>> > \item Buffers are added to the rx virtqueue to start receiving packets.
>> >@@ -167,6 +200,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>> > consists of a (cid, port number) tuple. The header fields used for this are
>> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>> >
>> >+In the case of sending packets from the guest to its peer, if the
>> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated and the
>> >+\field{src_cid} isn't specified, the \field{src_cid} should be set to the
>>
>> It's unclear here, can you elaborate more on what you mean?
>> src_cid should always be specified by the guest.
>>
>> If you want to talk about the bind instead, maybe we should say
>> something like:
>>    When the driver supports multiple devices (feature
>>    VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting
>>    socket is not bound to any specific address, then src_cid should be
>>    assigned with the CID of the default device.
>>
>> Or something like that.
>
>Yes, I'd like to talk about the "bind". But I'm not sure if we can discuss
>"bind" here, since it is an implementation detail in the Linux. If that is
>ok to you, will replace with your version in the v4.

Why is it an implementation detail of Linux?

The device is related to a socket, and a bind is a well-defined 
operation for sockets, not only in Linux or POSIX, but in any OS. Also 
we already talk in the specification about connections, listening 
sockets, ports, etc.

>
>> >+CID of default device.
>> >+
>> > Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>> > for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
>>
>> On line 234 we have the following normative:
>>
>>      \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>>
>>      The \field{guest_cid} configuration field MUST be used as the source CID when
>>      sending outgoing packets.
>>
>> Should we extend that paragraph to specify what source CID should be
>> used when VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated?
>
>I think it could be modified to
>
>"The \field{guest_cid} configuration field of one device MUST be used as
>the source CID when sending outgoing packets."
>(add "of one device")
>
>Regardless of whether VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the
>source CID MUST BE associated with one of the devices.

Okay, but when it is negotiated, which one should be used?

Thanks,
Stefano

