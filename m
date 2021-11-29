Return-Path: <virtio-comment-return-2412-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0DAFC98612F
	for <virtio-comment@lists.oasis-open.org>; Mon, 29 Nov 2021 12:33:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20211126114654.425806-1-cohuck@redhat.com>
References: <20211126114654.425806-1-cohuck@redhat.com>
Date: Mon, 29 Nov 2021 13:33:08 +0100
Message-ID: <87ee6zi1kr.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v2] ccw: clarify device reset
Content-Type: text/plain
To: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: Jason Wang <jasowang@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Nov 26 2021, Cornelia Huck <cohuck@redhat.com> wrote:

> Unlike other transports, a reset triggered by the driver is actually
> complete once the command has been completed. Make this behaviour
> and the requirements more explicit.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/123

>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>
> v1->v2: drop channel I/O internals, talk more specificly about virtio reset
>
> ---
>  conformance.tex |  2 ++
>  content.tex     | 22 +++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/conformance.tex b/conformance.tex
> index 80547db4939b..f7975d974c63 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -123,6 +123,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Initialization / Communicating Status Information}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Host->Guest Notification / Notification via Adapter I/O Interrupts}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Guest->Host Notification}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>  \end{itemize}
>  
>  \conformance{\subsection}{Network Driver Conformance}\label{sec:Conformance / Driver Conformance / Network Driver Conformance}
> @@ -374,6 +375,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Initialization / Setting Up Indicators / Setting Up Two-Stage Queue Indicators}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Host->Guest Notification / Notification via Adapter I/O Interrupts}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Guest->Host Notification}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>  \end{itemize}
>  
>  \conformance{\subsection}{Network Device Conformance}\label{sec:Conformance / Device Conformance / Network Device Conformance}
> diff --git a/content.tex b/content.tex
> index 5d112af206d2..899df5ffde6d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2775,8 +2775,28 @@ \subsubsection{Guest->Host Notification}\label{sec:Virtio Transport Options / Vi
>  \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>  
>  In order to reset a device, a driver sends the
> -CCW_CMD_VDEV_RESET command.
> +CCW_CMD_VDEV_RESET command. This command does not carry any payload.
>  
> +The device signals completion of the virtio reset operation through successful
> +conclusion of the CCW_CMD_VDEV_RESET channel command. In particular, the
> +command not only triggers the reset operation, but the reset operation is
> +already completed when the operation concludes successfully.
> +
> +\devicenormative{\paragraph}{Resetting Devices}{Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
> +
> +The device MUST finish the virtio reset operation and reinitialize
> +\field{device status} to zero before it concludes the CCW_CMD_VDEV_RESET
> +command successfully.
> +
> +The device MUST NOT send notifications or interact with the queues after
> +it signaled successful conclusion of the CCW_CMD_VDEV_RESET command.
> +
> +\drivernormative{\paragraph}{Resetting Devices}{Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
> +
> +The driver MAY consider the virtio reset operation to be complete already after
> +successful conclusion of the CCW_CMD_VDEV_RESET channel command, although it
> +MAY also choose to verify reset completion by reading \field{device status} via
> +CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
>  
>  \chapter{Device Types}\label{sec:Device Types}
>  
> -- 
> 2.31.1


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

