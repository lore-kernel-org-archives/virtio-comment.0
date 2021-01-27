Return-Path: virtio-comment-return-1683-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01B2A98656B
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Jan 2021 09:19:15 +0000 (UTC)
Date: Wed, 27 Jan 2021 10:19:04 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20210127101904.326d5295.pasic@linux.ibm.com>
In-Reply-To: <20210125110823.591104-1-cohuck@redhat.com>
References: <20210125110823.591104-1-cohuck@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v3] clarify device reset
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 25 Jan 2021 12:08:23 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> Properly specify that the method for the driver to request a
> device reset is transport specific, and some action the device
> has to take.
>=20
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>=20
> RFC v2 -> v3:
>   - re-worded the "must not send notifications" clause to avoid guessing
>   - added a driver conformance clause on how a driver should find out
>     when reset is complete
> RFC -> RFC v2:
>   - moved reset spec to basic facilities
>=20
> ---
>  conformance.tex |  2 ++
>  content.tex     | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/conformance.tex b/conformance.tex
> index eb3324053080..21fe89ccd937 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -60,6 +60,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
>  \begin{itemize}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device =
Status Field}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Feature=
 Bits}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device / Device =
Reset}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device =
Configuration Space}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message=
 Framing}
> @@ -271,6 +272,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \begin{itemize}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device =
Status Field}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature=
 Bits}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device =
Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device =
Configuration Space}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message=
 Framing}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtque=
ues / The Virtqueue Descriptor Table}
> diff --git a/content.tex b/content.tex
> index 620c0e28c9a7..9cdefe16509e 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -193,6 +193,25 @@ \section{Notifications}\label{sec:Basic Facilities o=
f a Virtio Device
>  terminology. Occasionally, the term event is used to refer to
>  a notification or a receipt of a notification.
> =20
> +\section{Device Reset}\label{sec:Basic Facilities of a Virtio Device / D=
evice Reset}
> +
> +The driver may initiate a device reset at various times; notably, during
> +device initialization and device cleanup.

Are there times the driver may not initiate a device reset? What are we
trying to tell with this sentence?

If we are just looking for an introductionary sentence, I would probably
go with something like "A device reset be either initiated by the
driver, or by a system reset, or other external controls."

> +
> +The mechanism used by the driver to initiate the reset is transport spec=
ific.
> +
> +\devicenormative{\subsection}{Device Reset}{Basic Facilities of a Virtio=
 Device / Device Reset}
> +
> +A device MUST reinitialize device status to 0 after receiving a reset.
> +

What is the intent behind this sentence?

One way I can read this it, that the device reset is not allowed to
fail. I.e. device must reinitialize status to after receiving a reset
and status 0 indicating the reset is done implies, that a reset must
succeed eventually (provided the device did receive).

The other way i can read it is, what I would rather have worded as:
"The device MUST indicate the completion of the reset by reinitializing
the device status to 0".


> +A device MUST NOT send notifications after indicating completion of
> +the reset by reinitializing the device status to 0.

I've just realized, that 'after' is very open to the right. Of course
the device may send notifications again after the driver re-initialized
the device as per 3.1.1.

Maybe it is wiser to tie this restriction to the current status value
(without any after or before), and do it where the notifications are
described.=20

Also a device that has status 0 may not poke the virtqueues. If we
are explicit about the notifications, we should be explicit about
the virtqueues as well.

> +
> +\drivernormative{\subsection}{Device Reset}{Basic Facilities of a Virtio=
 Device / Device Reset}
> +
> +The driver SHOULD consider a driver-initiated reset complete when it
> +reads the device status as 0.
> +
>  \section{Device Configuration Space}\label{sec:Basic Facilities of a Vir=
tio Device / Device Configuration Space}
> =20
>  Device configuration space is generally used for rarely-changing or


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

