Return-Path: virtio-comment-return-1644-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 79C1C985D30
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Jan 2021 16:41:40 +0000 (UTC)
Date: Mon, 18 Jan 2021 16:41:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20210118164132.GC9899@work-vm>
References: <20210118163804.437098-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210118163804.437098-1-cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH RFC v2] clarify device reset
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

* Cornelia Huck (cohuck@redhat.com) wrote:
> Properly specify that the method for the driver to request a
> device reset is transport specific, and some action the device
> has to take.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> RFC -> RFC v2:
>   - moved reset spec to basic facilities
> 
> ---
>  conformance.tex |  1 +
>  content.tex     | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/conformance.tex b/conformance.tex
> index eb3324053080..3be499ae3c5e 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -271,6 +271,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \begin{itemize}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Status Field}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
> diff --git a/content.tex b/content.tex
> index 620c0e28c9a7..782ddf3ed78d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -193,6 +193,19 @@ \section{Notifications}\label{sec:Basic Facilities of a Virtio Device
>  terminology. Occasionally, the term event is used to refer to
>  a notification or a receipt of a notification.
>  
> +\section{Device Reset}\label{sec:Basic Facilities of a Virtio Device / Device Reset}
> +
> +The driver may initiate a device reset at various times; notably, during
> +device initialization and device cleanup.
> +
> +The mechanism used by the driver to initiate the reset is transport specific.
> +
> +\devicenormative{\subsection}{Device Reset}{Basic Facilities of a Virtio Device / Device Reset}
> +
> +A device MUST reinitialize device status to 0 after receiving a reset.
> +
> +A device MUST NOT send notifications after receiving a reset.
> +

This feels like a bit of a race in the description;  a Device may have
just sent a notification at the point that it receives a reset.
When a driver initiates a reset, how does the driver know that the
device has received it?

Dave

>  \section{Device Configuration Space}\label{sec:Basic Facilities of a Virtio Device / Device Configuration Space}
>  
>  Device configuration space is generally used for rarely-changing or
> -- 
> 2.26.2
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


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

