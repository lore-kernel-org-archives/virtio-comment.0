Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7553E25
	for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207934; cv=none; b=JCkzsAl25zSUr3NztAaPcEobTUfXsonbEaqI5sPfk8xKJ0aRsbL81IHGtfkF+tFG6rA9bfPMEqlyIg+wUu6+ApqyJXEt/lVbtRecPNmQ+VbaOHinxvW63UxVHQR4jC+adG+/E6tSEHpZcnVtxa38lGfCUn/sWT3Z12cs9Z4SFLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207934; c=relaxed/simple;
	bh=ADp2wIrRZ7nlkpHVYidA3pOq9VUmqH/ueWD++VP9+uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IFoTvvsqR7MDnDFXglwjF1K1Jkin8Wjpwvgw0117SMjtgVDbOy79WeZD2hAA4f2S7VSYxqwpGF2FSmZFwkxSGriziDIXHixjszI/xZiVuIbbWshoOOpjqE4RlzFoMrt4LstV8CgOh8dU6NsunsPbgA34F+rdM8ptNyg2vdNpimQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KKunWhhG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KKunWhhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716207931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1t7mElWwrowydIqs7dDFH9pH6tnc/zcmy4nCpm3//i0=;
	b=KKunWhhGj6kMN5e04OJB40O/X45cBYLwSVex44AlwaB6u1RPwYrmb44qoV0Tpf2kNTzQqo
	G8Iu/VmJVY7uwRF73YCz9whUfwTA2fN03K8IPqV7cLEoZOXZI9rcOwJTU31jQ2NqKPkocg
	w/2QvgJl1ufm7nlal98hrykT2g2hhWg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-I8upmivRMOqg5Vbd-BXTpA-1; Mon, 20 May 2024 08:25:27 -0400
X-MC-Unique: I8upmivRMOqg5Vbd-BXTpA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-41ff4ec2bb5so41841295e9.2
        for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 05:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716207926; x=1716812726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1t7mElWwrowydIqs7dDFH9pH6tnc/zcmy4nCpm3//i0=;
        b=jTw//chigW1ZpDbuzJcCChxClpr8ZFVHDBz+xTEviGOBE/RPTH65Pk6TTZBx3pLbNf
         yLatu+KHL2TwkzGqiaoiaFmPbp0gNxZhWywAKVGdfh+j9o0zRYVrnfsklta400xqAUTa
         87gG63+74kI2MpIfJEg1Mo1Si1/UqhKPdk3bVIeFCQAcwc5auW6O62aPyFkxTM5NSQsB
         Ie2aR8ZI3MRQOWeAbkg+A6fXw7SqZfPdbuDPtQCkS2mfJ97v0rJCNeva9vWUH7rs4mfX
         YMkbIZchWyNyF9meBWuTYT/ssSWk9Ddsgi3kyP2VMXmeRpeAJvuMBqtzCNeoXp1DoQfh
         /vXw==
X-Forwarded-Encrypted: i=1; AJvYcCVf8/PmyUTBNFmomrT9sVBo7laaHJDu3IA1Qc7XpbAEJQt55Ine5iBrtYOgnKgT2P2AZqLsry2sd6Q6Pl6khxduaoRhQ2R/ak1FYV5Y5Fo=
X-Gm-Message-State: AOJu0YzvmIOJBGFINwYrIXWn55u+EENqd91oKQd7pe/fRIrroZdfXQXO
	F0/wM8dq24XseVVlNHgnpgC3Ix+ysqEKQtXTjM5OWBrjRuqg9KFjj8V8UuLtxBYflSC6MXB6v/a
	DozDva7m7FojCwXDYUjYFIk9JPTKAn/Zxgr+TaJ5UQKknn4erng3VvrKnPxelLJO2
X-Received: by 2002:a05:600c:3595:b0:41a:e995:b924 with SMTP id 5b1f17b1804b1-41fead6504emr210948055e9.33.1716207926272;
        Mon, 20 May 2024 05:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWq1ogxjRnqFOvao9GIs4OOUXsHfsyJzAAHbUgHN7kxmlXOJw7Jz7Nv3zfoa88nHabAO0WaA==
X-Received: by 2002:a05:600c:3595:b0:41a:e995:b924 with SMTP id 5b1f17b1804b1-41fead6504emr210947715e9.33.1716207925525;
        Mon, 20 May 2024 05:25:25 -0700 (PDT)
Received: from redhat.com ([2a02:14f:177:b718:2429:1dc5:dc6b:7d42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm29039963f8f.113.2024.05.20.05.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 05:25:24 -0700 (PDT)
Date: Mon, 20 May 2024 08:25:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"virtio-dev@lists.linux.dev" <virtio-dev@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <20240520082400-mutt-send-email-mst@kernel.org>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <PH0PR12MB54815E4558E7577AC219F5F9DCE92@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54815E4558E7577AC219F5F9DCE92@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 20, 2024 at 09:42:02AM +0000, Parav Pandit wrote:
> Michael,
> 
> > From: Viresh Kumar <viresh.kumar@linaro.org>
> > Sent: Monday, May 20, 2024 3:00 PM
> > To: virtio-comment@lists.linux.dev; virtio-dev@lists.linux.dev
> 
> There is still cross posting to virtio-dev.

Well we say "do not do this" in the list subscription form.
Viresh, what gives?

> Is the list open to community now?

It's been open for a week. I think it's fair to say whoever wanted to
subscribe, has subscribed.

> If not, can you please send out the guidance and timeline to open it on virtio-comment list?
> 
> This way contributors can avoid resending it multiple times.
> 
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>; Vincent Guittot
> > <vincent.guittot@linaro.org>; Alex Bennée <alex.bennee@linaro.org>; stratos-
> > dev@op-lists.linaro.org; Manos Pitsidianakis
> > <manos.pitsidianakis@linaro.org>; Cornelia Huck <cohuck@redhat.com>;
> > Michael S. Tsirkin <mst@redhat.com>
> > Subject: [PATCH V3 Resend] virtio-transport: Clarify requirements
> > 
> > The virtio documentation currently doesn't define any generic requirements
> > that are applicable to all transports. They can be useful while adding support
> > for a new transport.
> > 
> > This commit tries to define the same.
> > 
> > Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V2->V3:
> > - Minor fixes.
> > - Added Reviewed by from Alex.
> > 
> > V1->V2:
> > - Lot of changes after discussions with Alex and Cornelia.
> > - Almost a rewrite of the first commit.
> > - Add Transport normative sections.
> > 
> >  commands.tex    |  3 +-
> >  conformance.tex | 14 +++++++++
> >  content.tex     | 78
> > +++++++++++++++++++++++++++++++++++++++++++++++--
> >  3 files changed, 92 insertions(+), 3 deletions(-)
> > 
> > diff --git a/commands.tex b/commands.tex index
> > 25ea8ee3bc78..b64b14424bd2 100644
> > --- a/commands.tex
> > +++ b/commands.tex
> > @@ -7,7 +7,8 @@
> >  % How we format a field name
> >  \newcommand{\field}[1]{\emph{#1}}
> > 
> > -% Mark a normative section (driver or device)
> > +% Mark a normative section (driver or device, or transport)
> > +\newcommand{\transportnormative}[3]{#1{Transport Requirements:
> > +#2}\label{transportnormative:#3}}
> >  \newcommand{\drivernormative}[3]{#1{Driver Requirements:
> > #2}\label{drivernormative:#3}}
> > \newcommand{\devicenormative}[3]{#1{Device Requirements:
> > #2}\label{devicenormative:#3}}  \newcounter{clausecounter} diff --git
> > a/conformance.tex b/conformance.tex index dc00e84e75ae..4a873169ce63
> > 100644
> > --- a/conformance.tex
> > +++ b/conformance.tex
> > @@ -11,6 +11,10 @@ \section{Conformance Targets}\label{sec:Conformance
> > / Conformance Targets}
> > 
> >  Conformance targets:
> >  \begin{description}
> > +\item[Transport] A transport MUST conform to one conformance clauses:
> > +  \begin{itemize}
> > +    \item Clause \ref{sec:Conformance / Transport Conformance}.
> > +  \end{itemize}
> >  \item[Driver] A driver MUST conform to four conformance clauses:
> >    \begin{itemize}
> >      \item Clause \ref{sec:Conformance / Driver Conformance}.
> > @@ -66,6 +70,14 @@ \section{Conformance Targets}\label{sec:Conformance
> > / Conformance Targets}
> >    \end{itemize}
> >  \end{description}
> > 
> > +\conformance{\section}{Transport Conformance}\label{sec:Conformance /
> > +Transport Conformance}
> > +
> > +A transport MUST conform to the following normative statements:
> > +
> > +\begin{itemize}
> > +\item \ref{transportnormative:Virtio Transport Options / Virtio
> > +Transport Requirements} \end{itemize}
> > +
> >  \conformance{\section}{Driver Conformance}\label{sec:Conformance / Driver
> > Conformance}
> > 
> >  A driver MUST conform to the following normative statements:
> > @@ -93,6 +105,7 @@ \section{Conformance Targets}\label{sec:Conformance
> > / Conformance Targets}  \item \ref{drivernormative:Basic Facilities of a Virtio
> > Device / Packed Virtqueues / Supplying Buffers to The Device / Sending
> > Available Buffer Notifications}  \item \ref{drivernormative:General Initialization
> > And Device Operation / Device Initialization}  \item
> > \ref{drivernormative:General Initialization And Device Operation / Device
> > Cleanup}
> > +\item \ref{drivernormative:Virtio Transport Options / Virtio Transport
> > +Requirements}
> >  \item \ref{drivernormative:Reserved Feature Bits}  \end{itemize}
> > 
> > @@ -172,6 +185,7 @@ \section{Conformance
> > Targets}\label{sec:Conformance / Conformance Targets}  \item
> > \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues /
> > The Virtqueue Descriptor Table}  \item \ref{devicenormative:Basic Facilities of
> > a Virtio Device / Packed Virtqueues / Scatter-Gather Support}  \item
> > \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory
> > Regions}
> > +\item \ref{devicenormative:Virtio Transport Options / Virtio Transport
> > +Requirements}
> >  \item \ref{devicenormative:Reserved Feature Bits}  \end{itemize}
> > 
> > diff --git a/content.tex b/content.tex
> > index 0a62dce5f65f..a79993b5ed69 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -631,8 +631,82 @@ \section{Device Cleanup}\label{sec:General
> > Initialization And Device Operation /
> > 
> >  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
> > 
> > -Virtio can use various different buses, thus the standard is split -into virtio
> > general and bus-specific sections.
> > +Devices and drivers can use different transport methods to enable
> > +interaction, for example PCI, MMIO, or Channel I/O. The transport
> > +methods define various aspects of the communication between the device
> > +and the driver, like device discovery, exchanging capabilities,
> > +interrupt handling, data transfer, etc. For example, in a host/guest
> > +architecture, the host might expose a device to the guest on a PCI bus,
> > +and the guest will use a PCI-specific driver to interact with it.
> > +
> > +The standard is split into sections describing general virtio
> > +implementation and transport-specific sections.
> > +
> > +\section{Virtio Transport Requirements}\label{sec:Virtio Transport
> > +Options / Virtio Transport Requirements}
> > +
> > +\transportnormative{\subsection}{Virtio Transport Requirements}{Virtio
> > +Transport Options / Virtio Transport Requirements} The transport MUST
> > +provide a mechanism for the driver to discover the device.
> > +
> > +The transport MUST provide a mechanism for the driver to identify the
> > +device type.
> > +
> > +The transport MUST provide a mechanism for communicating virtqueue
> > +configurations between the device and the driver.
> > +
> > +The transport MUST allow multiple virtqueues per device. The number of
> > +virtqueues for a pair of device-driver are governed by the individual
> > +device protocol.
> > +
> > +The transport MUST provide a mechanism that the device and the driver
> > +use to access memory for implementing virtqueues.
> > +
> > +The transport MUST provide a mechanism for the device to notify the
> > +driver and a mechanism for the driver to notify the device, for example
> > +regarding availability of a buffer on the virtqueue.
> > +
> > +The transport MAY provide a mechanism for the driver to initiate a
> > +reset of the virtqueues and device.
> > +
> > +The transport SHOULD provide a mechanism for the driver to read the
> > +device status. The transport MUST provide a mechanism for the driver to
> > +change the device status.
> > +
> > +The transport MUST provide a mechanism to implement config space
> > +between the device and the driver.
> > +
> > +\devicenormative{\subsection}{Virtio Transport Requirements}{Virtio
> > +Transport Options / Virtio Transport Requirements}
> > +
> > +The device MUST keep any data associated with a device-initiated
> > +transaction accessible to the driver until the driver acknowledges the
> > +transaction to be complete.
> > +
> > +The device MUST NOT access the contents of a virtqueue before the
> > +driver notifies, in a transport defined way, the device that the
> > +virtqueue is ready to be accessed.
> > +
> > +The device MUST NOT access or modify buffers on a virtqueue after it
> > +has notified the driver about their availability.
> > +
> > +The device MUST reset the virtqueues if requested by the driver, in a
> > +transport defined way, if the transport provides such a method.
> > +
> > +\drivernormative{\subsection}{Virtio Transport Requirements}{Virtio
> > +Transport Options / Virtio Transport Requirements}
> > +
> > +The driver MUST acknowledge device notifications, as mandated by the
> > +transport.
> > +
> > +The driver MUST NOT access virtqueue contents before the device
> > +notifies about the readiness of the same.
> > +
> > +The driver MUST NOT access buffers, after it has added them to the
> > +virtqueue and notified the device about their availability. The driver
> > +MAY access them after the device has processed them and notified the
> > +driver of their availability, in a transport defined way.
> > +
> > +The driver MAY ask the device to reset the virtqueues if, for example,
> > +the driver times out waiting for a notification from the device for a
> > +previously queued request.
> > 
> >  \input{transport-pci.tex}
> >  \input{transport-mmio.tex}
> > --
> > 2.31.1.272.g89b43f80a514
> > 
> 

