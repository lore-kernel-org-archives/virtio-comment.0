Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CCC1AD25D
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361669; cv=none; b=kfA4J3MnLGT0OfFFkwc7tODETaUm0EyNBBInEcJskN3TVGasYfhnamAGp83HJ6t24ioA3z4GjIWt1GAy8b2xCpdg/hu/Wtp829nv/OwVYOaLm2nnS6Dw+AashZ+WJyICX5/PMBzYXpHJNV2/tBTYcIBJvorZlCvnSlvtU6vXajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361669; c=relaxed/simple;
	bh=7mFRHG0I7Pt4MuCyqpWlE997v6QfCQgE5PUAjmfgn30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FahKehLsiTkXQxU6+bUZXtsjmI58acaVyDZes3ktnQCVXbjfLuPGLMRE0ImKs0MR0XoOK14vySiLILZpwIHmDDOndQkrRTT2Tk9HLtMYocd91BNSjwAaBs03n2wqcPES9LtcATcCWL+ReH+euxcNe1sBtHmSyzWs2eOSOHBKriw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQgpZsGl; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQgpZsGl"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-70f6732a16dso3128818a34.3
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725361666; x=1725966466; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3DF+LP+vSWtNJzZRdI5epcI43jKXw4dlizVKVwDQMIY=;
        b=TQgpZsGlgvawTlk3NUYJnXuyRfXwIUXVUz2UbHJ9ne8WD3T94ac7UugZf6fp03KZcs
         9X7SzvdeChDyKcoqKUSYNBNnXd5ZsVTYE6uErk9GhUImNWT7LOmLGcVcaYnfzW9AJvuK
         tmpBuvqhcmeP91Du9unlJzBQ4zdpg/jwrC1rXhFFkZNNdDW28pub73Vbboplc/JHzDm9
         CUKZlLgdFvz0L7Ty3/3NNGz+7Lgrg5kid1WfcneQopxDmilp6XNyEu/aTXGukSmCgc6Q
         wSmmBax2A+eU7tTl7rr22Oudm2ZWeILWtpzkMQT8coDNlRJapRs0DQ6OGP00nUeTicfj
         tofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361666; x=1725966466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DF+LP+vSWtNJzZRdI5epcI43jKXw4dlizVKVwDQMIY=;
        b=vP+b70Eg2s5SoRjYFVmTodrXLN17PkXPmJTo3R3HswvhnXtg6mAwLCyxGcvAI7lwIm
         FkWXIF0/l1DAelZFPhx0DVzS3egtWa5FLM6RXmR6KYkg7VD7RpM48K6l4PJ+GZnTtp0u
         wZunfoXQrx1DE1ExPLCLMNCehXsj/77WA1Hg1Lf4OGq4liKJCCTnp0GO2JL2Q5qEWQ4u
         nr+Inb3vwfYoC2bkrUchZUfcBYgJ58cXmiXNm8CDimOKpmBE0wNj8Zyv2bsbErG3+Krq
         oF6R4luK/gQzedaZNihDOZA3RANzlKulu0n7chEa42yKnY7O0qQYi1DUraI5tHqL/cps
         V7Qg==
X-Gm-Message-State: AOJu0Yz6wZgFSiwEA4quGUEvo5j7MLeggJgGL5UaKM+gLeydwQwvEorE
	l8224Jv1ZKp/pv65Z4sHs11YOZycEClrXSy8ETqo8T2xSCsBgcjWzl3wk/2+uav/r8mh6nE+EYk
	b
X-Google-Smtp-Source: AGHT+IHd3N5+bYNt5jF7lG0ZvDRwb0zh+Bq3PSlCkLKpU3IIwuGWIyreKOpFhnBpvkAATLBL/8UpVA==
X-Received: by 2002:a05:6358:9144:b0:1b6:18d:277b with SMTP id e5c5f4694b2df-1b7e393361emr1833983755d.21.1725361666485;
        Tue, 03 Sep 2024 04:07:46 -0700 (PDT)
Received: from localhost ([122.172.83.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e575b7ecsm8258135b3a.189.2024.09.03.04.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 04:07:45 -0700 (PDT)
Date: Tue, 3 Sep 2024 16:37:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V10] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240903110743.mtoocphkrwurijef@vireshk-i7>
References: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>

On 14-08-24, 20:27, Viresh Kumar wrote:
> The current Virtio documentation lacks a set of generic requirements
> applicable to all transports. Defining these generic requirements could
> be beneficial when integrating support for a new transport.
> 
> This section outlines the essential requirements that any transport
> method must adhere to.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V9->V10:
> - s/multiple// and s/employ/use/
> 
> V8->V9:
> - Change order of the statements.
> - Specify DEVICE_NEEDS_RESET and FEATURES_OK bits.
> - Language improvements.
> 
> V7->V8:
> - Remove separate sections for device/driver requirements.
> - Remove optional requirements.
> - Other generic improvements.
> 
> V6->V7:
> - Remove parts that talk about accessing content of the virtqueue.
> 
> V5->V6:
> - Move the changes to a new appendix section.
> - Clarify the requirements a bit more based on review comments.
> 
> V4->V5:
> - s/The transport/A transport/
> - s/MUST provide/provides/
> - Added some text for transport requirements.
> 
> V3->V4:
> - Remove the normative sections and use direct speech.
> - Change wording at few places.
> 
> V2->V3:
> - Minor fixes.
> - Added Reviewed by from Alex.
> 
> V1->V2:
> - Lot of changes after discussions with Alex and Cornelia.
> - Almost a rewrite of the first commit.
> - Add Transport normative sections.
> 
>  main.tex         |  2 ++
>  newtransport.tex | 43 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 newtransport.tex
> 
> diff --git a/main.tex b/main.tex
> index b1913d65e964..6d337217a3d1 100644
> --- a/main.tex
> +++ b/main.tex
> @@ -42,6 +42,8 @@
>  
>  \input{newdevice.tex}
>  
> +\input{newtransport.tex}
> +
>  % acknowledgements
>  \input{acknowledgements.tex} 
>  
> diff --git a/newtransport.tex b/newtransport.tex
> new file mode 100644
> index 000000000000..b3e0df42fa2d
> --- /dev/null
> +++ b/newtransport.tex
> @@ -0,0 +1,43 @@
> +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> +
> +Devices and drivers utilize various transport methods to facilitate
> +communication, such as PCI, MMIO, or Channel I/O. These transport
> +methods determine aspects of the interaction between the device and the
> +driver, including device discovery, capability exchange, interrupt
> +handling, and data transfer. For instance, in a host/guest architecture,
> +the host might expose a device to the guest via a virtual PCI bus, and
> +the guest would use a PCI device driver to interface with the device.
> +
> +This section outlines the mandatory requirements that a transport method
> +implements.
> +
> +A transport provides a mechanism to implement configuration space for
> +the device.
> +
> +A transport provides a mechanism for the driver to identify the device
> +type.
> +
> +A transport provides a mechanism for the driver to read the device's
> +FEATURES_OK and DEVICE_NEEDS_RESET status bits.
> +
> +A transport provides a mechanism for the driver to modify the device's
> +status.
> +
> +A transport provides a mechanism for the driver to read and modify the
> +device's feature bits.
> +
> +A transport allows one or more virtqueues to be implemented by the
> +device. The number of virtqueues is device specific and not specified by
> +the transport.
> +
> +A transport provides a mechanism for the driver to communicate virtqueue
> +configuration and memory location to the device.
> +
> +A transport provides a mechanism for the device to send device
> +notifications to the driver, such as used buffer notifications.
> +
> +A transport provides a mechanism for the driver to send driver
> +notifications to the device, such as available buffer notifications.
> +
> +A transport provides a mechanism for the driver to initiate a device
> +reset.

Dear TC,

I'd like to request a vote on solving issue 201.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/201

-- 
viresh
