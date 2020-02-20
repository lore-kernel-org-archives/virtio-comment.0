Return-Path: virtio-comment-return-1086-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DF96985EF4
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Feb 2020 10:18:39 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Thu, 20 Feb 2020 10:18:32 +0000
Message-ID: <BN6PR1801MB2067FDC276CB401920EAEF5FC5130@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for correct
 hdr_len field.
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "jasowang@redhat.com" <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


>-----Original Message-----
>From: Michael S. Tsirkin <mst@redhat.com>
>Sent: Thursday, 20 February, 2020 12:01
>To: Vitaly Mireyno <vmireyno@marvell.com>
>Cc: virtio-comment@lists.oasis-open.org; jasowang@redhat.com
>Subject: [EXT] Re: [virtio-comment] [PATCH] virtio-net: Add support for co=
rrect hdr_len field.
>
>----------------------------------------------------------------------
>On Thu, Feb 20, 2020 at 09:51:17AM +0000, Vitaly Mireyno wrote:
>>
>> >-----Original Message-----
>> >From: virtio-comment@lists.oasis-open.org
>> ><virtio-comment@lists.oasis-open.org> On Behalf Of Michael S. Tsirkin
>> >Sent: Thursday, 20 February, 2020 10:12
>> >To: Vitaly Mireyno <vmireyno@marvell.com>
>> >Cc: virtio-comment@lists.oasis-open.org; jasowang@redhat.com
>> >Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for corre=
ct hdr_len field.
>> >
>> >---------------------------------------------------------------------
>> >- On Thu, Oct 24, 2019 at 03:24:43PM +0000, Vitaly Mireyno wrote:
>> >> Some devices benefit from the knowledge of the exact header length fo=
r TSO processing.
>> >> Add a feature bit for a driver that is capable of providing the corre=
ct header length for TSO
>packets.
>> >>
>> >> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>> >
>> >So I looked at implementing this and maybe this was not such a good ide=
a after all.
>> >
>> >How would we implement this in Linux?
>> >Current code just puts skb_headlen there which is # of bytes in the lin=
ear buffer.
>> >Which I guess it often the header, but not at all always.
>> >
>> >Should this have been limited to TSO packets?
>> >
>> >I also could not figure out how this is useful for the host.
>> >Could you enlighten me pls?
>>
>> As see it, header length is essential for TSO, and maybe not so useful f=
or non-TSO.
>
>So maybe we should limit this for when gso type is actually set?

Do you mean the hdr_len field will be valid only for TSO packets, or it wil=
l be accurate only for TSO packets?
I'm fine with both options.

>
>> To calculate the header length, I suppose a Linux driver could do someth=
ing like:
>> skb_transport_header(skb) + tcp_hdrlen(skb) - skb->data
>
>That's parsing the header in software. Why not have the card do it in hard=
ware?
>

It depends on hw architecture. The architecture I'm familiar with, the hw c=
an parse the header, but it happens too late for the segmentation decision.


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

