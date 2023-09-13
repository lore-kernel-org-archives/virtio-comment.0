Return-Path: <virtio-comment-return-7395-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969CACA5511
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 08:54:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D22401318CB
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 08:54:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B4A3498663F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 08:54:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A1236986632; Wed, 13 Sep 2023 08:54:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90F51986633
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 08:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Qei60QTPMSKjqBdIklyH9w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694595289; x=1695200089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4t7kg0fQ4AasonzcVJBOoEb3EdqGhr5Ha8bsPq53XNY=;
        b=K6nBb6fPOFcqawybMWckd2DqWjpr4QJH2QnGZki69pN4MGXRUR6Mi986keaeufrvCL
         Zb+t2NKKK7vHT6afFXmYm1ZBKbXiZOlsBEwDnnkRPCoffOEW2CmEQ/yLyGfORFjIRYAk
         eV6mGQhtPF2hoMq79uMl7YzwjFXQaVxAuPAbkvud1JMTPZQFVAjJoGPbIRK+n6PBRKBj
         3p+6BxGZUzdR3vroY2Wedt6bd/2Y7oCQ7yJES03D6h7gM6mW+t/Nr8SzazpiQ/L/bSWs
         5QEUYnU9f06f0u2lttssm5PNwa3VXZ6Wvi0n2EEEhYaKVlgE/Jh0pNrWD6PAwjh4MCqb
         Jprw==
X-Gm-Message-State: AOJu0YxbEI0xWXzDLJMYpIiGrawjMuLhaCRi8Q1fNRv5RDWL7+zC8Q81
	0hRbvTXd4vA4ke3viwsQ+oz+BBQHwgnACgBRKIsZRQwl4P3/8XoL/hFYQnFhxoa9Zu/J1bfjy5g
	42B8T6aY+UJKzCFjHfzAHb5nKw7YjnXtnNQ==
X-Received: by 2002:a17:906:100e:b0:9ad:7f8a:3720 with SMTP id 14-20020a170906100e00b009ad7f8a3720mr1315290ejm.73.1694595288850;
        Wed, 13 Sep 2023 01:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmlSo77y09SEx9AXa1KIAfaX7QEtF2w8AEDwXgohHKvCHUC/OjJeZkKQIrxx9lMUq/h1+BSg==
X-Received: by 2002:a17:906:100e:b0:9ad:7f8a:3720 with SMTP id 14-20020a170906100e00b009ad7f8a3720mr1315277ejm.73.1694595288435;
        Wed, 13 Sep 2023 01:54:48 -0700 (PDT)
Date: Wed, 13 Sep 2023 04:54:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com,
	shahafs@nvidia.com
Message-ID: <20230913044121-mutt-send-email-mst@kernel.org>
References: <20230909143218.524481-1-parav@nvidia.com>
 <20230909143218.524481-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230909143218.524481-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH 2/2] content: Support enabling virtqueue after DRIVER_OK
 stage

On Sat, Sep 09, 2023 at 05:32:18PM +0300, Parav Pandit wrote:
> Currently, a virtqueue must be enabled before driver has set the
> DRIVER_OK status bit.
> 
> spec citation to section "Driver Requirements: Device Initialization"
> 
> "Perform device-specific setup, including discovery of virtqueues
> for the device, optional per-bus setup, reading and possibly writing
> the device’s virtio configuration space, and population of virtqueues."
> 
> This implies that a virtqueue must be enabled before reaching the
> DRIVER_OK stage. There was no explicit mention about ability to
> enable the virtqueue after DRIVER_OK stage.
> 
> In following usecases, creating a virtqueue after DRIVER_OK phase is
> desired.
> 
> 1. Dynamically create aq when administrative commands to be used.
> 2. Dynamically create the net device tx/rxq when device is
>    opened when deploying for a container.
>    In a container, number of virtqueues to be used may be <= max queues.
> 3. Dynamically create flow filter queues of netdevice when
>    ARFS or ethtool filters are enabled as listed in [1].
> 4. Dynamically create rtc functionality related read virtqueue only
>    when net device when timestamping to be used.
> 5. When XDP program is set, one can create additional XDP specific
>    queues without affecting existing queues.
> 
> Hence, This patch introduces an existing queue enable and disable
> (aka reset) facility and a new feature bit to explicitly indicate such
> support by the device.
> 
> With this feature, drivers can skip optional queues creation during
> driver init time. For example, a Linux net device driver
> can create/destroy the transmit and receive queues when net device's
> ndo_open() and ndo_stop() callbacks are invoked respectively.
> 
> As side effect, it also enables driver to not consume MSI-X vectors for
> the PCI device at driver load time and utilize(enable) individual vector
> when needed. This further helps on some cpus at high scale where a
> interrupt line may not be available from the platform.
> 
> [1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html


I'm not arguing against this functionality - Eugenio wanted it too -
but the use-cases of MSI looks suspect.

If you want to save on vectors isn't the thing to do actually
to allow changing the vector in the PCI mapping? Or not even that -
change vectors in the MSIX table.


> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  conformance.tex |  2 ++
>  content.tex     | 54 ++++++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/conformance.tex b/conformance.tex
> index 863f9c5..07b0b7b 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -77,6 +77,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
> @@ -164,6 +165,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
> diff --git a/content.tex b/content.tex
> index 0a62dce..91aee25 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -102,7 +102,7 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  \item[24 to 41] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms
>  
> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>  \end{description}
>  
>  \begin{note}
> @@ -440,6 +440,42 @@ \subsubsection{Virtqueue Re-enable}\label{sec:Basic Facilities of a Virtio Devic
>  as during initial virtqueue discovery, but optionally with different
>  parameters.
>  
> +\subsection{Dynamic Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues}
> +
> +When VIRTIO_F_RING_DYNAMIC is not negotiated, the virtqueues are
> +enabled when the device is initialized, i.e. after the driver has ensured that
> +the device has set the FEATURES_OK status bit and before the driver setting
> +the DRIVER_OK status bit.

Avoid passive voice pls. I think you mean driver enables not queues are
enabled.


> +When VIRTIO_F_RING_DYNAMIC is negotiated, the driver can avoid enabling the queue
> +before setting the DRIVER_OK status bit; the driver can enable the queue after
> +the driver has set the DRIVER_OK status bit. The queue enable mechanism is
> +transport specific.

I think you mean "specific queues" not "the queue".



Something else to consider is how this interacts with the ring reset
feature. I think you must allow ring reset before driver ok too, right?


> +
> +\devicenormative{\paragraph}{Enable Virtqueues}{Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
> +
> +When VIRTIO_F_RING_DYNAMIC is negotiated, the device MUST allow enabling the
> +virtqueue which was not enabled during the device initialization phase
> +i.e. after the device has set the FEATURES_OK status bit and before the
> +driver has set the DRIVER_OK status bit.
> +
> +\drivernormative{\paragraph}{Enable Virtqueues}{Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
> +
> +When VIRTIO_F_RING_DYNAMIC is negotiated,
> +\begin{itemize}
> +\item
> +the driver MAY not enable all the virtqueues during the device initialization phase;

MAY not sounds like it's not allowed. just drop this?


> +
> +\item the driver MAY enable some or all the virtqueues after the driver has set the
> +	DRIVER_OK status bit.
> +
> +\item the driver MAY enable all the virtqueues during the device initialization phase;
> +\end{itemize}
> +
> +The driver interested

let's be more formal pls. 
- if it does not negotiate it SHOULD enable before
- if it does negotiate it MAY enable after

> in enabling and disabling the virtqueue dynamically
> +after setting the DRIVER_OK status bit MUST negotiate VIRTIO_F_RING_DYNAMIC
> +and VIRTIO_F_RING_RESET features.

what does this have to do with reset?


So what is your assumption on existing devices. Do you think no drivers
enable before DRIVER_OK, or do you think some might?`


> +
>  \input{split-ring.tex}
>  
>  \input{packed-ring.tex}
> @@ -537,7 +573,9 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
>  
>  \item\label{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup} Perform device-specific setup, including discovery of virtqueues for the
>     device, optional per-bus setup, reading and possibly writing the
> -   device's virtio configuration space, and population of virtqueues.
> +   device's virtio configuration space.
> +
> +\item\label{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup} Configure and enable the virtqueues.
>  
>  \item\label{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point the device is
>     ``live''.
> @@ -551,6 +589,10 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
>  The driver MUST NOT send any buffer available notifications to
>  the device before setting DRIVER_OK.
>  
> +The driver MAY skip step
> +\ref{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup}
> +when driver has negotiated VIRTIO_F_RING_DYNAMIC feature.
> +
>  \subsection{Legacy Interface: Device Initialization}\label{sec:General Initialization And Device Operation / Device Initialization / Legacy Interface: Device Initialization}
>  Legacy devices did not support the FEATURES_OK status bit, and thus did
>  not have a graceful way for the device to indicate unsupported feature
> @@ -569,7 +611,7 @@ \subsection{Legacy Interface: Device Initialization}\label{sec:General Initializ
>  Initialization / Re-read FEATURES-OK} were omitted, and steps
>  \ref{itm:General Initialization And Device Operation /
>  Device Initialization / Read feature bits},
> -\ref{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup} and \ref{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK}
> +\ref{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup}, \ref{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup} and \ref{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK}
>  were conflated.
>  
>  Therefore, when using the legacy interface:
> @@ -872,8 +914,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_RING_DYNAMIC(42)] This feature indicates
> +  that the driver can enable a virtqueue individually after the driver has

virtqueues

> +  set the status bit of DRIVER_OK.
> +  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues}.
> +
>  \end{description}
>  
> +
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>  
>  A driver MUST accept VIRTIO_F_VERSION_1 if it is offered.  A driver
> -- 
> 2.34.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

