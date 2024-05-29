Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F516D9DD
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716978269; cv=none; b=HEPMjvus/BTby34BGPtq2by477yLFBWt8O74usONdiAW6AY0/d3uw7monWzVub9TZdrZc4vM5aGg6vAoTLcXjflaEFmAasdphHMEfofi2ZMFrf/wQIJ+IdUR/WLFh7DnSnbJUPeHoR14QoSbqmhb/xaNmJyE6WO7AoVhyEXdG4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716978269; c=relaxed/simple;
	bh=QRyU80OIbVqpazGZ6UjqjvUWZIBE4IqPfUR3JD0UMOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1Eb0Av6+ixIrtkkg2WM5KnLuLnALuaugyzganECS1ZXnjwJCQ8qzPSbb/nufbA+22uCdpoORAqksQQhxEcpF2biZ3SHfFsxU9Go3GCPOj3P/94i6eK0XrdUf0CrT7EITf5zCXwl883hwH2VCvAsR4n1Dms/RyZcidcIz+0Bw24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gp+iMHgE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gp+iMHgE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f4a52b94c3so16525915ad.3
        for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716978267; x=1717583067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUsESC8eNRekMaJKbxGmZa+PFXzNpRo5b5/vI6rgMAo=;
        b=gp+iMHgEpb0Z7ilrwnhjWuuflE2oq1Nx9YS4jHHs54hGHssnfkkF2vSf3El8YhLLHH
         lfmYY/c4AZNRFLEZpYzasl1HirtalzLT9SFwlW/7+Q37klfHuPxyPAo9fIpoIJTxta/D
         0IVWOume7/rMbJb14shSarB1h5lC0mLYLGv0ydPai+9oiLrW1+t6E/iCOomORZq6ZXnF
         7N0TarOhOX49MOtAbXR/DebcT+H9yuMaJ2sf1GwQL0i5tcZlAFwH/sKFUyFmpuQeg9hA
         d6bVtfBElNWcBJTdtfrbM961NPHvi8vao9pQXsFbQWkWJB7SGG57j9X0eh8uufnKS8+v
         ztnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716978267; x=1717583067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUsESC8eNRekMaJKbxGmZa+PFXzNpRo5b5/vI6rgMAo=;
        b=sxm2HePbuu/beCTY+PBKiUDxWG/TEtKTGLE/x5ZbKdRrKZdidQVK1KE63+38z/gVh5
         mSFPPjQd6LXeG3Amvacs1W+FPWZe6Kh4T/1uqTGHV+hQwJMES53A59DQdVU3t7nP8kUm
         hJhJP/oZIHJ+xPXBxz5tsAbe2oW6K7d6kIUif9bhwRAbONyACrwcH0bxx3jxi3W7kV+m
         7IyOPmVZzIP98zDNR2swGPDzxu7atqe/2iQcBSkcrt4l3w96IjtHUMknZ7gamnZ9UwqU
         mF41Dt4asrvSeO3D0vg1KjrJ/XMuD8mIkI0D7erEfzW8ADXxkuQUBNf5/y/JMZDVS/HE
         c/LA==
X-Gm-Message-State: AOJu0Yw6tx15zncIBdCULes4gNeYRbRRWHsybZQMV+W163z+gAtMgZk9
	WKv9tfUVmcHlzVRYp6vGHWwNlZEftmZPq8DwAQGq/1INIpof/7rEji7vyp4Io38=
X-Google-Smtp-Source: AGHT+IFIjG1jHRGYUcQ3NXQv7gQozQOPXvupQbt382F3wxXyTgqFOpTVPPrsot9ny9VVCH2hHo2EIw==
X-Received: by 2002:a17:902:f54c:b0:1f4:a008:29d3 with SMTP id d9443c01a7336-1f4a0082e01mr85313955ad.15.1716978267321;
        Wed, 29 May 2024 03:24:27 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c97063asm95832865ad.150.2024.05.29.03.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:24:26 -0700 (PDT)
Date: Wed, 29 May 2024 15:54:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <20240529102424.s7rnq7zqqjy6bfdw@vireshk-i7>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <20240520092332-mutt-send-email-mst@kernel.org>
 <20240521105706.tbyigihommrasdua@vireshk-i7>
 <20240521073925-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521073925-mutt-send-email-mst@kernel.org>

On 21-05-24, 07:40, Michael S. Tsirkin wrote:
> I feel a non-normative section is enough for this.
> Just convert should/must to direct speech.

Like this ?

diff --git a/content.tex b/content.tex
index 0a62dce5f65f..8af005398877 100644
--- a/content.tex
+++ b/content.tex
@@ -631,8 +631,84 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
 \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 
-Virtio can use various different buses, thus the standard is split
-into virtio general and bus-specific sections.
+Devices and drivers can use different transport methods to enable
+interaction, for example PCI, MMIO, or Channel I/O. The transport
+methods define various aspects of the communication between the device
+and the driver, like device discovery, exchanging capabilities,
+interrupt handling, data transfer, etc. For example, in a host/guest
+architecture, the host might expose a device to the guest on a PCI bus,
+and the guest will use a PCI-specific driver to interact with it.
+
+The standard contains sections describing the transport-agnostic parts
+of virtio, and sections describing how individual transports implement
+virtio.
+
+\section{Virtio Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements}
+
+\subsection{Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Transport Requirements}
+
+The transport provides a mechanism for the driver to discover the
+device.
+
+The transport provides a mechanism for the driver to identify the device
+type.
+
+The transport provides a mechanism for communicating virtqueue
+configurations between the device and the driver.
+
+The transport allows multiple virtqueues per device. The number of
+virtqueues for a pair of device-driver are governed by the individual
+device protocol.
+
+The transport provides a mechanism that the device and the driver use to
+access memory for implementing virtqueues.
+
+The transport provides a mechanism for the device to notify the driver
+and a mechanism for the driver to notify the device, for example
+regarding availability of a buffer on the virtqueue.
+
+The transport may provide a mechanism for the driver to initiate a reset
+of the virtqueues and device.
+
+The transport provides a mechanism for the driver to read the device
+status. The transport MUST provide a mechanism for the driver to change
+the device status.
+
+The transport provides a mechanism to implement configuration space
+between the device and the driver.
+
+\subsection{Device Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Device Requirements}
+
+The device keeps any data associated with a device-initiated transaction
+accessible to the driver until the driver acknowledges the transaction
+to be complete.
+
+The device doesn't access the contents of a virtqueue before the driver
+notifies, in a transport defined way, the device that the virtqueue is
+ready to be accessed.
+
+The device doesn't access or modify buffers on a virtqueue after it has
+notified the driver about their availability.
+
+The device resets the virtqueues if requested by the driver, in a
+transport defined way, if the transport provides such a method.
+
+\subsection{Driver Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Driver Requirements}
+
+The driver acknowledges device notifications, as mandated by the
+transport.
+
+The driver doesn't access virtqueue contents before the device notifies
+about the readiness of the same.
+
+The driver doesn't access buffers, after it has added them to the
+virtqueue and notified the device about their availability. The driver
+MAY access them after the device has processed them and notified the
+driver of their availability, in a transport defined way.
+
+The driver may ask the device to reset the virtqueues if, for example,
+the driver times out waiting for a notification from the device for a
+previously queued request.
 
 \input{transport-pci.tex}
 \input{transport-mmio.tex}

-- 
viresh
