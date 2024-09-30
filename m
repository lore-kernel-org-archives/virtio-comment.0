Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963E47462
	for <virtio-comment@lists.linux.dev>; Mon, 30 Sep 2024 06:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727677858; cv=none; b=ITyrb22CdiVe8D4Nz3o4f+fCTJllZEkvKbV2Oy/fo9PxPMzLM+B0Ew6MTYZaK86If80yJqaBAWhdms8AGMt4gJPWsI/10BpuOn/aN1SaTe3YMVGI4pe/mGyMABGS3iP7O+wIN1QNRmQnrzgzbsLS7bJramCMaoEbRbmZ854ayu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727677858; c=relaxed/simple;
	bh=tzOTydUxFBvKqLKYOCwuI4kJ9al5ZbobNGIkPGfKnUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uXyenEAnsWyHFK9iAxcEh3oSNN55E4pFWCuvVhueNRg29xz8qyxjd4K6952uWsN+R9TH3r2DIJG1a6PpeqpBX375h4MZbFkHnpm5uh/Fk3BEMk/KU9AzaXpXs8f2q4OA0io7b1Oinj4SX8RaEpGAXWAKgbuc1XL41OaZ3pQOBZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LEyNzZFY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LEyNzZFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727677855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LikbfEQa58WLAo42TTLRny1gwpBNO/gageQZcD/ZcMc=;
	b=LEyNzZFYdiBHDA4asxS/5qKqtgdUzkJnTyyqD1mFUtviK8WcZIWfnmoiJLqT3bDphzk9wA
	aRDgipXWtJ9yydl0JfjlsWcA9D+On8CGV2o18UuAVof9digL8Vt7T2J5luwunt1Tweq5Zu
	HKJHSzzZ9ZQLPc/YhzH6diUO6vWScQk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-PyXz71i6MPWFUmr3IFDaeQ-1; Mon, 30 Sep 2024 02:30:54 -0400
X-MC-Unique: PyXz71i6MPWFUmr3IFDaeQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37cd32f9c59so1153345f8f.1
        for <virtio-comment@lists.linux.dev>; Sun, 29 Sep 2024 23:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727677853; x=1728282653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LikbfEQa58WLAo42TTLRny1gwpBNO/gageQZcD/ZcMc=;
        b=BC2nRuaApL3FFGgcL7PNMrhi36DFMz8txCk4rxIm0vXJuuXRL60k51adk7lUtwAcIq
         7JSZqqltyXusp6KecSdyqgQBuJDWbTl8BK8QbwRlSHHV/n25zpHnbCrzAC7LJHqKZnbW
         qqt3m6hh7BN9YXqeR3ijezpABjZPfXDGcBgesm8rmGv10Jn5xZ4EAGdMenmThdV3hAx2
         ub4M7P6pcT6MezVDLypSSG4B//HvsGwoO93qjTx4XIVX/DErlhkeQgKgxVXruL80pkG6
         KZ1fDkzEqtht0iUZ/qsRaC8L2M2grCkuLYzviUmBEsoYw27rvyPaJdJucpNSOAhrjAq3
         rSBA==
X-Forwarded-Encrypted: i=1; AJvYcCUa1G1xcpzDEEPIRz3LRCJy7uvUbs5u59DVgpdS7k4FomvhmWzB8EB7Lli6MFp41zFlWJkVdhULu+1afoOZJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhzKAZZkMEwmwp9VRsN/d0W2QYPmhfpVTSxYR9vgbetxdayJnc
	DFH5Otw6CmfuRq03D9H+5eTlDzuvtQjNni43IPVVkumQYJBtNfcWgfN+gvGvzSoBes4jiUZTgEB
	Bx//Ghh4oL/uckj2Tq7k3BP+zHawzBuEFTdKL7PEofh2xz4QfYOa2I5UfkZfVoLcq
X-Received: by 2002:a5d:4bc6:0:b0:37c:cdcd:689e with SMTP id ffacd0b85a97d-37cd5aec7acmr5430963f8f.31.1727677852888;
        Sun, 29 Sep 2024 23:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdFimdoop/uOc/LNq7IytTD/tYpXKtcxG0NO9HiEs6JMtDfUx84UdD+kAwTFD/SSwjVP4V+w==
X-Received: by 2002:a5d:4bc6:0:b0:37c:cdcd:689e with SMTP id ffacd0b85a97d-37cd5aec7acmr5430943f8f.31.1727677852345;
        Sun, 29 Sep 2024 23:30:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:55d:ca3b:807c:fdd2:f46d:60e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fd9asm8221855f8f.75.2024.09.29.23.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 23:30:51 -0700 (PDT)
Date: Mon, 30 Sep 2024 02:30:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mie@igel.co.jp" <mie@igel.co.jp>
Subject: Re: [PATCH v2] transport-pci: Add MSI support
Message-ID: <20240930022818-mutt-send-email-mst@kernel.org>
References: <20240712140144.12066-1-manivannan.sadhasivam@linaro.org>
 <20240724162143.GH3349@thinkpad>
 <20240903053218.7lapwvllgz4xk4se@thinkpad>
 <IA0PR12MB8713D97523757F1FDD6D3525DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB8713D97523757F1FDD6D3525DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 30, 2024 at 05:45:48AM +0000, Parav Pandit wrote:
> 
> 
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: Tuesday, September 3, 2024 11:02 AM
> > 
> > On Wed, Jul 24, 2024 at 09:51:43PM +0530, Manivannan Sadhasivam wrote:
> > > On Fri, Jul 12, 2024 at 07:31:44PM +0530, Manivannan Sadhasivam wrote:
> > > > MSI is the predecessor of MSI-X that allows PCIe devices to send
> > > > interrupts to the host. Compared to MSI-X, MSI supports only a
> > > > maximum of 32 vectors per PCIe function. But MSI has been widely
> > > > supported by the PCIe devices requiring fewer interrupts such as
> > Modems, WLAN cards etc...
> > > >
> > > > Currently, Virtio spec only documents MSI-X and INTX interrupt
> > > > mechanisms for the PCI transport. So if a Virtio device based on PCI
> > > > transport supports only MSI, then the driver on the guest will only
> > > > use INTX for receiving the interrupts. This is really sub-optimal
> > > > and affects the performance of the device. Because with MSI, the
> > > > device can use one vector per queue (max of 32 vectors) thus
> > > > avoiding the overhead associated with a shared INTX vector.
> > > >
> > > > Hence, add support for MSI to the Virtio PCI transport. MSI support
> > > > is added such a way that it reuses the existing infrastructure of
> > > > MSI-X, like the config_msix_vector/queue_msix_vector fields of the
> > > > Virtio common config structure. This makes it easy for the Virtio
> > > > drivers to add MSI support without any disruptive changes.
> > > >
> > >
> > > Gentle ping!
> > >
> > 
> > Ping again. Virtio maintainers, can you please share some feedback?
> >
> Overall looks to me.
> A small comment below on single MSI vector.
> 
>  
> > - Mani
> > 
> > > - Mani
> > >
> > > > Signed-off-by: Manivannan Sadhasivam
> > > > <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >
> > > > Changes in v2:
> > > >
> > > > * Fixed a spelling mistake in commit message
> > > > * Removed update to legacy interface
> > > > * Used 'MSI vector' consistently
> > > >
> > > >  transport-pci.tex | 115
> > > > ++++++++++++++++++++++++++++++++++++----------
> > > >  1 file changed, 92 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/transport-pci.tex b/transport-pci.tex index
> > > > a5c6719..fd92641 100644
> > > > --- a/transport-pci.tex
> > > > +++ b/transport-pci.tex
> > > > @@ -347,7 +347,7 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport
> > > >          Driver Feature Bits selected by \field{driver_feature_select}.
> > > >
> > > >  \item[\field{config_msix_vector}]
> > > > -        Set by the driver to the MSI-X vector for configuration change
> > notifications.
> > > > +        Set by the driver to the MSI/MSI-X vector for configuration change
> > notifications.
> > > >
> > > >  \item[\field{num_queues}]
> > > >          The device specifies the maximum number of virtqueues supported
> > here.
> > > > @@ -371,7 +371,7 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport
> > > >          A 0 means the queue is unavailable.
> > > >
> > > >  \item[\field{queue_msix_vector}]
> > > > -        Set by the driver to the MSI-X vector for virtqueue notifications.
> > > > +        Set by the driver to the MSI/MSI-X vector for virtqueue
> > notifications.
> > > >
> > > >  \item[\field{queue_enable}]
> > > >          The driver uses this to selectively prevent the device from executing
> > requests from this virtqueue.
> > > > @@ -631,11 +631,11 @@ \subsubsection{ISR status
> > > > capability}\label{sec:Virtio Transport Options / Virti  in
> > > > \field{ISR status} before sending a device configuration  change
> > notification to the driver.
> > > >
> > > > -If MSI-X capability is disabled, the device MUST set the Queue
> > > > +If MSI/MSI-X capability is disabled, the device MUST set the Queue
> > > >  Interrupt bit in \field{ISR status} before sending a virtqueue
> > > > notification to the driver.
> > > >
> > > > -If MSI-X capability is disabled, the device MUST set the Interrupt
> > > > Status
> > > > +If MSI/MSI-X capability is disabled, the device MUST set the
> > > > +Interrupt Status
> > > >  bit in the PCI Status register in the PCI Configuration Header of
> > > > the device to the logical OR of all bits in \field{ISR status} of
> > > > the device.  The device then asserts/deasserts INT\#x interrupts
> > > > unless masked @@ -645,7 +645,7 @@ \subsubsection{ISR status
> > > > capability}\label{sec:Virtio Transport Options / Virti
> > > >
> > > >  \drivernormative{\paragraph}{ISR status capability}{Virtio
> > > > Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR
> > > > status capability}
> > > >
> > > > -If MSI-X capability is enabled, the driver SHOULD NOT access
> > > > +If MSI/MSI-X capability is enabled, the driver SHOULD NOT access
> > > >  \field{ISR status} upon detecting a Queue Interrupt.
> > > >
> > > >  \subsubsection{Device-specific configuration}\label{sec:Virtio
> > > > Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > > > Device-specific configuration} @@ -1017,7 +1017,7 @@
> > > > \subsubsection{Device Initialization}\label{sec:Virtio Transport
> > > > Options / Virti  \drivernormative{\subparagraph}{MSI-X Vector
> > > > Configuration}{Virtio Transport Options / Virtio Over PCI Bus /
> > > > PCI-specific Initialization And Device Operation / Device
> > > > Initialization / MSI-X Vector Configuration}
> > > >
> > > >  Driver MUST support device with any MSI-X Table Size 0 to 0x7FF.
> > > > -Driver MAY fall back on using INT\#x interrupts for a device
> > > > +Driver MAY fall back on using MSI or INT\#x interrupts for a device
> > > >  which only supports one MSI-X vector (MSI-X Table Size = 0).
> > > >
> > > >  Driver MAY interpret the Table Size as a hint from the device @@
> > > > -1034,6 +1034,75 @@ \subsubsection{Device
> > > > Initialization}\label{sec:Virtio Transport Options / Virti  the
> > > > driver MAY retry mapping with fewer vectors, disable MSI-X  or report
> > device failure.
> > > >
> > > > +\paragraph{MSI Vector Configuration}\label{sec:Virtio Transport
> > > > +Options / Virtio Over PCI Bus / PCI-specific Initialization And
> > > > +Device Operation / Device Initialization / MSI Vector
> > > > +Configuration}
> > > > +
> > > > +When MSI capability is present and enabled in the device (through
> > > > +standard PCI configuration space) \field{config_msix_vector} and
> > > > +\field{queue_msix_vector} are used to map configuration change and
> > queue interrupts to MSI vectors. In this case, the ISR Status is unused.
> > > > +
> > > > +Writing a valid MSI vector, 0 to 0x1F, to
> > > > +\field{config_msix_vector}/\field{queue_msix_vector} maps
> > > > +interrupts triggered by the configuration change/selected queue
> > > > +events respectively to the corresponding MSI vector. To disable
> > > > +interrupts for an event type, the driver unmaps this event by
> > > > +writing a special NO_VECTOR
> > > > +value:
> > > > +
> > > > +\begin{lstlisting}
> > > > +/* Vector value used to disable MSI for queue */
> > > > +#define VIRTIO_MSI_NO_VECTOR            0xffff
> > > > +\end{lstlisting}
> > > > +
> > > > +Note that mapping an event to vector might require device to
> > > > +allocate internal device resources, and thus could fail.
> > > > +
> > > > +\devicenormative{\subparagraph}{MSI Vector Configuration}{Virtio
> > > > +Transport Options / Virtio Over PCI Bus / PCI-specific
> > > > +Initialization And Device Operation / Device Initialization / MSI
> > > > +Vector Configuration}
> > > > +
> > > > +A device that has an MSI capability SHOULD support at least 2 and
> > > > +at most 0x20 MSI vectors.
> > > > +Device MUST report the number of vectors supported in
> > > > +\field{Multiple Message Capable} field in the MSI Capability as
> > > > +specified in \hyperref[intro:PCI]{[PCI]}.
> > > > +The device SHOULD restrict the reported MSI Multiple Message
> > > > +Capable field to a value that might benefit system performance.
> > > > +\begin{note}
> > > > +For example, a device which does not expect to send interrupts at a
> > > > +high rate might only specify 2 MSI vectors.
> > > > +\end{note}
> > > > +Device MUST support mapping any event type to any valid vector 0 to
> > > > +number of MSI vectors specified in \field{Multiple Message Capable}
> > field.
> > > > +Device MUST support unmapping any event type.
> > > > +
> > > > +The device MUST return vector mapped to a given event, (NO_VECTOR
> > > > +if unmapped) on read of
> > \field{config_msix_vector}/\field{queue_msix_vector}.
> > > > +The device MUST have all queue and configuration change events
> > > > +unmapped upon reset.
> > > > +
> > > > +Devices SHOULD NOT cause mapping an event to vector to fail unless
> > > > +it is impossible for the device to satisfy the mapping request.
> > > > +Devices MUST report mapping failures by returning the NO_VECTOR
> > > > +value when the relevant
> > > > +\field{config_msix_vector}/\field{queue_msix_vector} field is read.
> > > > +
> > > > +\drivernormative{\subparagraph}{MSI Vector Configuration}{Virtio
> > > > +Transport Options / Virtio Over PCI Bus / PCI-specific
> > > > +Initialization And Device Operation / Device Initialization / MSI
> > > > +Vector Configuration}
> > > > +
> > > > +Driver MUST support device with any MSI vector from 0 to 0x1F.
> > > > +Driver MAY fall back on using INT\#x interrupts for a device which
> > > > +only supports one MSI vector (MSI Multiple Message Capable = 0).
> > > > +
> A single MSI (and MSI-X) vector is still far more optimal than INTx due to the inefficiency of the INTx delivery on PCIe transport.

And lack of support on VFs.

> And for sw based devices, it anyway doesnt matter a lot either.
> 
> So when a new functionality like MSI is added, it does not need to continue what MSI-X has done.
> 
> So I request you to remove this guidance of INTx fallback on single MSI vector.

Let's provide an alternative guidance then.
Device SHOULD implement at least 2 MSI vectors?

> Rest all looks fine to me.

