Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EABD518
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720687548; cv=none; b=QFZojJYfINYPpo6NWR5hI3dCDsGt1emqsycykTCvaXDm18VK62ShAjFTNXNCvO/lCJQW+roNPJmrWG+3S2/WU2tO84d8G67suzr1g3kWhQ8DvdK8pk8cSzQVGuEVw8Xmk6WXWSmpYEHS6QeZhVRxzIbi2/3szk1iDKB1UC5nqMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720687548; c=relaxed/simple;
	bh=ngpMs58DbeAwiTRm77SYSL6dX1NAoKHeOb7roM6VJ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQbI9cO2LOOmXftVeSeLm/LP4/XsKUisyrWEcvsuHsWuADJbXeyd0wdtfJcRo1vy0A28CyLYPwaa9sKid4I+dFBAn4rc4x0IhIbMKR5cQoqn1DmxKgEehpVSSBe/8hB6hoQZdSAA3W0S/rs0m8hb37gmtbueYp1oRhabEoRRAOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=znovaEH0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="znovaEH0"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70b04cb28acso528842b3a.0
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720687546; x=1721292346; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eMsOAlUOEbopBRnoRa47XX85oRon9on51n0zji2c/c8=;
        b=znovaEH0BgsLanQeBb+pmNsu+1XpTh0cSH7jJZ8LTb0+p35i4VvUxAOlIqZzePnb06
         QpQCzRwsWbRp+M7JmqMw/50u5MSQOHnY4iy72kDQSVYM7A7wVFIu+OwZjJ7xGTO+zjYI
         yjVqhnjq2eDyLiYyV9//pJW/MTufi45zsBLBUR8SqK6wQsd4lmmWsfEFUxSb5OBG1R30
         d3IYirOKAoJyrmMytjUcnVxqa0Tq4CyfE66f8880oKUKm6agT0c2n27kJx269M2S/N/L
         yuWtvWyEuarx92AgQ50pg6GJu2dkx9YUy2mZ7yzp0O7yxiYidW0pvs47QwzoGz7CCgMQ
         eOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720687546; x=1721292346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMsOAlUOEbopBRnoRa47XX85oRon9on51n0zji2c/c8=;
        b=F35I2bxzObHxyNJ/X116mzo/S43xQzM/kE5Y5tx4btw8wp5sSHh+3u3sF7bfOdOfo6
         Osg6IkxiSeY7/pJZsZ0Fv6LUiZuwRALN3T3Umy9/mortnkcnLZ02qM1WNTfdCvH/zWg2
         KUpFb17W2REYbv1VC8/5zg90nZRJqWm/XuWHWorwmUlDXiSXb2JHUSHzm67dYcTI0xus
         LFkQFcssJhsrK/sIz22d504XXjeV8xRjEKNDKaxMl+8S20gBLDoX8VxgOhCHVZf6IW0a
         tRRjMGMzHmmMb9HxN6ss0OhctLsrFxO4mPzZzcBw2zl6zbK68QPVpAo7+SBPOy+MqidA
         IJxQ==
X-Gm-Message-State: AOJu0Yx1oWv/pZIu+y+JIydyjR8qCoJex+CCe3THUMbyXgH/ewaRF7SP
	8GNzGjiRI193uXs6DUt2yxRgHVOnlvOz3nV9x2Ur+3WURzZY6IgfxyanF2V4qQ==
X-Google-Smtp-Source: AGHT+IEYi3VL3OSOL0G9JqSkYnuqJp/PT7vgZ8+kQy25PwzM39StU5ZgPIDFMqvlY5H4OQnSi/w42g==
X-Received: by 2002:a05:6a00:4b0d:b0:706:3d61:4b21 with SMTP id d2e1a72fcca58-70b61d4a761mr1400309b3a.3.1720687545969;
        Thu, 11 Jul 2024 01:45:45 -0700 (PDT)
Received: from thinkpad ([120.56.197.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d6320fbbesm4005151a12.56.2024.07.11.01.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:45:45 -0700 (PDT)
Date: Thu, 11 Jul 2024 14:15:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH] transport-pci: Add MSI support
Message-ID: <20240711084542.GA22299@thinkpad>
References: <20240711065919.6977-1-manivannan.sadhasivam@linaro.org>
 <20240711031716-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240711031716-mutt-send-email-mst@kernel.org>

On Thu, Jul 11, 2024 at 03:54:12AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 11, 2024 at 12:29:19PM +0530, Manivannan Sadhasivam wrote:
> > MSI is the predecessor of MSI-X that allows PCIe devices to send interrupts
> > to the host. Compared to MSI-X, MSI supports only a maximum of 32 vectors
> > per PCIe function. But MSI has been widely supported by the PCIe devices
> > requiring fewer interrupts such as Modems, WLAN cards etc...
> > 
> > Currently, Virtio spec only documents MSI-X and INTX interrupt mechanisms
> > for the PCI transport. So if a Virtio device based on PCI transport
> > supports only MSI, then the driver on the guest will only use INTX for
> > receiving the interrupts. This is really sub-optimal and affects the
> > performance of the device. Because with MSI, the device can use one vector
> > per queue (max of 32 vectors) thus avoiding the overhead associated with a
> > shared INTX vector.
> > 
> > Hence, add support for MSI to the Virtio PCI transport. MSI support is
> > added such a way that it reuses the existing infrastructure of MSI-X, like
> > the config_msix_vector/queue_msix_vector fields of the Virito common config
> 
> avoid misspellings please.
> 

Sure.

> > structure. This makes it easy for the Virtio drivers to add MSI support
> > without any disruptive changes.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  transport-pci.tex | 125 +++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 97 insertions(+), 28 deletions(-)
> > 
> > diff --git a/transport-pci.tex b/transport-pci.tex
> > index a5c6719..f8e6ccd 100644
> > --- a/transport-pci.tex
> > +++ b/transport-pci.tex
> > @@ -347,7 +347,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> >          Driver Feature Bits selected by \field{driver_feature_select}.
> >  
> >  \item[\field{config_msix_vector}]
> > -        Set by the driver to the MSI-X vector for configuration change notifications.
> > +        Set by the driver to the MSI/MSI-X vector for configuration change notifications.
> >  
> >  \item[\field{num_queues}]
> >          The device specifies the maximum number of virtqueues supported here.
> > @@ -371,7 +371,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> >          A 0 means the queue is unavailable.
> >  
> >  \item[\field{queue_msix_vector}]
> > -        Set by the driver to the MSI-X vector for virtqueue notifications.
> > +        Set by the driver to the MSI/MSI-X vector for virtqueue notifications.
> >  
> >  \item[\field{queue_enable}]
> >          The driver uses this to selectively prevent the device from executing requests from this virtqueue.
> > @@ -631,11 +631,11 @@ \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virti
> >  in \field{ISR status} before sending a device configuration
> >  change notification to the driver.
> >  
> > -If MSI-X capability is disabled, the device MUST set the Queue
> > +If MSI/MSI-X capability is disabled, the device MUST set the Queue
> >  Interrupt bit in \field{ISR status} before sending a virtqueue
> >  notification to the driver.
> >  
> > -If MSI-X capability is disabled, the device MUST set the Interrupt Status
> > +If MSI/MSI-X capability is disabled, the device MUST set the Interrupt Status
> >  bit in the PCI Status register in the PCI Configuration Header of
> >  the device to the logical OR of all bits in \field{ISR status} of
> >  the device.  The device then asserts/deasserts INT\#x interrupts unless masked
> > @@ -645,7 +645,7 @@ \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virti
> >  
> >  \drivernormative{\paragraph}{ISR status capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
> >  
> > -If MSI-X capability is enabled, the driver SHOULD NOT access
> > +If MSI/MSI-X capability is enabled, the driver SHOULD NOT access
> >  \field{ISR status} upon detecting a Queue Interrupt.
> >  
> >  \subsubsection{Device-specific configuration}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Device-specific configuration}
> > @@ -838,7 +838,7 @@ \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio
> >  \hline
> >  \end{tabularx}
> >  
> > -If MSI-X is enabled for the device, two additional fields
> > +If MSI/MSI-X is enabled for the device, two additional fields
> >  immediately follow this header:
> >  
> >  \begin{tabular}{ |l||l|l| }
> > @@ -847,14 +847,14 @@ \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio
> >  \hline
> >  Read/Write & R+W            & R+W    \\
> >  \hline
> > -Purpose (MSI-X) & \field{config_msix_vector}  & \field{queue_msix_vector} \\
> > +Purpose (MSI/MSI-X) & \field{config_msix_vector}  & \field{queue_msix_vector} \\
> >  \hline
> >  \end{tabular}
> >  
> > -Note: When MSI-X capability is enabled, device-specific configuration starts at
> > -byte offset 24 in virtio common configuration structure. When MSI-X capability is not
> > +Note: When MSI/MSI-X capability is enabled, device-specific configuration starts at
> > +byte offset 24 in virtio common configuration structure. When MSI/MSI-X capability is not
> >  enabled, device-specific configuration starts at byte offset 20 in virtio
> > -header.  ie. once you enable MSI-X on the device, the other fields move.
> > +header.  ie. once you enable MSI/MSI-X on the device, the other fields move.
> >  If you turn it off again, they move back!
> >  
> >  Any device-specific configuration space immediately follows
> 
> 
> Legacy is legacy. It is there to document compatibility to existing
> drivers and hypervisors.  No changes, besides bugfixes to the legacy
> interface should be accepted.
> 

Ok.

> 
> > @@ -1017,7 +1017,7 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
> >  \drivernormative{\subparagraph}{MSI-X Vector Configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI-X Vector Configuration}
> >  
> >  Driver MUST support device with any MSI-X Table Size 0 to 0x7FF.
> > -Driver MAY fall back on using INT\#x interrupts for a device
> > +Driver MAY fall back on using MSI or INT\#x interrupts for a device
> >  which only supports one MSI-X vector (MSI-X Table Size = 0).
> 
> 
> Here do we want to also document fallback from MSI to INTx?
> 

I think it is not required, since it says that the driver call fallback to
either MSI or INTX. And the MSI section documents the immediate fallback to
INTX.

> >  
> >  Driver MAY interpret the Table Size as a hint from the device
> > @@ -1034,6 +1034,75 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
> >  the driver MAY retry mapping with fewer vectors, disable MSI-X
> >  or report device failure.
> >  

[...]

> > +\drivernormative{\subparagraph}{MSI Vector Configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI Vector Configuration}
> > +
> > +Driver MUST support device with any MSI vector from 0 to 0x1F.
> > +Driver MAY fall back on using INT\#x interrupts for a device
> > +which only supports one MSI vector (MSI Multiple Message Capable = 0).
> > +
> > +Driver MAY interpret the Multiple Message Capable field as a hint from the device
> > +for the suggested number of MSI vectors to use.
> > +
> > +Driver MUST NOT attempt to map an event to a vector
> > +outside the MSI vector supported by the device,
> > +as reported by \field{Multiple Message Capable} field in the MSI Capability.
> > +
> > +After mapping an event to vector, the
> > +driver MUST verify success by reading the Vector field value: on
> > +success, the previously written value is returned, and on
> > +failure, NO_VECTOR is returned. If a mapping failure is detected,
> > +the driver MAY retry mapping with fewer vectors, disable MSI
> > +or report device failure.
> > +
> >  \paragraph{Virtqueue Configuration}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / Virtqueue Configuration}
> >  
> >  As a device can have zero or more virtqueues for bulk data
> 
> Looks like a lot of text duplicated from MSI-X, can't we
> avoid doing that?
> 

Well, I initially tried to add MSI to the existing MSI-X sections, but that
looked messy. And all of the wordings are applicable to MSI as well. That's why
I kept them.

> 
> > @@ -1054,10 +1123,10 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
> >  \item Allocate and zero Descriptor Table, Available and Used rings for the
> >     virtqueue in contiguous physical memory.
> >  
> > -\item Optionally, if MSI-X capability is present and enabled on the
> > +\item Optionally, if MSI/MSI-X capability is present and enabled on the
> >    device, select a vector to use to request interrupts triggered
> > -  by virtqueue events. Write the MSI-X Table entry number
> > -  corresponding to this vector into \field{queue_msix_vector}. Read
> > +  by virtqueue events. Write the MSI-X Table entry number or MSI vector number
> > +  corresponding to this event into \field{queue_msix_vector}. Read
> >    \field{queue_msix_vector}: on success, previously written value is
> >    returned; on failure, NO_VECTOR value is returned.
> >  \end{enumerate}
> > @@ -1129,25 +1198,25 @@ \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Options / V
> >  If a used buffer notification is necessary for a virtqueue, the device would typically act as follows:
> >  
> >  \begin{itemize}
> > -  \item If MSI-X capability is disabled:
> > +  \item If MSI/MSI-X capability is disabled:
> >      \begin{enumerate}
> >      \item Set the lower bit of the ISR Status field for the device.
> >  
> >      \item Send the appropriate PCI interrupt for the device.
> >      \end{enumerate}
> >  
> > -  \item If MSI-X capability is enabled:
> > +  \item If MSI/MSI-X capability is enabled:
> >      \begin{enumerate}
> >      \item If \field{queue_msix_vector} is not NO_VECTOR,
> > -      request the appropriate MSI-X interrupt message for the
> > +      request the appropriate MSI/MSI-X interrupt message for the
> >        device, \field{queue_msix_vector} sets the MSI-X Table entry
> > -      number.
> > +      number or MSI vector number.
> 
> if we go with "the MSI-X Table entry" we should also do "the MSI
> vector".  We are inconsistent in this unfortunately, but at least not
> inside the same sentence.
> Applies elsewhere, too.
> 

Sure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
