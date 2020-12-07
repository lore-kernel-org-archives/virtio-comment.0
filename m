Return-Path: virtio-comment-return-1549-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8E87A985E74
	for <virtio-comment@lists.oasis-open.org>; Mon,  7 Dec 2020 14:57:40 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Mon, 7 Dec 2020 14:57:34 +0000
Message-ID: <BN6PR1801MB20675794659456FBC7B39408C5CE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
References: <BN6PR1801MB20674853EEEB69E982B02C8BC5EE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20201123171642.2da4abfa.pasic@linux.ibm.com>
 <20201124111907.4e6fea45.cohuck@redhat.com>
 <20201207090602-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201207090602-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: [virtio-comment] RE: [EXT] Re: [virtio-comment] [PATCH v9] virtio-net: Add support for
 the flexible driver notification structure.
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


>-----Original Message-----
>From: Michael S. Tsirkin <mst@redhat.com>
>Sent: Monday, 7 December, 2020 16:06
>To: Cornelia Huck <cohuck@redhat.com>
>Cc: Halil Pasic <pasic@linux.ibm.com>; Vitaly Mireyno <vmireyno@marvell.co=
m>; virtio-
>comment@lists.oasis-open.org; Jason Wang <jasowang@redhat.com>; Ariel Elio=
r
><aelior@marvell.com>
>Subject: [EXT] Re: [virtio-comment] [PATCH v9] virtio-net: Add support for=
 the flexible driver
>notification structure.
>
>External Email
>
>----------------------------------------------------------------------
>On Tue, Nov 24, 2020 at 11:19:07AM +0100, Cornelia Huck wrote:
>> On Mon, 23 Nov 2020 17:16:42 +0100
>> Halil Pasic <pasic@linux.ibm.com> wrote:
>>
>> > On Thu, 5 Nov 2020 22:41:42 +0000
>> > Vitaly Mireyno <vmireyno@marvell.com> wrote:
>> >
>> > > When the driver is required to send an available buffer notification=
 to the device, it sends the
>virtqueue number to be notified.
>> > > With this new feature, the device can optionally provide a per-virtq=
ueue value for the driver to
>use in driver notifications, instead of the virtqueue number.
>> > > Some devices may benefit from this flexibility by providing, for exa=
mple, an internal virtqueue
>identifier, or an internal offset related to the virtqueue number.
>> > >
>> > > Changes from v8:
>> > >  * Incorporated comments for v8:
>> > >      - moved the feature from a network device to a global section
>> > >      - few minor changes
>> > >
>> > > Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>> > > ---
>> > >  content.tex | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>> > >  1 file changed, 45 insertions(+), 1 deletion(-)
>>
>> >
>> > Whith your patch applied on top of current master I get something
>> > like this
>> >
>> > """
>> > \subsubsection{Available Buffer Notifications}\label{sec:Virtio
>> > Transport Options / Virtio Over PCI Bus / PCI-specific
>> > Initialization And Device Operation / Available Buffer
>> > Notifications}
>> >
>> > When VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver
>> > sends an available buffer notification to the device by writing the
>> > 16-bit virtqueue index of this virtqueue to the Queue Notify
>> > address.
>> >
>> > When VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver
>> > sends an available buffer notification to the device by writing the
>> > following 32-bit value to the Queue Notify address:
>> > \lstinputlisting{notifications-le.c}
>> >
>> > See \ref{sec:Virtqueues / Driver
>> > notifications}~\nameref{sec:Virtqueues / Driver notifications} for the=
 definition of the components.
>> >
>> > See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI
>> > Device Layout / Notification capability} for how to calculate the Queu=
e Notify address.
>> >
>> > \drivernormative{\paragraph}{Available Buffer Notifications}{Virtio
>> > Transport Options / Virtio Over PCI Bus / PCI-specific Initialization =
And Device Operation / Available
>Buffer Notifications} If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
>> > \begin{itemize}
>> > \item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the
>> > driver MUST use the \field{queue_notify_data} value instead of the vir=
tqueue index.
>> > \item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver
>> > MUST set the \field{vqn} field to the \field{queue_notify_data} value.
>> > \end{itemize}
>> >
>> > \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport
>> > Options / Virtio Over PCI Bus / PCI-specific Initialization And Device=
 Operation / Used Buffer
>Notifications} """
>> >
>> > The device normative section and the preceding text are IMHO in
>> > contradiction. The former says  the driver sends a 16-bit virtqueue
>> > index unconditionally, the later says if if
>> > VIRTIO_F_NOTIFICATION_DATA has been negotiated then use
>> > queue_notify_data, instead (thus referencing the non-normative content=
).
>> >
>>
>> I'd probably reword the paragraph above to
>>
>> "When VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver
>> sends an available buffer notification to the device by writing either
>> the 16-bit virtqueue index of this virtqueue or, if
>> VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the 16-bit queue
>> notification data to the Queue Notify address."
>>
>> > IMHO we need a normative section that fully describes all the
>> > available cases.
>> >
>> > I think we can do this on top.
>>
>> Agreed.
>
>Vitaly can you please propose a patch addressing all these comments?
>

Sure. I see that the patch was committed, so I'll work on a new one address=
ing these comments.

>
>> >
>> > Regards,
>> > Halil
>> >
>> > This publicly archived list offers a means to provide input to the
>> > OASIS Virtual I/O Device (VIRTIO) TC.
>> >
>> > In order to verify user consent to the Feedback License terms and to
>> > minimize spam in the list archive, subscription is required before
>> > posting.
>> >
>> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> > List help: virtio-comment-help@lists.oasis-open.org
>> > List archive:
>> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-2Do
>> > pen.org_archives_virtio-2Dcomment_&d=3DDwIBAg&c=3DnKjWec2b6R0mOyPaz7xt=
fQ
>> > &r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DSdg9nY3DXvmW8GOOA=
nS
>> > c3bvhynULlXrU6VJr0PwpCQw&s=3DPUKZFs2yNUYr72olm1OXA3_bn6TJDPIPkctEwLQV_
>> > _c&e=3D Feedback License:
>> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dope
>> > n.org_who_ipr_feedback-5Flicense.pdf&d=3DDwIBAg&c=3DnKjWec2b6R0mOyPaz7=
xt
>> > fQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DSdg9nY3DXvmW8GO=
OA
>> > nSc3bvhynULlXrU6VJr0PwpCQw&s=3DvdV5kbrxxGNM4ip1ZRHf-1ZYtlJo3iC40zyQHey
>> > tOUs&e=3D List Guidelines:
>> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dope
>> > n.org_policies-2Dguidelines_mailing-2Dlists&d=3DDwIBAg&c=3DnKjWec2b6R0=
mO
>> > yPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DSdg9nY3D=
Xv
>> > mW8GOOAnSc3bvhynULlXrU6VJr0PwpCQw&s=3D53wcRwDYA794xlY_OV9nEQ4Pb9j5kXk4
>> > owwz4acRJlk&e=3D
>> > Committee:
>> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dope
>> > n.org_committees_virtio_&d=3DDwIBAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDH=
J2FW
>> > 52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DSdg9nY3DXvmW8GOOAnSc3bvhynULl
>> > XrU6VJr0PwpCQw&s=3Dj_NyouqpYmr-2MPBHQyQXFLZXj01PEcFqtoNnZiB0bY&e=3D
>> > Join OASIS:
>> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dope
>> > n.org_join_&d=3DDwIBAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqs=
ArgF
>> > Rdcevq01tbLQAw4A_NO7xgI&m=3DSdg9nY3DXvmW8GOOAnSc3bvhynULlXrU6VJr0PwpCQ
>> > w&s=3D4oVMylhMszp8y4x3fdF6X00K_r-3YIhPzz4cHLp5XdA&e=3D
>> >


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

