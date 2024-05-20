Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B871143AB2
	for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716211675; cv=none; b=c2OPiN0HQyIwb21zKTLh477OHW23omVLi60MSvK8EsJWT71YfoxgpjUHUix+QDsB4+umeZOfKBcBq/N3U954tUXYnaH2okPI25ZQAiSACYyb4tRC+a71LcvBYugtslTgCTu9L6ot6pzFj8VOHm1R61h+r77sDte+QOY3k8eZgsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716211675; c=relaxed/simple;
	bh=/+i9yRau+V1/Q2uIK959Yx/424x+EEj3feDUJFYKPw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jqebVZkeXbKl4AP3JAQtfDnl5159bt2QTTszZPqHg1aO+OCuXEeyN40t9oq6fNlGu1j9WqfFtUyPLNIaVd5UNJR7Awf51Ymx30KJMWw8pqjg09t4/zecs0rgGevWjPwVmi1fyCFXJrPfuT0rQr7WJ/qFt0nPjtx6R4DKDKZAJjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Phrx4HIA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Phrx4HIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716211672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=woqPc/tfncqCrWj/XN6wbeLa4GjYAe/9g+nZeeCb2w4=;
	b=Phrx4HIAxDAD7mKWdEXDP5LZJmCm4bzOKDl+XBJj/W4RPGj35Dd/rJqPglYunMIbyrBAdZ
	/jhzFHDXmSi3edGejmXRPNdmF8BHRHc9voWEfTABGf6oTxJWcacjale9DSmFVM72dpS3J/
	cMaQ5WhFMAd2BkhJv2qOrSWLr7nUEjE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-y_e9ZCOAMKmAiNx01ZagxQ-1; Mon, 20 May 2024 09:27:51 -0400
X-MC-Unique: y_e9ZCOAMKmAiNx01ZagxQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52391bebf79so2622931e87.1
        for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 06:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211669; x=1716816469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woqPc/tfncqCrWj/XN6wbeLa4GjYAe/9g+nZeeCb2w4=;
        b=XBbIPaEfaOR/z7jJ+IZ7Nhu8CB7lbyTnS3yadfJEcUft2Re8prGEQIPM9g5KZkjSOX
         2uXVvJ+SWKJOKXFa2Lkx1YKCQTN/ij0xqhAQDH+KkBbvcW8+AttE4OiqHPXlNjitwoYD
         /10vPC7EgLJV+Ii2jCD3vZkkp0YsJEwA6YIOPzHB8i8RkjhHBUkiEX2PqaMN6PPazuJU
         Z1Saz8qPJ3RSO1y+Bj54eK/zBOvjoVUXiX3pVVx3ssaSFF0CnFOkGZRkiYGOSLkLF+E/
         hFFwNqKiwpBSm3JajOkBlRnVOXAcNWJRUxZsVJ/XFnmZIiMtK0qtFtujkVc/22PzbB95
         FVfA==
X-Gm-Message-State: AOJu0YwA48uqxTi3AxdX1cusx4qkLKza8+SGzsbD7afD5UE9BBYn6zMl
	IXZjGP+B4RpLoHSMW5fg6YbLeBXs2ft+64PsHtVBOrz2Pvb3YgitvZJ5h6zEDVYxjpEiPuY1Hv4
	fUrhf3iEBzVRBT/ui/CFzH5hx/hJbdxyTJhA1QcvyEPVYw0OkBpUueti5hIkPdlnh
X-Received: by 2002:a05:6512:3b91:b0:51a:cdc4:dd48 with SMTP id 2adb3069b0e04-524079a81d3mr2485880e87.3.1716211669215;
        Mon, 20 May 2024 06:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMG9xH8YjWA3swFh7Na1+GJ++idhwmyFMEiLFCK2SBfwW6cb5eG/9Wv1tsF/XEA64Wxn6JTw==
X-Received: by 2002:a05:6512:3b91:b0:51a:cdc4:dd48 with SMTP id 2adb3069b0e04-524079a81d3mr2485871e87.3.1716211668625;
        Mon, 20 May 2024 06:27:48 -0700 (PDT)
Received: from redhat.com ([2a02:14f:177:b718:2429:1dc5:dc6b:7d42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52232d0a81esm3609185e87.259.2024.05.20.06.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:27:48 -0700 (PDT)
Date: Mon, 20 May 2024 09:27:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <20240520092332-mutt-send-email-mst@kernel.org>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Dropped virtio-dev this is clearly spec discussion.

On Mon, May 20, 2024 at 02:59:40PM +0530, Viresh Kumar wrote:
> The virtio documentation currently doesn't define any generic
> requirements that are applicable to all transports. They can be useful
> while adding support for a new transport.
> 
> This commit tries to define the same.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2->V3:
> - Minor fixes.
> - Added Reviewed by from Alex.
> 
> V1->V2:
> - Lot of changes after discussions with Alex and Cornelia.
> - Almost a rewrite of the first commit.
> - Add Transport normative sections.
> 
>  commands.tex    |  3 +-
>  conformance.tex | 14 +++++++++
>  content.tex     | 78 +++++++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 92 insertions(+), 3 deletions(-)
> 
> diff --git a/commands.tex b/commands.tex
> index 25ea8ee3bc78..b64b14424bd2 100644
> --- a/commands.tex
> +++ b/commands.tex
> @@ -7,7 +7,8 @@
>  % How we format a field name
>  \newcommand{\field}[1]{\emph{#1}}
>  
> -% Mark a normative section (driver or device)
> +% Mark a normative section (driver or device, or transport)
> +\newcommand{\transportnormative}[3]{#1{Transport Requirements: #2}\label{transportnormative:#3}}
>  \newcommand{\drivernormative}[3]{#1{Driver Requirements: #2}\label{drivernormative:#3}}
>  \newcommand{\devicenormative}[3]{#1{Device Requirements: #2}\label{devicenormative:#3}}
>  \newcounter{clausecounter}

> diff --git a/conformance.tex b/conformance.tex
> index dc00e84e75ae..4a873169ce63 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -11,6 +11,10 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  
>  Conformance targets:
>  \begin{description}
> +\item[Transport] A transport MUST conform to one conformance clauses:
> +  \begin{itemize}
> +    \item Clause \ref{sec:Conformance / Transport Conformance}.
> +  \end{itemize}
>  \item[Driver] A driver MUST conform to four conformance clauses:
>    \begin{itemize}
>      \item Clause \ref{sec:Conformance / Driver Conformance}.
> @@ -66,6 +70,14 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>    \end{itemize}
>  \end{description}
>  
> +\conformance{\section}{Transport Conformance}\label{sec:Conformance / Transport Conformance}
> +
> +A transport MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{transportnormative:Virtio Transport Options / Virtio Transport Requirements}
> +\end{itemize}
> +
>  \conformance{\section}{Driver Conformance}\label{sec:Conformance / Driver Conformance}
>  
>  A driver MUST conform to the following normative statements:
> @@ -93,6 +105,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Supplying Buffers to The Device / Sending Available Buffer Notifications}
>  \item \ref{drivernormative:General Initialization And Device Operation / Device Initialization}
>  \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Transport Requirements}
>  \item \ref{drivernormative:Reserved Feature Bits}
>  \end{itemize}
>  
> @@ -172,6 +185,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / The Virtqueue Descriptor Table}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Scatter-Gather Support}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Transport Requirements}
>  \item \ref{devicenormative:Reserved Feature Bits}
>  \end{itemize}
>  
> diff --git a/content.tex b/content.tex
> index 0a62dce5f65f..a79993b5ed69 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -631,8 +631,82 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>  
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  
> -Virtio can use various different buses, thus the standard is split
> -into virtio general and bus-specific sections.
> +Devices and drivers can use different transport methods to enable
> +interaction, for example PCI, MMIO, or Channel I/O. The transport
> +methods define various aspects of the communication between the device
> +and the driver, like device discovery, exchanging capabilities,
> +interrupt handling, data transfer, etc. For example, in a host/guest
> +architecture, the host might expose a device to the guest on a PCI bus,
> +and the guest will use a PCI-specific driver to interact with it.
> +
> +The standard is split into sections describing general virtio
> +implementation and transport-specific sections.
> +

This makes it seem like trasport is distinct from both
device and driver. Makes no sense to me.

> +\section{Virtio Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements}
> +
> +\transportnormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
> +The transport MUST provide a mechanism for the driver to discover the
> +device.
> +
> +The transport MUST provide a mechanism for the driver to identify the
> +device type.
> +
> +The transport MUST provide a mechanism for communicating virtqueue
> +configurations between the device and the driver.
> +
> +The transport MUST allow multiple virtqueues per device. The number of
> +virtqueues for a pair of device-driver are governed by the individual
> +device protocol.
> +
> +The transport MUST provide a mechanism that the device and the driver
> +use to access memory for implementing virtqueues.
> +
> +The transport MUST provide a mechanism for the device to notify the
> +driver and a mechanism for the driver to notify the device, for example
> +regarding availability of a buffer on the virtqueue.
> +
> +The transport MAY provide a mechanism for the driver to initiate a
> +reset of the virtqueues and device.
> +
> +The transport SHOULD provide a mechanism for the driver to read the
> +device status. The transport MUST provide a mechanism for the driver to
> +change the device status.
> +
> +The transport MUST provide a mechanism to implement config space between
> +the device and the driver.
> +
> +\devicenormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
> +
> +The device MUST keep any data associated with a device-initiated
> +transaction accessible to the driver until the driver acknowledges the
> +transaction to be complete.
> +
> +The device MUST NOT access the contents of a virtqueue before the
> +driver notifies, in a transport defined way, the device that the
> +virtqueue is ready to be accessed.
> +
> +The device MUST NOT access or modify buffers on a virtqueue after it has
> +notified the driver about their availability.
> +
> +The device MUST reset the virtqueues if requested by the driver, in a
> +transport defined way, if the transport provides such a method.
> +
> +\drivernormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
> +
> +The driver MUST acknowledge device notifications, as mandated by the
> +transport.
> +
> +The driver MUST NOT access virtqueue contents before the device notifies
> +about the readiness of the same.
> +
> +The driver MUST NOT access buffers, after it has added them to the
> +virtqueue and notified the device about their availability. The driver
> +MAY access them after the device has processed them and notified the
> +driver of their availability, in a transport defined way.
> +
> +The driver MAY ask the device to reset the virtqueues if, for example,
> +the driver times out waiting for a notification from the device for a
> +previously queued request.
>  

This makes no sense in a normative section.
Normative statements are for implementations not spec writers.
If you think of defining lots of new transports
(questionable) I think a new non-normative section
along the lines of newdevice.tex will make sense.


>  \input{transport-pci.tex}
>  \input{transport-mmio.tex}
> -- 
> 2.31.1.272.g89b43f80a514

