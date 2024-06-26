Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449B1F94C
	for <virtio-comment@lists.linux.dev>; Wed, 26 Jun 2024 16:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719420866; cv=none; b=MnSoytTVay6ce+LtQImNdkwFeOBPJoxuerJ138baGtJLUS90XDE+dHoHxF0x5sg0TtpGRPG27aeLu2q5Srt4sL+SByItW0u1smWkQ4+7s24PXQU4HX73tjbJGJDzxR3mx1W7U/iu4Nu5Gnt5bV46ToH1EQQZtbLROYF+n6oxYqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719420866; c=relaxed/simple;
	bh=7wdPYWkLPAd64P2bnJ5sSu88tOGXvn2mUC4bOy32XFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsjFkx7DH8shvr5oxasG2QgbWY4wd66JInDoKj9xDA4JBoTgjnlE6R3n8BJGKCJ/miQ7jvp4jDxhSS4yCqQ/hzN8OAPg4Zsq+dNnpOd25WIUvQVWRF73KI7zGyfwQkpHpbIPzqK8B15ZtJfxUyyxi9J+cQLPY3C5tomzNcy6Hmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W72Gde2Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W72Gde2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719420863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNvdPT/G0bxEe8Nw+Zv8Z0DcziCyoIIg2AZDUm3IYns=;
	b=W72Gde2QaOyVgEuqM2FSWGaaXNTs9hbVNa7UGSpfZ0UGD5zHEdBa+3d6x4Zswx1tqYhMKd
	GKaIdZw17QRyF0XMMwYI8rDUoE4i3McsG3L9In+zU5ifImosNBNqyPB1ki6/yPLq1GguD/
	fzRhg1wkxhoVrtw+54uRaZLaRohAKz8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-Sg4M4UM_MJSpcznWOoavzg-1; Wed, 26 Jun 2024 12:54:20 -0400
X-MC-Unique: Sg4M4UM_MJSpcznWOoavzg-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e02f2c852f3so10406387276.0
        for <virtio-comment@lists.linux.dev>; Wed, 26 Jun 2024 09:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719420859; x=1720025659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNvdPT/G0bxEe8Nw+Zv8Z0DcziCyoIIg2AZDUm3IYns=;
        b=fLkhTYhT92e2t6j38PCXgwniFPb0gX8zMzOxxrAH1Q5zCkp13GmGLyHuRR24pKOGok
         XAdsEWSIKVyQDSM4KUuoQ1TYPE+iLK0Towg7Mp939bzL6d78n4BGfHzwHP0wWNDa8FCU
         PCXGasL1PhIxvLJUhXldBg+jgph33g91mcPUG4kl9Ehhzeh/V0t7yLIZfflktFgJLQ0q
         FLzJSTJuBafli+8Bbr6/VWLfJ6VrNW42FYEhvwgu//1J0ggmGvbEQogqNWcvKeYDA3GP
         cnbA91ITHwCPu4gfl3zCdK87rL5uDd5ID6HeS6XBqSqrk/Ts2Lq6u7rk6HQSg9uaxxWu
         g3lA==
X-Forwarded-Encrypted: i=1; AJvYcCXllm8ej2YnbQLH9DnVry2SmQXuW51bqgST1prNMZe2FeJ1O82u+uLBWCr4X9YXoMCBw/indKyyMRfy1F+CsGuQbk2OxMmtiI4CB9D0rBM=
X-Gm-Message-State: AOJu0YzoptUppMTx4MyFoA+KH4j0omHfzamWE4WKgBzLjtJt8YTTUwox
	JFBVbisPVcZL7iD1SOoSQdthcchbkHb/xoDnDe0TcoydVovjb2xFwU9+Ypd9mL1/Bvw2FM2nxiE
	oDpiFhg9SJCzegTNzDv8/mmT2Z8qY0LhiqtbEkaTQWMbKPUrceeXS01fwU7JZGW8/JWih6M2G2S
	VmDwtINW3zFiSJdCdfh86Pvdo+A9XSIbmfwks46YE=
X-Received: by 2002:a25:7412:0:b0:dfd:bd4d:c0d6 with SMTP id 3f1490d57ef6-e0303eb2dfbmr10884866276.7.1719420858741;
        Wed, 26 Jun 2024 09:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+r5r7yPYdyyZR1qdtPXIXyQWMs/ua7AP56SFvQBNvxApJvFKYly4Ro0YbYXNV6+XdfCBiGNDMLp6dLQNrjZI=
X-Received: by 2002:a25:7412:0:b0:dfd:bd4d:c0d6 with SMTP id
 3f1490d57ef6-e0303eb2dfbmr10884848276.7.1719420858324; Wed, 26 Jun 2024
 09:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617015446.2723779-1-niuxuewei.nxw@antgroup.com> <nlwexda7v2vo7o5c5i3ssrwj4t6vxzny63hgemwotvd7dmf3gm@cmp4jkxf4k6i>
In-Reply-To: <nlwexda7v2vo7o5c5i3ssrwj4t6vxzny63hgemwotvd7dmf3gm@cmp4jkxf4k6i>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 26 Jun 2024 18:54:05 +0200
Message-ID: <CAGxU2F4g7OxQK4hO9UBLSJVvmAE38gVUzcmzAzYR7gbeChnSzQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, fupan.lfp@antgroup.com, virtio-comment@lists.linux.dev, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 3:30=E2=80=AFPM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Mon, Jun 17, 2024 at 09:54:46AM GMT, Xuewei Niu wrote:
> >This patch brings a new feature, called "multi devices", to the virtio
> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> >"index" field to the config for the virtio vsock.
> >
> >I've pushed a version of code for the implementation of multi devices to
> >lkml [1]. You might also refer to a google doc [2] for multi devices
> >details regarding motivation, implementation, use cases, etc.
> >
> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niux=
uewei.nxw@antgroup.com
> >[2] https://docs.google.com/document/d/14RUDEesi86EBZigVxxFsjxAl2OslPFpl=
LyXMHiyDgYs/edit?usp=3Dsharing
> >
> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >---
> >v2 -> v3:
> >- Merge the two commits into one.
> >- Add some descriptions regarding the "index" field: the default device =
and
> >  the type.
> >- Add some descriptions about how multi devices are initialized in the
> >  Device Initialization.
> >
> >v1 -> v2:
> >- Rename the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES".
> >- Remove description from the relationship clarification.
> >- Remove implementation details from commit message and documentation.
> >- Rename the field from `order` to `index`.
> >- Rewrite the introduction about the `index` field.
> >- Add a case for sending message from the guest.
> >---
> > device-types/vsock/description.tex | 38 ++++++++++++++++++++++++++++++
> > 1 file changed, 38 insertions(+)
> >
> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/des=
cription.tex
> >index 7d91d15..190f123 100644
> >--- a/device-types/vsock/description.tex
> >+++ b/device-types/vsock/description.tex
> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Soc=
ket Device / Feature bits}
> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not i=
mplied.
> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple device=
s.
> > \end{description}
> >
> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket De=
vice / Feature bits}
> >@@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Dev=
ice Types / Socket Device
> > \begin{lstlisting}
> > struct virtio_vsock_config {
> >       le64 guest_cid;
> >+      le16 index;
> > };
> > \end{lstlisting}
> >
> >@@ -77,11 +79,42 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Socket Device
> > \hline
> > \end{tabular}
> >
> >+The \field{index} field indicates index of a device, and is required fo=
r
> >+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> >+negotiated. The size of the \field{index} is 16 bits which supports up =
to
> >+65,536 devices.
> >+
> >+The device with the lowest index is considered as the default device. P=
lus,
>
> Should we explain what "default device" means here?
>
> >+it works fine with hot-plug and hot-unplug. When adding a device at run=
time
> >+to be the default, assign it the lowest \field{index} without changing =
the
> >+configuration of the previous device.
>
> I'm not sure it's worthwhile here to talk about hot-plug/unplug.
>
> >+
> >+The device is responsible for populating the \field{index} field. The r=
ules
> >+for \field{index} are:
> >+
> >+\begin{itemize}
> >+\item It doesn't have to be continuous. For instance, three devices wit=
h
> >+the \field{index} 1, 2 and 5 respectively are acceptable.
> >+
> >+\item It cannot have conflicts. For instance, three devices with the
> >+\field{index} 1, 1 and 5 respectively are prohibited.
> >+\end{itemize}
>
> Maybe we should put this second point in a normative section.
>
> >+
> > \subsection{Device Initialization}\label{sec:Device Types / Socket Devi=
ce / Device Initialization}
> >
> > \begin{enumerate}
> > \item The guest's cid is read from \field{guest_cid}.
> >
> >+\item Check for multi devices support:
> >+\begin{itemize}
> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiat=
ed,
> >+    the device's index will be read from \field{index}, and the driver =
will
> >+    allow multi devices.
> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated,=
 the
> >+    device's index will be ignored, and the driver will deny the second=
 and
> >+    subsequent devices.
> >+\end{itemize}
> >+
> > \item Buffers are added to the event virtqueue to receive events from t=
he device.
> >
> > \item Buffers are added to the rx virtqueue to start receiving packets.
> >@@ -167,6 +200,11 @@ \subsubsection{Addressing}\label{sec:Device Types /=
 Socket Device / Device Opera
> > consists of a (cid, port number) tuple. The header fields used for this=
 are
> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port=
}.
> >
> >+In the case of sending packets from the guest to its peer, if the
> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated and the
> >+\field{src_cid} isn't specified, the \field{src_cid} should be set to t=
he
>
> It's unclear here, can you elaborate more on what you mean?
> src_cid should always be specified by the guest.
>
> If you want to talk about the bind instead, maybe we should say
> something like:
>    When the driver supports multiple devices (feature
>    VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting
>    socket is not bound to any specific address, then src_cid should be
>    assigned with the CID of the default device.
>
> Or something like that.
>
> >+CID of default device.
> >+
> > Currently stream and seqpacket sockets are supported. \field{type} is 1=
 (VIRTIO_VSOCK_TYPE_STREAM)
> > for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpac=
ket socket types.
>
> On line 234 we have the following normative:
>
>      \drivernormative{\paragraph}{Device Operation: Receive and Transmit}=
{Device Types / Socket Device / Device Operation / Receive and Transmit}
>
>      The \field{guest_cid} configuration field MUST be used as the source=
 CID when
>      sending outgoing packets.
>
> Should we extend that paragraph to specify what source CID should be
> used when VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated?
>
> Should we also considering changes in `struct virtio_vsock_event`?

Forget about this last question, `struct virtio_vsock_event` contains
just the id of the event, then the driver needs to access the config
space.

Stefano

