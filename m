Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D01E98E3
	for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739977131; cv=none; b=SE4hkcLoeyDzIyAPgQwK2UIfC2TbyCAq4DisOppwTxAu22uwQoqqw/FBDGFgvNGtNMfI23GxMhj47yA4KceSnXep2zaz3d4ovZgRXVkHNR3ALYbQHZ90aLeKsZtHcoAlGjAqmaMxl3PTSx+ZNetgFYqLIVMJXwuYJfcTWGcW1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739977131; c=relaxed/simple;
	bh=ZwR2rMFbDsaQYjmbwJzPR8HW98UZB5vc372hqLVSw9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tD0xzi58ecA/1Iv3zNpO4Hqn1+eADnl7+JE2z8HCe1AebCPB2brxQo/w/aDBhSNmfZ/K3iLs+GOsLFqUAAgXrKLN422e5KVOEZQsuYTIGYuEgJWTKwm3i5JSZ7UZB+b8SCUdEjBmwQsd//pr4UsJ8M202noIuC24xqyKBtAdMps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bv/8zvwf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bv/8zvwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739977127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WZrOAq/rUa/HMJBffAT9iAdrrUBF5cIW0CczD79w0cA=;
	b=Bv/8zvwfSuH2Yw7lME0m2NGjuZtdAM6CPx9dQ9qvd+WU5FxWk+fURgJN+gQEYmSCmjLqrz
	BFL+oW6IBtKCtPt5dMrCD1ht+pCuM8j+f2hxGOQl8i/RUHSHCn+/0ooBzcqFREzbxgz8SX
	LO+Bd8raf2d2jd5smUk1qirp8CM9zaE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-TGFj9fx3MDO5e-q6wgoteQ-1; Wed, 19 Feb 2025 09:58:46 -0500
X-MC-Unique: TGFj9fx3MDO5e-q6wgoteQ-1
X-Mimecast-MFC-AGG-ID: TGFj9fx3MDO5e-q6wgoteQ_1739977125
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f34b3f9f1so3335462f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 06:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739977125; x=1740581925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZrOAq/rUa/HMJBffAT9iAdrrUBF5cIW0CczD79w0cA=;
        b=IdyayDLwAesZB3oT8BrrH5RhbfAzGkRlwjreQdiDMGsg7IlROhCBVDuQNuyJhsflVT
         UlhB2ZltBalCH++MkuUNcdswHnM4aKHjGJrA+CQC1tNokQAtr7N7BdSQPCMD+zqeXiyj
         egHV/iov8ttxOGuU35WFa0tv9QXNCBG4bhZmr47lQnACReMpEn5Jo7ZMQuBNxUXwoZBM
         QI7vdWNrqX6ZTX4cVGPhURQBc5G3lITNw5a3sToETfY9UCT9BDDd0+jBV9C3Q/DeLVTP
         FQlv79GJMvdiM5f+7ZXbsVqEZWDDAQHoCdwU4giMWtUPpMzP0VQwQufcpvxSYSqD8pQG
         t0/w==
X-Gm-Message-State: AOJu0Yz58ZZP8VyXsoMHi+AuK9A+zcKS6UIbyl4pOBOZhSyfkac97dNH
	jGVYG0p7lL+t+0SoRZpqJ4ucMrVIeZNABs9dphKUcyBC29oibZoUvgQ/2KguSAvUNkVOV/eGJlQ
	EZseq7L6YUl2NSS1dVkfM4QZ5akjordzajN65oZeQjPvCJc8nCEmOhjC2BUTGQSlD
X-Gm-Gg: ASbGncukCYmqD0ml+cSJKayWuzXhldDxe3gGzH8/DY7vPuauDDOOrr/+ex8dvoswPXq
	TKBHslOwyHX0IPTw//dDgj616AaQIbqI2IxDX5cUMVGz1kxE1EUcprkMFcxZqLvoPiEinc/X6/L
	to3XICdFFSievpcBXjXnwjK7wjdNYNmVDjxon115755L+dVBXDxKDCBq5fCn/xJFKNgMa2PqiXj
	AaKMj/rHLg4Yex5jG8mTrmLsI9RoufGaedX9CiTW6T0BB7ThJj9tUnESmjaLXYHGTiFmIHYknI=
X-Received: by 2002:a05:6000:1bc1:b0:38f:31b6:4f30 with SMTP id ffacd0b85a97d-38f587ca52bmr3374374f8f.35.1739977124910;
        Wed, 19 Feb 2025 06:58:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGtb34pI5y4Xl6ulY57LnBYxSuw+ByQ4JID6wz3e5NrNDqJUlJ8/YOv9/Cqzu0a+TIb/k1Kg==
X-Received: by 2002:a05:6000:1bc1:b0:38f:31b6:4f30 with SMTP id ffacd0b85a97d-38f587ca52bmr3374351f8f.35.1739977124420;
        Wed, 19 Feb 2025 06:58:44 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43992ad82cfsm56473415e9.37.2025.02.19.06.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 06:58:43 -0800 (PST)
Date: Wed, 19 Feb 2025 15:58:41 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 2/4] virtio-rtc: Add initial normative statements
Message-ID: <Z7XxoQDRT/d8H/PE@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-3-quic_philber@quicinc.com>
 <Z6oqSDDOqhRgt/ZB@fedora>
 <uiejj47qg5cu4vfplk2ir4qy3j4leo52uiqw3xxgskfwjlwv4x@urzsoe62n6fq>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <uiejj47qg5cu4vfplk2ir4qy3j4leo52uiqw3xxgskfwjlwv4x@urzsoe62n6fq>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9xlNJEnmcbIUPGDfWVq_ZytXVhEYF2z5lN5awFgi6-o_1739977125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2025 at 07:13:12PM +0100, Peter Hilber wrote:
> On Mon, Feb 10, 2025 at 05:33:12PM +0100, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Jan 23, 2025 at 11:16:13AM +0100, Peter Hilber wrote:
> > > Add the normative statements for the initial device specification.
> > > 
> > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > ---
> > > 
> > > Notes:
> > >     v7:
> > >     
> > >     - Remove obsolete requirements for leap second indication.
> > >     
> > >     v6:
> > >     
> > >     - Update requirements to make leap second status information optional if
> > >       if the clock smears (or might smear) leap seconds.
> > >     
> > >     - Allow indicating VIRTIO_RTC_SMEAR_UNSPECIFIED for
> > >       VIRTIO_RTC_CLOCK_SMEARED.
> > >     
> > >     - Shorten some requirements by omitting redundant information.
> > >     
> > >     v5:
> > >     
> > >     - Update normative statements to match v5 changes to non-normative
> > >       statements (patch 1).
> > >     
> > >     v4:
> > >     
> > >     - Require driver to set unused flags to zero.
> > >     
> > >     - Update normative statements to match v4 changes to non-normative
> > >       statements (patch 1).
> > >     
> > >     - Improve formatting.
> > > 
> > >  conformance.tex                         |   2 +
> > >  device-types/rtc/description.tex        | 269 ++++++++++++++++++++++++
> > >  device-types/rtc/device-conformance.tex |   9 +
> > >  device-types/rtc/driver-conformance.tex |   9 +
> > >  4 files changed, 289 insertions(+)
> > >  create mode 100644 device-types/rtc/device-conformance.tex
> > >  create mode 100644 device-types/rtc/driver-conformance.tex
> > > 
> 
> [...]
> 
> > > +
> > > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > > +\field{status} field to VIRTIO_RTC_S_EINVAL if the request values are
> > > +inconsistent with the specification and if the inconsistence is not
> > > +described by the requirements which stipulate status
> > > +VIRTIO_RTC_S_EOPNOTSUPP or VIRTIO_RTC_S_ENODEV.
> > > +
> > > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > > +\field{status} field to VIRTIO_RTC_S_EINVAL if the device read-only part
> > > +of the message is too small.
> > 
> > What do you mean with `too small`?
> > 
> 
> "Too small" means that the cumulative length of the buffers marked as
> device-readable is less than the (minimum) length of the request which
> is indicated by the message type in the header.
> 

Oh, I see, you mean there is a mismatch between the type of the request
and the corresponding size of device read-only part.

> Maybe I could reword like this?
> 
> 	For \field{struct virtio_rtc_resp_head}, the device MUST set the
> 	\field{status} field to VIRTIO_RTC_S_EINVAL if the request
> 	specified in the request header through the \field{msg_type}
> 	field does not fit into the device read-only part of the actual
> 	message.

I think it is better.

> 
> > > +
> > > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > > +\field{status} field to VIRTIO_RTC_S_EINVAL if the device write-only
> > > +part of the message is too small, unless the \field{status} field does
> > > +not fit into the device write-only part.
> > > +
> > 
> > I think we can improve the wording by replacing `too small` with
> > something else.
> > 
> 
> Maybe I could reword like this?
> 
> 	For \field{struct virtio_rtc_resp_head}, the device MUST set the
> 	\field{status} field to VIRTIO_RTC_S_EINVAL if the response
> 	specified in the request header through the \field{msg_type}
> 	field does not fit into the device write-only part of the actual
> 	message, unless the \field{status} field does not fit into the
> 	device write-only part.
> 
I think it is better.

> > > +For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
> > > +\field{status} field if the \field{status} field does not fit into the
> > > +device write-only part.
> > > +
> > > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > > +\field{status} field to VIRTIO_RTC_S_EIO if none of the previous
> > > +requirements in this document stipulated another \field{status}.
> > > +
> > > +If the device read-only part of a message M is bigger than the size of
> > > +the request specified for message M, the device MUST ignore the
> > > +additional space.
> > > +
> > > +If the device write-only part of a message M is bigger than the size of
> > > +the response specified for message M, the device MUST ignore the
> > > +additional space.
> > > +
> > > +The device MUST NOT interpret \emph{reserved} fields in the
> > > +device-readable part of the message.
> > 
> > I wonder if last three requirements are needed.
> > 
> 
> I included them because in my understanding this is not specified in the
> generic part of the spec, and because I tried to be *somewhat*
> forward-compatible.

I see.

> 
> Do you think they are unneeded because they are self-evident? Then I
> think they could be dropped indeed. However, the IOMMU device explicitly
> requires the device to reject a request if some reserved field is not
> zero, and to ignore some other reserved field. 

I think is OK to have a requirement that says that the device rejects a
request if reserved fields are not zero. For the other requirements, if
you drop them, they will be implementation-specific. What is the
drawback of doing this?

> 
> > > +
> > > +The device MUST set \emph{reserved} fields in the device-writable part
> > > +of the message to zero.
> > > +
> > > +The device MUST set unnamed bits in \emph{flags} fields in the
> > > +device-writable part of the message to zero.
> > > +
> > > +After feature negotiation completion the device MUST NOT change the set
> > > +of clocks until device reset.
> > > +
> > > +The device SHOULD NOT change the set of clocks on a device reset after
> > > +the first device reset.
> > > +
> > > +The device MUST use non-negative integers, which are smaller than the
> > > +number of clocks, as clock identifiers.
> > > +
> > > +For a fixed request value V, the device SHOULD either, for every request
> > > +with value V, always execute successfully, or, for every request with
> > > +value V, always set a fixed \field{status} other than VIRTIO_RTC_S_OK.
> > 
> > I am not familiar enough with rtc clocks, what does `request with value
> > V` mean ?
> > 
> 
> I tried to avoid ambiguity by emulating the language used in semi-formal
> proofs. "V" refers to any particular request, e.g. VIRTIO_REQ_READ with
> clock_id 1. For any such particular request the device SHOULD either
> always return success, or always return the same error code.
> 
> Maybe I could rephrase like this:
> 
> 	The device SHOULD always set the same \field{status} in response
> 	to identical requests.
> 

Oh, I see. Do you think we could drop this requirement? It is not clear
to me if it is required.

> > > +
> > > +For any clock C and read requests \emph{A} and \emph{B} which read C,
> > > +\emph{A} being the message which the driver marks as available before
> > > +\emph{B}, the device MUST obtain the \field{clock_reading} value for the
> > > +message \emph{A} response before the \field{clock_reading} value for the
> > > +message \emph{B} response, or the device MUST obtain the same
> > > +\field{clock_reading} value for both \emph{A} and \emph{B}.
> > 
> > Can't we just say that the device MUST processes the available ring as FIFO
> > queue?
> > 
> 
> The spec mandates FIFO processing for all the readings *of the same
> clock* by the above requirement (in conjunction with the below
> requirement, if you care about the used order).
> 
> The ordering requirement only applies to readings of the same clock, so
> that clocks which are slow to read (such as GPS clocks read over UART),
> or future slow commands, do not necessarily stall other processing, such
> as fast clock readings.
> 
> To guarantee that a clock never goes backwards (unless the clock is
> stepped backwards), the spec explicitly specifies the order of
> clock_reading values of successive clock readings. Just mandating FIFO
> processing would not prohibit a clock from going backwards.
> 
> E.g. when hardware counters are not properly synchronized across a
> multi-core device, the clock can go backwards when read on different
> cores. The spec mandates that the device avoid this. By this, the
> driver does not have to do mitigation.

The example helped a lot. You mean that the device must ensure that
requests that are read in order from the available ring, their output
values must respect that order. In a multicore system, I think
measurements should base always on the same physical clock for a given
clock to prevent getting the value from the clock in which the request
is processed. Does it make sense? 

> 
> > > +
> > > +For any clock C, the device MUST mark all read requests reading C as
> > > +used in the total order in which the driver marked these messages as
> > > +available.
> > > +
> > > +For any clock C of type VIRTIO_RTC_CLOCK_MONOTONIC and read requests
> > > +\emph{A} and \emph{B} which read C, \emph{A} being the message which the
> > > +driver marks as available before \emph{B}, the device MUST set the
> > > +\field{clock_reading} value for the message \emph{B} response to a value
> > > +greater than or equal to the \field{clock_reading} value for the message
> > > +\emph{A} response.
> > 
> > See comment above.
> > 
> > > +
> > > +The device MUST support VIRTIO_RTC_REQ_READ for every clock.
> > > +
> > > +For VIRTIO_RTC_REQ_READ and for any clock type listed in this
> > > +specification, the device MUST use the nanosecond as unit for field
> > > +\field{clock_reading}.
> > 
> > In other parts of the document the word `field` is written after the
> > name of the field. I think we could just put it after the name
> > everywhere.
> > 
> 
> OK.
> 
> > > +
> > > +For read requests, the device MUST obtain the \field{clock_reading}
> > > +response value after the read request is marked as available.
> > > +
> > > +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
> > > +\field{counter_cycles} to a value which approximates the value which the
> > > +driver would have read from the hardware counter identified by
> > > +\field{hw_counter} at the time instant when the device read the
> > > +\field{clock_reading} value.
> > 
> > s/read/reads
> > 
> 
> "read" seems correct to me. The last "read" in the above sentence is
> simple past tense, since the device sets the field after reading the
> clock_reading value. 
> 

I wonder if it is not `have read` them, I may be wrong and simple past
tense is OK.

> > > +
> > > +For VIRTIO_RTC_REQ_READ_CROSS, the device SHOULD assume that the driver
> > > +reads the hardware counter identified by \field{hw_counter} through the
> > > +CPU which the driver enumerates as the first.
> > > +
> > > +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set \field{status} to a
> > > +value other than VIRTIO_RTC_S_OK if the device cannot determine the
> > > +approximate value which the driver would have read from the hardware
> > > +counter identified by \field{hw_counter} at the time instant when the
> > > +device read the \field{clock_reading} value.
> > 
> > s/read/reads
> > 
> 
> The last "read" above is simple past tense, too.
> 
> > > +
> > > +For any clock C, and VIRTIO_RTC_REQ_READ_CROSS messages \emph{A} and
> > > +\emph{B} which read C and which specify the same hardware counter
> > > +\emph{H} through field \field{hw_counter}, \emph{A} being the message
> > > +which the driver marks as available before \emph{B}, the device MUST set
> > > +the \field{counter_cycles} value for \emph{B} to a value which \emph{H}
> > > +shows after the \field{counter_cycles} value of \emph{A}, or the device
> > > +MUST set the same \field{counter_cycles} value for \emph{A} and
> > > +\emph{B}.
> > 
> > Can't we just say that the request queue follows a FIFO semantics?
> > 
> 
> As discussed above, this would not guarantee that the counter_cycles
> value does not decrease across reads (ignoring rollovers), e.g. if
> successive READ_CROSS messages are processed on different cores whose
> hardware counters are not properly synchronized.

Got it. Is that not a wrong implementation? Because the device must base
on the same physical clock. It must not base on the clock in which the
request is processed. In other words, the device should ensure that
request to a given clock (virtual) are got always from the same physical
clock.

Matias

