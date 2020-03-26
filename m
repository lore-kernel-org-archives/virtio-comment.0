Return-Path: virtio-comment-return-1158-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF5CB98601F
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Mar 2020 12:19:09 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Thu, 26 Mar 2020 12:19:04 +0000
Message-ID: <BN6PR1801MB2067FF56ACB319D1840540DCC5CF0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v7] virtio-net: Add support for the flexible driver
 notification structure.
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

I can suggest changing the feature definition such that the value, that the=
 driver sets in the vqn field, will be per-virtqueue (instead of per-device=
).
The device can provide a per-virtqueue value to the driver in the PCI Commo=
n configuration structure (virtio_pci_common_cfg).
This will probably make the feature more generic. It will also simplify the=
 feature, as it will not depend on notify_off_multiplier anymore.

Would it make more sense?


>-----Original Message-----
>From: Cornelia Huck <cohuck@redhat.com>
>Sent: Thursday, 26 March, 2020 13:53
>To: Michael S. Tsirkin <mst@redhat.com>
>Cc: Vitaly Mireyno <vmireyno@marvell.com>; virtio-comment@lists.oasis-open=
.org; Jason Wang
><jasowang@redhat.com>; Ariel Elior <aelior@marvell.com>
>Subject: [EXT] Re: [PATCH v7] virtio-net: Add support for the flexible dri=
ver notification structure.
>
>External Email
>
>----------------------------------------------------------------------
>On Thu, 26 Mar 2020 07:26:16 -0400
>"Michael S. Tsirkin" <mst@redhat.com> wrote:
>
>> On Thu, Mar 26, 2020 at 10:43:20AM +0100, Cornelia Huck wrote:
>> > On Wed, 18 Mar 2020 18:29:19 +0000
>> > Vitaly Mireyno <vmireyno@marvell.com> wrote:
>
>> > > +
>> > > +\begin{note}
>> > > +If \field{notify_off_multiplier} > 0, the virtqueue number can
>> > > +potentially be derived by the device from the Queue Notify
>> > > +address, so \field{vqn} may be redundant.
>>
>> I feel this is confusing the reader more than it explains.
>> the field is always there. It's either the virtqueue number or
>> whatever we get from the device.
>
>"the virtqueue number can potentially be derived by the device from the Qu=
eue Notify address, so
>obtaining the virtqueue number from \field{vqn} is not needed"
>
>?
>
>>
>> > > +\end{note}
>> > > +
>(...)
>> > > @@ -4180,6 +4205,33 @@ \subsubsection{Legacy Interface: Framing
>> > > Requirements}\label{sec:Device  See \ref{sec:Basic  Facilities of
>> > > a Virtio Device / Virtqueues / Message Framing}.
>> > >
>> > > +\subsubsection{Driver Notifications}\label{sec:Device Types /
>> > > +Network Device / Device Operation / Driver Notifications} As
>> > > +mentioned in section \ref{sec:Virtqueues / Driver notifications},
>> > > +when the driver is required to send an available buffer
>> > > +notification to the device, it always sends the virtqueue number
>> > > +to be notified. The method of delivering notifications is
>> > > +transport specific. With the PCI transport, the device can
>> > > +optionally provide a distinct per-virtqueue address for driver
>> > > +notifications (Queue Notify address). In this case, the virtqueue
>> > > +number can potentially be derived by the device from the Queue Noti=
fy address. For devices,
>that provide per-virtqueue Queue Notify addresses and are able to derive t=
he virtqueue number from
>that address, the virtqueue number in the notification data is redundant.
>> >
>> > I would keep the remark that the queue number might be redundant
>> > with the PCI transport.
>>
>> I feel redundant is too strong a word. If anything sending data we
>> just read from device back to it is definitely redundant.
>> Spec says send it so we send it.
>> Maybe say it can be ignored by the device?
>
>Maybe "not needed"?
>
>(see above)
>
>>
>> > > +On the other hand, some devices can benefit from receiving
>> > > +additional data with driver notifications. An example could be a
>> > > +hardware device implementing multiple protocols (with virtio
>> > > +being one of them), so the extra notification data could serve as a=
 notification type indication or
>a protocol indication.
>> >
>> > Hm... what about replacing the whole text above with
>> >
>> > "Driver notifications (\ref{sec:Virtqueues / Driver notifications})
>> > always contain at least the virtqueue number for which buffers are
>> > available. Some devices can benefit from receiving additional data
>> > with driver notifications. For example, a hardware device
>> > implementing multiple protocols (with virtio being one of them)
>> > could benefit from a notification type indication or a protocol indica=
tion."
>>
>>
>> My problem with both versions is that it talks about "additional
>> information" while in fact it's information that comes from the device
>> itself.
>
>"per-device information", maybe?


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

