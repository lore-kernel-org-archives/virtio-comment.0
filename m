Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC4F1A76C4
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722416660; cv=none; b=qvBZFb0rj8fxKOitkTvGpRzymwP9LJ8IRd7WWEM1iu72Tk7DG42PjV60bImzVy7tuTviburMz244LexUmBL2coHElHKb3jXmglLFW0ZfXiLLGJ81MSwS339HNeN94dUsVyVfK5Dlpr6aw2/0gVC3BMdCWCRvVHZo+c5gz+nxhCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722416660; c=relaxed/simple;
	bh=/2hZybB5qGrZ7EqMBpBMSssQ33hwSe261HUdl703hIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4j5dBtq7hGFepwOZgORSLlR7eyIjvmfdU3XhZxUZr0Ek5jUGNMdF31NZ+eok6fn7UpjBn1cen6VMCBB5IlnzMhQ26ePVTDuiFLicYwaFGNr27GJLaoWAh6Hkfls1LzmjF4QU9DzK9rzVvOlNl3St7ZbdKf/NJP7Xf1pjo3/3No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3S5NMQg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3S5NMQg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc611a0f8cso38461125ad.2
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722416658; x=1723021458; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dZ7uwU7kzTJIp0Q67ia3k5nurHjMeuGTsIvr6LnOdIo=;
        b=T3S5NMQgd4KiAkxegu+9Mj6YAgBffIUCwm1Lo1pUYRlmU5GyXBQwOYW7UFzPheVz9G
         aC7kReaxKAtlhkrSck+irL42tUFCBGhP5/bo6IbijytOpg6gbMW28rAdxBCY5Ow/0SnW
         6MdrPJoHF5aK6qwuBU35exvGb2NVjrOBDQqYe0TTOxBdshfEUCk43CcHK9JARG5m48Qe
         OCRcayKo1fLi1XdmmukRhSSrmIN5ieMoW2zb3UhkgF+IKW3h8Et2N3aPinWjmAj+p7ya
         1LV3WhyClRPck0Q+HbzZxG2kPvU1KKAIVhp0Af34s7JyilpVJy4S11gnlx5ahMUg8/5+
         Ms5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722416658; x=1723021458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ7uwU7kzTJIp0Q67ia3k5nurHjMeuGTsIvr6LnOdIo=;
        b=j9KU6kjC+tu2emDvZrF/4dinpNyUiSzQ8AsmFQiAmtQ5FIx83LuqVy2kthQVfBey0o
         Useu1HFeDGpRMgZu//s6incb9PZPxmAh9WtbyA3ftVzgmzzp0E4rYow6Hj3vtKf+y5WW
         80DTrWpXC9pSBOXTMufu4dvoefD6rB0YSwiBjVO9abMbLbcvw7DbfhefpkInQkqxBrQ/
         AU2M8BISWXNSiqpU/j2G4EKZj9T4SszgMToBikqzvhNmHnqi0DyZbTHh7E9TKSpclJ/7
         ivBwmarDI/xUy7b+pGpQcqxCiPI63It18eashd9kVvy/08oOfAMLNePlvtRc5bq03mdk
         yKOw==
X-Gm-Message-State: AOJu0YyFbuUrypwbicutucrBDdVkYsZ/WMy+OLPsjkxe5GwfB+zyN+bK
	rzDsamnyUhLS5NjUo6j5V/VF/9izdkTBdNgDKHomUTmH2AnWh25cWftxz4rzbkU=
X-Google-Smtp-Source: AGHT+IHolxiSMAznoGxxXG1pzDWSpSkijSzzKMx5O6HUmRTN+OkVjzkJXv++nEsXLlEjgAEtCJYfow==
X-Received: by 2002:a17:902:e542:b0:1fb:5e2c:986c with SMTP id d9443c01a7336-1ff0489f69emr117364405ad.45.1722416657767;
        Wed, 31 Jul 2024 02:04:17 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee8489sm115701045ad.148.2024.07.31.02.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 02:04:17 -0700 (PDT)
Date: Wed, 31 Jul 2024 14:34:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH V8] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240731090414.m5hkzvq34djq6awl@vireshk-i7>
References: <1ef4e58fdbbc2c94305aa8fac856da882da1cdc2.1722324234.git.viresh.kumar@linaro.org>
 <20240730091155-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730091155-mutt-send-email-mst@kernel.org>

On 30-07-24, 09:14, Michael S. Tsirkin wrote:
> Let's order it sensibly though, in the order in which stuff is used

Right.

diff --git a/newtransport.tex b/newtransport.tex
new file mode 100644
index 000000000000..3b760250a4c0
--- /dev/null
+++ b/newtransport.tex
@@ -0,0 +1,44 @@
+\chapter{Creating New Transports}\label{sec:Creating New Transports}
+
+Devices and drivers utilize various transport methods to facilitate
+communication, such as PCI, MMIO, or Channel I/O. These transport
+methods determine multiple aspects of the interaction between the device
+and the driver, including device discovery, capability exchange,
+interrupt handling, and data transfer. For instance, in a host/guest
+architecture, the host might expose a device to the guest via a virtual
+PCI bus, and the guest would employ a PCI device driver to interface
+with the device.
+
+This section outlines the mandatory requirements that a transport method
+implements.
+
+A transport provides a mechanism to implement configuration space for
+the device.
+
+A transport provides a mechanism for the driver to identify the device
+type.
+
+A transport provides a mechanism for the driver to read the device's
+status bit.
+
+A transport provides a mechanism for the driver to modify the device's
+status.
+
+A transport provides a mechanism for the driver to read and modify the
+device's feature bits.
+
+A transport allows one or more virtqueues to be implemented by the
+device. The number of virtqueues is device specific and not specified by
+the transport.
+
+A transport provides a mechanism for the driver to communicate virtqueue
+configuration and memory location to the device.
+
+A transport provides a mechanism for the device to send device
+notifications to the driver, such as used buffer notifications.
+
+A transport provides a mechanism for the driver to send driver
+notifications to the device, such as available buffer notifications.
+
+A transport provides a mechanism for the driver to initiate a device
+reset.

-- 
viresh
