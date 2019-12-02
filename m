Return-Path: virtio-comment-return-970-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6A30985BD6
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Dec 2019 15:23:38 +0000 (UTC)
Date: Mon, 2 Dec 2019 10:23:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191202101627-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB2067E36E09AC56EB5D3C29A2C5710@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191120081531-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB20673345E995560006031996C54B0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191124100825-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067A7EE01B3199DE7FF956CC5450@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191127083719-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067106A0466A952568B84D4C5400@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191201074825-mutt-send-email-mst@kernel.org>
 <20191201164128-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067B5D14AF2415576326BB9C5430@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067B5D14AF2415576326BB9C5430@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: Re: [virtio-comment] Re: [EXT] Re: [virtio-comment] Re: [PATCH]
 virtio-net: Add equal-sized receive buffers feature
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Dec 02, 2019 at 03:09:14PM +0000, Vitaly Mireyno wrote:
>=20
>=20
> >-----Original Message-----
> >From: Michael S. Tsirkin <mst@redhat.com>
> >Sent: Sunday, 1 December, 2019 23:44
> >To: Vitaly Mireyno <vmireyno@marvell.com>
> >Cc: Jason Wang <jasowang@redhat.com>; virtio-comment@lists.oasis-
> >open.org
> >Subject: Re: [virtio-comment] Re: [EXT] Re: [virtio-comment] Re: [PATCH]
> >virtio-net: Add equal-sized receive buffers feature
> >
> >On Sun, Dec 01, 2019 at 08:07:55AM -0500, Michael S. Tsirkin wrote:
> >> On Sun, Dec 01, 2019 at 10:22:17AM +0000, Vitaly Mireyno wrote:
> >> >
> >> >
> >> > >-----Original Message-----
> >> > >From: Michael S. Tsirkin <mst@redhat.com>
> >> > >Sent: Wednesday, 27 November, 2019 15:51
> >> > >To: Vitaly Mireyno <vmireyno@marvell.com>
> >> > >Cc: Jason Wang <jasowang@redhat.com>; virtio-comment@lists.oasis-
> >> > >open.org
> >> > >Subject: Re: [virtio-comment] Re: [EXT] Re: [virtio-comment] Re:
> >> > >[PATCH]
> >> > >virtio-net: Add equal-sized receive buffers feature
> >> > >
> >> > >On Tue, Nov 26, 2019 at 05:27:31PM +0000, Vitaly Mireyno wrote:
> >> > >>
> >> > >>
> >> > >> >-----Original Message-----
> >> > >> >From: virtio-comment@lists.oasis-open.org
> >> > >> ><virtio-comment@lists.oasis- open.org> On Behalf Of Michael S.
> >> > >> >Tsirkin
> >> > >> >Sent: Sunday, 24 November, 2019 17:30
> >> > >> >To: Vitaly Mireyno <vmireyno@marvell.com>
> >> > >> >Cc: Jason Wang <jasowang@redhat.com>;
> >> > >> >virtio-comment@lists.oasis- open.org
> >> > >> >Subject: [virtio-comment] Re: [EXT] Re: [virtio-comment] Re:
> >> > >> >[PATCH]
> >> > >> >virtio-
> >> > >> >net: Add equal-sized receive buffers feature
> >> > >> >
> >> > >> >On Sun, Nov 24, 2019 at 03:02:05PM +0000, Vitaly Mireyno wrote:
> >> > >> >>
> >> > >> >>
> >> > >> >> >-----Original Message-----
> >> > >> >> >From: Michael S. Tsirkin <mst@redhat.com>
> >> > >> >> >Sent: Wednesday, 20 November, 2019 15:23
> >> > >> >> >To: Vitaly Mireyno <vmireyno@marvell.com>
> >> > >> >> >Cc: Jason Wang <jasowang@redhat.com>;
> >> > >> >> >virtio-comment@lists.oasis- open.org
> >> > >> >> >Subject: Re: [EXT] Re: [virtio-comment] Re: [PATCH] virtio-ne=
t:
> >> > >> >> >Add
> >> > >> >> >equal- sized receive buffers feature
> >> > >> >> >
> >> > >> >> >On Thu, Nov 14, 2019 at 03:49:59PM +0000, Vitaly Mireyno wrot=
e:
> >> > >> >> >>
> >> > >> >> >>
> >> > >> >> >> >-----Original Message-----
> >> > >> >> >> >From: Michael S. Tsirkin <mst@redhat.com>
> >> > >> >> >> >Sent: Monday, 11 November, 2019 17:05
> >> > >> >> >> >To: Vitaly Mireyno <vmireyno@marvell.com>
> >> > >> >> >> >Cc: Jason Wang <jasowang@redhat.com>;
> >> > >> >> >> >virtio-comment@lists.oasis- open.org
> >> > >> >> >> >Subject: Re: [EXT] Re: [virtio-comment] Re: [PATCH] virtio=
-net:
> >> > >> >> >> >Add
> >> > >> >> >> >equal- sized receive buffers feature
> >> > >> >> >> >
> >> > >> >> >> >On Mon, Nov 11, 2019 at 01:58:51PM +0000, Vitaly Mireyno
> >wrote:
> >> > >> >> >> >>
> >> > >> >> >> >>
> >> > >> >> >> >> >-----Original Message-----
> >> > >> >> >> >> >From: Michael S. Tsirkin <mst@redhat.com>
> >> > >> >> >> >> >Sent: Sunday, 10 November, 2019 17:35
> >> > >> >> >> >> >To: Vitaly Mireyno <vmireyno@marvell.com>
> >> > >> >> >> >> >Cc: Jason Wang <jasowang@redhat.com>;
> >> > >> >> >> >> >virtio-comment@lists.oasis- open.org
> >> > >> >> >> >> >Subject: Re: [EXT] Re: [virtio-comment] Re: [PATCH] vir=
tio-
> >net:
> >> > >> >> >> >> >Add
> >> > >> >> >> >> >equal- sized receive buffers feature
> >> > >> >> >> >> >
> >> > >> >> >> >> >On Sun, Nov 10, 2019 at 02:13:14PM +0000, Vitaly Mireyn=
o
> >wrote:
> >> > >> >> >> >> >>
> >> > >> >> >> >> >> >-----Original Message-----
> >> > >> >> >> >> >> >From: virtio-comment@lists.oasis-open.org
> >> > >> >> >> >> >> ><virtio-comment@lists.oasis- open.org> On Behalf Of
> >> > >> >> >> >> >> >Michael
> >> > >S.
> >> > >> >> >> >> >> >Tsirkin
> >> > >> >> >> >> >> >Sent: Tuesday, 5 November, 2019 20:52
> >> > >> >> >> >> >> >To: Jason Wang <jasowang@redhat.com>
> >> > >> >> >> >> >> >Cc: Vitaly Mireyno <vmireyno@marvell.com>;
> >> > >> >> >> >> >> >virtio-comment@lists.oasis- open.org
> >> > >> >> >> >> >> >Subject: [EXT] Re: [virtio-comment] Re: [PATCH] virt=
io-
> >net:
> >> > >> >> >> >> >> >Add equal-sized receive buffers feature
> >> > >> >> >> >> >> >
> >> > >> >> >> >> >> >External Email
> >> > >> >> >> >> >> >
> >> > >> >> >> >> >> >----------------------------------------------------
> >> > >> >> >> >> >> >-----
> >> > >> >> >> >> >> >---
> >> > >> >> >> >> >> >---
> >> > >> >> >> >> >> >---
> >> > >> >> >> >> >> >---
> >> > >> >> >> >> >> >- On Fri, Nov 01, 2019 at 03:22:26PM +0800, Jason Wa=
ng
> >wrote:
> >> > >> >> >> >> >> >>
> >> > >> >> >> >> >> >> On 2019/11/1 =E4=B8=8B=E5=8D=8812:09, Michael S. T=
sirkin wrote:
> >> > >> >> >> >> >> >> > On Thu, Oct 31, 2019 at 10:46:55AM +0000, Vitaly
> >> > >> >> >> >> >> >> > Mireyno
> >> > >> >wrote:
> >> > >> >> >> >> >> >> > > The feature is limited to receive buffers only=
.
> >> > >> >> >> >> >> >> > > A driver decides on receive buffer length. The
> >> > >> >> >> >> >> >> > > only limitation is that this
> >> > >> >> >> >> >> >length has to be the same for all receive virtqueue
> >buffers.
> >> > >> >> >> >> >> >> > > The driver configures receive buffer length to
> >> > >> >> >> >> >> >> > > the device during device
> >> > >> >> >> >> >> >initialization, and the device reads it and may use
> >> > >> >> >> >> >> >it for optimal
> >> > >> >> >> >operation.
> >> > >> >> >> >> >> >> > > No changes for transmit buffers.
> >> > >> >> >> >> >> >> > >
> >> > >> >> >> >> >> >> > > -----Original Message-----
> >> > >> >> >> >> >> >> > > From: virtio-comment@lists.oasis-open.org
> >> > >> >> >> >> >> >> > > <virtio-comment@lists.oasis-open.org> On
> >> > >> >> >> >> >> >> > > Behalf Of Jason Wang
> >> > >> >> >> >> >> >> > > Sent: Thursday, 31 October, 2019 12:15
> >> > >> >> >> >> >> >> > > To: Vitaly Mireyno <vmireyno@marvell.com>;
> >> > >> >> >> >> >> >> > > virtio-comment@lists.oasis-open.org
> >> > >> >> >> >> >> >> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> >> > >> >> >> >> >> >> > > Subject: [virtio-comment] Re: [PATCH] virtio-n=
et:
> >> > >> >> >> >> >> >> > > Add equal-sized receive buffers feature
> >> > >> >> >> >> >> >> > >
> >> > >> >> >> >> >> >> > >
> >> > >> >> >> >> >> >> > > On 2019/10/31 =E4=B8=8B=E5=8D=885:23, Vitaly M=
ireyno wrote:
> >> > >> >> >> >> >> >> > > > Some devices benefit from working with
> >> > >> >> >> >> >> >> > > > receive buffers of a
> >> > >> >> >> >> >> >predefined constant length.
> >> > >> >> >> >> >> >> > > > Add a feature for drivers that allocate
> >> > >> >> >> >> >> >> > > > equal-sized receive buffers, and
> >> > >> >> >> >> >> >devices that benefit from predefined receive buffers
> >length.
> >> > >> >> >> >> >> >> > > >
> >> > >> >> >> >> >> >> > > > Signed-off-by: Vitaly Mireyno
> >> > >> >> >> >> >> >> > > > <vmireyno@marvell.com>
> >> > >> >> >> >> >> >> > > > ---
> >> > >> >> >> >> >> >> > > >    content.tex | 29
> >+++++++++++++++++++++++++++--
> >> > >> >> >> >> >> >> > > >    1 file changed, 27 insertions(+), 2
> >> > >> >> >> >> >> >> > > > deletions(-)
> >> > >> >> >> >> >> >> > >
> >> > >> >> >> >> >> >> > > Is there any other networking device that has
> >> > >> >> >> >> >> >> > > this
> >> > >feature?
> >> > >> >> >> >> >> >> > >
> >> > >> >> >> >> >> >> > >
> >> > >> >> >> >> >> >> > > > diff --git a/content.tex b/content.tex index
> >> > >> >> >> >> >> >> > > > b1ea9b9..c9e67c8
> >> > >> >> >> >> >> >> > > > 100644
> >> > >> >> >> >> >> >> > > > --- a/content.tex
> >> > >> >> >> >> >> >> > > > +++ b/content.tex
> >> > >> >> >> >> >> >> > > > @@ -2811,6 +2811,10 @@ \subsection{Feature
> >> > >> >> >> >> >> >> > > > bits}\label{sec:Device
> >> > >> >> >> >> >> >Types / Network Device / Feature bits
> >> > >> >> >> >> >> >> > > >    \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set
> >> > >MAC
> >> > >> >> >> >> >> >> > > > address
> >> > >> >> >> >> >> >through control
> >> > >> >> >> >> >> >> > > >        channel.
> >> > >> >> >> >> >> >> > > > +\item[VIRTIO_NET_F_CONST_RXBUF_LEN(58)]
> >> > >> >> >> >> >> >> > > > +Driver allocates all
> >> > >> >> >> >> >> >receive buffers
> >> > >> >> >> >> >> >> > > > +    of the same constant length. Device
> >> > >> >> >> >> >> >> > > > + benefits from working
> >> > >> >> >> >with
> >> > >> >> >> >> >> >> > > > +    receive buffers of equal length.
> >> > >> >> >> >> >> >> > > > +
> >> > >> >> >> >> >> >> > Problem is, I don't think linux will use this
> >> > >> >> >> >> >> >> > for skbs since it breaks buffer accounting. This
> >> > >> >> >> >> >> >> > is because it is important to make skbs as small
> >> > >> >> >> >> >> >> > as you can. So even if you see "device would
> >> > >> >> >> >benefit"
> >> > >> >> >> >> >> >> > there is no way to balance this with the benefit=
 to
> >linux.
> >> > >> >> >> >> >> >> > How do you know which benefit is bigger?
> >> > >> >> >> >> >> >>
> >> > >> >> >> >> >> >>
> >> > >> >> >> >> >> >> I guess the idea is e.g for Linux driver, it can
> >> > >> >> >> >> >> >> refuse this
> >> > >feature.
> >> > >> >> >> >> >> >
> >> > >> >> >> >> >> >Okay. What uses it?
> >> > >> >> >> >> >> >
> >> > >> >> >> >> >> >>
> >> > >> >> >> >> >> >> >
> >> > >> >> >> >> >> >> > You also never explained how does device
> >> > >> >> >> >> >> >> > benefit. My guess is this allows device to
> >> > >> >> >> >> >> >> > calculate the # of descriptors to fetch that are=
 needed
> >for a packet. Right?
> >> > >> >> >> >> >> >> > Assuming this, I think a rough estimate should b=
e
> >enough.
> >> > >> >> >> >> >> >> > If device fetches too much it can discard extra,
> >> > >> >> >> >> >> >> > if it does not fetch enough it can fetch extra.
> >> > >> >> >> >> >> >> >
> >> > >> >> >> >> >> >> > Let us not forget that express packets are 256
> >> > >> >> >> >> >> >> > bytes so up to
> >> > >> >> >> >> >> >> > 16 descriptors fit in a packet, there is no
> >> > >> >> >> >> >> >> > benefit most of the time in knowing whether e.g.
> >> > >> >> >> >> >> >> > 1 or 2 descriptors are
> >> > >> >needed.
> >> > >> >> >> >> >> >> >
> >> > >> >> >> >> >> >> >
> >> > >> >> >> >> >> >> > Let us not forget these are buffers, not descrip=
tors.
> >> > >> >> >> >> >> >>
> >> > >> >> >> >> >> >>
> >> > >> >> >> >> >> >> I guess maybe the initial motivation is constant
> >> > >> >> >> >> >> >> descriptor
> >> > >> >length.
> >> > >> >> >> >> >> >
> >> > >> >> >> >> >> >
> >> > >> >> >> >> >> >That conflicts with requirement framing is up to dri=
ver.
> >> > >> >> >> >> >> >
> >> > >> >> >> >> >> >
> >> > >> >> >> >> >> I was using the wrong terminology. The feature is
> >> > >> >> >> >> >> about constant
> >> > >> >> >> >> >*descriptor* length. In other words, the value that
> >> > >> >> >> >> >driver puts in Packed Virtqueue "Element Length" field =
(or
> >'len'
> >> > >> >> >> >> >field in the
> >> > >> >> >'pvirtq_desc'
> >> > >> >> >> >struct).
> >> > >> >> >> >> >
> >> > >> >> >> >> >OK so this conflicts with "2.6.4 Message Framing" which
> >> > >> >> >> >> >requires that drivers can split buffers into as many
> >> > >> >> >> >> >descriptors as
> >> > >> >they like.
> >> > >> >> >> >> >Right?
> >> > >> >> >> >> >
> >> > >> >> >> >> >> Does it make more sense now, or you still see an
> >> > >> >> >> >> >> issue with Linux
> >> > >> >> >driver?
> >> > >> >> >> >> >
> >> > >> >> >> >> >I think there's an issue with the flexible framing
> >> > >> >> >> >> >requirements and there's an issue with Linux driver.
> >> > >> >> >> >> >
> >> > >> >> >> >> >> The motivation is to allow the device to calculate
> >> > >> >> >> >> >> the exact number of
> >> > >> >> >> >> >descriptors to consume, before fetching the descriptors=
.
> >> > >> >> >> >> >This is beneficial for devices for which overconsuming
> >> > >> >> >> >> >or underconsuming descriptors come at a high cost.
> >> > >> >> >> >> >
> >> > >> >> >> >> >So I guess we can agree getting the # of descriptors
> >> > >> >> >> >> >*exactly* right isn't all that important. Right? My
> >> > >> >> >> >> >question is how does the driver balance the device vers=
us
> >Linux needs?
> >> > >> >> >> >> >
> >> > >> >> >> >> >One idea is if we assume this is best effort, does not
> >> > >> >> >> >> >have to be exact, then how about just having the device
> >> > >> >> >> >> >assume descriptor sizes stay more or less constant and
> >> > >> >> >> >> >use that to estimate the amount? If it under/over
> >> > >> >> >> >> >estimates, things just go a bit
> >> > >> >slower.
> >> > >> >> >> >> >This way driver can adjust the sizes and device will
> >> > >> >> >> >> >react automatically, with time.
> >> > >> >> >> >> >
> >> > >> >> >> >> >
> >> > >> >> >> >>
> >> > >> >> >> >> I see that "2.6.4 Message Framing" allows a full
> >> > >> >> >> >> flexibility of descriptor lengths, and I presume it's
> >> > >> >> >> >> applicable to Packet Virtqueues as well, though defined
> >> > >> >> >> >> under Split Virtqueues
> >> > >section.
> >> > >> >> >> >
> >> > >> >> >> >That's a good point. Probably makes sense to move it out
> >> > >> >> >> >to a common section, right?
> >> > >> >> >> >
> >> > >> >> >> >> The example
> >> > >> >> >> >> talks about transmit virtqueue, and it makes perfect sen=
se.
> >> > >> >> >> >> However, wouldn't a typical driver place equal-sized
> >> > >> >> >> >> *receive* descriptors
> >> > >> >> >> >anyway? So if a device can benefit from it, the driver
> >> > >> >> >> >might as well negotiate this new feature.
> >> > >> >> >> >
> >> > >> >> >> >Having buffer size jump around wildly doesn't seem too
> >> > >> >> >> >useful, I
> >> > >agree.
> >> > >> >> >> >OTOH being able to adjust it gradually has been in the
> >> > >> >> >> >past demontrated to help performance measureably.
> >> > >> >> >> >
> >> > >> >> >> >> This could be especially relevant for devices, for which
> >> > >> >> >> >> adjusting the number
> >> > >> >> >> >of used descriptors is impractical after descriptors have
> >> > >> >> >> >already been
> >> > >> >> >fetched.
> >> > >> >> >> >> I agree that if this requirement conflicts with specific
> >> > >> >> >> >> driver needs, it will not
> >> > >> >> >> >be negotiated, and the device will either underperform in
> >> > >> >> >> >certain scenarios, or will not come up at all.
> >> > >> >> >> >
> >> > >> >> >> >Right so that makes it a challenge. Device says it prefers
> >> > >> >> >> >fixed buffers. Is that preference more or less important
> >> > >> >> >> >than ability to efficiently support workloads such as TCP =
small
> >queues?
> >> > >> >> >> >Driver has no idea and I suspect neither does the device.
> >> > >> >> >> >So I don't see how will a Linux driver know that it should
> >> > >> >> >> >enable this, neither how will device know it's okay to
> >> > >> >> >> >just refuse
> >> > >features_ok.
> >> > >> >> >> >
> >> > >> >> >> >
> >> > >> >> >> >On the other hand, current drivers already have logic that
> >> > >> >> >> >tries to change buffer sizes in a smooth way.  So simply
> >> > >> >> >> >caching the last buffer size and assuming all the others
> >> > >> >> >> >will be exactly the same will go a long way towards
> >> > >> >> >> >limiting how much does device need to
> >> > >> >fetch.
> >> > >> >> >> >This does imply extra logic on the device to recover if
> >> > >> >> >> >things change and the first read did not fetch enough
> >> > >> >> >> >buffers, but then it would be required anyway if as you
> >> > >> >> >> >say above the failure is not
> >> > >> >catastrophic.
> >> > >> >> >> >
> >> > >> >> >> >
> >> > >> >> >> >The feature thus only seems useful for small,
> >> > >> >> >> >feature-restrained devices
> >> > >> >> >> >- which are prepared to sacrifice some performance to cut
> >> > >> >> >> >costs, and which can't recover at all. Is this what you ar=
e trying
> >to do?
> >> > >> >> >> >
> >> > >> >> >>
> >> > >> >> >> The intention is to enable devices with this specific
> >> > >> >> >> limitation to offer virtio offload.  The feature can be
> >> > >> >> >> redefined such that it would only be offered by devices
> >> > >> >> >> that are unable to handle dynamically changing descriptor
> >lengths. How does that sound?
> >> > >> >> >
> >> > >> >> >So it makes more sense when mergeable buffers are disabled
> >> > >> >> >(since then buffers are practically all same size).
> >> > >> >> >
> >> > >> >>
> >> > >> >> Actually, mergeable buffers are not a problem. They could be
> >> > >> >> enabled, as long as each descriptor is the same length. So
> >> > >> >> implementations that prefer optimizing memory utilization over
> >> > >> >> jumbo frame performance can negotiate
> >VIRTIO_NET_F_MRG_RXBUF
> >> > >and allocate smaller buffers.
> >> > >> >
> >> > >> >So my point was, without VIRTIO_NET_F_MRG_RXBUF, all buffers are
> >> > >same
> >> > >> >length anyway. So if we are talking about cheap simple hardware,
> >> > >> >I guess it can just not have VIRTIO_NET_F_MRG_RXBUF and be done
> >> > >> >with
> >> > >it?
> >> > >> >If device does care about memory utilization then I think it
> >> > >> >needs to give driver the flexibility it needs/uses.
> >> > >> >No?
> >> > >> >
> >> > >>
> >> > >> It's not a matter of device complexity, but a HW architecture,
> >> > >> which could be
> >> > >complex, but have this specific limitation.
> >> > >
> >> > >So - don't do it then?
> >> > >
> >> > >> I see at least two reasons to support and negotiate
> >> > >VIRTIO_NET_F_MRG_RXBUF, while keeping equal-sized descriptor
> >limitation:
> >> > >>  * GRO
> >> > >
> >> > >You mean LRO?
> >> > >
> >> > >>  * With jumbo packets, if the throughput is capped by the port
> >> > >> bandwidth,
> >> > >and not by the device/driver per-packet performance, it makes sense
> >> > >to optimize memory utilization by allocating small buffers, without
> >> > >sacrificing throughput performance.
> >> > >
> >> > >So we are back to square one, if driver cares about memory
> >> > >utilization with 1K packets vs 9K buffers, why not with 100byte
> >> > >packets vs 1K buffers? Looks like exactly the same tradeoff.
> >> > >
> >> > >
> >> > >>
> >> > >> >Again I can see how we might want to disallow crazy setups with =
e.g.
> >> > >> >1 byte per buffer. That's just abuse, no guest does that anyway.
> >> > >> >So asking e.g. for a minimal buffer size sounds very reasonable.
> >> > >> >But an option that disables functionality that a popular guest
> >> > >> >uses needs a lot of documentation to help device writers figure
> >> > >> >out whether they want that option or not, and I'd worry that
> >> > >> >even with documentation will
> >> > >be misunderstood even if we write it.
> >> > >> >When do you enable this?
> >> > >> >When you don't care about performance? When you don't care about
> >> > >Linux?
> >> > >> >
> >> > >>
> >> > >> I understand that there are guest-side optimizations that require
> >> > >> flexibility
> >> > >in descriptors length. I can propose the following simple logic:
> >> > >> Device - advertise "equal-sized descriptor" feature only if the
> >> > >> device is
> >> > >absolutely unable to operate otherwise. The device will not set
> >> > >FEATURES_OK unless the driver negotiates this feature.
> >> > >> Driver - if device advertises "equal-sized descriptor" feature -
> >> > >> if possible,
> >> > >give up on the flexible descriptors length optimizations. If not -
> >> > >give up on the device.
> >> > >
> >> > >Yes, that's possible. Looks like a rather limited feature, and i'd
> >> > >rather we focused on something more widely applicable, but with
> >> > >enough disclamers that devices SHOULD NOT set this bit we can maybe
> >do that.
> >> > >
> >> >
> >> > I agree that this feature is more of a limitation declaration, rathe=
r than an
> >enhancement, but let me emphasize that its only purpose is to make more
> >*existing* HW devices be virtio compatible.
> >> > This feature will allow such HW devices to offer virtio offload with
> >VIRTIO_NET_F_MRG_RXBUF capability for GRO/LRO offload.
> >> > New device designs should definitely avoid employing this feature.
> >>
> >> I understand, my question is: can you find a way to make this more
> >> generally useful? Something along the lines of the min buffer size
> >> suggestion which would avoid creating a special case in the driver?
> >> Any idea?
> >
> >as an example of a vague idea, exposing max rx s/g, min buffer + max buf=
fer
> >will allow device to force this from device side.
> >
> >Is that good? If not, how does driver decide on a good fixed buffer size=
?
> >
>=20
> Setting max=3Dmin=3Dfixed_size by the device will work, but this seems to=
o restrictive, as we still may want to enable the driver to select its buff=
er size.
> I guess driver can select the fixed buffer size based on the MTU.


Would that be based on max MTU field then?
I note that that's read-only, so just starting with that
and sending it back to the device doesn't change much ...

> What if device will request max/min buffer size ratio, and driver will se=
t min buffer size? This can solve the fixed size issue, without forcing a s=
pecific size.
> Along with the max s/g, maybe it can also help avoiding rx buffer size ab=
use by the driver (i.e. setting it too low).

That sounds reasonably generic, too.

--=20
MST


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

