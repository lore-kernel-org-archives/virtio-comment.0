Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B984A12D1E9
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720687299; cv=none; b=QyStuOjzr/MsRtlsjiYUIyn+ICmxywvAUvNjp2jPJJ5zdDiXqasVRALzcf7WusIgBWg6fgLl3wopQisQqX17F9moZ3+WV+OmqwtO0Sof0xsF/ChAkVIdNiMr2009/WDhf6gTHMZPfzWOdRl8FwJbpttndobixalhTAWX9CZwOTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720687299; c=relaxed/simple;
	bh=o4Ip64YP7Si6xXem8L0mEZp+kGJ6J/cNWTaTp56G7mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AtLqiXI24Y7L38DljcAuaXRVjb+c2dyFAxm0ZjfgREz/PD+Ck55gYxbs+frzGXOSF6AyrTEqWUgpOB07Nq7sA4z0puaPZzw/MG025JhNSoWBnMr20b+tXG7bt2NHxEqVZGAPaHSin+BbXVaDBDMEKGoKXgM94vnoiSWL6FU6pXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YmL0MK66; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YmL0MK66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720687296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inrmb+ZiG2wT2d/mNOzfh3MVj2+0H+VlyigRgFxb+rU=;
	b=YmL0MK66VFhGeCdrYxWe0pO6CptLFwJ2OB3zEPcNrb+PcRzK5WHxHqb3Inv4nCffTakEFu
	S9UNslJ8SS1jNBXtOF+1pqgpBLddX+wGM8+Fnb+Q6QCjI+PmltrkrZqhjgbVBNgWo/6jmi
	5vXi0DfBCqmjrbfhhCxXYNDsaHciHT0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-62mvJh2dNimPrsyTSa39QA-1; Thu, 11 Jul 2024 04:41:35 -0400
X-MC-Unique: 62mvJh2dNimPrsyTSa39QA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77e044ff17so43171666b.3
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 01:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720687293; x=1721292093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inrmb+ZiG2wT2d/mNOzfh3MVj2+0H+VlyigRgFxb+rU=;
        b=SaR4Jn14qTxKpGngeX2qfatS7bMT9xclwGycepqEXHWywBnzfYZFm5NKmfoQ30YMSv
         H+PcoaTJ73zgNaschVbLgS+hbna1tYUBS4Ronvi/mqDKhbTP7ypUAJaX8XVl5hCmUv6p
         5ujAFsdqgNAzuGvWxqkI2SMVMkmNUUuzYpldGoUAThCUnKST1IELmvnra57HfgfkLgOs
         JYbcZgAobawOkpNKeZylbV4IYWodhKOUrtkvSHC7x/riUEGnsaal+BMeUgngHHnPArMf
         KH214ucHLFZCJR6EuZCpoVtQkzZuDZ0CMrNgzOhu9M6pRDALc+Xz6TqurpqZu3053iM5
         dG+A==
X-Gm-Message-State: AOJu0Yy78XP54MtQjEiYvJXeysQrdl2/FLDp17IdOFcOsCHcxfhM7W2m
	QzByLofUrPCJOHv9Wyr+nVVbDditbr8VCjf58jeXqPQJBQ9HQPiUJuGOGYm04uqGBb0j1fQMfMF
	IG4VDhsLnaETKa4P7NT1TSXLUVRs9wWn9/Dfsp+STQYJhe6eK50ePs4n0yOPtZvGd3CEy5VAi
X-Received: by 2002:a17:906:5ad9:b0:a77:cf09:9c5f with SMTP id a640c23a62f3a-a780b6fe88emr543266666b.37.1720687293443;
        Thu, 11 Jul 2024 01:41:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS1uelnr+97CiqUG0qyQGyIteLmyiJ/uaQ+8sS0x427b739jdhjfkFN5QNQyeS0JA3WgdK9A==
X-Received: by 2002:a17:906:5ad9:b0:a77:cf09:9c5f with SMTP id a640c23a62f3a-a780b6fe88emr543263666b.37.1720687292724;
        Thu, 11 Jul 2024 01:41:32 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-153.retail.telecomitalia.it. [82.57.51.153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dfa93sm232152766b.65.2024.07.11.01.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:41:32 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:41:28 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev, 
	Vincent Guittot <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>, 
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <zzzc2nvseptvarhpwv5vckka5yvtptgebufw3ll4oe2yascfek@5so5pdt4ur7w>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 11, 2024 at 01:18:18PM GMT, Viresh Kumar wrote:
>The virtio documentation currently doesn't define any generic
>requirements that are applicable to all transports. They can be useful
>while adding support for a new transport.
>
>This commit tries to define the same under a new Appendix section.
>
>Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>---
>V6->V7:
>- Remove parts that talk about accessing content of the virtqueue.
>
>V5->V6:
>- Move the changes to a new appendix section.
>- Clarify the requirements a bit more based on review comments.
>
>V4->V5:
>- s/The transport/A transport/
>- s/MUST provide/provides/
>- Added some text for transport requirements.
>
>V3->V4:
>- Remove the normative sections and use direct speech.
>- Change wording at few places.
>
>V2->V3:
>- Minor fixes.
>- Added Reviewed by from Alex.
>
>V1->V2:
>- Lot of changes after discussions with Alex and Cornelia.
>- Almost a rewrite of the first commit.
>- Add Transport normative sections.
>
> main.tex         |  2 ++
> newtransport.tex | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 74 insertions(+)
> create mode 100644 newtransport.tex
>
>diff --git a/main.tex b/main.tex
>index b1913d65e964..6d337217a3d1 100644
>--- a/main.tex
>+++ b/main.tex
>@@ -42,6 +42,8 @@
>
> \input{newdevice.tex}
>
>+\input{newtransport.tex}
>+
> % acknowledgements
> \input{acknowledgements.tex}
>
>diff --git a/newtransport.tex b/newtransport.tex
>new file mode 100644
>index 000000000000..2abd76e5b037
>--- /dev/null
>+++ b/newtransport.tex
>@@ -0,0 +1,72 @@
>+\chapter{Creating New Transports}\label{sec:Creating New Transports}
>+
>+Devices and drivers can use different transport methods to enable
>+interaction, for example PCI, MMIO, or Channel I/O. The transport
>+methods define various aspects of the communication between the device
>+and the driver, like device discovery, exchanging capabilities,
>+interrupt handling, data transfer, etc. For example, in a host/guest
>+architecture, the host might expose a device to the guest on a PCI bus,
>+and the guest will use a PCI-specific driver to interact with it.
>+
>+There are some mechanisms that any transport is required to implement,
>+and some requirements that devices and drivers are required to follow.
>+
>+\section{Transport Requirements}\label{sec:Creating New Transports / Transport Requirements}
>+
>+A transport provides a mechanism for the driver to discover the device.

I agree that this would be desirable, but for example IIUC the MMIO 
transport does not provide this, in fact we have to specify to the 
kernel the address where to find the devices.

Should we put it more as something desirable but not required?

Having said that I don't know whether to use different words or split 
"Transport Requirements" into 2 sub sections "Required Requirements" and 
"Optional Requirements".

Thanks,
Stefano

>+
>+A transport provides a mechanism for the driver to identify the device
>+type.
>+
>+A transport provides a mechanism for communicating virtqueue
>+configurations between the device and the driver.
>+
>+A transport allows multiple virtqueues per device. The number of
>+virtqueues for a pair of device-driver are governed by the individual
>+device protocol.
>+
>+A transport provides a mechanism that the device and the driver use to
>+access memory for implementing virtqueues.
>+
>+A transport provides a mechanism for the device to notify the driver and
>+a mechanism for the driver to notify the device, for example regarding
>+availability of a buffer on the virtqueue.
>+
>+A transport provides a mechanism for the driver to initiate a reset of
>+the device.
>+
>+A transport provides a mechanism to reset an individual virtqueue.
>+
>+A transport provides a mechanism for the driver to read the device
>+status. A transport provides a mechanism for the driver to change the
>+device status.
>+
>+A transport provides a mechanism to implement configuration space
>+between the device and the driver.
>+
>+\section{Device Requirements}\label{sec:Creating New Transports / Device Requirements}
>+
>+The device keeps any data associated with a device-initiated transaction
>+accessible to the driver until the driver acknowledges the transaction
>+to be complete.
>+
>+The device resets itself if requested by the driver, in a transport
>+defined way, if the transport provides such a method.
>+
>+The device resets an individual virtqueue if requested by the driver,
>+in a transport defined way, if the transport provides such a method.
>+
>+\section{Driver Requirements}\label{sec:Creating New Transports / Driver Requirements}
>+
>+The driver acknowledges device notifications, as mandated by the
>+transport.
>+
>+The driver accesses queued buffers after the device has processed them
>+and notified the driver of their availability. This mechanism is
>+transport defined.
>+
>+The driver asks the device to reset itself if, for example, the driver
>+times out waiting for a notification from the device for a previously
>+queued request.
>+
>+The driver asks the device to reset an individual virtqueue.
>-- 
>2.31.1.272.g89b43f80a514
>
>

