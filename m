Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9426413DB92
	for <virtio-comment@lists.linux.dev>; Tue,  9 Jul 2024 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520321; cv=none; b=RnAiBn8JoI/iQ0079XPELULbzxJalxlsTwsvKrHJwU9zSsPEkennW8qub6IEcDSMSm9jP3Nzt6vIIR2AGTu/jPcFGU6c6ElMJztc/dPBanTOLsVERW7mPl5+xdJm5YHCFNLxhbAN8BfBX/Fc2srke52kwzqNgwcw7ihydgHBZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520321; c=relaxed/simple;
	bh=YR4/PKIIjqkmMG3PtIJ3hHuPdBBEX3gnnozEVay0+e4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SwWmPFD/0vYJ1ka17E9+IQImOwa65jbQzFYFvJTfw6vXDAeig84ibPP5Rah4rVIxK/K0I6FOqv334L06MUdNmP1jwcbdMOygPPZ4dA1ONNy99zvMn9Qwymk7+YxtMnOmyy005eA4BhvtyIkN4UkKKFn9dTWw5hHqFk+z4RXgxYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWKaiiD1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWKaiiD1"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-767506e1136so2681439a12.0
        for <virtio-comment@lists.linux.dev>; Tue, 09 Jul 2024 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720520319; x=1721125119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g91KZbDpBKNXo7CmBklnlOz+9U5jDkHKpARM8imGdWg=;
        b=RWKaiiD1+vGnru2ekS+CCZSE/GM5z4+wrYQp+CWaZrG66hzpHL8MP4IMH35eYmxyKs
         hDbk1lAJem9TNC8nopPg80/qvRiUGCSTc8DkyGD1SLtrIdnhR+iLEBxIfFrBAWveiWQe
         pDWbrbHAlIrrIEPV9Mi6ROcXX8MTeMgBp7GcA3wdYM7qNSf+6AR6HG0qkGlK6A6jA+LY
         synynEbKYbTxkF7hSbl4cIHSYjTIuE/eGzijmYaO/r9kKJVV3gx5cjCtVMJWpd4Zgubv
         TkfW5cYzhFv9g/uxAF0Aqk46iG7C/9Tg2/R+PemnqnMUt4v/AbDWX/R1ziTAjLNMNJKg
         Bkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720520319; x=1721125119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g91KZbDpBKNXo7CmBklnlOz+9U5jDkHKpARM8imGdWg=;
        b=tLF2sjBNNOHfzZ0NxZSzLpNXCTyQKKXXkjT9+eHTCCLpXmFcqkgEwLLIcvXSB9Z4Py
         hBua/NNnbRb5EpLizdApJdkdH/BKr0hr+/2p4BNc2KTO3O28C8UGNlsjmabKVrjCkf9g
         CCcRKT9AT6mktK6jQnhzn0zEdS8SuotEAWgZ/pUXPHCwgv0WmW9Ea0+YkUoJu8SvF7P+
         BnoOMd8tWoGuSn6ZYlMbI/44DhXwdEwONwmpg7rOj2Px+OKbq8KexuzVuvXc6Y97rlGa
         DEDZ6Y8Cp57ZsR5H0aL+FJRA6y+EW9F7MCyNOmSDb29/tIaELZW1JvtKU+2dwgfAx6+u
         dE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeJ8k4CLVDCyqQNe7ViWFZqBxrjhM+YhVo7kWlyY04bnhn1d1zd5w3K6LlbF5U4DfANfWyC0dL+MObVOnCb/zBzby0ex3M3NOu4fXccsQ=
X-Gm-Message-State: AOJu0YwCNUeCammvvsk1Q2aJLyFndK7S+z334J/rtGJiUt16hh6VjHHT
	ieOh9i3EKYDfrC7spmRb4xqEUBq2zN8seHelrtJCEVvfWtFmf3R7
X-Google-Smtp-Source: AGHT+IF6bZmOnjrNBIDQWCDDwb4XYIvMN+DkJ7vDKWV6MT8BAhS6iG9CC9xy63M4xYvDQUlz/N9cvA==
X-Received: by 2002:a05:6a21:6711:b0:1bd:25bd:ef6f with SMTP id adf61e73a8af0-1c298c468a6mr2196660637.18.1720520318560;
        Tue, 09 Jul 2024 03:18:38 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b9afbsm1417927b3a.191.2024.07.09.03.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 03:18:38 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	virtio-comment@lists.linux.dev
Subject: Re: [RFC PATCH v3] virtio-vsock: Add support for multi devices
Date: Tue,  9 Jul 2024 18:18:18 +0800
Message-Id: <20240709101818.2674694-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <nlwexda7v2vo7o5c5i3ssrwj4t6vxzny63hgemwotvd7dmf3gm@cmp4jkxf4k6i>
References: <nlwexda7v2vo7o5c5i3ssrwj4t6vxzny63hgemwotvd7dmf3gm@cmp4jkxf4k6i>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the late reply. I have a few more questions regarding your
remarks. PTAL!

> >This patch brings a new feature, called "multi devices", to the virtio
> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> >"index" field to the config for the virtio vsock.
> >
> >I've pushed a version of code for the implementation of multi devices to
> >lkml [1]. You might also refer to a google doc [2] for multi devices
> >details regarding motivation, implementation, use cases, etc.
> >
> >[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> >[2] https://docs.google.com/document/d/14RUDEesi86EBZigVxxFsjxAl2OslPFplLyXMHiyDgYs/edit?usp=sharing
> >
> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >---
> >v2 -> v3:
> >- Merge the two commits into one.
> >- Add some descriptions regarding the "index" field: the default device and
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
> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> >index 7d91d15..190f123 100644
> >--- a/device-types/vsock/description.tex
> >+++ b/device-types/vsock/description.tex
> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
> > \end{description}
> >
> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >@@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > \begin{lstlisting}
> > struct virtio_vsock_config {
> > 	le64 guest_cid;
> >+	le16 index;
> > };
> > \end{lstlisting}
> >
> >@@ -77,11 +79,42 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > \hline
> > \end{tabular}
> >
> >+The \field{index} field indicates index of a device, and is required for
> >+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> >+negotiated. The size of the \field{index} is 16 bits which supports up to
> >+65,536 devices.
> >+
> >+The device with the lowest index is considered as the default device. Plus,
> 
> Should we explain what "default device" means here?

I believe it's unnecessary because the primary function of the default
device is to assign a source CID when the transmitting socket isn't bound.
This will be elaborated in the subsequent section.

> >+it works fine with hot-plug and hot-unplug. When adding a device at runtime
> >+to be the default, assign it the lowest \field{index} without changing the
> >+configuration of the previous device.
> 
> I'm not sure it's worthwhile here to talk about hot-plug/unplug.

Will remove in the v4.

> >+
> >+The device is responsible for populating the \field{index} field. The rules
> >+for \field{index} are:
> >+
> >+\begin{itemize}
> >+\item It doesn't have to be continuous. For instance, three devices with
> >+the \field{index} 1, 2 and 5 respectively are acceptable.
> >+
> >+\item It cannot have conflicts. For instance, three devices with the
> >+\field{index} 1, 1 and 5 respectively are prohibited.
> >+\end{itemize}
> 
> Maybe we should put this second point in a normative section.

Only the second one? How about moving all of these rules to the normative
section?

> >+
> > \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> >
> > \begin{enumerate}
> > \item The guest's cid is read from \field{guest_cid}.
> >
> >+\item Check for multi devices support:
> >+\begin{itemize}
> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
> >+    the device's index will be read from \field{index}, and the driver will
> >+    allow multi devices.
> >+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated, the
> >+    device's index will be ignored, and the driver will deny the second and
> >+    subsequent devices.
> >+\end{itemize}
> >+
> > \item Buffers are added to the event virtqueue to receive events from the device.
> >
> > \item Buffers are added to the rx virtqueue to start receiving packets.
> >@@ -167,6 +200,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> > consists of a (cid, port number) tuple. The header fields used for this are
> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> >
> >+In the case of sending packets from the guest to its peer, if the
> >+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated and the
> >+\field{src_cid} isn't specified, the \field{src_cid} should be set to the
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

Yes, I'd like to talk about the "bind". But I'm not sure if we can discuss
"bind" here, since it is an implementation detail in the Linux. If that is
ok to you, will replace with your version in the v4.

> >+CID of default device.
> >+
> > Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> > for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
> 
> On line 234 we have the following normative:
> 
>      \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> 
>      The \field{guest_cid} configuration field MUST be used as the source CID when
>      sending outgoing packets.
> 
> Should we extend that paragraph to specify what source CID should be
> used when VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated?

I think it could be modified to

"The \field{guest_cid} configuration field of one device MUST be used as
the source CID when sending outgoing packets."
(add "of one device")

Regardless of whether VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the
source CID MUST BE associated with one of the devices.

> Should we also considering changes in `struct virtio_vsock_event`?
> 
> Thanks,
> Stefano

Thanks,
Xuewei
