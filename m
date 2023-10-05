Return-Path: <virtio-comment-return-7587-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13D3E7AD44
	for <virtio-comment@archiver.kernel.org>; Thu,  5 Oct 2023 16:53:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EC9FF68468
	for <virtio-comment@archiver.kernel.org>; Thu,  5 Oct 2023 16:53:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D3D679867EF
	for <virtio-comment@archiver.kernel.org>; Thu,  5 Oct 2023 16:53:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BEC9C9867EC; Thu,  5 Oct 2023 16:53:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AC5769867ED
	for <virtio-comment@lists.oasis-open.org>; Thu,  5 Oct 2023 16:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: eTm7BjhYOf-yTMVaKIvqFw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696524829; x=1697129629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFvyP0hqeIBBdfpdF0TbLe0NFST5PIlJsxtCL/7SvfM=;
        b=qI0TiVFjRKzQ6xsJFN8P56f2e3D8ZWpGUGleNRmtmlWpbnL3UwwBTk1Z6mAwT/+MSf
         UBnT570w0goKcZSUzGipqSx7NvgRb25o4DdcFyZiI1SJsZYbfzqnNMsiZDKtUP4Ptdm2
         0AHO//S8duHIrfFv8Q3TiKxUmDBgggCYVARsJg+UBnIN0LZYxLBHYlqG+C2pK7UGH+A3
         pfMJLAYZHelqsPjBXbGMg5bO8auQpsAwsxScpKhrvE4UZuRzZIj8mitXQS7vQn7QCHLw
         ZD70rWwpuf7mapE54O6cyOBFLV0HRLUN6cDkW4Xpj5qjkFNZbhiKtftOVNF9+1HDcHoD
         hR6Q==
X-Gm-Message-State: AOJu0Yw40Z37NHGDCbbeRzYavQ5EzgCWoqh5EVf/cddFie6ysGK/UqBm
	QTMrXZY+Tqs0BqTQnx4rkTMZnkr3x8gTjmrbMNJQZxp4vgAhWWEkLJx0gFo+8b9gnmif3oselkb
	nt5OMn3cqD1DvlcEFQmUsIz8hBpqSblx4sENN6Ut8BmpKcZdTwA==
X-Received: by 2002:a0d:db56:0:b0:59f:69e6:18c5 with SMTP id d83-20020a0ddb56000000b0059f69e618c5mr5950559ywe.11.1696524829549;
        Thu, 05 Oct 2023 09:53:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE16gbD26DOlPFBZodK4XI4UpXEGfQ8ncQIQ3dsDH7Blb/WQHA4eHur34GchKPoBWqBE+RRGGSxChd6lftzR00=
X-Received: by 2002:a0d:db56:0:b0:59f:69e6:18c5 with SMTP id
 d83-20020a0ddb56000000b0059f69e618c5mr5950546ywe.11.1696524829119; Thu, 05
 Oct 2023 09:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231002051601.6626-1-parav@nvidia.com> <20231002051601.6626-3-parav@nvidia.com>
In-Reply-To: <20231002051601.6626-3-parav@nvidia.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 5 Oct 2023 18:53:12 +0200
Message-ID: <CAJaqyWckz_HotsdHbuHE3ui4NcYieYeADO=u5aB8DRHZt9ZmiQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, 
	hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com, shahafs@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Mon, Oct 2, 2023 at 7:17=E2=80=AFAM Parav Pandit <parav@nvidia.com> wrot=
e:
>
> Currently, a virtqueue must be enabled before driver has set the
> DRIVER_OK status bit.
>
> spec citation to section "Driver Requirements: Device Initialization"
>
> "Perform device-specific setup, including discovery of virtqueues
> for the device, optional per-bus setup, reading and possibly writing
> the device=E2=80=99s virtio configuration space, and population of virtqu=
eues."
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
>    In a container, number of virtqueues to be used may be <=3D max queues=
.
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
> [1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.=
html
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/177

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v2->v3:
> - github fixes tag added
> v1->v2:
> - fixed comments from Michael
> - reduced device and driver normatives (simplified)
> - replace 'a virtqueue' to 'the virtqueues'
> - reworded to remove 'interested'
> - avoided repeated 'device initialization text', replaced with
>   DRIVER_OK status bit language
> - avoided confusing text around 'MAY' in the requirements
> - replaced 'the queue' to 'specific virtqueues'
> - replaced queue to virtqueue
> - simplified commit log to talk about msix
> v0->v1:
> - fixed comments from Xuan
> - removed blank lines
> - fixed wrong requirement link to device in driver section
> ---
>  conformance.tex |  2 ++
>  content.tex     | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 48 insertions(+), 3 deletions(-)
>
> diff --git a/conformance.tex b/conformance.tex
> index 863f9c5..75de58c 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -77,6 +77,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device =
Configuration Space}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues / Virtqueue Reset / Virtqueue Reset}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues / Dynamic Virtqueues / Enable Virtqueues}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message=
 Framing}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues / The Virtqueue Descriptor Table}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues / The Virtqueue Descriptor Table / Indirect Descriptors}
> @@ -164,6 +165,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device =
Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device =
Configuration Space}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtque=
ues / Virtqueue Reset / Virtqueue Reset}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtque=
ues / Dynamic Virtqueues / Enable Virtqueues}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message=
 Framing}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtque=
ues / The Virtqueue Descriptor Table}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtque=
ues / The Virtqueue Descriptor Table / Indirect Descriptors}
> diff --git a/content.tex b/content.tex
> index 0a62dce..1a296a9 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -102,7 +102,7 @@ \section{Feature Bits}\label{sec:Basic Facilities of =
a Virtio Device / Feature B
>  \item[24 to 41] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms
>
> -\item[42 to 49, and 128 and above] Feature bits reserved for future exte=
nsions.
> +\item[43 to 49, and 128 and above] Feature bits reserved for future exte=
nsions.
>  \end{description}
>
>  \begin{note}
> @@ -440,6 +440,38 @@ \subsubsection{Virtqueue Re-enable}\label{sec:Basic =
Facilities of a Virtio Devic
>  as during initial virtqueue discovery, but optionally with different
>  parameters.
>
> +\subsection{Dynamic Virtqueues}\label{sec:Basic Facilities of a Virtio D=
evice / Virtqueues / Dynamic Virtqueues}
> +
> +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver enables the vir=
tqueues
> +during the device initialization sequence, i.e. after the device sets th=
e
> +FEATURES_OK status bit and before the driver setting the DRIVER_OK statu=
s bit.
> +
> +When VIRTIO_F_RING_DYNAMIC is negotiated, the driver can avoid enabling =
the
> +virtqueues before setting the DRIVER_OK status bit; the driver can enabl=
e the
> +specific virtqueues after the driver has set the DRIVER_OK status bit.
> +The virtqueue enable mechanism is transport specific.
> +
> +\devicenormative{\paragraph}{Enable Virtqueues}{Basic Facilities of a Vi=
rtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
> +
> +When VIRTIO_F_RING_DYNAMIC is negotiated, the device MUST allow enabling=
 the
> +virtqueue which was not enabled during the device initialization phase
> +i.e. after the device has set the FEATURES_OK status bit and before the
> +driver has set the DRIVER_OK status bit.
> +
> +\drivernormative{\paragraph}{Enable Virtqueues}{Basic Facilities of a Vi=
rtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
> +
> +When VIRTIO_F_RING_DYNAMIC is negotiated,
> +\begin{itemize}
> +\item the driver MAY enable some or all the virtqueues after the driver =
has set the
> +      DRIVER_OK status bit.
> +
> +\item the driver MAY enable some of the virtqueues or all the virtqueues=
 or none of
> +      the virtqueues before the driver has set the DRIVER_OK status bit.
> +\end{itemize}
> +
> +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver MUST enable the
> +required number of virtqueues before setting the DRIVER_OK status bit.
> +
>  \input{split-ring.tex}
>
>  \input{packed-ring.tex}
> @@ -537,7 +569,9 @@ \section{Device Initialization}\label{sec:General Ini=
tialization And Device Oper
>
>  \item\label{itm:General Initialization And Device Operation / Device Ini=
tialization / Device-specific Setup} Perform device-specific setup, includi=
ng discovery of virtqueues for the
>     device, optional per-bus setup, reading and possibly writing the
> -   device's virtio configuration space, and population of virtqueues.
> +   device's virtio configuration space.
> +
> +\item\label{itm:General Initialization And Device Operation / Device Ini=
tialization / Virtqueue Setup} Configure and enable the virtqueues.
>
>  \item\label{itm:General Initialization And Device Operation / Device Ini=
tialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point t=
he device is
>     ``live''.
> @@ -551,6 +585,10 @@ \section{Device Initialization}\label{sec:General In=
itialization And Device Oper
>  The driver MUST NOT send any buffer available notifications to
>  the device before setting DRIVER_OK.
>
> +The driver MAY skip step
> +\ref{itm:General Initialization And Device Operation / Device Initializa=
tion / Virtqueue Setup}
> +when driver has negotiated VIRTIO_F_RING_DYNAMIC feature.
> +
>  \subsection{Legacy Interface: Device Initialization}\label{sec:General I=
nitialization And Device Operation / Device Initialization / Legacy Interfa=
ce: Device Initialization}
>  Legacy devices did not support the FEATURES_OK status bit, and thus did
>  not have a graceful way for the device to indicate unsupported feature
> @@ -569,7 +607,7 @@ \subsection{Legacy Interface: Device Initialization}\=
label{sec:General Initializ
>  Initialization / Re-read FEATURES-OK} were omitted, and steps
>  \ref{itm:General Initialization And Device Operation /
>  Device Initialization / Read feature bits},
> -\ref{itm:General Initialization And Device Operation / Device Initializa=
tion / Device-specific Setup} and \ref{itm:General Initialization And Devic=
e Operation / Device Initialization / Set DRIVER-OK}
> +\ref{itm:General Initialization And Device Operation / Device Initializa=
tion / Device-specific Setup}, \ref{itm:General Initialization And Device O=
peration / Device Initialization / Virtqueue Setup} and \ref{itm:General In=
itialization And Device Operation / Device Initialization / Set DRIVER-OK}
>  were conflated.
>
>  Therefore, when using the legacy interface:
> @@ -872,6 +910,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved F=
eature Bits}
>         \ref{devicenormative:Basic Facilities of a Virtio Device / Featur=
e Bits} for
>         handling features reserved for future use.
>
> +  \item[VIRTIO_F_RING_DYNAMIC(42)] This feature indicates
> +  that the driver can enable the virtqueues individually after the drive=
r has
> +  set the status bit of DRIVER_OK.
> +  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynami=
c Virtqueues}.
> +
>  \end{description}
>
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> --
> 2.34.1
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

