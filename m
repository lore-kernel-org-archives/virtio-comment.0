Return-Path: virtio-comment-return-944-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5DA85985CAF
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Nov 2019 08:18:15 +0000 (UTC)
Date: Mon, 25 Nov 2019 03:18:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191125031208-mutt-send-email-mst@kernel.org>
References: <20191110095305-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067B4B98759B7A7BF9FFBE0C5740@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191111092046-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067E36E09AC56EB5D3C29A2C5710@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191120081531-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB20673345E995560006031996C54B0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191124100825-mutt-send-email-mst@kernel.org>
 <d10ea92e-4aab-28db-42b2-644b3deeb1df@redhat.com>
 <20191125022719-mutt-send-email-mst@kernel.org>
 <5730ce35-19fc-e707-1113-30fe24caaeaa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5730ce35-19fc-e707-1113-30fe24caaeaa@redhat.com>
Subject: Re: [virtio-comment] Re: [EXT] Re: [virtio-comment] Re: [PATCH]
 virtio-net: Add equal-sized receive buffers feature
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Nov 25, 2019 at 04:07:05PM +0800, Jason Wang wrote:
>=20
> On 2019/11/25 =E4=B8=8B=E5=8D=883:33, Michael S. Tsirkin wrote:
> > On Mon, Nov 25, 2019 at 11:31:09AM +0800, Jason Wang wrote:
> > > On 2019/11/24 =E4=B8=8B=E5=8D=8811:30, Michael S. Tsirkin wrote:
> > > > On Sun, Nov 24, 2019 at 03:02:05PM +0000, Vitaly Mireyno wrote:
> > > > > > -----Original Message-----
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Wednesday, 20 November, 2019 15:23
> > > > > > To: Vitaly Mireyno <vmireyno@marvell.com>
> > > > > > Cc: Jason Wang <jasowang@redhat.com>; virtio-comment@lists.oasi=
s-
> > > > > > open.org
> > > > > > Subject: Re: [EXT] Re: [virtio-comment] Re: [PATCH] virtio-net:=
 Add equal-
> > > > > > sized receive buffers feature
> > > > > >=20
> > > > > > On Thu, Nov 14, 2019 at 03:49:59PM +0000, Vitaly Mireyno wrote:
> > > > > > > > -----Original Message-----
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Monday, 11 November, 2019 17:05
> > > > > > > > To: Vitaly Mireyno <vmireyno@marvell.com>
> > > > > > > > Cc: Jason Wang <jasowang@redhat.com>; virtio-comment@lists.=
oasis-
> > > > > > > > open.org
> > > > > > > > Subject: Re: [EXT] Re: [virtio-comment] Re: [PATCH] virtio-=
net: Add
> > > > > > > > equal- sized receive buffers feature
> > > > > > > >=20
> > > > > > > > On Mon, Nov 11, 2019 at 01:58:51PM +0000, Vitaly Mireyno wr=
ote:
> > > > > > > > > > -----Original Message-----
> > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > Sent: Sunday, 10 November, 2019 17:35
> > > > > > > > > > To: Vitaly Mireyno <vmireyno@marvell.com>
> > > > > > > > > > Cc: Jason Wang <jasowang@redhat.com>; virtio-comment@li=
sts.oasis-
> > > > > > > > > > open.org
> > > > > > > > > > Subject: Re: [EXT] Re: [virtio-comment] Re: [PATCH] vir=
tio-net:
> > > > > > > > > > Add
> > > > > > > > > > equal- sized receive buffers feature
> > > > > > > > > >=20
> > > > > > > > > > On Sun, Nov 10, 2019 at 02:13:14PM +0000, Vitaly Mireyn=
o wrote:
> > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > > > > > > > <virtio-comment@lists.oasis- open.org> On Behalf Of=
 Michael S.
> > > > > > > > > > > > Tsirkin
> > > > > > > > > > > > Sent: Tuesday, 5 November, 2019 20:52
> > > > > > > > > > > > To: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > Cc: Vitaly Mireyno <vmireyno@marvell.com>;
> > > > > > > > > > > > virtio-comment@lists.oasis- open.org
> > > > > > > > > > > > Subject: [EXT] Re: [virtio-comment] Re: [PATCH] vir=
tio-net: Add
> > > > > > > > > > > > equal-sized receive buffers feature
> > > > > > > > > > > >=20
> > > > > > > > > > > > External Email
> > > > > > > > > > > >=20
> > > > > > > > > > > > ---------------------------------------------------=
------------
> > > > > > > > > > > > ---
> > > > > > > > > > > > ---
> > > > > > > > > > > > - On Fri, Nov 01, 2019 at 03:22:26PM +0800, Jason W=
ang wrote:
> > > > > > > > > > > > > On 2019/11/1 =E4=B8=8B=E5=8D=8812:09, Michael S. =
Tsirkin wrote:
> > > > > > > > > > > > > > On Thu, Oct 31, 2019 at 10:46:55AM +0000, Vital=
y Mireyno wrote:
> > > > > > > > > > > > > > > The feature is limited to receive buffers onl=
y.
> > > > > > > > > > > > > > > A driver decides on receive buffer length. Th=
e only
> > > > > > > > > > > > > > > limitation is that this
> > > > > > > > > > > > length has to be the same for all receive virtqueue=
 buffers.
> > > > > > > > > > > > > > > The driver configures receive buffer length t=
o the device
> > > > > > > > > > > > > > > during device
> > > > > > > > > > > > initialization, and the device reads it and may use=
 it for
> > > > > > > > > > > > optimal
> > > > > > > > operation.
> > > > > > > > > > > > > > > No changes for transmit buffers.
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > > > > > > > > > > <virtio-comment@lists.oasis-open.org> On Beha=
lf Of Jason
> > > > > > > > > > > > > > > Wang
> > > > > > > > > > > > > > > Sent: Thursday, 31 October, 2019 12:15
> > > > > > > > > > > > > > > To: Vitaly Mireyno <vmireyno@marvell.com>;
> > > > > > > > > > > > > > > virtio-comment@lists.oasis-open.org
> > > > > > > > > > > > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > > > > > > Subject: [virtio-comment] Re: [PATCH] virtio-=
net: Add
> > > > > > > > > > > > > > > equal-sized receive buffers feature
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > On 2019/10/31 =E4=B8=8B=E5=8D=885:23, Vitaly =
Mireyno wrote:
> > > > > > > > > > > > > > > > Some devices benefit from working with rece=
ive buffers
> > > > > > > > > > > > > > > > of a
> > > > > > > > > > > > predefined constant length.
> > > > > > > > > > > > > > > > Add a feature for drivers that allocate equ=
al-sized
> > > > > > > > > > > > > > > > receive buffers, and
> > > > > > > > > > > > devices that benefit from predefined receive buffer=
s length.
> > > > > > > > > > > > > > > > Signed-off-by: Vitaly Mireyno <vmireyno@mar=
vell.com>
> > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > >      content.tex | 29 +++++++++++++++++++++=
++++++--
> > > > > > > > > > > > > > > >      1 file changed, 27 insertions(+), 2 de=
letions(-)
> > > > > > > > > > > > > > > Is there any other networking device that has=
 this feature?
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > diff --git a/content.tex b/content.tex inde=
x
> > > > > > > > > > > > > > > > b1ea9b9..c9e67c8
> > > > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > > > --- a/content.tex
> > > > > > > > > > > > > > > > +++ b/content.tex
> > > > > > > > > > > > > > > > @@ -2811,6 +2811,10 @@ \subsection{Feature
> > > > > > > > > > > > > > > > bits}\label{sec:Device
> > > > > > > > > > > > Types / Network Device / Feature bits
> > > > > > > > > > > > > > > >      \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] =
Set MAC
> > > > > > > > > > > > > > > > address
> > > > > > > > > > > > through control
> > > > > > > > > > > > > > > >          channel.
> > > > > > > > > > > > > > > > +\item[VIRTIO_NET_F_CONST_RXBUF_LEN(58)] Dr=
iver
> > > > > > > > > > > > > > > > +allocates all
> > > > > > > > > > > > receive buffers
> > > > > > > > > > > > > > > > +    of the same constant length. Device be=
nefits from
> > > > > > > > > > > > > > > > + working
> > > > > > > > with
> > > > > > > > > > > > > > > > +    receive buffers of equal length.
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > Problem is, I don't think linux will use this f=
or skbs
> > > > > > > > > > > > > > since it breaks buffer accounting. This is beca=
use it is
> > > > > > > > > > > > > > important to make skbs as small as you can. So =
even if you
> > > > > > > > > > > > > > see "device would
> > > > > > > > benefit"
> > > > > > > > > > > > > > there is no way to balance this with the benefi=
t to linux.
> > > > > > > > > > > > > > How do you know which benefit is bigger?
> > > > > > > > > > > > > I guess the idea is e.g for Linux driver, it can =
refuse this feature.
> > > > > > > > > > > > Okay. What uses it?
> > > > > > > > > > > >=20
> > > > > > > > > > > > > > You also never explained how does device benefi=
t. My guess
> > > > > > > > > > > > > > is this allows device to calculate the # of des=
criptors to
> > > > > > > > > > > > > > fetch that are needed for a packet. Right?
> > > > > > > > > > > > > > Assuming this, I think a rough estimate should =
be enough.
> > > > > > > > > > > > > > If device fetches too much it can discard extra=
, if it does
> > > > > > > > > > > > > > not fetch enough it can fetch extra.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Let us not forget that express packets are 256 =
bytes so up
> > > > > > > > > > > > > > to
> > > > > > > > > > > > > > 16 descriptors fit in a packet, there is no ben=
efit most of
> > > > > > > > > > > > > > the time in knowing whether e.g. 1 or 2 descrip=
tors are needed.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Let us not forget these are buffers, not descri=
ptors.
> > > > > > > > > > > > > I guess maybe the initial motivation is constant =
descriptor length.
> > > > > > > > > > > > That conflicts with requirement framing is up to dr=
iver.
> > > > > > > > > > > >=20
> > > > > > > > > > > >=20
> > > > > > > > > > > I was using the wrong terminology. The feature is abo=
ut constant
> > > > > > > > > > *descriptor* length. In other words, the value that dri=
ver puts in
> > > > > > > > > > Packed Virtqueue "Element Length" field (or 'len' field=
 in the
> > > > > > 'pvirtq_desc'
> > > > > > > > struct).
> > > > > > > > > > OK so this conflicts with "2.6.4 Message Framing" which=
 requires
> > > > > > > > > > that drivers can split buffers into as many descriptors=
 as they like.
> > > > > > > > > > Right?
> > > > > > > > > >=20
> > > > > > > > > > > Does it make more sense now, or you still see an issu=
e with Linux
> > > > > > driver?
> > > > > > > > > > I think there's an issue with the flexible framing requ=
irements
> > > > > > > > > > and there's an issue with Linux driver.
> > > > > > > > > >=20
> > > > > > > > > > > The motivation is to allow the device to calculate th=
e exact
> > > > > > > > > > > number of
> > > > > > > > > > descriptors to consume, before fetching the descriptors=
. This is
> > > > > > > > > > beneficial for devices for which overconsuming or under=
consuming
> > > > > > > > > > descriptors come at a high cost.
> > > > > > > > > >=20
> > > > > > > > > > So I guess we can agree getting the # of descriptors *e=
xactly*
> > > > > > > > > > right isn't all that important. Right? My question is h=
ow does the
> > > > > > > > > > driver balance the device versus Linux needs?
> > > > > > > > > >=20
> > > > > > > > > > One idea is if we assume this is best effort, does not =
have to be
> > > > > > > > > > exact, then how about just having the device assume des=
criptor
> > > > > > > > > > sizes stay more or less constant and use that to estima=
te the
> > > > > > > > > > amount? If it under/over estimates, things just go a bi=
t slower.
> > > > > > > > > > This way driver can adjust the sizes and device will re=
act
> > > > > > > > > > automatically, with time.
> > > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > I see that "2.6.4 Message Framing" allows a full flexibil=
ity of
> > > > > > > > > descriptor lengths, and I presume it's applicable to Pack=
et
> > > > > > > > > Virtqueues as well, though defined under Split Virtqueues=
 section.
> > > > > > > > That's a good point. Probably makes sense to move it out to=
 a common
> > > > > > > > section, right?
> > > > > > > >=20
> > > > > > > > > The example
> > > > > > > > > talks about transmit virtqueue, and it makes perfect sens=
e.
> > > > > > > > > However, wouldn't a typical driver place equal-sized *rec=
eive*
> > > > > > > > > descriptors
> > > > > > > > anyway? So if a device can benefit from it, the driver migh=
t as well
> > > > > > > > negotiate this new feature.
> > > > > > > >=20
> > > > > > > > Having buffer size jump around wildly doesn't seem too usef=
ul, I agree.
> > > > > > > > OTOH being able to adjust it gradually has been in the past
> > > > > > > > demontrated to help performance measureably.
> > > > > > > >=20
> > > > > > > > > This could be especially relevant for devices, for which =
adjusting
> > > > > > > > > the number
> > > > > > > > of used descriptors is impractical after descriptors have a=
lready been
> > > > > > fetched.
> > > > > > > > > I agree that if this requirement conflicts with specific =
driver
> > > > > > > > > needs, it will not
> > > > > > > > be negotiated, and the device will either underperform in c=
ertain
> > > > > > > > scenarios, or will not come up at all.
> > > > > > > >=20
> > > > > > > > Right so that makes it a challenge. Device says it prefers =
fixed
> > > > > > > > buffers. Is that preference more or less important than abi=
lity to
> > > > > > > > efficiently support workloads such as TCP small queues?
> > > > > > > > Driver has no idea and I suspect neither does the device.
> > > > > > > > So I don't see how will a Linux driver know that it should =
enable
> > > > > > > > this, neither how will device know it's okay to just refuse=
 features_ok.
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > On the other hand, current drivers already have logic that =
tries to
> > > > > > > > change buffer sizes in a smooth way.  So simply caching the=
 last
> > > > > > > > buffer size and assuming all the others will be exactly the=
 same will
> > > > > > > > go a long way towards limiting how much does device need to=
 fetch.
> > > > > > > > This does imply extra logic on the device to recover if thi=
ngs change
> > > > > > > > and the first read did not fetch enough buffers, but then i=
t would be
> > > > > > > > required anyway if as you say above the failure is not cata=
strophic.
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > The feature thus only seems useful for small, feature-restr=
ained
> > > > > > > > devices
> > > > > > > > - which are prepared to sacrifice some performance to cut c=
osts, and
> > > > > > > > which can't recover at all. Is this what you are trying to =
do?
> > > > > > > >=20
> > > > > > > The intention is to enable devices with this specific limitat=
ion to
> > > > > > > offer virtio offload.  The feature can be redefined such that=
 it would
> > > > > > > only be offered by devices that are unable to handle dynamica=
lly
> > > > > > > changing descriptor lengths. How does that sound?
> > > > > > So it makes more sense when mergeable buffers are disabled (sin=
ce then
> > > > > > buffers are practically all same size).
> > > > > >=20
> > > > > Actually, mergeable buffers are not a problem. They could be enab=
led,
> > > > > as long as each descriptor is the same length. So implementations=
 that
> > > > > prefer optimizing memory utilization over jumbo frame performance=
 can
> > > > > negotiate VIRTIO_NET_F_MRG_RXBUF and allocate smaller buffers.
> > > > So my point was, without VIRTIO_NET_F_MRG_RXBUF, all buffers are sa=
me
> > > > length anyway. So if we are talking about cheap simple hardware, I =
guess
> > > > it can just not have VIRTIO_NET_F_MRG_RXBUF and be done with it?
> > > > If device does care about memory utilization then I think
> > > > it needs to give driver the flexibility it needs/uses.
> > > > No?
> > > >=20
> > > > Again I can see how we might want to disallow crazy setups with e.g=
. 1
> > > > byte per buffer. That's just abuse, no guest does that anyway. So a=
sking
> > > > e.g. for a minimal buffer size sounds very reasonable.
> > >=20
> > > One question here is that, the minimal buffer size should depends on =
various
> > > factors. E.g the ring size. Consider a 256 entries ring, the minimal =
size
> > > should be 64K/256=3D256 ...
> > I guess you are right. We can make this driver programmable I guess?
> > Basically pass min_buf_len to the device.
>=20
>=20
> Then it still have the chance to program the min_buf_len to 1?

If it wants to - yes - presumably device won't work as well,
fetching all kind of extra data e.g. unnecessary descriptors.

>=20
> >=20
> >=20
> > > > But an option that
> > > > disables functionality that a popular guest uses needs a lot of
> > > > documentation to help device writers figure out whether they want t=
hat
> > > > option or not, and I'd worry that even with documentation will be
> > > > misunderstood even if we write it. When do you enable this?
> > > > When you don't care about performance? When you don't care about Li=
nux?
> > >=20
> > > It looks to me the feature proposal here is something related to the
> > > descriptor pre fetching. In the case of packed virtqueue. Having
> > > avail/producer index may help more or less here?
> > >=20
> > > Thanks
> > Isn't this addressed by VIRTIO_F_NOTIFICATION_DATA?
> > At least that's one of the things it's supposed to do ...
>=20
>=20
> Device can choose to disable notification, they usually happen on heavy
> workload which suppresses the effort of notification data.
>=20
> Thanks

Well prefetch is good for latency but presumably
less important for a streaming workload.

>=20
> > > > > > With that in mind, I have an idea: scsi and block already have =
max sg field.
> > > > > > How about we add a writeable max sg field, maybe even make it
> > > > > > programmable per vq?
> > > > > >=20
> > > > > > Thus driver tells device what is it's max s/g value for rx. Wor=
st case device
> > > > > > fetches a bit more than it needs. Discarding extra shouldn't be=
 expensive. This
> > > > > > looks like it will help even smart devices. What do you think?
> > > > > >=20
> > > > > > This nicely avoids conflicting with the flexible framing requir=
ement.
> > > > > >=20
> > > > > My intention was to avoid any descriptor length variations, for
> > > > > devices that unable fetching or discarding extra descriptors. (If=
 in
> > > > > the pipelined HW processing the decision on number of descriptors=
 is
> > > > > made in the early stage, and it cannot be undone in a later stage=
).
> > > > Frankly discarding unused descriptors looks to me like something th=
at
> > > > shouldn't have a high cost in the hardware.  I can see how trying t=
o
> > > > predict descriptor length, and fetching extra if not enough was fet=
ched
> > > > can have a high cost, so to me extensions to remove the guesswork
> > > > from the device have value.  However a lot of effort went into tryi=
ng to
> > > > reduce e.g. number of pci express packets needed to fetch descripto=
rs.
> > > > Each packet fetches 256 bytes anyway, does it not?  Not having an
> > > > ability to use that information seems like an obvious waste, and th=
at
> > > > means ability to keep some fetched descriptors around even if they =
are
> > > > not used for a given packet. Again just my $.02.
> > > >=20
> > > > > Defining max s/g sounds like an interesting feature by itself.
> > > > But assuming we have max RX s/g, I guess hardware can set max s/g =
=3D 1?
> > > > Then since with !VIRTIO_NET_F_MRG_RXBUF all buffers are forced to
> > > > be same length.
> > > >=20
> > > > > > > > > Could you specify what issue do you see with the Linux dr=
iver?
> > > > > > > > See logic around struct ewma.
> > > > > > > >=20
> > > > > > > > The first relevant commit is I guess
> > > > > > > > commit ab7db91705e95ed1bba1304388936fccfa58c992
> > > > > > > >      virtio-net: auto-tune mergeable rx buffer size for imp=
roved
> > > > > > > > performance
> > > > > > > >=20
> > > > > > > > this claims a gain of about 10% with large packets which is=
n't earth
> > > > > > > > shattering but also not something we can ignore completely.=
 And I
> > > > > > > > suspect it can be bigger with smaller packets.
> > > > > > > >=20
> > > > > > > > > > > > > > So device does not really know the exact # of d=
escriptors:
> > > > > > > > > > > > > > current drivers do 1 descriptor per buffer but =
nothing
> > > > > > > > > > > > > > prevents more.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Thoughts?
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > >      \item[VIRTIO_NET_F_RSC_EXT(61)] Device=
 can process
> > > > > > > > > > > > > > > > duplicated
> > > > > > > > > > > > ACKs
> > > > > > > > > > > > > > > >          and report number of coalesced seg=
ments and
> > > > > > > > > > > > > > > > duplicated ACKs @@ -2854,8 +2858,8 @@
> > > > > > > > \subsubsection{Legacy Interface:
> > > > > > > > > > > > Feature bits}\label{sec:Device Types / Network
> > > > > > > > > > > > > > > >      \subsection{Device configuration
> > > > > > > > > > > > > > > > layout}\label{sec:Device Types /
> > > > > > > > > > > > Network Device / Device configuration layout}
> > > > > > > > > > > > > > > >      \label{sec:Device Types / Block Device=
 / Feature
> > > > > > > > > > > > > > > > bits / Device configuration layout} -Three
> > > > > > > > > > > > > > > > driver-read-only configuration fields are c=
urrently defined.
> > > > > > > > > > > > > > > > The \field{mac} address field -always exist=
s (though is
> > > > > > > > > > > > > > > > only valid if VIRTIO_NET_F_MAC is set), and
> > > > > > > > > > > > > > > > +The driver-read-only \field{mac} address f=
ield always
> > > > > > > > > > > > > > > > +exists (though is only valid if VIRTIO_NET=
_F_MAC is
> > > > > > > > > > > > > > > > +set), and
> > > > > > > > > > > > > > > >      \field{status} only exists if VIRTIO_N=
ET_F_STATUS is set.
> > > > > > Two
> > > > > > > > > > > > > > > >      read-only bits (for the driver) are cu=
rrently
> > > > > > > > > > > > > > > > defined for the status
> > > > > > > > > > > > field:
> > > > > > > > > > > > > > > >      VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_=
ANNOUNCE.
> > > > > > > > > > > > > > > > @@ -2875,12 +2879,17 @@ \subsection{Device
> > > > > > > > > > > > > > > > configuration
> > > > > > > > > > > > layout}\label{sec:Device Types / Network Device
> > > > > > > > > > > > > > > >      VIRTIO_NET_F_MTU is set. This field sp=
ecifies the
> > > > > > > > > > > > > > > > maximum MTU for
> > > > > > > > > > > > the driver to
> > > > > > > > > > > > > > > >      use.
> > > > > > > > > > > > > > > > +The device-read-only field \field{rx_buf_l=
en} only
> > > > > > > > > > > > > > > > +exists if
> > > > > > > > > > > > > > > Should be driver-read-only.
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > +VIRTIO_NET_F_CONST_RXBUF_LEN is negotiated=
. This field
> > > > > > > > > > > > > > > > +specifies the receive buffers length.
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > >      \begin{lstlisting}
> > > > > > > > > > > > > > > >      struct virtio_net_config {
> > > > > > > > > > > > > > > >              u8 mac[6];
> > > > > > > > > > > > > > > >              le16 status;
> > > > > > > > > > > > > > > >              le16 max_virtqueue_pairs;
> > > > > > > > > > > > > > > >              le16 mtu;
> > > > > > > > > > > > > > > > +        le32 rx_buf_len;
> > > > > > > > > > > > > > > >      };
> > > > > > > > > > > > > > > >      \end{lstlisting}
> > > > > > > > > > > > > > > > @@ -2933,6 +2942,13 @@ \subsection{Device c=
onfiguration
> > > > > > > > > > > > > > > > layout}\label{sec:Device Types / Network De=
vice
> > > > > > > > > > > > > > > >      A driver SHOULD negotiate the VIRTIO_N=
ET_F_STANDBY
> > > > > > > > > > > > > > > > feature if
> > > > > > > > > > > > the device offers it.
> > > > > > > > > > > > > > > > +A driver SHOULD accept the
> > > > > > > > VIRTIO_NET_F_CONST_RXBUF_LEN
> > > > > > > > > > > > feature if offered.
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +If VIRTIO_NET_F_CONST_RXBUF_LEN feature ha=
s been
> > > > > > > > > > negotiated,
> > > > > > > > > > > > > > > > +the driver MUST set \field{rx_buf_len}.
> > > > > > > > > > > > > > > I think it's device that set the field?
> > > > > > > > > > > > > > Makes more sense for the driver, but if you wan=
t this set e.g.
> > > > > > > > > > > > > > before buffers are added, you must say so.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +A driver MUST NOT modify \field{rx_buf_len=
} once it
> > > > > > > > > > > > > > > > +has been
> > > > > > > > > > set.
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > This seems very unflexible. I can see how e.g. =
XDP would
> > > > > > > > > > > > > > benefit from big buffers while skbs benefit fro=
m small buffers.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > This calls for ability to change this.
> > > > > > > > > > > > > Yes, but it requires non trivial cleanups for the=
 old length
> > > > > > > > > > > > > and place them with new ones.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Thanks
> > > > > > > > > > > > Let's see:
> > > > > > > > > > > > 1=09- making buffer smaller: just update config spa=
ce,
> > > > > > > > > > > > =09  then make new buffers smaller
> > > > > > > > > > > >=20
> > > > > > > > > > > > 2=09- making buffers bigger: add larger buffers,
> > > > > > > > > > > > =09once all small ones are consumed update config s=
pace
> > > > > > > > > > > >=20
> > > > > > > > > > > > 2 is tricky I agree. Thoughts?
> > > > > > > > > > > >=20
> > > > > > > > > > > >=20
> > > > > > > > > > > Agree. It's doable, provided that the driver will fol=
low the
> > > > > > > > > > > update
> > > > > > > > > > procedure.
> > > > > > > > > > > > > > > >      \subsubsection{Legacy Interface: Devic=
e
> > > > > > > > > > > > > > > > configuration
> > > > > > > > > > > > layout}\label{sec:Device Types / Network Device / D=
evice
> > > > > > > > > > > > configuration layout / Legacy Interface: Device con=
figuration
> > > > > > > > > > > > layout}
> > > > > > > > > > > > > > > >      \label{sec:Device Types / Block Device=
 / Feature
> > > > > > > > > > > > > > > > bits / Device
> > > > > > > > > > > > configuration layout / Legacy Interface: Device con=
figuration
> > > > > > > > > > > > layout}
> > > > > > > > > > > > > > > >      When using the legacy interface, trans=
itional
> > > > > > > > > > > > > > > > devices and drivers @@
> > > > > > > > > > > > > > > > -3241,6 +3257,11 @@ \subsubsection{Setting =
Up Receive
> > > > > > > > > > > > Buffers}\label{sec:Device Types / Network Devi
> > > > > > > > > > > > > > > >      If VIRTIO_NET_F_MQ is negotiated, each=
 of
> > > > > > > > > > > > > > > > receiveq1\ldots
> > > > > > > > > > > > receiveqN
> > > > > > > > > > > > > > > >      that will be used SHOULD be populated =
with receive
> > > > > > buffers.
> > > > > > > > > > > > > > > > +If VIRTIO_NET_F_CONST_RXBUF_LEN feature ha=
s been
> > > > > > > > > > negotiated,
> > > > > > > > > > > > > > > > +the driver MUST initialize all receive vir=
tqueue
> > > > > > > > > > > > > > > > +descriptors \field{len} field with the val=
ue
> > > > > > > > > > > > > > > > +configured in \field{rx_buf_len} device co=
nfiguration
> > > > > > > > > > > > > > > > +field, and allocate receive
> > > > > > > > > > > > buffers accordingly.
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > >      \devicenormative{\paragraph}{Setting U=
p Receive
> > > > > > > > > > > > > > > > Buffers}{Device Types / Network Device / De=
vice
> > > > > > > > > > > > > > > > Operation / Setting Up Receive Buffers}
> > > > > > > > > > > > > > > >      The device MUST set \field{num_buffers=
} to the
> > > > > > > > > > > > > > > > number of descriptors used to @@ -3396,6 +3=
417,10 @@
> > > > > > > > > > > > \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device
> > > > > > > > > > > > Types / Network
> > > > > > > > > > > > > > > >      checksum (in case of multiple encapsul=
ated
> > > > > > > > > > > > > > > > protocols, one
> > > > > > > > level
> > > > > > > > > > > > > > > >      of checksums is validated).
> > > > > > > > > > > > > > > > +If VIRTIO_NET_F_CONST_RXBUF_LEN has been n=
egotiated,
> > > > > > > > the
> > > > > > > > > > > > device
> > > > > > > > > > > > > > > > +MAY use \field{rx_buf_len} as a buffer len=
gth (instead
> > > > > > > > > > > > > > > > +of reading it from virtqueue descriptor \f=
ield{len} field).
> > > > > > > > > > > > > > > Is this safe? What if driver submit a small b=
uffer, then
> > > > > > > > > > > > > > > device can read
> > > > > > > > > > > > more than what is allowed?
> > > > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > >      \drivernormative{\paragraph}{Processin=
g of Incoming
> > > > > > > > > > > > > > > >      Packets}{Device Types / Network Device=
 / Device Operation
> > > > > > /
> > > > > > > > > > > > > > > >      Processing of Incoming Packets}
> >=20
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >=20
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >=20
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >=20


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

