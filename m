Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A621CEAD3
	for <virtio-comment@lists.linux.dev>; Tue, 15 Oct 2024 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984114; cv=none; b=WtbryDm2ucjWo0w9uWHUuZajXIzSZCvsqOsd/PRX8dpOk3+mr4XeCDPuplYQLE0IZlsCmg9nmLIxybEyn3HbETPJ9reLtwRTv/Xwx3cfXdEfOOONEDhO5wKECG1evtPp9Q+HOhkBrH9UFWZq0/wBsoX/gVpeGolJ1UnHx0XD0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984114; c=relaxed/simple;
	bh=wpZi/O8raqdJxiQO3/CnbhJkNgA96g+dZO4gIc66kpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qhfL3/xfbHUMyXIlNYXz1tFGMyk4uyhEhINh1U421qprkDiBhtzK2JabsaW/LxaPMGzBpPTriku/lrz3BzSMNXnyrmAmRJsEz1E4xQwLEKLBMawWSlZP2swSFHAFFPyV62E7iCpVRkwBtosQmsQKw/+FbGat/9a4XtM2r94SKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WcvRZbgO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WcvRZbgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728984110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMaFnrzaJys0/ydNUuSfptorIFshUCo4YIaN2QbszVs=;
	b=WcvRZbgOMWonorAOVGifYbFph3YN5ebzdoI7cZk36gZBcVZw+zXKttGuIzn+oSng24U01f
	ZYtqXoQ3bj28j2l0GAeCtYG2tjlA3sO6fWkc4pAaX91sy7sg0l9Tez1xEkNwT020cmW5GI
	7+TJQESkOIXBVsGG2QJAOP/KjwVf9n4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-Zi3gfERfNd6AjjDIdnPb8g-1; Tue, 15 Oct 2024 05:21:48 -0400
X-MC-Unique: Zi3gfERfNd6AjjDIdnPb8g-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4601a473e90so77321601cf.2
        for <virtio-comment@lists.linux.dev>; Tue, 15 Oct 2024 02:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728984107; x=1729588907;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMaFnrzaJys0/ydNUuSfptorIFshUCo4YIaN2QbszVs=;
        b=ZMtA50Z6b494QOTo4/ep73denhocWP75xq4eq3GRMraookUalx/eZcVnj/880Vn57V
         +lxGlEe+IDs09reg8byqsCc7q9yjERyuhrl/lieiJzazSBaIwR9884Gumz5daqohFeLo
         dzqJLvT/8cYj2u6YNPEEfWZwkdqgs/Faa7jkGiPJZGdLK6h49R4nLMCvlZTubtQq/Z/g
         mNhdFgKndIyoMtUiQY9NlRoxK4xToK0TSbw7v1n0DTRVcAU694XI7pq//rV6jIcOJcm2
         UfgzQnRGybxDHlhH7NqcoNSdOs6YkFshDbwRu3Um8h4yc+9ovNcNJ/xt44IgYjWyW5hu
         mEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMcqLfAdmYIS9zowTSrlNiNILO5etoJ2lv2++bWgBUZmnUbXoX+sZ6/X21u3G9rWqUOu+iGSKeb3UUMputKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWHpnplQtZL8ljUnftzpkyaW5kGYATYR6OcpbOUKnii+EhIJOl
	dHf3OdQ9fJ9ra/jLsNz3jjaGVAeLv3cdO0WpADtUQg9Tqns/a/aAkP5xUErujh/ecBZh5U/DwUo
	Knf+XUgJ2X9je3o6z1EAdJnKxZobVxKR7IldkM/BOiCROtosGMY5RF6IqzFJnyvfF
X-Received: by 2002:a05:622a:1f07:b0:458:3be2:d2d6 with SMTP id d75a77b69052e-4604bc39132mr252133811cf.47.1728984107465;
        Tue, 15 Oct 2024 02:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2yHX2n+gsH1PqVFULJ/liEKHadJKE/R8JNAvWH7G2pDGAzqtvYTPJqp/deCUdN3Owv5EG9g==
X-Received: by 2002:a05:622a:1f07:b0:458:3be2:d2d6 with SMTP id d75a77b69052e-4604bc39132mr252133511cf.47.1728984106898;
        Tue, 15 Oct 2024 02:21:46 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-231.retail.telecomitalia.it. [79.46.200.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607b38b505sm4362751cf.83.2024.10.15.02.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:21:46 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:21:40 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	virtio-comment@lists.linux.dev
Subject: Re: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Message-ID: <oa3vk2dtqj33rowzehcvxvyb7rmkxb73ilggeicyqy4d5ezml2@frcvynoyxrub>
References: <pxccl5mfv7m3r4shslqusnrd3zgwlzdwo3o45fgmulahup2jjl@dtm6dbw3fl4o>
 <20241012093621.2966775-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241012093621.2966775-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Oct 12, 2024 at 05:36:21PM +0800, Xuewei Niu wrote:
>> On Mon, Sep 09, 2024 at 04:51:50PM GMT, Xuewei Niu wrote:
>> >Hi Stefano,
>> >
>> >Thanks for your constructive comments and hope you had a nice vacation ;)
>> >
>> >I responded to some comments before proceeding to the next version. PTAL!
>> >
>> >Thanks,
>> >Xuewei
>> >
>> >> Hi,
>> >> sorry for the delay, I was on vacation.
>> >
>> >> On Tue, Aug 13, 2024 at 04:14:46PM GMT, Xuewei Niu wrote:
>> >> >This patch brings a new feature, called "multi devices", to the virtio
>> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and
>> >> >a
>> >> >"index" field to the config for the virtio vsock.
>> >> >
>> >> >== Motivition ==
>> >> >
>> >> >Vsock is a lightweight and widely used data exchange mechanism between host
>> >> >and guest. Kata Containers, a secure container runtime, leverages the
>> >> >capability to exchange control data between the shim and the kata-agent.
>> >> >
>> >> >Currently, the virtio-vsock only supports one device, resulting in the
>> >> >following limitations:
>> >> >
>> >> >* Poor performance isolation: All vsock connections share the same
>> >> >virtqueue. By the way, although multi-queues can solve this problem, they
>> >> >do not conflict.
>> >> >* Cannot enable more than one backend: Virtio-vsock, vhost-vsock, and
>> >> >vhost-user-vsock cannot be enabled simultaneously on the transport.
>> >> >
>> >> >We’d like to transfer networking data, based on TSI (Transparent Socket
>> >> >Impersonation) technique, over vsock via the vhost-user protocol to reduce
>> >> >overhead. However, by default, the vsock device is occupied by the
>> >> >kata-agent, a control component for Kata Containers.
>> >> >
>> >> >== Typical Usages ==
>> >> >
>> >> >Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
>> >> >respectively. And the device with CID 3 is default.
>> >> >
>> >> >==== Guest -> Host ====
>> >> >
>> >> >Use the device with CID 3.
>> >> >
>> >> >```c
>> >> >fd = socket(AF_VSOCK);
>> >> >bind(fd, 3, -1);
>> >> >connect(fd, 2, 1234);
>> >> >n = write(fd, buffer);
>> >> >
>> >> >// or use default (no bind)
>> >> >fd = socket(AF_VSOCK);
>> >> >connect(fd, 2, 1234);
>> >> >n = write(fd, buffer);
>> >> >```
>> >> >
>> >> >Use the device with CID 4.
>> >> >
>> >> >```c
>> >> >fd = socket(AF_VSOCK);
>> >> >bind(fd, 4, -1);
>> >> >connect(fd, 2, 1234);
>> >> >n = write(fd, buffer);
>> >> >```
>> >> >
>> >> >==== Host -> Guest ====
>> >> >
>> >> >The usage is no changes in this case. Send to device with CID 3.
>> >> >
>> >> >```c
>> >> >fd = socket(AF_VSOCK);
>> >> >connect(fd, 3, 1234);
>> >> >n = write(fd, buffer);
>> >> >```
>> >> >
>> >> >Send to device with CID 4.
>> >> >
>> >> >```c
>> >> >fd = socket(AF_VSOCK);
>> >> >connect(fd, 4, 1234);
>> >> >n = write(fd, buffer);
>> >> >```
>> >> >
>> >> >I've pushed a version of code for the implementation of multi devices to
>> >> >lkml [1].
>> >> >
>> >> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
>> >> >
>> >> >Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> >>
>> >> mmm, why there is my S-o-b here?
>> >
>> >Lol. I've replaced some of descriptions with your version. So should I keep this s-o-b?
>>
>> Commonly S-o-b is to be put only if the person concerned specifies you
>> to put it. In this case it's your work, I just made suggestions and you
>> don't need to put my S-o-b ;-)
>
>Okay. Will update.
>
>> >
>> >> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>> >> >---
>> >> > device-types/vsock/description.tex | 45 ++++++++++++++++++++++++++++--
>> >> > 1 file changed, 43 insertions(+), 2 deletions(-)
>> >> >
>> >> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>> >> >index 7d91d15..5a10ae1 100644
>> >> >--- a/device-types/vsock/description.tex
>> >> >+++ b/device-types/vsock/description.tex
>> >> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>> >> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>> >> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>> >> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
>> >> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
>> >>
>> >> I'd follow the the other features with something like:
>> >> "\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are supported."
>> >>
>> >> > \end{description}
>> >> >
>> >> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>> >> >@@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> >> > \begin{lstlisting}
>> >> > struct virtio_vsock_config {
>> >> > 	le64 guest_cid;
>> >> >+	le16 index;
>> >> > };
>> >> > \end{lstlisting}
>> >> >
>> >> >@@ -77,11 +79,41 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> >> > \hline
>> >> > \end{tabular}
>> >> >
>> >> >+The \field{index} field indicates index of a device, and is required for
>> >> >+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
>> >>
>> >> what about "when the VIRTIO_VSOCK_F_MULTI_DEVICES feature is negotiated" ?
>> >>
>> >> >+negotiated. The size of the \field{index} is 16 bits which supports up to
>> >> >+65,536 devices.
>> >>
>> >> What about "The \field{index} is 16 bits in size, enabling support for
>> >> up to 65,536 devices."
>> >
>> >I'll update in v5.
>> >
>> >> >+The device with the lowest index is considered as the default device. There
>> >> >+was only one device before the multi-device feature was supported. When the
>> >> >+multi-device feature is enabled (VIRTIO_VSOCK_F_MULTI_DEVICES has been
>> >> >+negotiated), the default device can be thought of as the device. It is used
>> >> >+to maintain compatibility with applications that are not yet ready to
>> >> >+support this feature.
>> >>
>> >> IMHO this part is not very clear.
>> >> I would try to explain what index is only for when
>> >> VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, something like that:
>> >>
>> >>    If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the index of multiple
>> >>    devices managed by the driver is used by the driver to choose the
>> >>    default device when the source socket is not bound to any CID. In this
>> >>    case, the driver uses the device with the lowest index as the default.
>> >>
>> >> I'm not sure if we need to add a specific paragraph to explain that
>> >> part better.
>> >
>> >I'd like to tell the users that what will happen if they don't update their
>> >vsock apps. But your version is more concise and clear.
>> >
>> >I think we don't need to do that, since we'll elaborate the details about
>> >the default device in the "Device Operation: Receive and Transmit".
>> >
>> >Wdyt?
>>
>> Okay, let's try, I'll check the final result.
>>
>> >
>> >> >+
>> >> >+\devicenormative{\subsubsection}{Device configuration layout}{Device
>> >> >Types / Socket Device / Device configuration layout}
>> >> >+
>> >> >+The \field{index}es don't have to be continuous. For instance, three
>> >> >+devices with \field{index} 1, 2 and 5 respectively are acceptable.
>> >> >+
>> >> >+The \field{index}es cannot have conflicts. For instance, three devices with
>> >> >+\field{index} 1, 1 and 5 respectively are prohibited.
>> >>
>> >> A normative section should use SHOULD, MAY, MUST. Please take a look at
>> >> the other normative sections.
>> >>
>> >> Should we add a line here in the normative section to specify that the
>> >> driver must use the device with the lowest index as the default?
>> >
>> >I will update it as follows in v5.
>> >
>> >```
>> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> >
>> >The device MAY make \field{index}es discontinuous.
>> >
>> >The device MUST use a different \field{index}.
>>
>> I think in both we need to talk about multiple devices, not the single
>> device.
>
>Yes, I think I am talking about multiple devices. I'd like to point out that the
>indexes must be unique but could be discontinuous.
>
>What about the following?
>
>```
>\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>
>The device MUST offer a unique \field{index}. The \field{index}es among all
>devices MAY be discontinuous.
>```

I think we should emphasize that this is only true when 
VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated. Also we should better say 
what we mean by unique, i.e., that index can be assigned to one device 
when there are more than one.

Thanks,
Stefano

>
>> >
>> >\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> >
>> >The driver MUST use the device with the lowest index as the default.
>>
>> IMHO "default" here is not clear, so something like, “as default device
>> for outgoing connections”
>
>Will update.
>
>> Thanks,
>> Stefano
>>
>> >```
>> >
>> >Looks good to you?
>> >
>> >> >+
>> >> > \subsection{Device Initialization}\label{sec:Device Types / Socket
>> >> > Device / Device Initialization}
>> >> >
>> >> > \begin{enumerate}
>> >> > \item The guest's cid is read from \field{guest_cid}.
>> >> >
>> >> >+\item Check for multi devices support:
>> >> >+\begin{itemize}
>> >> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
>> >> >+    the device's index will be read from \field{index}, and the driver will
>> >> >+    allow multi devices.
>> >> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated, the
>> >> >+    device's index will be ignored, and the driver will deny the 
>> >> >second and
>> >> >+    subsequent devices.
>> >> >+\end{itemize}
>> >> >+
>> >> > \item Buffers are added to the event virtqueue to receive events from the device.
>> >> >
>> >> > \item Buffers are added to the rx virtqueue to start receiving packets.
>> >> >@@ -167,6 +199,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>> >> > consists of a (cid, port number) tuple. The header fields used for this are
>> >> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>> >> >
>> >> >+When the driver supports multiple devices (feature
>> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting socket is not
>> >>
>> >> s/transmitting/source
>> >
>> >I'll update in v5.
>> >
>> >> >+bound to any specific address, then \field{src_cid} should be assigned with
>> >> >+the CID of the default device.
>> >> >+
>> >> > Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>> >> > for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for
>> >> > seqpacket socket types.
>> >> >
>> >> >@@ -233,8 +270,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
>> >> >
>> >> > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>> >> >
>> >> >-The \field{guest_cid} configuration field MUST be used as the source CID when
>> >> >-sending outgoing packets.
>> >> >+The \field{guest_cid} configuration field of one device MUST be used as the
>> >> >+source CID when sending outgoing packets. When the
>> >> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature is not negotiated, there is only one
>> >> >+device. When this feature has been negotiated, either use the
>> >> >+\field{guest_cid} of the device specified by the user, or use that of the
>> >> >+default device.
>> >>
>> >> We can skip the one device part, I would rephrase it to something like this:
>> >>
>> >> The \field{guest_cid} configuration field MUST be used as the source CID when
>> >> sending outgoing packets.
>> >> When the VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
>> >> MUST be one of the \field{guest_cid} configuration field of the multiple
>> >> devices handled by the driver.
>> >
>> >I'll update in v5.
>> >
>> >> Thanks,
>> >> Stefano
>> >>
>> >> >
>> >> > A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
>> >> > unknown \field{type} value.
>> >> >--
>> >> >2.34.1
>> >> >
>> >
>
>Regards,
>Xuewei
>

