Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A87215ECE0
	for <virtio-comment@lists.linux.dev>; Wed, 24 Jul 2024 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721838110; cv=none; b=sK2VudI9F7bwpBIz8eoTbOoPzUwvIgILUgIVZOFZjCf99NPIDeDSGiF8O9NXui+qrcHacuQkQjc9PhfPJz0iXmhEOEzYFA++532bgURcQrR5xAij0nJ277/q8a0zXamFY8mRn6I+BRlRHNfIQV/vshRxny9WzMy2kVZEUIaZEKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721838110; c=relaxed/simple;
	bh=8aG0wtcrLFH00sDkj5AsboASZ/r+kAXzdLku7rBw6vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naUyNQzIiTSiyU3tOjoIZTYtg4NoZWT8gsqbrhhfmM3Nnh9J/+AMKvzdyI0yfJzfKRBOjRz8/DQGR/OcIcJjlu1DTL7Ybr5QfCclRA7jjDBANe1HTGzwZ5hCkDOY5dP7dpnc0m9SfF1lzeNmBmWrImzkNIx6yig1n8AG4GHg0hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJvW99Y/; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJvW99Y/"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d6301e7279so4520452b6e.3
        for <virtio-comment@lists.linux.dev>; Wed, 24 Jul 2024 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721838107; x=1722442907; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=84VsGoCwB28Q+SHURs4lJ89ReQ1yChnwGf3007VbiiM=;
        b=jJvW99Y/B62uIyJKBL1NhMOk3XgJiu0AAsLOM+e1UggS6kqI4XdMnRjkFv5Vp2CROr
         MBUBFhjUD1+OwVaSsz6DADCcmnyiAvUphk9OsOOOcPtXUfb8s5iNfMmA4/ykPbi7jrTn
         W4kCKIdscW+ifjNMwVGQzC/0F4GfgeGPwvOTMGVur276RkQeOcB1jurCk7n/ZkrrJ6fM
         tywVL947nHdXBa/cl4a/HLS8v4nQhuxy/VARdIICt5f6pcM2iJWXji87r9tpXrvqLer+
         LhsZypKSeIE9yyUp9RaUpfgsr15sp/p6GJYNSCXcnk4VaIPugTi0T//L5b5VnR8H6GbF
         hCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721838107; x=1722442907;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84VsGoCwB28Q+SHURs4lJ89ReQ1yChnwGf3007VbiiM=;
        b=H41N+jM8clH6xqU/PS/eQmrhM8zwQVHp9KqE4DlYP5bOEcJhCEVW8koil2zM3qJm63
         0vT05y9W3anDZZ6xs/W2LvbwyLeIQxoC6GVBMN+Wozvmb13r4AoFIApXehlym/+CGRa2
         kLXJloKDuMFieLzJ8otxc+1QTUkzn4kcBmNVmd4l3y67181Yj8/B3G1FON+bXrLwMUlp
         ZCKaovQeGUFnBweO3UQ+3FoFaOkn6le6OjgX/DYMAyhOxtDTlFxPtAt7KrJ9E+mviVDG
         p9ilAax2Ey+SJf91ls564SY3iYY5M/Q1hvluem3CDgWmoDzGSRWWarhyfX+tmsEqol/R
         P0Vg==
X-Gm-Message-State: AOJu0YziZZ2iCF2BgGOdKccy0BuO5IpKVNXTaUo1Wc3qL/5UZJC0E146
	O8GdJQ8MUaLoP9289Q17Yd7EGXDmXvdsqCnRbAfo5aDOxtVSpKwzjBLa8beFoqKrcPRme6paqwE
	=
X-Google-Smtp-Source: AGHT+IEC0hzRpwBpdQUs6LAeIlEzbwl8WqXce/fDM9eaK+aFtQcDaEhXZajKYyBag9ghR0L6GGpnFA==
X-Received: by 2002:a05:6808:3093:b0:3d9:3337:d38a with SMTP id 5614622812f47-3db10e4155dmr161750b6e.3.1721838107162;
        Wed, 24 Jul 2024 09:21:47 -0700 (PDT)
Received: from thinkpad ([103.244.168.26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a1a1b9c8f9sm5066914a12.26.2024.07.24.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:21:46 -0700 (PDT)
Date: Wed, 24 Jul 2024 21:51:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: mie@igel.co.jp
Subject: Re: [PATCH v2] transport-pci: Add MSI support
Message-ID: <20240724162143.GH3349@thinkpad>
References: <20240712140144.12066-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240712140144.12066-1-manivannan.sadhasivam@linaro.org>

On Fri, Jul 12, 2024 at 07:31:44PM +0530, Manivannan Sadhasivam wrote:
> MSI is the predecessor of MSI-X that allows PCIe devices to send interrupts
> to the host. Compared to MSI-X, MSI supports only a maximum of 32 vectors
> per PCIe function. But MSI has been widely supported by the PCIe devices
> requiring fewer interrupts such as Modems, WLAN cards etc...
> 
> Currently, Virtio spec only documents MSI-X and INTX interrupt mechanisms
> for the PCI transport. So if a Virtio device based on PCI transport
> supports only MSI, then the driver on the guest will only use INTX for
> receiving the interrupts. This is really sub-optimal and affects the
> performance of the device. Because with MSI, the device can use one vector
> per queue (max of 32 vectors) thus avoiding the overhead associated with a
> shared INTX vector.
> 
> Hence, add support for MSI to the Virtio PCI transport. MSI support is
> added such a way that it reuses the existing infrastructure of MSI-X, like
> the config_msix_vector/queue_msix_vector fields of the Virtio common config
> structure. This makes it easy for the Virtio drivers to add MSI support
> without any disruptive changes.
> 

Gentle ping!

- Mani

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Changes in v2:
> 
> * Fixed a spelling mistake in commit message
> * Removed update to legacy interface
> * Used 'MSI vector' consistently
> 
>  transport-pci.tex | 115 ++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 92 insertions(+), 23 deletions(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..fd92641 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -347,7 +347,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          Driver Feature Bits selected by \field{driver_feature_select}.
>  
>  \item[\field{config_msix_vector}]
> -        Set by the driver to the MSI-X vector for configuration change notifications.
> +        Set by the driver to the MSI/MSI-X vector for configuration change notifications.
>  
>  \item[\field{num_queues}]
>          The device specifies the maximum number of virtqueues supported here.
> @@ -371,7 +371,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          A 0 means the queue is unavailable.
>  
>  \item[\field{queue_msix_vector}]
> -        Set by the driver to the MSI-X vector for virtqueue notifications.
> +        Set by the driver to the MSI/MSI-X vector for virtqueue notifications.
>  
>  \item[\field{queue_enable}]
>          The driver uses this to selectively prevent the device from executing requests from this virtqueue.
> @@ -631,11 +631,11 @@ \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virti
>  in \field{ISR status} before sending a device configuration
>  change notification to the driver.
>  
> -If MSI-X capability is disabled, the device MUST set the Queue
> +If MSI/MSI-X capability is disabled, the device MUST set the Queue
>  Interrupt bit in \field{ISR status} before sending a virtqueue
>  notification to the driver.
>  
> -If MSI-X capability is disabled, the device MUST set the Interrupt Status
> +If MSI/MSI-X capability is disabled, the device MUST set the Interrupt Status
>  bit in the PCI Status register in the PCI Configuration Header of
>  the device to the logical OR of all bits in \field{ISR status} of
>  the device.  The device then asserts/deasserts INT\#x interrupts unless masked
> @@ -645,7 +645,7 @@ \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virti
>  
>  \drivernormative{\paragraph}{ISR status capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
>  
> -If MSI-X capability is enabled, the driver SHOULD NOT access
> +If MSI/MSI-X capability is enabled, the driver SHOULD NOT access
>  \field{ISR status} upon detecting a Queue Interrupt.
>  
>  \subsubsection{Device-specific configuration}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Device-specific configuration}
> @@ -1017,7 +1017,7 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
>  \drivernormative{\subparagraph}{MSI-X Vector Configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI-X Vector Configuration}
>  
>  Driver MUST support device with any MSI-X Table Size 0 to 0x7FF.
> -Driver MAY fall back on using INT\#x interrupts for a device
> +Driver MAY fall back on using MSI or INT\#x interrupts for a device
>  which only supports one MSI-X vector (MSI-X Table Size = 0).
>  
>  Driver MAY interpret the Table Size as a hint from the device
> @@ -1034,6 +1034,75 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
>  the driver MAY retry mapping with fewer vectors, disable MSI-X
>  or report device failure.
>  
> +\paragraph{MSI Vector Configuration}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI Vector Configuration}
> +
> +When MSI capability is present and enabled in the device
> +(through standard PCI configuration space) \field{config_msix_vector} and \field{queue_msix_vector} are used to map configuration change and queue
> +interrupts to MSI vectors. In this case, the ISR Status is unused.
> +
> +Writing a valid MSI vector, 0 to 0x1F, to
> +\field{config_msix_vector}/\field{queue_msix_vector} maps interrupts triggered
> +by the configuration change/selected queue events respectively to
> +the corresponding MSI vector. To disable interrupts for an
> +event type, the driver unmaps this event by writing a special NO_VECTOR
> +value:
> +
> +\begin{lstlisting}
> +/* Vector value used to disable MSI for queue */
> +#define VIRTIO_MSI_NO_VECTOR            0xffff
> +\end{lstlisting}
> +
> +Note that mapping an event to vector might require device to
> +allocate internal device resources, and thus could fail.
> +
> +\devicenormative{\subparagraph}{MSI Vector Configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI Vector Configuration}
> +
> +A device that has an MSI capability SHOULD support at least 2
> +and at most 0x20 MSI vectors.
> +Device MUST report the number of vectors supported in
> +\field{Multiple Message Capable} field in the MSI Capability as specified in
> +\hyperref[intro:PCI]{[PCI]}.
> +The device SHOULD restrict the reported MSI Multiple Message Capable field
> +to a value that might benefit system performance.
> +\begin{note}
> +For example, a device which does not expect to send
> +interrupts at a high rate might only specify 2 MSI vectors.
> +\end{note}
> +Device MUST support mapping any event type to any valid
> +vector 0 to number of MSI vectors specified in \field{Multiple Message Capable} field.
> +Device MUST support unmapping any event type.
> +
> +The device MUST return vector mapped to a given event,
> +(NO_VECTOR if unmapped) on read of \field{config_msix_vector}/\field{queue_msix_vector}.
> +The device MUST have all queue and configuration change
> +events unmapped upon reset.
> +
> +Devices SHOULD NOT cause mapping an event to vector to fail
> +unless it is impossible for the device to satisfy the mapping
> +request.  Devices MUST report mapping
> +failures by returning the NO_VECTOR value when the relevant
> +\field{config_msix_vector}/\field{queue_msix_vector} field is read.
> +
> +\drivernormative{\subparagraph}{MSI Vector Configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI Vector Configuration}
> +
> +Driver MUST support device with any MSI vector from 0 to 0x1F.
> +Driver MAY fall back on using INT\#x interrupts for a device
> +which only supports one MSI vector (MSI Multiple Message Capable = 0).
> +
> +Driver MAY interpret the Multiple Message Capable field as a hint from the device
> +for the suggested number of MSI vectors to use.
> +
> +Driver MUST NOT attempt to map an event to a vector
> +outside the MSI vector supported by the device,
> +as reported by \field{Multiple Message Capable} field in the MSI Capability.
> +
> +After mapping an event to vector, the
> +driver MUST verify success by reading the Vector field value: on
> +success, the previously written value is returned, and on
> +failure, NO_VECTOR is returned. If a mapping failure is detected,
> +the driver MAY retry mapping with fewer vectors, disable MSI
> +or report device failure.
> +
>  \paragraph{Virtqueue Configuration}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / Virtqueue Configuration}
>  
>  As a device can have zero or more virtqueues for bulk data
> @@ -1054,10 +1123,10 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
>  \item Allocate and zero Descriptor Table, Available and Used rings for the
>     virtqueue in contiguous physical memory.
>  
> -\item Optionally, if MSI-X capability is present and enabled on the
> +\item Optionally, if MSI/MSI-X capability is present and enabled on the
>    device, select a vector to use to request interrupts triggered
> -  by virtqueue events. Write the MSI-X Table entry number
> -  corresponding to this vector into \field{queue_msix_vector}. Read
> +  by virtqueue events. Write the MSI-X Table entry number or MSI vector
> +  corresponding to this event into \field{queue_msix_vector}. Read
>    \field{queue_msix_vector}: on success, previously written value is
>    returned; on failure, NO_VECTOR value is returned.
>  \end{enumerate}
> @@ -1129,25 +1198,25 @@ \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Options / V
>  If a used buffer notification is necessary for a virtqueue, the device would typically act as follows:
>  
>  \begin{itemize}
> -  \item If MSI-X capability is disabled:
> +  \item If MSI/MSI-X capability is disabled:
>      \begin{enumerate}
>      \item Set the lower bit of the ISR Status field for the device.
>  
>      \item Send the appropriate PCI interrupt for the device.
>      \end{enumerate}
>  
> -  \item If MSI-X capability is enabled:
> +  \item If MSI/MSI-X capability is enabled:
>      \begin{enumerate}
>      \item If \field{queue_msix_vector} is not NO_VECTOR,
> -      request the appropriate MSI-X interrupt message for the
> +      request the appropriate MSI/MSI-X interrupt message for the
>        device, \field{queue_msix_vector} sets the MSI-X Table entry
> -      number.
> +      number or MSI vector.
>      \end{enumerate}
>  \end{itemize}
>  
>  \devicenormative{\paragraph}{Used Buffer Notifications}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Used Buffer Notifications}
>  
> -If MSI-X capability is enabled and \field{queue_msix_vector} is
> +If MSI/MSI-X capability is enabled and \field{queue_msix_vector} is
>  NO_VECTOR for a virtqueue, the device MUST NOT deliver an interrupt
>  for that virtqueue.
>  
> @@ -1157,19 +1226,19 @@ \subsubsection{Notification of Device Configuration Changes}\label{sec:Virtio Tr
>  state, as reflected in the device-specific configuration region of the device. In this case:
>  
>  \begin{itemize}
> -  \item If MSI-X capability is disabled:
> +  \item If MSI/MSI-X capability is disabled:
>      \begin{enumerate}
>      \item Set the second lower bit of the ISR Status field for the device.
>  
>      \item Send the appropriate PCI interrupt for the device.
>      \end{enumerate}
>  
> -  \item If MSI-X capability is enabled:
> +  \item If MSI/MSI-X capability is enabled:
>      \begin{enumerate}
>      \item If \field{config_msix_vector} is not NO_VECTOR,
> -      request the appropriate MSI-X interrupt message for the
> +      request the appropriate MSI/MSI-X interrupt message for the
>        device, \field{config_msix_vector} sets the MSI-X Table entry
> -      number.
> +      number or MSI vector.
>      \end{enumerate}
>  \end{itemize}
>  
> @@ -1178,7 +1247,7 @@ \subsubsection{Notification of Device Configuration Changes}\label{sec:Virtio Tr
>  
>  \devicenormative{\paragraph}{Notification of Device Configuration Changes}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Notification of Device Configuration Changes}
>  
> -If MSI-X capability is enabled and \field{config_msix_vector} is
> +If MSI/MSI-X capability is enabled and \field{config_msix_vector} is
>  NO_VECTOR, the device MUST NOT deliver an interrupt
>  for device configuration space changes.
>  
> @@ -1191,7 +1260,7 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
>  The driver interrupt handler would typically:
>  
>  \begin{itemize}
> -  \item If MSI-X capability is disabled:
> +  \item If MSI/MSI-X capability is disabled:
>      \begin{itemize}
>        \item Read the ISR Status field, which will reset it to zero.
>        \item If the lower bit is set:
> @@ -1201,14 +1270,14 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
>        \item If the second lower bit is set:
>          re-examine the configuration space to see what changed.
>      \end{itemize}
> -  \item If MSI-X capability is enabled:
> +  \item If MSI/MSI-X capability is enabled:
>      \begin{itemize}
>        \item
> -        Look through all virtqueues mapped to that MSI-X vector for the
> +        Look through all virtqueues mapped to that MSI/MSI-X vector for the
>          device, to see if any progress has been made by the device
>          which requires servicing.
>        \item
> -        If the MSI-X vector is equal to \field{config_msix_vector},
> +        If the MSI/MSI-X vector is equal to \field{config_msix_vector},
>          re-examine the configuration space to see what changed.
>      \end{itemize}
>  \end{itemize}
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
