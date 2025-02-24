Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C7D194A44
	for <virtio-comment@lists.linux.dev>; Mon, 24 Feb 2025 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740395396; cv=none; b=Qz0ywnFeleMb+I3dVjmCzff30nQa/und6U0e8b06AxmWJTJ++jag4VRKTOsfdQw0UYrvhEzVP0+Aw7feByWWzlRHBd4fI8YC5Dzl07Cl6H4lO73nI39TJMQL5KnxdiuaZcD1uLFB/KdoSE1h3VtFJTZwOz81lW7KbYyqHV30Zhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740395396; c=relaxed/simple;
	bh=FKdqEJbpmjbD5aDqbvQUQECcUE76oQlT8VH7KhmY+BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uLWRdpfHBbS71Z575GV+p+lLYviUaEhULSuDxjyLK2+9cRgQwdHaylYMZxXj/488E1db6F9t+4V9U1vbtB0T3ODO4CgiBACEmbnvqwXDdHwu63jQwqPBBAKORsB9A1blEzY7HzYWV86bxGjoIPoAM4x5K4YZ/xjxdwZ7rp4W1gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aJsZeyCj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aJsZeyCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740395392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FgzuFIkyfBL9shMw200expqjU4j4sDeLQRkPyhXCWZM=;
	b=aJsZeyCjwI/Zk6uS+zZnCB5X2PRvIZUbKVkuUTcy6yH9vy2Fn6YZxT5eW9JDLajIMMytT2
	Jz2PXLASYHprWcQlu9/P8RdNguYhwqkzcjTpHCPlEED/HubpYpIxcng52g0d6Y8V64182g
	AafJyWewBWbGG/USRbG/aX9yUCSMwkY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-UjdAUkEUMo2VB3a9Yfg43g-1; Mon, 24 Feb 2025 06:09:50 -0500
X-MC-Unique: UjdAUkEUMo2VB3a9Yfg43g-1
X-Mimecast-MFC-AGG-ID: UjdAUkEUMo2VB3a9Yfg43g_1740395390
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4394b2c19ccso33017405e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 24 Feb 2025 03:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740395390; x=1741000190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgzuFIkyfBL9shMw200expqjU4j4sDeLQRkPyhXCWZM=;
        b=Tj2bpASb2HfZcVES+svMcTEFTI/t4DPa2lealHUvVjNMEou3kZtuBKSVEy9hjCzFqT
         6YBVqj0Iar4w3cLG/4lpuy+KDRgvOfacuvEUZ9ewdLz6aLXpYqurDbkeTxYVmuXxy4B3
         xueKws0q+RCnZAEmeWwiLOPydfP5d7JzqxvjmkCy1hf0oCuyl9OgIDHk0Hyfd3IFNkqY
         57aEbOeGQrt2ynQIUn81Zvzx4xF15K4DcAH5QRoGY8IlZTJ92ihzYL1HdtfN5FkeLOCz
         Fu8gY1ZkCOC0s/guGZ7eO7KkUM7O7Ly8C1bNzHeUqArXKYnx87UFTO8DAT8iXYMJd65+
         Sj2w==
X-Gm-Message-State: AOJu0YzxMvbc0Hiyb2sJ15LLBpQjVq7SvbgL3pl2EZOH1rnKxtZd3I4n
	2V0jl0JNsYfxsKefOc2a1B1c6gBkuitxFBFAsuQa0CY7NroKDrEb2xWjp0dKsh1I4uIs9nfJlCb
	hR3w0Yj0eLAUYKb4QvmCIc2bwHIzdaM9oHGimoHhLd5j50eWSmsemWV6rHIdFK1mB
X-Gm-Gg: ASbGncu49zfz3/A3EEUq0hhsFy/KmhCftL4g2HTRwFYSyzHr46kQWnQiFyf78R/9ZhI
	Vq257FZ4FQ1cOY4ZmRmUoevzu1DJY2d0Ed6KTOH40/FLM0YyQ7gZbMvBJCgoq9jhSn3CRdvjp49
	n3Gbe7L0d1qZGvL4XMaUoUWPtIxcRos/ChHnT+lmfUFXCOs/yKyXMv/j82kzwS2uZ7I/FEnZDfd
	3p/cWuE/ERNZIMiwLhCmKT+OlLQZblrojOQxew3joaMXTjiGIvGO5lb18vAmwyIjHLUJjCmErbh
	lbbbKKc=
X-Received: by 2002:a05:600c:1991:b0:439:9dec:b7a2 with SMTP id 5b1f17b1804b1-439ae1d7505mr118490895e9.2.1740395389609;
        Mon, 24 Feb 2025 03:09:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1ycW6iB5hYrt5Xmlz/g3BBnHUWtdkbBQ5E9Ylni4+nYVA/XZsiy3BO1ni/4+EOPJaBi0Lmg==
X-Received: by 2002:a05:600c:1991:b0:439:9dec:b7a2 with SMTP id 5b1f17b1804b1-439ae1d7505mr118490415e9.2.1740395389077;
        Mon, 24 Feb 2025 03:09:49 -0800 (PST)
Received: from fedora ([37.174.243.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399c5f901bsm82957195e9.3.2025.02.24.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 03:09:48 -0800 (PST)
Date: Mon, 24 Feb 2025 12:09:46 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 2/4] virtio-rtc: Add initial normative statements
Message-ID: <Z7xTeqvKzhtXgKFv@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-3-quic_philber@quicinc.com>
 <Z6oqSDDOqhRgt/ZB@fedora>
 <uiejj47qg5cu4vfplk2ir4qy3j4leo52uiqw3xxgskfwjlwv4x@urzsoe62n6fq>
 <Z7XxoQDRT/d8H/PE@fedora>
 <n2i6ucm6mns2gf7mjf7fswj6temfobuet2xemhmjnq6vn5qv4r@tvhl7soxyf42>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <n2i6ucm6mns2gf7mjf7fswj6temfobuet2xemhmjnq6vn5qv4r@tvhl7soxyf42>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yr3Rv5nEruVrp9NwTN4SOC1Zs8QFNi2qYgyl-0_Sd98_1740395390
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2025 at 05:36:15PM +0100, Peter Hilber wrote:
> On Wed, Feb 19, 2025 at 03:58:41PM +0100, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Feb 13, 2025 at 07:13:12PM +0100, Peter Hilber wrote:
> > > On Mon, Feb 10, 2025 at 05:33:12PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > > On Thu, Jan 23, 2025 at 11:16:13AM +0100, Peter Hilber wrote:
> > > > > Add the normative statements for the initial device specification.
> > > > > 
> > > > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > > > ---
> > > > > 
> > > > > Notes:
> > > > >     v7:
> > > > >     
> > > > >     - Remove obsolete requirements for leap second indication.
> > > > >     
> > > > >     v6:
> > > > >     
> > > > >     - Update requirements to make leap second status information optional if
> > > > >       if the clock smears (or might smear) leap seconds.
> > > > >     
> > > > >     - Allow indicating VIRTIO_RTC_SMEAR_UNSPECIFIED for
> > > > >       VIRTIO_RTC_CLOCK_SMEARED.
> > > > >     
> > > > >     - Shorten some requirements by omitting redundant information.
> > > > >     
> > > > >     v5:
> > > > >     
> > > > >     - Update normative statements to match v5 changes to non-normative
> > > > >       statements (patch 1).
> > > > >     
> > > > >     v4:
> > > > >     
> > > > >     - Require driver to set unused flags to zero.
> > > > >     
> > > > >     - Update normative statements to match v4 changes to non-normative
> > > > >       statements (patch 1).
> > > > >     
> > > > >     - Improve formatting.
> > > > > 
> > > > >  conformance.tex                         |   2 +
> > > > >  device-types/rtc/description.tex        | 269 ++++++++++++++++++++++++
> > > > >  device-types/rtc/device-conformance.tex |   9 +
> > > > >  device-types/rtc/driver-conformance.tex |   9 +
> > > > >  4 files changed, 289 insertions(+)
> > > > >  create mode 100644 device-types/rtc/device-conformance.tex
> > > > >  create mode 100644 device-types/rtc/driver-conformance.tex
> > > > > 
> 
> [...]
>  
> > > > > +For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
> > > > > +\field{status} field if the \field{status} field does not fit into the
> > > > > +device write-only part.
> > > > > +
> > > > > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > > > > +\field{status} field to VIRTIO_RTC_S_EIO if none of the previous
> > > > > +requirements in this document stipulated another \field{status}.
> > > > > +
> > > > > +If the device read-only part of a message M is bigger than the size of
> > > > > +the request specified for message M, the device MUST ignore the
> > > > > +additional space.
> > > > > +
> > > > > +If the device write-only part of a message M is bigger than the size of
> > > > > +the response specified for message M, the device MUST ignore the
> > > > > +additional space.
> > > > > +
> > > > > +The device MUST NOT interpret \emph{reserved} fields in the
> > > > > +device-readable part of the message.
> > > > 
> > > > I wonder if last three requirements are needed.
> > > > 
> > > 
> > > I included them because in my understanding this is not specified in the
> > > generic part of the spec, and because I tried to be *somewhat*
> > > forward-compatible.
> > 
> > I see.
> > 
> > > 
> > > Do you think they are unneeded because they are self-evident? Then I
> > > think they could be dropped indeed. However, the IOMMU device explicitly
> > > requires the device to reject a request if some reserved field is not
> > > zero, and to ignore some other reserved field. 
> > 
> > I think is OK to have a requirement that says that the device rejects a
> > request if reserved fields are not zero. For the other requirements, if
> > you drop them, they will be implementation-specific. What is the
> > drawback of doing this?
> > 
> 
> If the ignore-size-is-bigger requirements are dropped, it complicates
> the driver handling of any message which is lengthened through feature
> bits in the future: the driver would then need to size the
> request/response according to the negotiated features, instead of using
> sizeof.
> 
> As for ignoring reserved fields in the device-readable part
> (effectively: in the request), there is arguably no good reason for the
> driver to put data in the request which the device will not process
> according to the negotiated feature bits. 
> 
> But does the device actually need to check that reserved fields are
> zero? I would say no. Depending on future additions, there could also be
> multiple reserved fields per request.
> 
> So my suggestion would be to drop the last requirement and retain the
> other two.

Sounds good.

> 
> (For the response, adding extra information not negotiated by feature
> bits should be unproblematic. I think I added the requirement on the
> request for symmetry.)
> 
> > > 
> > > > > +
> > > > > +The device MUST set \emph{reserved} fields in the device-writable part
> > > > > +of the message to zero.
> > > > > +
> > > > > +The device MUST set unnamed bits in \emph{flags} fields in the
> > > > > +device-writable part of the message to zero.
> > > > > +
> > > > > +After feature negotiation completion the device MUST NOT change the set
> > > > > +of clocks until device reset.
> > > > > +
> > > > > +The device SHOULD NOT change the set of clocks on a device reset after
> > > > > +the first device reset.
> > > > > +
> > > > > +The device MUST use non-negative integers, which are smaller than the
> > > > > +number of clocks, as clock identifiers.
> > > > > +
> > > > > +For a fixed request value V, the device SHOULD either, for every request
> > > > > +with value V, always execute successfully, or, for every request with
> > > > > +value V, always set a fixed \field{status} other than VIRTIO_RTC_S_OK.
> > > > 
> > > > I am not familiar enough with rtc clocks, what does `request with value
> > > > V` mean ?
> > > > 
> > > 
> > > I tried to avoid ambiguity by emulating the language used in semi-formal
> > > proofs. "V" refers to any particular request, e.g. VIRTIO_REQ_READ with
> > > clock_id 1. For any such particular request the device SHOULD either
> > > always return success, or always return the same error code.
> > > 
> > > Maybe I could rephrase like this:
> > > 
> > > 	The device SHOULD always set the same \field{status} in response
> > > 	to identical requests.
> > > 
> > 
> > Oh, I see. Do you think we could drop this requirement? It is not clear
> > to me if it is required.
> > 
> 
> This requirement says that the device SHOULD respond to requests in an
> consistent way, i.e. it SHOULD not sporadically fail requests. If there
> are sporadic failures, clock synchronization daemons such as chrony may
> choose a suboptimal clock reading method, i.e. one without READ_CROSS.
> 
> OTOH there is another requirement
> 
> 	The device SHOULD continuously support reading of all clocks
> 	once DRIVER_OK has been set.
> 
> I think the latter might suffice and the former could indeed be dropped.

I think so or something like that the device is considered live after
DRIVER_OK command.

> 
> > > > > +
> > > > > +For any clock C and read requests \emph{A} and \emph{B} which read C,
> > > > > +\emph{A} being the message which the driver marks as available before
> > > > > +\emph{B}, the device MUST obtain the \field{clock_reading} value for the
> > > > > +message \emph{A} response before the \field{clock_reading} value for the
> > > > > +message \emph{B} response, or the device MUST obtain the same
> > > > > +\field{clock_reading} value for both \emph{A} and \emph{B}.
> > > > 
> > > > Can't we just say that the device MUST processes the available ring as FIFO
> > > > queue?
> > > > 
> > > 
> > > The spec mandates FIFO processing for all the readings *of the same
> > > clock* by the above requirement (in conjunction with the below
> > > requirement, if you care about the used order).
> > > 
> > > The ordering requirement only applies to readings of the same clock, so
> > > that clocks which are slow to read (such as GPS clocks read over UART),
> > > or future slow commands, do not necessarily stall other processing, such
> > > as fast clock readings.
> > > 
> > > To guarantee that a clock never goes backwards (unless the clock is
> > > stepped backwards), the spec explicitly specifies the order of
> > > clock_reading values of successive clock readings. Just mandating FIFO
> > > processing would not prohibit a clock from going backwards.
> > > 
> > > E.g. when hardware counters are not properly synchronized across a
> > > multi-core device, the clock can go backwards when read on different
> > > cores. The spec mandates that the device avoid this. By this, the
> > > driver does not have to do mitigation.
> > 
> > The example helped a lot. You mean that the device must ensure that
> > requests that are read in order from the available ring, their output
> > values must respect that order. In a multicore system, I think
> > measurements should base always on the same physical clock for a given
> > clock to prevent getting the value from the clock in which the request
> > is processed. Does it make sense? 
> > 
> 
> I would not say that the device always needs to use the same physical
> clock (counter). It suffices if the physical clocks are synchronized
> good enough so that the clock never goes backwards between successive
> requests.

Right.

> 
> > > 
> > > > > +
> > > > > +For any clock C, the device MUST mark all read requests reading C as
> > > > > +used in the total order in which the driver marked these messages as
> > > > > +available.
> > > > > +
> > > > > +For any clock C of type VIRTIO_RTC_CLOCK_MONOTONIC and read requests
> > > > > +\emph{A} and \emph{B} which read C, \emph{A} being the message which the
> > > > > +driver marks as available before \emph{B}, the device MUST set the
> > > > > +\field{clock_reading} value for the message \emph{B} response to a value
> > > > > +greater than or equal to the \field{clock_reading} value for the message
> > > > > +\emph{A} response.
> > > > 
> > > > See comment above.
> > > > 
> > > > > +
> > > > > +The device MUST support VIRTIO_RTC_REQ_READ for every clock.
> > > > > +
> > > > > +For VIRTIO_RTC_REQ_READ and for any clock type listed in this
> > > > > +specification, the device MUST use the nanosecond as unit for field
> > > > > +\field{clock_reading}.
> > > > 
> > > > In other parts of the document the word `field` is written after the
> > > > name of the field. I think we could just put it after the name
> > > > everywhere.
> > > > 
> > > 
> > > OK.
> > > 
> > > > > +
> > > > > +For read requests, the device MUST obtain the \field{clock_reading}
> > > > > +response value after the read request is marked as available.
> > > > > +
> > > > > +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
> > > > > +\field{counter_cycles} to a value which approximates the value which the
> > > > > +driver would have read from the hardware counter identified by
> > > > > +\field{hw_counter} at the time instant when the device read the
> > > > > +\field{clock_reading} value.
> > > > 
> > > > s/read/reads
> > > > 
> > > 
> > > "read" seems correct to me. The last "read" in the above sentence is
> > > simple past tense, since the device sets the field after reading the
> > > clock_reading value. 
> > > 
> > 
> > I wonder if it is not `have read` them, I may be wrong and simple past
> > tense is OK.
> > 
> 
> Can somebody help? I looked at some grammar website and I still think
> simple past is the appropriate tense, because "the device read the
> clock_reading value" describes something which finished in the past.
> 

I think simple past is then alright.

> > > > > +
> > > > > +For VIRTIO_RTC_REQ_READ_CROSS, the device SHOULD assume that the driver
> > > > > +reads the hardware counter identified by \field{hw_counter} through the
> > > > > +CPU which the driver enumerates as the first.
> > > > > +
> > > > > +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set \field{status} to a
> > > > > +value other than VIRTIO_RTC_S_OK if the device cannot determine the
> > > > > +approximate value which the driver would have read from the hardware
> > > > > +counter identified by \field{hw_counter} at the time instant when the
> > > > > +device read the \field{clock_reading} value.
> > > > 
> > > > s/read/reads
> > > > 
> > > 
> > > The last "read" above is simple past tense, too.
> > > 
> > > > > +
> > > > > +For any clock C, and VIRTIO_RTC_REQ_READ_CROSS messages \emph{A} and
> > > > > +\emph{B} which read C and which specify the same hardware counter
> > > > > +\emph{H} through field \field{hw_counter}, \emph{A} being the message
> > > > > +which the driver marks as available before \emph{B}, the device MUST set
> > > > > +the \field{counter_cycles} value for \emph{B} to a value which \emph{H}
> > > > > +shows after the \field{counter_cycles} value of \emph{A}, or the device
> > > > > +MUST set the same \field{counter_cycles} value for \emph{A} and
> > > > > +\emph{B}.
> > > > 
> > > > Can't we just say that the request queue follows a FIFO semantics?
> > > > 
> > > 
> > > As discussed above, this would not guarantee that the counter_cycles
> > > value does not decrease across reads (ignoring rollovers), e.g. if
> > > successive READ_CROSS messages are processed on different cores whose
> > > hardware counters are not properly synchronized.
> > 
> > Got it. Is that not a wrong implementation? Because the device must base
> > on the same physical clock. It must not base on the clock in which the
> > request is processed. In other words, the device should ensure that
> > request to a given clock (virtual) are got always from the same physical
> > clock.
> > 
> > Matias
> > 
> 
> I think it should be up to the implementation to use any suitable
> physical clock and translation mechanism to virtual clock (if required).
> It should be possible to implement the device as a program which can
> migrate across cores. The spec should only mandate that the responses to
> the driver are self-consistent (which relieves the driver of
> post-processing).
> 

I see. It makes sense. Thanks.

Matias

