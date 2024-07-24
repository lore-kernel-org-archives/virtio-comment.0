Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32695695
	for <virtio-comment@lists.linux.dev>; Wed, 24 Jul 2024 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721817943; cv=none; b=QF8bI1WLCY+wC2HQ/w6vpIXMw5fSBmOeiUK/Ggm0YNhM+HSN26z94T+xzv59UUmXeBrP/ohHtP2l1Mt0SajPGLvQbF4Xfq3W8ktFMs/GwcA5ZphOBixdH5Jn3cCeFMA+F3+sarEpwB1ubDudLKDtNyXYfmGpmWa1ySKgJiXpBIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721817943; c=relaxed/simple;
	bh=2A0Dv8XYF+2T5QanXX5F/8xQkd5bI7txJH1YnJhvNXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBOsQgkU0B2/ftVUzu+RIuUA8GDfPN6wPXHeCnby8WBOvRvaVuvxuamp96zt4IYKSPklSEQPFyVde/xlNWpel+XayzCuYaSOLsRDxnyRcuRaWKi7dN9r8hUpkhbdsXOB7X12IGcS9U4HZR5qjwt52UHdkey7RvaaB+g6VZFzIyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZsYICZN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZsYICZN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fb3b7d0d56so5521355ad.1
        for <virtio-comment@lists.linux.dev>; Wed, 24 Jul 2024 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721817941; x=1722422741; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWLz5BER7gu+lqpnar9zuB7bzMf8k2fbk6f8NmTA42U=;
        b=sZsYICZN5JZa6HTKLzUgPmKoe8+PpdtNFF880wQAuipxMPD52vSyKFDehWH7cvkw/7
         JMMdyVZ9DZrY4rqNTrHF1dVmWh/cMq7O5PljjE47AokEuJqjpjllFrw7l2GwSmX3EQqs
         0qER1s0KA9kXV86Poo+Dfg6h1vhZ3hjXQZEWwi8fgeuwYIu7cAxVqkf80iTnuiCKOmFg
         gp61RhDzJOe0gv20jPy2n5MSJYcck1+/++Wt/PJh0/AKkirTqE0fIbkZw/n+vc/KEwxr
         W+UJOdlLix4fQT0qojem1q7sFUxxEV/fYc6Z4MxnvGTcf0JqVhVB+lNUdV2X8MTM9MQV
         vARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721817941; x=1722422741;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWLz5BER7gu+lqpnar9zuB7bzMf8k2fbk6f8NmTA42U=;
        b=WJZOUn+vBWum7waqhGHYk6KXcBnM2a9WLmeq4jlQsbkVJr2YFsszVe5JZKMP71+QAh
         vy5JLsl8A13mti2AxpLTSYNGVEwYA7P3Lhyw2qIMfIUCE78HCjIV/k0zM4LkqQgro+Um
         zCKrZugIMLF02KF1geKTGrUYY8zuINYOmzfyMSDCoePbio+HZyFYlv9X3wevcBaom7mp
         csRF+FAK9W5gDdCDbP79CEHA23TisWMiM4HXYEwTl/LG66pvSC0ueJ5o8WwQwi5pKpTd
         +iJ1gefJmb3qgjkBYnqpVWPoOqrpacn0Se12AleFhivflzLffjaxwJ6VsHh398iWmW7Y
         zV9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlhTR6vB8TNSuJETM1bY5TKKqK8M7O6BQDU/QD81M16jdMN7MuQiZRgayy+Y26J7eGO2KKX2QBbZEbySM1oDbVchdqqks2k7qBjAFM4Rk=
X-Gm-Message-State: AOJu0Ywbkq+nWMZF9AAmB8SPClnP/TihOaAtPIHEF8NoBRbKngsJEY/i
	MxTOsg2PSDM91tEH0OXiz9CBVkXsQxp4/PWXFT8CRp2Wtm5QvYNnqTOOHAFwD6c=
X-Google-Smtp-Source: AGHT+IHC1yMXO0Nn4Q5MuDKtt4w1z57GSkY0zNgBMDu9idZWU6iOBg7HJAgAgNWwz5iDrzx5kxPB0Q==
X-Received: by 2002:a17:903:41cc:b0:1fd:ac9f:4050 with SMTP id d9443c01a7336-1fdac9f42ebmr71649335ad.35.1721817940778;
        Wed, 24 Jul 2024 03:45:40 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f4310basm90376265ad.184.2024.07.24.03.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 03:45:40 -0700 (PDT)
Date: Wed, 24 Jul 2024 16:15:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240724104537.5632obtaek7yr4ct@vireshk-i7>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>

On 11-07-24, 13:18, Viresh Kumar wrote:
> The virtio documentation currently doesn't define any generic
> requirements that are applicable to all transports. They can be useful
> while adding support for a new transport.
> 
> This commit tries to define the same under a new Appendix section.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V6->V7:
> - Remove parts that talk about accessing content of the virtqueue.

I have tried to simplify the requirements now based on the discussion over the
list. Do they look better now ?

diff --git a/newtransport.tex b/newtransport.tex
new file mode 100644
index 000000000000..8f7a21dc64e2
--- /dev/null
+++ b/newtransport.tex
@@ -0,0 +1,37 @@
+\chapter{Creating New Transports}\label{sec:Creating New Transports}
+
+Devices and drivers can use different transport methods to enable
+interaction, for example PCI, MMIO, or Channel I/O. The transport
+methods define various aspects of the communication between the device
+and the driver, like device discovery, exchanging capabilities,
+interrupt handling, data transfer, etc. For example, in a host/guest
+architecture, the host might expose a device to the guest on a PCI bus,
+and the guest will use a PCI-specific driver to interact with it.
+
+This section specifies the mandatory requirements that any transport
+needs to implement.
+
+\section{Transport Requirements}\label{sec:Creating New Transports / Transport Requirements}
+
+A transport provides a mechanism to implement configuration space
+between a pair of device-driver.
+
+A transport provides a mechanism for a pair of device-driver to
+communicate virtqueue configurations and virtqueue memory location.
+
+A transport provides a mechanism for the driver to identify the device
+type.
+
+A transport allows one or more virtqueues for a given device-driver
+pair. The number of virtqueues per pair are governed by the individual
+device protocol.
+
+A transport provides a mechanism for the device and driver to notify
+each other, for example regarding availability of a buffer on the
+virtqueue.
+
+A transport provides a mechanism for the driver to initiate a reset of
+the device.
+
+A transport provides a mechanism for the driver to read or modify the
+device status.
