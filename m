Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0450E15C158
	for <virtio-comment@lists.linux.dev>; Wed, 25 Sep 2024 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727267125; cv=none; b=CyLYXH4Unzs5BuvKJPb51Zcu2vCIbsV66b7v4Hb4fcc0LLpf69t3GQysccMPPA0V7ZUSsezpJAcKSYnzDfu5kWwrrGwq9g6W/Ax3s5vmRxL8UeMxPgVIcWTmapzduYLpMh4lrbItAhL2opfJFByzyHHZ3TZxZHDWT/DeBZAHA+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727267125; c=relaxed/simple;
	bh=mvsYbdL2RwrRk6ITsBnh+SDjKMLbf8adEzEdb4EpsY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LB+6S/gHAmy23E+HgfUp2YNFtMr9aej3DVe+A8g9Uv4yqf7892TYOnnFs3itt7w7ySdfjqqNBDX06Ktqm44r2Z1Sv/ErRmZo1DLkX01gX+e8H8LqGfDm8V3hCSYu4o6HTPxkoq2lQafseW24EP4nxHYW0k3b8d8zvbKuKOMKgns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ARF/e72D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ARF/e72D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727267121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=opiEHAvqGAgy8dnZXjH6Ybf1Z3b689eonL/VoyfnCDM=;
	b=ARF/e72DFAoGIvS2l1kE2VW8tGFlEnxV0swwbyF/ZzX+AUl4eOh7caU7ct8KCSIFryknlj
	LzyYmev8xhcyufgGJjetmXpVhJVWIeBE95YMj0ubX57ZPUnO3qY2oj9afpwvDO2fGiMqRm
	oabEkdIgK00uTjFf3qMe5jDfVFrIrO0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-Vg3H7SKPNpO7AmJPeXhExg-1; Wed, 25 Sep 2024 08:25:20 -0400
X-MC-Unique: Vg3H7SKPNpO7AmJPeXhExg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8a6fee3ab1so576752166b.3
        for <virtio-comment@lists.linux.dev>; Wed, 25 Sep 2024 05:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727267119; x=1727871919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opiEHAvqGAgy8dnZXjH6Ybf1Z3b689eonL/VoyfnCDM=;
        b=v5wOuClGF3PV4dwDpyJyEgdl/A9vGwi1gtLn/3zzeFWNWV7uKE/aD736Qci42ExnqI
         O1AKz6KHv/MEP3kK1GhUPuemiAoW0EMVzODT5jAe2TYQU+/04/paTGR2txoqHsIoDbvw
         5e9ckgE/pnowKbUFjx9d4ZD5nuXCG9+VGedaetu6rxFjhaaP/HzYogWknNp+is4yHmUJ
         VpRhwsfsv5yVR4PdKEQs0fwelZsPcBXiwZTJPRfWGhVxuYC1nmGcrjfzalsDbj5RGkOK
         SMepr27iyXpYLQbia29ROdkhKUqJYsamLLiMtym0aNGzwSyz/da0iPIyst4a9NbhQjKB
         6xuA==
X-Forwarded-Encrypted: i=1; AJvYcCV8WU1eQUG6TFVkW+ToiyhvgFGrjCAu5dUq6KG8JVXOnWkd9+zo+FbFpF3IwXsskkbzmq9rsFmuzAyXItrNRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7AhkxhPIfFEwHD7rAGjvhYXeoE+nmjJaBcqb8wjg8I53Tu09u
	+aLqtNFbwBxpf7PdwWP2+1asu5/F6Ld8mwiDo1A2iQKCiIdpjX1gRnKQ1Ep6ZQ33fLLi8j2Ap0v
	y9Yn9b6on38OYqnRHobZ/H3O8fXePQGSMNktVlx6GAmR/pAVkXvZbuAoNRMG8TbFY
X-Received: by 2002:a17:906:d25e:b0:a90:df6f:f086 with SMTP id a640c23a62f3a-a93a032011bmr250066566b.11.1727267119263;
        Wed, 25 Sep 2024 05:25:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkXkUCFabfhBNvpPwWGHbwsczCj8lqk5OLSRjDC9PwiqKbSfXURm+JtIVC4msUd8NLFJJtMA==
X-Received: by 2002:a17:906:d25e:b0:a90:df6f:f086 with SMTP id a640c23a62f3a-a93a032011bmr250061566b.11.1727267118499;
        Wed, 25 Sep 2024 05:25:18 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-231.retail.telecomitalia.it. [79.46.200.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm203337666b.120.2024.09.25.05.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:25:17 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:25:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	virtio-comment@lists.linux.dev
Subject: Re: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Message-ID: <pxccl5mfv7m3r4shslqusnrd3zgwlzdwo3o45fgmulahup2jjl@dtm6dbw3fl4o>
References: <r6nrxdgajmzpun3sfqfqtvh3en3r4samuac2o7tczq35geuju4@6nchpg2l2qz7>
 <20240909085150.461189-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240909085150.461189-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 09, 2024 at 04:51:50PM GMT, Xuewei Niu wrote:
>Hi Stefano,
>
>Thanks for your constructive comments and hope you had a nice vacation ;)
>
>I responded to some comments before proceeding to the next version. PTAL!
>
>Thanks,
>Xuewei
>
>> Hi,
>> sorry for the delay, I was on vacation.
>
>> On Tue, Aug 13, 2024 at 04:14:46PM GMT, Xuewei Niu wrote:
>> >This patch brings a new feature, called "multi devices", to the virtio
>> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and
>> >a
>> >"index" field to the config for the virtio vsock.
>> >
>> >== Motivition ==
>> >
>> >Vsock is a lightweight and widely used data exchange mechanism between host
>> >and guest. Kata Containers, a secure container runtime, leverages the
>> >capability to exchange control data between the shim and the kata-agent.
>> >
>> >Currently, the virtio-vsock only supports one device, resulting in the
>> >following limitations:
>> >
>> >* Poor performance isolation: All vsock connections share the same
>> >virtqueue. By the way, although multi-queues can solve this problem, they
>> >do not conflict.
>> >* Cannot enable more than one backend: Virtio-vsock, vhost-vsock, and
>> >vhost-user-vsock cannot be enabled simultaneously on the transport.
>> >
>> >We’d like to transfer networking data, based on TSI (Transparent Socket
>> >Impersonation) technique, over vsock via the vhost-user protocol to reduce
>> >overhead. However, by default, the vsock device is occupied by the
>> >kata-agent, a control component for Kata Containers.
>> >
>> >== Typical Usages ==
>> >
>> >Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
>> >respectively. And the device with CID 3 is default.
>> >
>> >==== Guest -> Host ====
>> >
>> >Use the device with CID 3.
>> >
>> >```c
>> >fd = socket(AF_VSOCK);
>> >bind(fd, 3, -1);
>> >connect(fd, 2, 1234);
>> >n = write(fd, buffer);
>> >
>> >// or use default (no bind)
>> >fd = socket(AF_VSOCK);
>> >connect(fd, 2, 1234);
>> >n = write(fd, buffer);
>> >```
>> >
>> >Use the device with CID 4.
>> >
>> >```c
>> >fd = socket(AF_VSOCK);
>> >bind(fd, 4, -1);
>> >connect(fd, 2, 1234);
>> >n = write(fd, buffer);
>> >```
>> >
>> >==== Host -> Guest ====
>> >
>> >The usage is no changes in this case. Send to device with CID 3.
>> >
>> >```c
>> >fd = socket(AF_VSOCK);
>> >connect(fd, 3, 1234);
>> >n = write(fd, buffer);
>> >```
>> >
>> >Send to device with CID 4.
>> >
>> >```c
>> >fd = socket(AF_VSOCK);
>> >connect(fd, 4, 1234);
>> >n = write(fd, buffer);
>> >```
>> >
>> >I've pushed a version of code for the implementation of multi devices to
>> >lkml [1].
>> >
>> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
>> >
>> >Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>
>> mmm, why there is my S-o-b here?
>
>Lol. I've replaced some of descriptions with your version. So should I keep this s-o-b?

Commonly S-o-b is to be put only if the person concerned specifies you 
to put it. In this case it's your work, I just made suggestions and you 
don't need to put my S-o-b ;-)

>
>> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>> >---
>> > device-types/vsock/description.tex | 45 ++++++++++++++++++++++++++++--
>> > 1 file changed, 43 insertions(+), 2 deletions(-)
>> >
>> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>> >index 7d91d15..5a10ae1 100644
>> >--- a/device-types/vsock/description.tex
>> >+++ b/device-types/vsock/description.tex
>> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
>> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
>>
>> I'd follow the the other features with something like:
>> "\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are supported."
>>
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
>> >@@ -77,11 +79,41 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> > \hline
>> > \end{tabular}
>> >
>> >+The \field{index} field indicates index of a device, and is required for
>> >+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
>>
>> what about "when the VIRTIO_VSOCK_F_MULTI_DEVICES feature is negotiated" ?
>>
>> >+negotiated. The size of the \field{index} is 16 bits which supports up to
>> >+65,536 devices.
>>
>> What about "The \field{index} is 16 bits in size, enabling support for
>> up to 65,536 devices."
>
>I'll update in v5.
>
>> >+The device with the lowest index is considered as the default device. There
>> >+was only one device before the multi-device feature was supported. When the
>> >+multi-device feature is enabled (VIRTIO_VSOCK_F_MULTI_DEVICES has been
>> >+negotiated), the default device can be thought of as the device. It is used
>> >+to maintain compatibility with applications that are not yet ready to
>> >+support this feature.
>>
>> IMHO this part is not very clear.
>> I would try to explain what index is only for when
>> VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, something like that:
>>
>>    If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the index of multiple
>>    devices managed by the driver is used by the driver to choose the
>>    default device when the source socket is not bound to any CID. In this
>>    case, the driver uses the device with the lowest index as the default.
>>
>> I'm not sure if we need to add a specific paragraph to explain that
>> part better.
>
>I'd like to tell the users that what will happen if they don't update their
>vsock apps. But your version is more concise and clear.
>
>I think we don't need to do that, since we'll elaborate the details about
>the default device in the "Device Operation: Receive and Transmit".
>
>Wdyt?

Okay, let's try, I'll check the final result.

>
>> >+
>> >+\devicenormative{\subsubsection}{Device configuration layout}{Device
>> >Types / Socket Device / Device configuration layout}
>> >+
>> >+The \field{index}es don't have to be continuous. For instance, three
>> >+devices with \field{index} 1, 2 and 5 respectively are acceptable.
>> >+
>> >+The \field{index}es cannot have conflicts. For instance, three devices with
>> >+\field{index} 1, 1 and 5 respectively are prohibited.
>>
>> A normative section should use SHOULD, MAY, MUST. Please take a look at
>> the other normative sections.
>>
>> Should we add a line here in the normative section to specify that the
>> driver must use the device with the lowest index as the default?
>
>I will update it as follows in v5.
>
>```
>\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>
>The device MAY make \field{index}es discontinuous.
>
>The device MUST use a different \field{index}.

I think in both we need to talk about multiple devices, not the single 
device.

>
>\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>
>The driver MUST use the device with the lowest index as the default.

IMHO "default" here is not clear, so something like, “as default device 
for outgoing connections”

Thanks,
Stefano

>```
>
>Looks good to you?
>
>> >+
>> > \subsection{Device Initialization}\label{sec:Device Types / Socket
>> > Device / Device Initialization}
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
>> >@@ -167,6 +199,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>> > consists of a (cid, port number) tuple. The header fields used for this are
>> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>> >
>> >+When the driver supports multiple devices (feature
>> >+VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting socket is not
>>
>> s/transmitting/source
>
>I'll update in v5.
>
>> >+bound to any specific address, then \field{src_cid} should be assigned with
>> >+the CID of the default device.
>> >+
>> > Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>> > for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for
>> > seqpacket socket types.
>> >
>> >@@ -233,8 +270,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
>> >
>> > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>> >
>> >-The \field{guest_cid} configuration field MUST be used as the source CID when
>> >-sending outgoing packets.
>> >+The \field{guest_cid} configuration field of one device MUST be used as the
>> >+source CID when sending outgoing packets. When the
>> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature is not negotiated, there is only one
>> >+device. When this feature has been negotiated, either use the
>> >+\field{guest_cid} of the device specified by the user, or use that of the
>> >+default device.
>>
>> We can skip the one device part, I would rephrase it to something like this:
>>
>> The \field{guest_cid} configuration field MUST be used as the source CID when
>> sending outgoing packets.
>> When the VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
>> MUST be one of the \field{guest_cid} configuration field of the multiple
>> devices handled by the driver.
>
>I'll update in v5.
>
>> Thanks,
>> Stefano
>>
>> >
>> > A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
>> > unknown \field{type} value.
>> >--
>> >2.34.1
>> >
>

