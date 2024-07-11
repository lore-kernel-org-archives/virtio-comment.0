Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF3C14F9F3
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684469; cv=none; b=YCSPzmtmVx+ei/SAq0fk+dcsWSzcpSqzYWusTo76Qi+2bOEdqDyDlvfJQ+EDnBHP5kNnjOkxfJFqyH8T0VR9e21yx5uLkvmV6c89mvdcmXJWaXhSq2A6sVjlLppk8mHLJUtsb6Ce1DqyOfMJvSBc7H+g8fn6NUIWaMF10HFe0QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684469; c=relaxed/simple;
	bh=xZxZVn9L+TvRO9wgSmD5LUhlzoNgPq21VsKs559Q/lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cWhbLX/MiMgAqYywf73wn/2EEuAm/nkcAhDZf6LoI7qaVl4NLaGNBux4424HWx+Q0L/4DiMLg7fClEMiG8EnfKeKsiXOMmrSKc/EfyWeXP8C7+dwtF5DrRl3aBijfIZUlR50guKt1NdSW3Gm30XVaao94cDUsI3ue7fEeo9Vfuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bsvZ98wE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsvZ98wE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720684464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OMv4Qxniq+tGBa9TlNh1HVQ8snwLHV0UkYy/txdczEo=;
	b=bsvZ98wEIYizoj7nPBuj+sy0NbPeaEc7Y/BST/Kfj7lKZ43qrN0+obY7/eINa3qORAr78A
	vBptqawJOtlypgdxQapiWP7/wp++uQAkRhENVDVM41ulHPdYOjtauwKS+MRaTAA6Dnn1LF
	DTGVCCKcgn9RGcW9AYS2AoUYLHLtc5U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-DQLPw9WtPZSIIxZIhrArew-1; Thu, 11 Jul 2024 03:54:23 -0400
X-MC-Unique: DQLPw9WtPZSIIxZIhrArew-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-58d784d316aso461881a12.3
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 00:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720684461; x=1721289261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMv4Qxniq+tGBa9TlNh1HVQ8snwLHV0UkYy/txdczEo=;
        b=TttOM1AxQkTvxTBrreqEWL0B4glcKw4pFxpXrzcf1kpPaN7KhqbKCUI96ArDtLKMRQ
         oCbuY9FUwfDISvEv2h+2k+0Yj7SWIYhaHH3lPu0thnke/6lP3iQ4psruq8MYP66MMe7D
         nnVrb0xhpppqqidrFgQ4fqnPA56oR85qYcyaowNkmi2d6I15+M53IaDtg4IstxpQMApf
         g+f13qoMGjCprt8+ORJ51WRLnZNIHjUAZ41qsBxO7zkIvyPmeodYi0YdoJrAD9WJoDKZ
         lPHH1eN0Pp+s9DKYayToZtFc/NZ4b/yxaFMWdvy73hvvrr4tJKZIn4VKNTpf1WKFHs7S
         0WWQ==
X-Gm-Message-State: AOJu0YwkFC4W2jdPmIuk3dlsEiWPw03EKEvALD/VQrdoto/NaOtAFeNr
	L16AoR8mwOyivSB9TImj+uU6ktIrG/sOdPlhiXledljoP01jNgH5BTvWclhw1dNooYBIs70w7Z6
	ZdrRhmsDUl80KEru0NBFGNS/WNnCx1H8PgbFibfuWsKLh/r2cIdIliD1dGbgsCmogr+hpifPj
X-Received: by 2002:aa7:c1c5:0:b0:582:8746:6534 with SMTP id 4fb4d7f45d1cf-594bc7cb4demr7062650a12.28.1720684461404;
        Thu, 11 Jul 2024 00:54:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpbG9OrOVhPvkv/9SFfo99ihgEo76m1W3H4DrlLwEuc4uoMBigABckheKxgy24NIA5RPAw5Q==
X-Received: by 2002:aa7:c1c5:0:b0:582:8746:6534 with SMTP id 4fb4d7f45d1cf-594bc7cb4demr7062627a12.28.1720684460427;
        Thu, 11 Jul 2024 00:54:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bd459af1sm3168378a12.59.2024.07.11.00.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 00:54:20 -0700 (PDT)
Date: Thu, 11 Jul 2024 03:54:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH] transport-pci: Add MSI support
Message-ID: <20240711031716-mutt-send-email-mst@kernel.org>
References: <20240711065919.6977-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240711065919.6977-1-manivannan.sadhasivam@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2024 at 12:29:19PM +0530, Manivannan Sadhasivam wrote:
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
> the config_msix_vector/queue_msix_vector fields of the Virito common config

avoid misspellings please.

> structure. This makes it easy for the Virtio drivers to add MSI support
> without any disruptive changes.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  transport-pci.tex | 125 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 97 insertions(+), 28 deletions(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..f8e6ccd 100644
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
> @@ -838,7 +838,7 @@ \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio
>  \hline
>  \end{tabularx}
>  
> -If MSI-X is enabled for the device, two additional fields
> +If MSI/MSI-X is enabled for the device, two additional fields
>  immediately follow this header:
>  
>  \begin{tabular}{ |l||l|l| }
> @@ -847,14 +847,14 @@ \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio
>  \hline
>  Read/Write & R+W            & R+W    \\
>  \hline
> -Purpose (MSI-X) & \field{config_msix_vector}  & \field{queue_msix_vector} \\
> +Purpose (MSI/MSI-X) & \field{config_msix_vector}  & \field{queue_msix_vector} \\
>  \hline
>  \end{tabular}
>  
> -Note: When MSI-X capability is enabled, device-specific configuration starts at
> -byte offset 24 in virtio common configuration structure. When MSI-X capability is not
> +Note: When MSI/MSI-X capability is enabled, device-specific configuration starts at
> +byte offset 24 in virtio common configuration structure. When MSI/MSI-X capability is not
>  enabled, device-specific configuration starts at byte offset 20 in virtio
> -header.  ie. once you enable MSI-X on the device, the other fields move.
> +header.  ie. once you enable MSI/MSI-X on the device, the other fields move.
>  If you turn it off again, they move back!
>  
>  Any device-specific configuration space immediately follows


Legacy is legacy. It is there to document compatibility to existing
drivers and hypervisors.  No changes, besides bugfixes to the legacy
interface should be accepted.


> @@ -1017,7 +1017,7 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
>  \drivernormative{\subparagraph}{MSI-X Vector Configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI-X Vector Configuration}
>  
>  Driver MUST support device with any MSI-X Table Size 0 to 0x7FF.
> -Driver MAY fall back on using INT\#x interrupts for a device
> +Driver MAY fall back on using MSI or INT\#x interrupts for a device
>  which only supports one MSI-X vector (MSI-X Table Size = 0).


Here do we want to also document fallback from MSI to INTx?

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
> +Writing a valid MSI vector number, 0 to 0x1F, to
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

Looks like a lot of text duplicated from MSI-X, can't we
avoid doing that?


> @@ -1054,10 +1123,10 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
>  \item Allocate and zero Descriptor Table, Available and Used rings for the
>     virtqueue in contiguous physical memory.
>  
> -\item Optionally, if MSI-X capability is present and enabled on the
> +\item Optionally, if MSI/MSI-X capability is present and enabled on the
>    device, select a vector to use to request interrupts triggered
> -  by virtqueue events. Write the MSI-X Table entry number
> -  corresponding to this vector into \field{queue_msix_vector}. Read
> +  by virtqueue events. Write the MSI-X Table entry number or MSI vector number
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
> +      number or MSI vector number.

if we go with "the MSI-X Table entry" we should also do "the MSI
vector".  We are inconsistent in this unfortunately, but at least not
inside the same sentence.
Applies elsewhere, too.

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
> +      number or MSI vector number.
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

