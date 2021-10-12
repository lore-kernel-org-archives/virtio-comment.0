Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <20211011113828.309458-1-cohuck@redhat.com>
In-Reply-To: <20211011113828.309458-1-cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Oct 2021 10:54:37 +0800
Message-ID: <CACGkMEtb8P76pu0VM+B-Dt1BMi1edxv18BmAN0S6Z6_vHLHKSA@mail.gmail.com>
Subject: Re: [PATCH] ccw: clarify device reset
Content-Type: text/plain; charset="UTF-8"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Oct 11, 2021 at 7:38 PM Cornelia Huck <cohuck@redhat.com> wrote:
>
> Unlike other transports, a reset triggered by the driver is actually
> complete once the command has been completed. Make this behaviour
> and the requirements more explicit.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>
> We have discussed this before while talking about reset behaviour,
> but I don't remember sending an actual patch.
>
> If this looks good, I'll open an issue.
>
> ---
>  conformance.tex |  2 ++
>  content.tex     | 22 +++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/conformance.tex b/conformance.tex
> index c52f1a40be2d..24e862ad217a 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -122,6 +122,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Initialization / Communicating Status Information}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Host->Guest Notification / Notification via Adapter I/O Interrupts}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Guest->Host Notification}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>  \end{itemize}
>
>  \conformance{\subsection}{Network Driver Conformance}\label{sec:Conformance / Driver Conformance / Network Driver Conformance}
> @@ -372,6 +373,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Initialization / Setting Up Indicators / Setting Up Two-Stage Queue Indicators}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Host->Guest Notification / Notification via Adapter I/O Interrupts}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Guest->Host Notification}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>  \end{itemize}
>
>  \conformance{\subsection}{Network Device Conformance}\label{sec:Conformance / Device Conformance / Network Device Conformance}
> diff --git a/content.tex b/content.tex
> index 5e716721edb3..0410f46f6a78 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2775,8 +2775,28 @@ \subsubsection{Guest->Host Notification}\label{sec:Virtio Transport Options / Vi
>  \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>
>  In order to reset a device, a driver sends the
> -CCW_CMD_VDEV_RESET command.
> +CCW_CMD_VDEV_RESET command. This command does not carry any payload.
>
> +The device signals completion of the reset operation by making the subchannel
> +status pending to indicate successful completion of the channel command.

Not familiar with ccw, but I wonder what's the meaning of "making the
subchannel status pending"?

> +Notably, the command not only triggers the reset operation, but the reset
> +operation is already completed when the operation concludes successfully.
> +
> +\devicenormative{\paragraph}{Resetting Devices}{Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
> +
> +Before making the subchannel status pending to indicate successful completion
> +of the reset command, the device MUST reinitialize \field{device status} to
> +zero.

Is the ordering of reinitialization and interrupt guaranteed by the transport?

> +
> +The device MUST NOT send notifications or interact with the queues after
> +it signaled successful completion of the reset command.
> +
> +\drivernormative{\paragraph}{Resetting Devices}{Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
> +
> +The driver MAY consider the reset operation to be complete already after
> +successful completion of the channel command, although it MAY also verify
> +reset completion by reading \field{device status} via CCW_CMD_READ_STATUS
> +afterwards.

I wonder if it's better to say

The driver MUST consider the reset operation to be complete by either ... or ...

Thanks

>
>  \chapter{Device Types}\label{sec:Device Types}
>
> --
> 2.31.1
>

