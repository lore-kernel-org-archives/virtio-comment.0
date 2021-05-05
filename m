Return-Path: virtio-comment-return-1850-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0EC1E9864EC
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 May 2021 13:20:52 +0000 (UTC)
Date: Wed, 5 May 2021 09:20:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20210505091944-mutt-send-email-mst@kernel.org>
References: <20210128135235.679402-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210128135235.679402-1-cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH v4] clarify device reset
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 28, 2021 at 02:52:35PM +0100, Cornelia Huck wrote:
> Properly specify that the method for the driver to request a
> device reset is transport specific, and some action the device
> has to take.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> Stefan, Halil: I did not apply your R-b due to the amount of changes.
> 
> v3 -> v4:
>   - moved device status 're-initialize to 0' clause that is now duplicated
>     to an informal description
>   - more clarifications on when reset may be used and device requirements
>   - use \field{device status} consistently
> RFC v2 -> v3:
>   - re-worded the "must not send notifications" clause to avoid guessing
>   - added a driver conformance clause on how a driver should find out
>     when reset is complete
> RFC -> RFC v2:
>   - moved reset spec to basic facilities
> 
> ---
>  conformance.tex |  2 ++
>  content.tex     | 24 +++++++++++++++++++++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/conformance.tex b/conformance.tex
> index e78adfdbd283..17c390d249db 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -64,6 +64,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \begin{itemize}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Status Field}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Feature Bits}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Reset}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
> @@ -283,6 +284,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \begin{itemize}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Status Field}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
> diff --git a/content.tex b/content.tex
> index 1ca24c13f2d0..47239b877c6c 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -51,6 +51,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>    an error from which it can't recover.
>  \end{description}
>  
> +The \field{device status} field starts out as 0, and is reinitialized to 0 by
> +the device during reset.
> +
>  \drivernormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}
>  The driver MUST update \field{device status},
>  setting bits to indicate the completed steps of the driver
> @@ -71,7 +74,6 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  \end{note}
>  
>  \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}
> -The device MUST initialize \field{device status} to 0 upon reset.
>  
>  The device MUST NOT consume buffers or send any used buffer
>  notifications to the driver before DRIVER_OK.

Do we want to keep the part where it starts out as 0 here?

> @@ -193,6 +195,26 @@ \section{Notifications}\label{sec:Basic Facilities of a Virtio Device
>  terminology. Occasionally, the term event is used to refer to
>  a notification or a receipt of a notification.
>  
> +\section{Device Reset}\label{sec:Basic Facilities of a Virtio Device / Device Reset}
> +
> +The driver may want to initiate a device reset at various times; notably,
> +it is required to do so during device initialization and device cleanup.
> +
> +The mechanism used by the driver to initiate the reset is transport specific.
> +
> +\devicenormative{\subsection}{Device Reset}{Basic Facilities of a Virtio Device / Device Reset}
> +
> +A device MUST reinitialize \field{device status} to 0 after receiving a reset.
> +
> +A device MUST NOT send notifications or interact with the queues after
> +indicating completion of the reset by reinitializing \field{device status}
> +to 0, until the driver re-initializes the device.
> +
> +\drivernormative{\subsection}{Device Reset}{Basic Facilities of a Virtio Device / Device Reset}
> +
> +The driver SHOULD consider a driver-initiated reset complete when it
> +reads \field{device status} as 0.
> +
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

