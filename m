Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC50391
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 04:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718251315; cv=none; b=ieTwML7AgHdodDYbJzutrGvY8icYQd5imbxkbEe/zBpPWHvHJNbmFdFb+cMjI2Y8ySp2d8epMrirkzmcOgQWryZNTUYtN7/iRNPFxqYBRGMyjLtTk3HyvFqNSum8cN7EzlDyHUx3FVrEEfqF15Pm1o+pgyq7mtaU5OlSKUY0IMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718251315; c=relaxed/simple;
	bh=sWBY3LrLcq0EbMD4APgstnvO536wRx3JuhcFPrcKbOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CVznvZ34fJdpKguwGivyEI4yr6eUgfB3Rd2byhwjYxcWeoBt+P960onF6C2ny4G7VLA2bqxTLzrK9vWXQpJLEgKBiIQ0dQxzTh+446WOEmNNCuguIJ/Mti7stnxeUkxmkmYKs4N+EDZuCm90tlFkVMEBX6nGPrhIQCR7wVRbKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWvoIfL8; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWvoIfL8"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e4e6230f42so417295a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 21:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718251313; x=1718856113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJaDSa797MY17nS4a5if7Rb6JlRlk5uXJ+GCNVQhL1w=;
        b=CWvoIfL8LbnzXAp8Qbn6jpiF+IF3fU/KvguezV7C7aHNHzNH5RQ2GgVkOvlOLpX/Yg
         5N9UaQRBMLtV4H7qadPwEWyCoGOVRNH+cHRJGrXr/gsWlTi+/IahqNq9iX5lqLJqt8wJ
         OYPXA5PGZ1tRQKJGsWRVd6HYLnHDml2EJ7ZJdRgPTFUGffTB8XHz6BnmjJEeI7hHDVTL
         4tKF1dtQe6oZu+2QukZzrbZ255v3ixWGtyelX2f5ZteVaxXtd9wq+OshYMu2hSpctqcf
         v7C59/bcND/g/2uio4PL/XyadG97fgnVYI+wtdrd66us3fcpMrD7x17yP4Igy+G44fN+
         ehPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718251313; x=1718856113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJaDSa797MY17nS4a5if7Rb6JlRlk5uXJ+GCNVQhL1w=;
        b=nKtU7sFyX5UV07fgiJWUTSN0yosqG5yqVexCBwntk78aPUlqHEvPxMY9VhcufIPRDR
         VU4nOcaYvchmzXn4GLe7fu5+Q0xwWT8+KgU5cFiABfDXcEaUwlANVxhuZ4uSXVXNJuJO
         cAYnbdV3eF9OJ2mVoZ7bSVvsB3gJSle20bLLczSePsqAXa2h3H9I7RiNIlE5pJRmJy+s
         jb6c7xaHrAvBmOkvZkEQDJLU7k5RIkfnBKn48Gcn39V1f1wA2fYwYfz9A4DvAEPFL7U0
         /sAkp10GKcWtGo+4rjP15Vcy33eavFlzW+j+Aliuukj+UmzA2xEzhu/cwPyoTOyV4jxR
         OOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUauRLJHtVVdg4fbmRdAfCDYfDa9jD9JRtGFvO6YAKeo7xDus7BtIiyVLI1UN5fIBwfD3L8dSlS5G+f41mIALTwbfvg3keJu0dho5ZsT84=
X-Gm-Message-State: AOJu0YyR48yvfw2r4YL0HAs/g3YBMrY/nYw3xaWJ8AJVz21tSbWFZSC3
	+7k8+hAot+V9icNQnVwM3SOsGVunAuzLOlW3ppG9lcZAfybzIlfxsJoiYp4zLKtoDg==
X-Google-Smtp-Source: AGHT+IFJBeE36n5k3y3gqiEAOK2Fj9UQA5/4dragsMOeIyx4nO5HPXjyyBJM3YumzuHRvFqHyWBPEQ==
X-Received: by 2002:a17:90a:928c:b0:2bd:801f:dabd with SMTP id 98e67ed59e1d1-2c4bd79faebmr2291564a91.3.1718251312781;
        Wed, 12 Jun 2024 21:01:52 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c45f8949sm466909a91.34.2024.06.12.21.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 21:01:52 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	hi@alyssa.is,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	virtio-comment@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] virtio-vsock: Extend the spec with an `order`
Date: Thu, 13 Jun 2024 12:01:36 +0800
Message-Id: <20240613040136.2497504-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <oxfm5jjjim3tv6q22o4mr2oidz4yljjs4lmadcccfbkdlrudrp@fo7wkwb2p3up>
References: <oxfm5jjjim3tv6q22o4mr2oidz4yljjs4lmadcccfbkdlrudrp@fo7wkwb2p3up>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> >> >Add a new field, named `order`, to the `virtio_vsock_config`.
> >> >
> >> >There are two questions about the field that are valuable to discuss:
> >> >
> >> >(1) Do we really need the `order` instead of a `default_device`?
> >> >
> >> >IMHO, the answer is yes.
> >> >
> >> >The `order` is more generic than the `default_device`. The device with the
> >> >lowest order is the default device. Moreover, the `order` field determines
> >> >the sequence of devices in the list. The device list is the same every time
> >> >the system starts.
> >> >
> >> >The device with lower order means it is more important. Also, it means it
> >> >has more likely to be used. Those devices are placed in the front of the
> >> >list for performance purposes.
> >>
> >> This is an implementation details IMHO.
> >>
> >> BTW perhaps the biggest point in favor of `order` IMHO is the fact that
> >> this works very well with hotplung/hotunplug, since if we add at runtime
> >> a device that is to become the default, we don't need to change the
> >> configuration of the previous device.
> >
> >I'll rework on this. BTW, shall I add this to the document? Currently, they
> >only exist on the commit message.
> 
> Maybe yes, what about adding a new paragraph to describe the 
> multi-device support?

I'd like to add some descriptor after "\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.":

\begin{description}
\item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
\item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
\item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
It allows to enable multiple backends, e.g. virtio-vsock, vhost-vsock, etc.
The isolation of virtqueues benefits from this feature.
\end{description}

Is this ok?

> >In addition, I think "index" is a more proper term than "order". So I'd
> >like to rename it in the next version.
> 
> Yep, I agree.
> 
> >
> >> >Last but not least, the `order` represents a sort of priority, which might
> >> >be used in the future. For example, assuming that if there are two devices
> >> >that are eligible to be used, the kernel will return a device with higher
> >> >priority.
> >> >
> >> >(2) Why is the type of the `order` `le16`?
> >> >
> >> >The maximum number of devices, in the implementation on the kernel, is 16
> >> >for performance reasons. The users could compile the kernel to support more
> >> >devices. The type of `le16` supports up to 65536 devices, which is enough
> >> >to cover most cases.
> >> >
> >> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >> >---
> >> > device-types/vsock/description.tex | 16 ++++++++++++++++
> >> > 1 file changed, 16 insertions(+)
> >> >
> >> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> >> >index 3fbc02a..dc3bd66 100644
> >> >--- a/device-types/vsock/description.tex
> >> >+++ b/device-types/vsock/description.tex
> >> >@@ -58,6 +58,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> > \begin{lstlisting}
> >> > struct virtio_vsock_config {
> >> > 	le64 guest_cid;
> >> >+	le16 order;
> >> > };
> >> > \end{lstlisting}
> >> >
> >> >@@ -83,11 +84,26 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >> > \hline
> >> > \end{tabular}"
> >> >
> >> >+The \field{order} field is required while the multi-device feature is
> >>
> >> We should use the feature name, so something like: "is required if
> >> VIRTIO_VSOCK_F_MULTI_DEVICE feature is negotiated."
> >
> >It will be updated on the v2.
> >
> >> >+enabled. A list is used to organize devices.
> >>
> >> This is an implementation detail.
> >>
> >> > The field is used to determine
> >> >+the order of the device in the list.
> >>
> >> I think we should not talk about a list, because that seems too close to
> >> implementation, but focus on the meaning we want to give to the
> >> ordering. For now I think we can only talk about the one with the
> >> smallest value being the device used by default.
> >
> >Ok. These will be removed.
> >
> >> > The device with the lowest order is
> >> >+the default one when no CID is specified.
> >>
> >> "no CID is specified" in which case?
> >
> >I'll elaborate a bit more about the case in the v2.
> >
> >> >+
> >> >+The rules are:
> >>
> >> "The rules" for what?
> >
> >The rules is for the new field "order". I'll update it on the v2.
> 
> Yep, I think we should be more clear on what the rules refer and who 
> should respect them.
> 
> Thanks,
> Stefano

Okay, I'll update them.

Thanks,
Xuewei
