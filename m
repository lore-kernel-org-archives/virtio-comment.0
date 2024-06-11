Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9013174EC1
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094075; cv=none; b=NFVO3bNspekd+dzRndwnQXtXKYRRV14NSabbnPg7X8uexg6ZbxMhJ7I9fi8Xd2ZBwGw2tDcgyWcw4XY5HBbKDL/qSDjN2pWBhDigG0icPkO7mBJ4j+mGVQ45G+KYS30ZnO30+xZq8GDUSkx6RMv6sXjJ4CafPrt+XWjPIX6bEsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094075; c=relaxed/simple;
	bh=Uv5IXiXLgcGFnNo5W4d+8TfgVNM4tmqp0cPCq8kS2lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ABewLMbS80ZuziQ0lzTuoCCqDp1rXi3kQmEDLzgxWSyJOqXTj56OY9dNZ3QC7lvqPCeT1FdwRrHuwyhrpp1SjMsa309LoS75ZsSkwGUfZHZ6LuGAZr0H/HWjrV806BlR7EwLUdqW+eAEMLk8zU6DzO63hNY/l9QDQ/zINgzDOlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PMJ1VkbI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PMJ1VkbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718094071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiD9QyOlg8W+u47crI/mk2tKw6AS0h0Mw9TB+WHUAEc=;
	b=PMJ1VkbIdFg9fzloM23gSy6q3EOqSQtP908wi2JNwRmMEXpcbTCIU6htXJqz61W+dCvBi/
	5i9+mmWYmT+sISzpJpOq65bRPiQIv9cNO+OhASGMDdis4yLjorrsdkdw3HPrlMRQyYjxmU
	yVWykAETatoELjpEFTH44Z1f2qaEmH4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-OqbTkSGuNZed7CIhx-cVlQ-1; Tue, 11 Jun 2024 04:21:10 -0400
X-MC-Unique: OqbTkSGuNZed7CIhx-cVlQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4217104c425so23372585e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 01:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718094069; x=1718698869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiD9QyOlg8W+u47crI/mk2tKw6AS0h0Mw9TB+WHUAEc=;
        b=MkzWMTbUPUOXJ+9XYYPVlQiN2wZRz3VCHSo9uFaOtvOYNawXn/OM0ri5VGMl0KyoKo
         596aIhoAJewSew3fJlVAnBitNt05ialc//iD3P9rTX0S77bSfbakEh1FIPQHEnp6B/06
         n7Sj3BMZkqI5SL8UEK3m767KTEJmkkHBRbbahpgokGHcciEqlrqj8nQmHVN0nckbw1F9
         2AoCjVEy5s/74SVCfoz/0qHPV7GGHtnQa7b5Mrp56OP2Rjt9LNH/eqQb5JpI8Ug1CIRA
         /EC8gX6KFhhHHdibqC30Jq+4vKSwYHauqkqDhTt5Ej8hD1M7hWyVV09bGHhq/n3lvyX+
         fVHg==
X-Forwarded-Encrypted: i=1; AJvYcCVRVgSKMRh8cGmfZ795g45twrFD37f12ULzrsb06cLNcxUXZdmKRSOEcvIe5NXAoSl9mq1HW0GI2k/uriY3iLIguJHP1ipOHemcwPVBIN0=
X-Gm-Message-State: AOJu0YzMf9dy2gZVveU8X12/VMbIL4Va6RxgsYU2brn2h+3/wzOWPPZD
	1VAiW1mSkPbu6U+BY3sylKmZtvP4ml7SrUonEwhFdqGli/ZuFfAoZN8MhwxEojrk/SF59HKuBXW
	+hLsOLdUu1Pn95SKOFnb/y9IhbyBchyTme7F0aIYJqC8c8Yf3552smOS+u7Epy15o
X-Received: by 2002:a05:600c:5010:b0:421:81b7:1e23 with SMTP id 5b1f17b1804b1-42181b72430mr55111795e9.4.1718094068954;
        Tue, 11 Jun 2024 01:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZI8q2myPfkfga1CSRizBouWV3UUgUJC9j0OpBRHa0w5BC+7aZ9SszeLSHkJxhHPK9XGANXg==
X-Received: by 2002:a05:600c:5010:b0:421:81b7:1e23 with SMTP id 5b1f17b1804b1-42181b72430mr55111605e9.4.1718094068616;
        Tue, 11 Jun 2024 01:21:08 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4217de88933sm102180515e9.44.2024.06.11.01.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 01:21:08 -0700 (PDT)
Date: Tue, 11 Jun 2024 10:21:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, hi@alyssa.is, virtio-comment@lists.linux.dev, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [RFC PATCH 2/2] virtio-vsock: Extend the spec with an `order`
Message-ID: <qhikhsdegxqpvluwe2m3cbq7xclyol5qnnag2lqsd3cpwlqkvu@jbu7utft67ih>
References: <20240528054725.268173-1-niuxuewei.nxw@antgroup.com>
 <20240528054725.268173-3-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240528054725.268173-3-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 28, 2024 at 01:47:25PM GMT, Xuewei Niu wrote:
>Add a new field, named `order`, to the `virtio_vsock_config`.
>
>There are two questions about the field that are valuable to discuss:
>
>(1) Do we really need the `order` instead of a `default_device`?
>
>IMHO, the answer is yes.
>
>The `order` is more generic than the `default_device`. The device with the
>lowest order is the default device. Moreover, the `order` field determines
>the sequence of devices in the list. The device list is the same every time
>the system starts.
>
>The device with lower order means it is more important. Also, it means it
>has more likely to be used. Those devices are placed in the front of the
>list for performance purposes.

This is an implementation details IMHO.

BTW perhaps the biggest point in favor of `order` IMHO is the fact that 
this works very well with hotplung/hotunplug, since if we add at runtime 
a device that is to become the default, we don't need to change the 
configuration of the previous device.

>
>Last but not least, the `order` represents a sort of priority, which might
>be used in the future. For example, assuming that if there are two devices
>that are eligible to be used, the kernel will return a device with higher
>priority.
>
>(2) Why is the type of the `order` `le16`?
>
>The maximum number of devices, in the implementation on the kernel, is 16
>for performance reasons. The users could compile the kernel to support more
>devices. The type of `le16` supports up to 65536 devices, which is enough
>to cover most cases.
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> device-types/vsock/description.tex | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
>diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>index 3fbc02a..dc3bd66 100644
>--- a/device-types/vsock/description.tex
>+++ b/device-types/vsock/description.tex
>@@ -58,6 +58,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> \begin{lstlisting}
> struct virtio_vsock_config {
> 	le64 guest_cid;
>+	le16 order;
> };
> \end{lstlisting}
>
>@@ -83,11 +84,26 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> \hline
> \end{tabular}"
>
>+The \field{order} field is required while the multi-device feature is

We should use the feature name, so something like: "is required if 
VIRTIO_VSOCK_F_MULTI_DEVICE feature is negotiated."

>+enabled. A list is used to organize devices.

This is an implementation detail.

> The field is used to determine
>+the order of the device in the list.

I think we should not talk about a list, because that seems too close to 
implementation, but focus on the meaning we want to give to the 
ordering. For now I think we can only talk about the one with the 
smallest value being the device used by default.

> The device with the lowest order is
>+the default one when no CID is specified.

"no CID is specified" in which case?

>+
>+The rules are:

"The rules" for what?

>+
>+\begin{enumerate}
>+\item It doesn't have to be continuous.
>+
>+\item It cannot have conflicts.
>+\end{enumerate}
>+
> \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
>
> \begin{enumerate}
> \item The guest's cid is read from \field{guest_cid}.
>
>+\item The device's order is read from the \field{order}.

Should we add "if the VIRTIO_VSOCK_F_MULTI_DEVICE feature is 
negotiated."?

Thanks,
Stefano

>+
> \item Buffers are added to the event virtqueue to receive events from the device.
>
> \item Buffers are added to the rx virtqueue to start receiving packets.
>-- 
>2.34.1
>

