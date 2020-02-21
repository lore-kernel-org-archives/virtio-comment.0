Return-Path: virtio-comment-return-1091-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13B89985F69
	for <virtio-comment@lists.oasis-open.org>; Fri, 21 Feb 2020 12:47:19 +0000 (UTC)
References: <DBBPR08MB47902B48AE4B6F9B446EF4BD82120@DBBPR08MB4790.eurprd08.prod.outlook.com>
From: Peter Hilber <peter.hilber@opensynergy.com>
Message-ID: <5372c73c-3528-8ad8-54c5-20a52ec22a6d@opensynergy.com>
Date: Fri, 21 Feb 2020 13:47:11 +0100
MIME-Version: 1.0
In-Reply-To: <DBBPR08MB47902B48AE4B6F9B446EF4BD82120@DBBPR08MB4790.eurprd08.prod.outlook.com>
Content-Language: en-US
Subject: [virtio-comment] Fwd: [PATCH] Add virtio SCMI device specification
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Forwarding reply to virtio-comment on behalf of Souvik Chakravarty.

-------- Forwarded Message --------
Subject: RE: [PATCH] Add virtio SCMI device specification
Date: Fri, 21 Feb 2020 11:22:57 +0000
From: Souvik Chakravarty <Souvik.Chakravarty@arm.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-open.org>
CC: linux-arm-kernel@lists.infradead.org
<linux-arm-kernel@lists.infradead.org>, Sudeep Holla <Sudeep.Holla@arm.com>

Hi Peter,

The overall proposal is mostly in sync with the SCMI specification. A
few comments below.

> -----Original Message-----
> From: Peter Hilber <peter.hilber@opensynergy.com>
> Sent: Thursday, February 20, 2020 7:37 PM
>
> This patch proposes a new virtio device for the Arm SCMI protocol.
>
> The device provides a simple transport for the Arm SCMI protocol[1]. The
> *S*ystem *C*ontroller *M*anagement *I*nterface protocol allows speaking t=
o

Its "System Control and Management Interface" (some recurrences are
there below which I haven't pointed out).

> embedded system controllers that allow orchestrating things like power

If we are using Virtio, the system controller is probably no longer
"embedded".

> management, system state management and sensor access. The SCMI protocol
> is used on SoCs where multiple cores and co-processors need access to the=
se
> resources.
>
> The virtio transport allows making use of this protocol in virtualized em=
bedded
> systems.

Again, what stops this from being deployed beyond embedded?
There is scope for hypervisors which might implement the full SCMI
device for non-embedded usages as well.

>
> OpenSynergy has a prototype implementation, and plans to upstream the Lin=
ux
> kernel driver.
>
> The PDF output (with ugly fonts, apologies) is available at [2].
>
> [1] https://developer.arm.com/docs/den0056/b
> [2]
> https://share.mailbox.org/ajax/share/0d959c190d5a1c47d18eb2fd5a1c40ad81
> e8d7897ab9ca1e/1/8/Mjk/MjkvOA
>
> Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
> ---
>  conformance.tex  |  27 ++++-
>  content.tex      |   1 +
>  introduction.tex |   3 +
>  virtio-scmi.tex  | 269
> +++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 297 insertions(+), 3 deletions(-)  create mode 100644 v=
irtio-
> scmi.tex
>

<SNIP>

> +
> +\subsubsection{cmdq Operation}\label{sec:Device Types / SCMI Device /
> +Device Operation / cmdq Operation}
> +
> +Each buffer in the cmdq holds a single SCMI command once the buffer has
> +been made available. When the buffer has been marked as used, it
> +contains the SCMI response. Conceptually, each SCMI message transmitted
> +over the cmdq uses its own short-lived SCMI A2P (agent to platform)
> +channel.

Any special significance of the "short-lived" phrase. Does it have any
implications on how it will interact with the SCMI driver?

> +
> +The SCMI response is in the same virtio buffer as the corresponding
> +SCMI command. The response contains the return values which SCMI
> +specifies for each command, whether synchronous or asynchronous.
> +Delayed responses are distinct SCMI messages transmitted over the eventq=
.
> +
> +Buffers in the cmdq contain both the request and the response. A
> +request has the following layout:
> +
> +\begin{lstlisting}
> +struct virtio_scmi_request {
> +        le32 len;
> +        le32 hdr;
> +        u8 params[<actual parameters size>]; }; \end{lstlisting}
> +
> +The virtio_scmi_request fields are interpreted as follows:
> +
> +\begin{description}
> +\item[\field{len}] (device-readable) size of \field{hdr} and actual
> +\field{params} in bytes \item[\field{hdr}] (device-readable) contains
> +the SCMI message header \item[\field{params}] (device-readable)
> +comprises the SCMI message parameters \end{description}
> +
> +A cmdq response has the following layout:
> +
> +\begin{lstlisting}
> +struct virtio_scmi_response {
> +        le32 len;
> +        le32 hdr;
> +        u8 ret_values[<actual return values size>]; }; \end{lstlisting}
> +
> +The virtio_scmi_response fields are interpreted as follows:
> +

<SNIP>

> +\subsubsection{eventq Operation}
> +
> +Each buffer in the eventq holds (once the buffer is marked as used)
> +either a single SCMI notification, or a single SCMI delayed response.
> +Conceptually, each SCMI message transmitted over the eventq uses its
> +own short-lived SCMI P2A (platform to agent) channel. Buffers in the
> +eventq have the following layout:

Same question. Any special significance of the "short-lived" phrase?

> +
> +\begin{lstlisting}
> +struct virtio_scmi_event_msg {
> +        /* start of device-writable data */
> +        le32 len;
> +        le32 hdr;
> +        u8 payload[<actual payload size>]; }; \end{lstlisting}
> +
> +\begin{description}
> +\item[\field{len}] (device-writable) size of \field{hdr} and actual
> +\field{payload} in bytes \item[\field{hdr}] (device-writable) contains
> +the SCMI message header \item[\field{payload}] (device-writable)
> +comprises the SCMI message payload \end{description}
> +
> +\devicenormative{\paragraph}{eventq Operation}{Device Types / SCMI
> +Device / Device Operation / eventq Operation}
> +
> +If the device intends to send a notification and there are no available
> +buffers in the eventq, the device SHOULD send a corresponding
> +notification later, once enough buffers become available.

Any reason why this is mandated? It should be possible for the device to
drop the notification if there is no buffer available since this
provides an implicit flow control as well, since the guest in this case
is clearly unable to consume the notifications at a sufficient rate.
Can we make this Recommended instead?

Regards,
Souvik

> +
> +The device MAY send the notification later if the events which cause
> +the notification take place in quick succession.
> +
> +If the device sends the notification later, the device MAY send the
> +notification with updated data, unless the specific SCMI protocol
> +disallows this.
> +
> +If the device intends to send a notification and there are available
> +buffers, but one of the buffers is too small to fit the notification,
> +the device MAY omit the notification.
> +
> +If the device intends to send a delayed response and there are no
> +available buffers in the eventq, the device MUST send the corresponding
> +delayed response once enough buffers become available.
> +
> +\subsubsection{Shared Memory Operation}
> +
> +Various SCMI protocols define statistics shared memory regions (for
> +statistics and sensor values).
> +
> +\devicenormative{\paragraph}{Shared Memory Operation}{Device Types /
> +SCMI Device / Device Operation / Shared Memory Operation}
> +
> +If VIRTIO_SCMI_F_SHARED_MEMORY was negotiated, the device MAY
> implement
> +an SCMI statistics shared memory region using a virtio shared memory
> +region.
> +
> +If the device implements a shared memory region, the device MUST assign
> +the corresponding shmid as per the following table:
> +
> +\begin{tabular}{|l|l|}
> +\hline
> +SCMI statistics shared memory region & Virtio shmid \\ \hline \hline
> +Power state statistics shared memory region & 1 \\ \hline Performance
> +domain statistics shared memory region & 2 \\ \hline Sensor Values
> +Shared Memory & 3 \\ \hline Reserved for future use & 4 to 0x7F \\
> +\hline Vendor-specific statistics shared memory regions & 0x80 to 0xFF
> +\\ \hline Reserved for future use & 0x100 and greater \\ \hline
> +\end{tabular}
> --
> 2.20.1

IMPORTANT NOTICE: The contents of this email and any attachments are
confidential and may also be privileged. If you are not the intended
recipient, please notify the sender immediately and do not disclose the
contents to any other person, use it for any purpose, or store or copy
the information in any medium. Thank you.

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

