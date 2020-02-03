Return-Path: virtio-comment-return-1045-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A817C985DC1
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Feb 2020 11:53:38 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Mon, 3 Feb 2020 11:53:32 +0000
Message-ID: <BN6PR1801MB2067763079A906218666D5A8C5000@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for the flexible
 driver notification
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>


>-----Original Message-----
>From: Michael S. Tsirkin <mst@redhat.com>
>Sent: Monday, 3 February, 2020 11:52
>To: Vitaly Mireyno <vmireyno@marvell.com>
>Cc: Stefan Hajnoczi <stefanha@redhat.com>; virtio-comment@lists.oasis-
>open.org; Jason Wang <jasowang@redhat.com>; Ariel Elior
><aelior@marvell.com>
>Subject: [EXT] Re: [virtio-comment] [PATCH] virtio-net: Add support for th=
e
>flexible driver notification
>
>----------------------------------------------------------------------
>On Thu, Jan 30, 2020 at 04:56:15PM +0000, Vitaly Mireyno wrote:
>> The main motivation is to support virtio on the existing silicon,
>> where this is the only way. Hopefully more use-cases would arise that
>> would find this useful.
>
>So there's some silicon out there that just happened to use exactly the vi=
rtio
>format, except for a couple of bits in the notification? Interesting.

Yes, exactly. The virtio notifications format is quite generic, so it's pro=
bably not that surprising that it's almost suitable for some HW devices.

>And what are these bits actually set to in this hardware? Just curious ...
>

At the low level, the notification data contains an encoded information of =
where to store the producer, and where to send the notification to. In case=
 of the virtio, it will enqueue the request for the networking fast-path pr=
ocessing, and update the new ring producer in the internal location, specif=
ic to the L2/virtio. In other cases, it may just update the data in the int=
ernal memory (at a protocol specific location), without triggering any furt=
her action.


>--
>MST


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

