Return-Path: virtio-comment-return-972-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3893985C0C
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Dec 2019 16:47:10 +0000 (UTC)
Date: Mon, 2 Dec 2019 11:47:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191202112345-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB20673345E995560006031996C54B0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191124100825-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067A7EE01B3199DE7FF956CC5450@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191127083719-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067106A0466A952568B84D4C5400@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191201074825-mutt-send-email-mst@kernel.org>
 <20191201164128-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067B5D14AF2415576326BB9C5430@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191202101627-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB20671CCFC812042D5E24D3BCC5430@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB20671CCFC812042D5E24D3BCC5430@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: Re: [virtio-comment] Re: [EXT] Re: [virtio-comment] Re: [PATCH]
 virtio-net: Add equal-sized receive buffers feature
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Dec 02, 2019 at 04:16:46PM +0000, Vitaly Mireyno wrote:
> >> >as an example of a vague idea, exposing max rx s/g, min buffer + max
> >> >buffer will allow device to force this from device side.
> >> >
> >> >Is that good? If not, how does driver decide on a good fixed buffer s=
ize?
> >> >
> >>
> >> Setting max=3Dmin=3Dfixed_size by the device will work, but this seems=
 too
> >restrictive, as we still may want to enable the driver to select its buf=
fer size.
> >> I guess driver can select the fixed buffer size based on the MTU.
> >
> >
> >Would that be based on max MTU field then?
> >I note that that's read-only, so just starting with that and sending it =
back to the
> >device doesn't change much ...
> >
>=20
> I had in mind the actual interface MTU, and not the maximum supported
> MTU (given the device provided one).  Perhaps it's a different
> discussion, but in this sense I find the 'mtu' field a bit confusing.
> Device advertises its maximum supported MTU, but then it's being used
> as an actual MTU (which can be much smaller).

This was sufficient for what it was used for (encapsulation).


> Shouldn't device enforce
> the actual MTU on TX and RX packets?

We need to think of a set of usecases to address though. It's also
tricky wrt things like migration.

>  I also noticed that the spec
> mentions the maximum RX packet size is strictly 1514 bytes (w/o TSO).

It might make sense to extend that for jumbo frames etc. And, I suspect
it doesn't match what drivers/devices actually do in all cases.
Would be great if someone looked at this some more.

> >> What if device will request max/min buffer size ratio, and driver will=
 set min
> >buffer size? This can solve the fixed size issue, without forcing a spec=
ific size.
> >> Along with the max s/g, maybe it can also help avoiding rx buffer size=
 abuse
> >by the driver (i.e. setting it too low).
> >
> >That sounds reasonably generic, too.
> >
>=20
> Ok, I will formulate a new patch.
>=20
> >--
> >MST
>=20


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

