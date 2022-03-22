Return-Path: <virtio-comment-return-2848-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D00DE9863D4
	for <virtio-comment@lists.oasis-open.org>; Tue, 22 Mar 2022 09:58:05 +0000 (UTC)
From: "Loghin, Laura" <lauralg@amazon.com>
Date: Tue, 22 Mar 2022 09:57:59 +0000
Message-ID: <1647943078836.86626@amazon.com>
References: <1645101080313.3853@amazon.com>
 <20220217125506.icgvndy3v66cyhxy@sgarzare-redhat>
 <0420e5d6-60f0-be57-ec6a-e88127174cda@gmail.com>
 <1645519589258.8467@amazon.com>,<20220223085725.22vwp72qo7m6noq7@sgarzare-redhat>,<1645623537015.64403@amazon.com>
In-Reply-To: <1645623537015.64403@amazon.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] vsock: define a maximum size for the packet data
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Arseniy Krasnov <oxffffaa@gmail.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

Sorry for the super late reply! I just sent the patch for the `len` descrip=
tion [1].

Regarding the max size for the packet data, the proposal for adding a field=
 in the config space sounds good to me. What would be some next steps here?=
 Should I send a patch for this one as well? From what I understand, we wou=
ld define a new feature for the max size, and
add a new field in the config space. Did I misunderstand it?


Thanks,
Laura


[1] https://lists.oasis-open.org/archives/virtio-comment/202203/msg00073.ht=
ml

=20
________________________________________
From: Loghin, Laura
Sent: Wednesday, February 23, 2022 3:38 PM
To: Stefano Garzarella
Cc: Arseniy Krasnov; virtio-comment@lists.oasis-open.org
Subject: Re: [EXTERNAL] [virtio-comment] vsock: define a maximum size for t=
he packet data

Hello,

Yes I'll send a patch next week, these days I'll be on vacation.

Thank you,
Laura
________________________________________
From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-open.=
org> on behalf of Stefano Garzarella <sgarzare@redhat.com>
Sent: Wednesday, February 23, 2022 10:57 AM
To: Loghin, Laura
Cc: Arseniy Krasnov; virtio-comment@lists.oasis-open.org
Subject: RE: [EXTERNAL] [virtio-comment] vsock: define a maximum size for t=
he packet data

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you can confirm the sender and know the=
 content is safe.



On Tue, Feb 22, 2022 at 08:46:29AM +0000, Loghin, Laura wrote:
>
>Hello,
>
>I was thinking that this limit would be used on the TX path (because on
>the RX, the device is considered to be trusted it will add a shorter
>buffer). The size of the TX buffer would still be the one from the
>header or from its descriptor (this is another thing that I think
>should be explicitly mentioned in the spec even though it's pretty
>obvious; there is no mention at this moment about what `len` is). The

The size of the TX buffers should be the one from the descriptor. (Now
we are using 2 buffers, one for the header and one for the payload, but
it is an implementation details).

Then the `len` field in the header contains the amount of bytes used for
the payload. So the buffer could be bigger then (hdr + payload).

For TX in the current implementation it never happens because of the way
the Linux driver is written, but for RX it happens just this, because
the driver allocates the buffer and the device can use only a part of
it.

However I agree that we could describe the `len` field better in the
specs, also because it's currently not really described.

If you want to send a patch, that would be great!

Thanks,
Stefano


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




Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.


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

