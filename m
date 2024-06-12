Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C1433AE
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 06:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173493; cv=none; b=E5kqdGr2j11E2JtwI7MSeB+Lig42Stb/9cBASvhs5H98zyCh5YyMQNdR3TBC3/BJr3WSfABSg3WkbCMRI3ZcsYAgoGBTB1b9iP571kzrda6faDtkjRWv8ht4DJPCAXBMZg1jXihxNLWh8kUwjMbMHjOy4B9EgaFcuYgJO131OL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173493; c=relaxed/simple;
	bh=I4KKRRSgA2fzwWO9fVeyjwoTD/+meEyFjf8d/Imm7lY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xy1Eu8lm1ep/YUomT+WiGGFLnW6UvmFpXC2lJF7hEiF/N9RDCX/irsmHcRhOV/x0lOTQas12c/erbqd6L7H9PIe7hjNgDIArPhJ5kgEDIcDIzvifVRSHlO1aMfC30BktWej4J5TwJ03tnZKSvHSs7JzDsBhx3T0jKb5gVOueBW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxzN0rvx; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxzN0rvx"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7042a8ad9f5so424965b3a.0
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 23:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718173491; x=1718778291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVqA2Fkm2WJdrmWII2pOnRc24jW+VCCMY5Ekb1IJ4KA=;
        b=HxzN0rvxzAKvOxdo9p2F5M9iIse0yPAJdiGibapakeE/6X6Sr12D6pyo+axqh//GqQ
         1oVHxfex+rB79XWBXL0zZNfaa5fpSOyVj8bO86hkD/zVIlRdA9GVQHJCD9Niocj7a+Of
         ZB+Ng62wMfUT3aB0omK7/zg1lYR+HiCPGorr9icYDHGBFT/DcUG1hyF0G15QIigMZ1EO
         HniYb7lErHuwlgMx7H6cJFn7EsOm3MhUEiWQyREGjVSagpl+28Raf9FmFJ7ZC4epB6LD
         P/0ZaRsEMB1UF+BjcqR8MB2o9TZI4LEUsxofJ9c5wv9T8b95VHJDmeD1xc1DAbsbEs4E
         ZwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718173491; x=1718778291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVqA2Fkm2WJdrmWII2pOnRc24jW+VCCMY5Ekb1IJ4KA=;
        b=Nv9wfogNHN15R/kShLTKTGblHGsXvqjeQlg4PlUQzDcsGmID/ScFzFh5QInYKv8ELm
         Xc67x3j3h5e0UCP08jcmdBp6eGBoDKD2k95Ph8sR5MOqXhuH9tl2iIQO8FLp0yKwF9IH
         v3TuYBKchPpO7f9oZtvWtlK1tGumsErovcloTBCPd99+z/m64Ngtp25ZBDJQGBJheguG
         JLE9cXii+YEIKfUrHFt0C0imXvyMnlcbgC9pdQ9msjfbh3HlnVbVUQAeeQRZyrQNKtuQ
         Lyp8QQwYWv0Y0aSnnDUTLWqP23TFy+fLCprIP/5/EGwhfgfo5H2oMK+rDN4lTMG1XW8F
         hnNA==
X-Forwarded-Encrypted: i=1; AJvYcCUlNKh1NY0zCKDYrOMC1BqjlFCIzeC+i/K+VwRXLZQMSK/5DYhHNtm5AUz3ADR68gs/Dj+gSoZw6nuq6ABSPSNKhfUiBPnufYl8eR9+Wzs=
X-Gm-Message-State: AOJu0YyUKNxGiccLXHTnRTMOnImMfqkf67TqjmiGI2rJsViDLhhmsEQF
	Lmc73nDNjJSuc7l5ujmexiBu5laf4SgN4doIwUljkTypJg8XYNYv
X-Google-Smtp-Source: AGHT+IEBkmo9y27LNkq2BcubJ/BJqzyQFeu/dPqhKgSWKPy8TblpsACAVXhSmb8raXFaA3Tfc1VdEA==
X-Received: by 2002:a05:6a20:728b:b0:1b6:98ba:8df2 with SMTP id adf61e73a8af0-1b8a9b1ee55mr1988357637.3.1718173490499;
        Tue, 11 Jun 2024 23:24:50 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042b4eb9f8sm6629352b3a.30.2024.06.11.23.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 23:24:50 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: hi@alyssa.is,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	virtio-comment@lists.linux.dev,
	fupan.lfp@antgroup.com
Subject: Re: Re: [RFC PATCH 2/2] virtio-vsock: Extend the spec with an `order`
Date: Wed, 12 Jun 2024 14:24:42 +0800
Message-Id: <20240612062442.2429221-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <qhikhsdegxqpvluwe2m3cbq7xclyol5qnnag2lqsd3cpwlqkvu@jbu7utft67ih>
References: <qhikhsdegxqpvluwe2m3cbq7xclyol5qnnag2lqsd3cpwlqkvu@jbu7utft67ih>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> >Add a new field, named `order`, to the `virtio_vsock_config`.
> >
> >There are two questions about the field that are valuable to discuss:
> >
> >(1) Do we really need the `order` instead of a `default_device`?
> >
> >IMHO, the answer is yes.
> >
> >The `order` is more generic than the `default_device`. The device with the
> >lowest order is the default device. Moreover, the `order` field determines
> >the sequence of devices in the list. The device list is the same every time
> >the system starts.
> >
> >The device with lower order means it is more important. Also, it means it
> >has more likely to be used. Those devices are placed in the front of the
> >list for performance purposes.
> 
> This is an implementation details IMHO.
> 
> BTW perhaps the biggest point in favor of `order` IMHO is the fact that 
> this works very well with hotplung/hotunplug, since if we add at runtime 
> a device that is to become the default, we don't need to change the 
> configuration of the previous device.

I'll rework on this. BTW, shall I add this to the document? Currently, they
only exist on the commit message.

In addition, I think "index" is a more proper term than "order". So I'd
like to rename it in the next version.

> >Last but not least, the `order` represents a sort of priority, which might
> >be used in the future. For example, assuming that if there are two devices
> >that are eligible to be used, the kernel will return a device with higher
> >priority.
> >
> >(2) Why is the type of the `order` `le16`?
> >
> >The maximum number of devices, in the implementation on the kernel, is 16
> >for performance reasons. The users could compile the kernel to support more
> >devices. The type of `le16` supports up to 65536 devices, which is enough
> >to cover most cases.
> >
> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >---
> > device-types/vsock/description.tex | 16 ++++++++++++++++
> > 1 file changed, 16 insertions(+)
> >
> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> >index 3fbc02a..dc3bd66 100644
> >--- a/device-types/vsock/description.tex
> >+++ b/device-types/vsock/description.tex
> >@@ -58,6 +58,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > \begin{lstlisting}
> > struct virtio_vsock_config {
> > 	le64 guest_cid;
> >+	le16 order;
> > };
> > \end{lstlisting}
> >
> >@@ -83,11 +84,26 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > \hline
> > \end{tabular}"
> >
> >+The \field{order} field is required while the multi-device feature is
> 
> We should use the feature name, so something like: "is required if 
> VIRTIO_VSOCK_F_MULTI_DEVICE feature is negotiated."

It will be updated on the v2.

> >+enabled. A list is used to organize devices.
> 
> This is an implementation detail.
> 
> > The field is used to determine
> >+the order of the device in the list.
> 
> I think we should not talk about a list, because that seems too close to 
> implementation, but focus on the meaning we want to give to the 
> ordering. For now I think we can only talk about the one with the 
> smallest value being the device used by default.

Ok. These will be removed.

> > The device with the lowest order is
> >+the default one when no CID is specified.
> 
> "no CID is specified" in which case?

I'll elaborate a bit more about the case in the v2.

> >+
> >+The rules are:
> 
> "The rules" for what?

The rules is for the new field "order". I'll update it on the v2.
 
> >+
> >+\begin{enumerate}
> >+\item It doesn't have to be continuous.
> >+
> >+\item It cannot have conflicts.
> >+\end{enumerate}
> >+
> > \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> >
> > \begin{enumerate}
> > \item The guest's cid is read from \field{guest_cid}.
> >
> >+\item The device's order is read from the \field{order}.
> 
> Should we add "if the VIRTIO_VSOCK_F_MULTI_DEVICE feature is 
> negotiated."?

Yeah! Agree with you! Will update on the v2 either.

> Thanks,
> Stefano
> 
> >+
> > \item Buffers are added to the event virtqueue to receive events from the device.
> >
> > \item Buffers are added to the rx virtqueue to start receiving packets.
> >-- 
> >2.34.1
> >

Hi Stefano,

Thanks for your comments! I'll send a new version of patch ASAP.

Thanks,
Xuewei
