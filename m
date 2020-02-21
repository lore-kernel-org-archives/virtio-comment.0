Return-Path: virtio-comment-return-1092-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AADC985F77
	for <virtio-comment@lists.oasis-open.org>; Fri, 21 Feb 2020 19:45:38 +0000 (UTC)
References: <20200220193715.12097-1-peter.hilber@opensynergy.com>
 <DBBPR08MB47902B48AE4B6F9B446EF4BD82120@DBBPR08MB4790.eurprd08.prod.outlook.com>
From: Peter Hilber <peter.hilber@opensynergy.com>
Message-ID: <88588437-56c5-f5ca-e17f-ca283c1d154b@opensynergy.com>
Date: Fri, 21 Feb 2020 20:45:31 +0100
MIME-Version: 1.0
In-Reply-To: <DBBPR08MB47902B48AE4B6F9B446EF4BD82120@DBBPR08MB4790.eurprd08.prod.outlook.com>
Content-Language: en-US
Subject: [virtio-comment] Re: [PATCH] Add virtio SCMI device specification
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Souvik Chakravarty <Souvik.Chakravarty@arm.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sudeep Holla <Sudeep.Holla@arm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 21.02.20 12:22, Souvik Chakravarty wrote:
> Hi Peter,
>=20
> The overall proposal is mostly in sync with the SCMI specification. A few=
 comments below.

Hi Souvik,

thanks for the review.

>=20
>> -----Original Message-----
>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Thursday, February 20, 2020 7:37 PM
>>
>> This patch proposes a new virtio device for the Arm SCMI protocol.
>>
>> The device provides a simple transport for the Arm SCMI protocol[1]. The
>> *S*ystem *C*ontroller *M*anagement *I*nterface protocol allows speaking =
to
>=20
> Its "System Control and Management Interface" (some recurrences are there=
 below which I haven't pointed out).
>=20
>> embedded system controllers that allow orchestrating things like power
>=20
> If we are using Virtio, the system controller is probably no longer "embe=
dded".
>=20
>> management, system state management and sensor access. The SCMI protocol
>> is used on SoCs where multiple cores and co-processors need access to th=
ese
>> resources.
>>
>> The virtio transport allows making use of this protocol in virtualized e=
mbedded
>> systems.
>=20
> Again, what stops this from being deployed beyond embedded?
> There is scope for hypervisors which might implement the full SCMI device=
 for non-embedded usages as well.

I will update the commit message and device intro text for the next
patch version according to the above comments.

>=20
>>
>> OpenSynergy has a prototype implementation, and plans to upstream the Li=
nux
>> kernel driver.
>>
>> The PDF output (with ugly fonts, apologies) is available at [2].
>>
>> [1] https://developer.arm.com/docs/den0056/b
>> [2]
>> https://share.mailbox.org/ajax/share/0d959c190d5a1c47d18eb2fd5a1c40ad81
>> e8d7897ab9ca1e/1/8/Mjk/MjkvOA
>>
>> Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
>> ---
>>  conformance.tex  |  27 ++++-
>>  content.tex      |   1 +
>>  introduction.tex |   3 +
>>  virtio-scmi.tex  | 269
>> +++++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 297 insertions(+), 3 deletions(-)  create mode 100644 =
virtio-
>> scmi.tex
>>
>=20
> <SNIP>
>=20
>> +
>> +\subsubsection{cmdq Operation}\label{sec:Device Types / SCMI Device /
>> +Device Operation / cmdq Operation}
>> +
>> +Each buffer in the cmdq holds a single SCMI command once the buffer has
>> +been made available. When the buffer has been marked as used, it
>> +contains the SCMI response. Conceptually, each SCMI message transmitted
>> +over the cmdq uses its own short-lived SCMI A2P (agent to platform)
>> +channel.
>=20
> Any special significance of the "short-lived" phrase. Does it have any im=
plications on how it will interact with the SCMI driver?

"Short-lived" should just illustrate that the conceptual channel is used
for the lifetime of a single message.

The motivation to introduce this concept: It should be clear that both
device and driver may send multiple messages at once (subject to the
other requirements). But the SCMI spec might be read to imply e.g. that
the platform must wait until the P2A "channel is now free and can be
used to send a further message" (DEN0056B p. 12). For the virtio
transport, since each message uses its own (conceptual) channel, it's
clear that the message's channel can never be considered occupied by
another message.

I think the short-lived channels don't match the meaning of channels in
the Linux kernel SCMI driver. From that driver POV, all messages in the
A2P resp. P2A direction would still go over the same channel (i.e. one
struct scmi_chan_info for A2P, one for P2A).

I'd try to reword the paragraph so the intent becomes more clear.

>=20
>> +
>> +The SCMI response is in the same virtio buffer as the corresponding
>> +SCMI command. The response contains the return values which SCMI
>> +specifies for each command, whether synchronous or asynchronous.
>> +Delayed responses are distinct SCMI messages transmitted over the event=
q.
>> +
>> +Buffers in the cmdq contain both the request and the response. A
>> +request has the following layout:
>> +
>> +\begin{lstlisting}
>> +struct virtio_scmi_request {
>> +        le32 len;
>> +        le32 hdr;
>> +        u8 params[<actual parameters size>]; }; \end{lstlisting}
>> +
>> +The virtio_scmi_request fields are interpreted as follows:
>> +
>> +\begin{description}
>> +\item[\field{len}] (device-readable) size of \field{hdr} and actual
>> +\field{params} in bytes \item[\field{hdr}] (device-readable) contains
>> +the SCMI message header \item[\field{params}] (device-readable)
>> +comprises the SCMI message parameters \end{description}
>> +
>> +A cmdq response has the following layout:
>> +
>> +\begin{lstlisting}
>> +struct virtio_scmi_response {
>> +        le32 len;
>> +        le32 hdr;
>> +        u8 ret_values[<actual return values size>]; }; \end{lstlisting}
>> +
>> +The virtio_scmi_response fields are interpreted as follows:
>> +
>=20
> <SNIP>
>=20
>> +\subsubsection{eventq Operation}
>> +
>> +Each buffer in the eventq holds (once the buffer is marked as used)
>> +either a single SCMI notification, or a single SCMI delayed response.
>> +Conceptually, each SCMI message transmitted over the eventq uses its
>> +own short-lived SCMI P2A (platform to agent) channel. Buffers in the
>> +eventq have the following layout:
>=20
> Same question. Any special significance of the "short-lived" phrase?

Please see answer above.

>=20
>> +
>> +\begin{lstlisting}
>> +struct virtio_scmi_event_msg {
>> +        /* start of device-writable data */
>> +        le32 len;
>> +        le32 hdr;
>> +        u8 payload[<actual payload size>]; }; \end{lstlisting}
>> +
>> +\begin{description}
>> +\item[\field{len}] (device-writable) size of \field{hdr} and actual
>> +\field{payload} in bytes \item[\field{hdr}] (device-writable) contains
>> +the SCMI message header \item[\field{payload}] (device-writable)
>> +comprises the SCMI message payload \end{description}
>> +
>> +\devicenormative{\paragraph}{eventq Operation}{Device Types / SCMI
>> +Device / Device Operation / eventq Operation}
>> +
>> +If the device intends to send a notification and there are no available
>> +buffers in the eventq, the device SHOULD send a corresponding
>> +notification later, once enough buffers become available.
>=20
> Any reason why this is mandated? It should be possible for the device to =
drop the notification if there is no buffer available since this provides a=
n implicit flow control as well, since the guest in this case is clearly un=
able to consume the notifications at a sufficient rate.
> Can we make this Recommended instead?

I was concerned that dropping non-periodic notifications during a
temporary overload could be problematic. If virtio driver
authors/integrators had the same concern, this could result in
unnecessarily large virtqueues to cover infrequent scenarios. By adding
this requirement, I intended to shift the responsibility for the
overload scenario to the virtio device authors.

If this is considered over-engineering, I will demote it to a
recommendation.

Best regards,

Peter

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

