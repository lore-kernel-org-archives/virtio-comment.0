Return-Path: <virtio-comment-return-7671-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4BFCDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 06:39:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AF87C2AC47
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 06:39:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 927CD986837
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 06:39:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 769AE986474; Thu, 12 Oct 2023 06:39:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 60FCE98660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 06:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VtzLtZJ_1697092763;
Message-ID: <1697092752.6200163-3-xuanzhuo@linux.alibaba.com>
Date: Thu, 12 Oct 2023 14:39:12 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: <hengqi@linux.alibaba.com>,
 <xuanzhuo@linux.alibaba.com>,
 <shahafs@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 <virtio-comment@lists.oasis-open.org>,
 <mst@redhat.com>,
 <cohuck@redhat.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com>
In-Reply-To: <20231002051601.6626-3-parav@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 2/2] content: Support enabling virtqueue after DRIVER_OK stage

On Mon, 2 Oct 2023 08:16:01 +0300, Parav Pandit <parav@nvidia.com> wrote:
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
>    In a container, number of virtqueues to be used may be <=3D max queues.
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
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


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
> +during the device initialization sequence, i.e. after the device sets the
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
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits=
} for
>  	handling features reserved for future use.
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

