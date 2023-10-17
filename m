Return-Path: <virtio-comment-return-7753-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3073FCDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 12:25:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 71B19157EE6
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 12:25:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5AB10986856
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 12:25:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4806998684F; Tue, 17 Oct 2023 12:25:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 38B4A986850
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 12:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: PiucNWfHPs-YWKFwq8dmmw-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
 mst@redhat.com
Cc: hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com,
 shahafs@nvidia.com, Parav Pandit <parav@nvidia.com>
In-Reply-To: <20231002051601.6626-3-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 17 Oct 2023 14:25:17 +0200
Message-ID: <871qdte8r6.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 2/2] content: Support enabling virtqueue after
 DRIVER_OK stage

On Mon, Oct 02 2023, Parav Pandit <parav@nvidia.com> wrote:

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

(...)

> @@ -440,6 +440,38 @@ \subsubsection{Virtqueue Re-enable}\label{sec:Basic =
Facilities of a Virtio Devic
>  as during initial virtqueue discovery, but optionally with different
>  parameters.
> =20
> +\subsection{Dynamic Virtqueues}\label{sec:Basic Facilities of a Virtio D=
evice / Virtqueues / Dynamic Virtqueues}
> +
> +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver enables the vir=
tqueues
> +during the device initialization sequence, i.e. after the device sets th=
e
> +FEATURES_OK status bit and before the driver setting the DRIVER_OK statu=
s bit.

_Or_ if a virtqueue has been reset and the driver wants to re-enable it,
right?

> +
> +When VIRTIO_F_RING_DYNAMIC is negotiated, the driver can avoid enabling =
the
> +virtqueues before setting the DRIVER_OK status bit; the driver can enabl=
e the
> +specific virtqueues after the driver has set the DRIVER_OK status bit.

"the driver is not required to enable every virtqueue it wants to use
before setting the DRIVER_OK status bit; it can choose to enable a
virtqueue even after it has set the DRIVER_OK status bit."

> +The virtqueue enable mechanism is transport specific.

Would that be the same mechanism as for re-enabling a queue after a
queue reset? I guess I'm missing the relationship here...

> +
> +\devicenormative{\paragraph}{Enable Virtqueues}{Basic Facilities of a Vi=
rtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
> +
> +When VIRTIO_F_RING_DYNAMIC is negotiated, the device MUST allow enabling=
 the
> +virtqueue which was not enabled during the device initialization phase

s/the virtqueue/a virtqueue/

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

Can we write this more concisely as

"When VIRTIO_F_RING_DYNAMIC is negotiated, the driver MAY enable any
virtqueue either before or after it has set the DRIVER_OK status bit."

?

> +
> +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver MUST enable the
> +required number of virtqueues before setting the DRIVER_OK status bit.

What does "required" mean here? It just chooses to enable the queues it
wants to use, right?

I'm also still not quite clear how this relates to re-enabling queues
after queue reset.

> +
>  \input{split-ring.tex}
> =20
>  \input{packed-ring.tex}
> @@ -537,7 +569,9 @@ \section{Device Initialization}\label{sec:General Ini=
tialization And Device Oper
> =20
>  \item\label{itm:General Initialization And Device Operation / Device Ini=
tialization / Device-specific Setup} Perform device-specific setup, includi=
ng discovery of virtqueues for the
>     device, optional per-bus setup, reading and possibly writing the
> -   device's virtio configuration space, and population of virtqueues.
> +   device's virtio configuration space.
> +
> +\item\label{itm:General Initialization And Device Operation / Device Ini=
tialization / Virtqueue Setup} Configure and enable the virtqueues.
> =20
>  \item\label{itm:General Initialization And Device Operation / Device Ini=
tialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point t=
he device is
>     ``live''.
> @@ -551,6 +585,10 @@ \section{Device Initialization}\label{sec:General In=
itialization And Device Oper
>  The driver MUST NOT send any buffer available notifications to
>  the device before setting DRIVER_OK.
> =20
> +The driver MAY skip step
> +\ref{itm:General Initialization And Device Operation / Device Initializa=
tion / Virtqueue Setup}
> +when driver has negotiated VIRTIO_F_RING_DYNAMIC feature.

That's confusing: It may not only skip it, but also enable only a subset
of the queues it wants to use later.

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
> =20
>  Therefore, when using the legacy interface:
> @@ -872,6 +910,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved F=
eature Bits}
>  =09\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bi=
ts} for
>  =09handling features reserved for future use.
> =20
> +  \item[VIRTIO_F_RING_DYNAMIC(42)] This feature indicates
> +  that the driver can enable the virtqueues individually after the drive=
r has

s/the virtqueues/virtqueues/

> +  set the status bit of DRIVER_OK.
> +  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynami=
c Virtqueues}.
> +
>  \end{description}
> =20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}

We currently have a device normative statement:

"The device MUST NOT consume buffers or send any used buffer
notifications to the driver before DRIVER_OK."

I guess we need to extend that to not doing that for not-yet-enabled
queues in the dynamic virtqueue case? There's a (transport-specific)
point in time when the driver tells the device that the queue is ready,
right?


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

