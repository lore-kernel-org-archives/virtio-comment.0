Return-Path: virtio-comment-return-908-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C0E4F985D79
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Nov 2019 15:05:25 +0000 (UTC)
Date: Mon, 11 Nov 2019 10:05:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191111092046-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB2067FA1E7C89A81371DC0DB9C5630@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191031235120-mutt-send-email-mst@kernel.org>
 <2b9fe971-7d9d-245c-bc74-81c1336cbb9d@redhat.com>
 <20191101052632-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB20670A707B77880981780293C5750@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191110095305-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067B4B98759B7A7BF9FFBE0C5740@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067B4B98759B7A7BF9FFBE0C5740@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: [virtio-comment] Re: [EXT] Re: [virtio-comment] Re: [PATCH] virtio-net: Add
 equal-sized receive buffers feature
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Nov 11, 2019 at 01:58:51PM +0000, Vitaly Mireyno wrote:
>=20
>=20
> >-----Original Message-----
> >From: Michael S. Tsirkin <mst@redhat.com>
> >Sent: Sunday, 10 November, 2019 17:35
> >To: Vitaly Mireyno <vmireyno@marvell.com>
> >Cc: Jason Wang <jasowang@redhat.com>; virtio-comment@lists.oasis-
> >open.org
> >Subject: Re: [EXT] Re: [virtio-comment] Re: [PATCH] virtio-net: Add equa=
l-
> >sized receive buffers feature
> >
> >On Sun, Nov 10, 2019 at 02:13:14PM +0000, Vitaly Mireyno wrote:
> >>
> >> >-----Original Message-----
> >> >From: virtio-comment@lists.oasis-open.org
> >> ><virtio-comment@lists.oasis- open.org> On Behalf Of Michael S.
> >> >Tsirkin
> >> >Sent: Tuesday, 5 November, 2019 20:52
> >> >To: Jason Wang <jasowang@redhat.com>
> >> >Cc: Vitaly Mireyno <vmireyno@marvell.com>;
> >> >virtio-comment@lists.oasis- open.org
> >> >Subject: [EXT] Re: [virtio-comment] Re: [PATCH] virtio-net: Add
> >> >equal-sized receive buffers feature
> >> >
> >> >External Email
> >> >
> >> >---------------------------------------------------------------------
> >> >- On Fri, Nov 01, 2019 at 03:22:26PM +0800, Jason Wang wrote:
> >> >>
> >> >> On 2019/11/1 =E4=B8=8B=E5=8D=8812:09, Michael S. Tsirkin wrote:
> >> >> > On Thu, Oct 31, 2019 at 10:46:55AM +0000, Vitaly Mireyno wrote:
> >> >> > > The feature is limited to receive buffers only.
> >> >> > > A driver decides on receive buffer length. The only limitation
> >> >> > > is that this
> >> >length has to be the same for all receive virtqueue buffers.
> >> >> > > The driver configures receive buffer length to the device
> >> >> > > during device
> >> >initialization, and the device reads it and may use it for optimal op=
eration.
> >> >> > > No changes for transmit buffers.
> >> >> > >
> >> >> > > -----Original Message-----
> >> >> > > From: virtio-comment@lists.oasis-open.org
> >> >> > > <virtio-comment@lists.oasis-open.org> On Behalf Of Jason Wang
> >> >> > > Sent: Thursday, 31 October, 2019 12:15
> >> >> > > To: Vitaly Mireyno <vmireyno@marvell.com>;
> >> >> > > virtio-comment@lists.oasis-open.org
> >> >> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> >> >> > > Subject: [virtio-comment] Re: [PATCH] virtio-net: Add
> >> >> > > equal-sized receive buffers feature
> >> >> > >
> >> >> > >
> >> >> > > On 2019/10/31 =E4=B8=8B=E5=8D=885:23, Vitaly Mireyno wrote:
> >> >> > > > Some devices benefit from working with receive buffers of a
> >> >predefined constant length.
> >> >> > > > Add a feature for drivers that allocate equal-sized receive
> >> >> > > > buffers, and
> >> >devices that benefit from predefined receive buffers length.
> >> >> > > >
> >> >> > > > Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> >> >> > > > ---
> >> >> > > >    content.tex | 29 +++++++++++++++++++++++++++--
> >> >> > > >    1 file changed, 27 insertions(+), 2 deletions(-)
> >> >> > >
> >> >> > > Is there any other networking device that has this feature?
> >> >> > >
> >> >> > >
> >> >> > > > diff --git a/content.tex b/content.tex index b1ea9b9..c9e67c8
> >> >> > > > 100644
> >> >> > > > --- a/content.tex
> >> >> > > > +++ b/content.tex
> >> >> > > > @@ -2811,6 +2811,10 @@ \subsection{Feature
> >> >> > > > bits}\label{sec:Device
> >> >Types / Network Device / Feature bits
> >> >> > > >    \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address
> >> >through control
> >> >> > > >        channel.
> >> >> > > > +\item[VIRTIO_NET_F_CONST_RXBUF_LEN(58)] Driver allocates all
> >> >receive buffers
> >> >> > > > +    of the same constant length. Device benefits from workin=
g with
> >> >> > > > +    receive buffers of equal length.
> >> >> > > > +
> >> >> > Problem is, I don't think linux will use this for skbs since it
> >> >> > breaks buffer accounting. This is because it is important to make
> >> >> > skbs as small as you can. So even if you see "device would benefi=
t"
> >> >> > there is no way to balance this with the benefit to linux.
> >> >> > How do you know which benefit is bigger?
> >> >>
> >> >>
> >> >> I guess the idea is e.g for Linux driver, it can refuse this featur=
e.
> >> >
> >> >Okay. What uses it?
> >> >
> >> >>
> >> >> >
> >> >> > You also never explained how does device benefit. My guess is
> >> >> > this allows device to calculate the # of descriptors to fetch
> >> >> > that are needed for a packet. Right?
> >> >> > Assuming this, I think a rough estimate should be enough.
> >> >> > If device fetches too much it can discard extra, if it does not
> >> >> > fetch enough it can fetch extra.
> >> >> >
> >> >> > Let us not forget that express packets are 256 bytes so up to 16
> >> >> > descriptors fit in a packet, there is no benefit most of the time
> >> >> > in knowing whether e.g. 1 or 2 descriptors are needed.
> >> >> >
> >> >> >
> >> >> > Let us not forget these are buffers, not descriptors.
> >> >>
> >> >>
> >> >> I guess maybe the initial motivation is constant descriptor length.
> >> >
> >> >
> >> >That conflicts with requirement framing is up to driver.
> >> >
> >> >
> >> I was using the wrong terminology. The feature is about constant
> >*descriptor* length. In other words, the value that driver puts in Packe=
d
> >Virtqueue "Element Length" field (or 'len' field in the 'pvirtq_desc' st=
ruct).
> >
> >OK so this conflicts with "2.6.4 Message Framing" which requires that dr=
ivers
> >can split buffers into as many descriptors as they like.
> >Right?
> >
> >> Does it make more sense now, or you still see an issue with Linux driv=
er?
> >
> >I think there's an issue with the flexible framing requirements and ther=
e's an
> >issue with Linux driver.
> >
> >> The motivation is to allow the device to calculate the exact number of
> >descriptors to consume, before fetching the descriptors. This is benefic=
ial for
> >devices for which overconsuming or underconsuming descriptors come at a
> >high cost.
> >
> >So I guess we can agree getting the # of descriptors *exactly* right isn=
't all
> >that important. Right? My question is how does the driver balance the de=
vice
> >versus Linux needs?
> >
> >One idea is if we assume this is best effort, does not have to be exact,=
 then
> >how about just having the device assume descriptor sizes stay more or le=
ss
> >constant and use that to estimate the amount? If it under/over estimates=
,
> >things just go a bit slower.
> >This way driver can adjust the sizes and device will react automatically=
, with
> >time.
> >
> >
>=20
> I see that "2.6.4 Message Framing" allows a full flexibility of
> descriptor lengths, and I presume it's applicable to Packet Virtqueues
> as well, though defined under Split Virtqueues section.

That's a good point. Probably makes sense to move it out to
a common section, right?

> The example
> talks about transmit virtqueue, and it makes perfect sense.
> However, wouldn't a typical driver place equal-sized *receive* descriptor=
s anyway? So if a device can benefit from it, the driver might as well nego=
tiate this new feature.

Having buffer size jump around wildly doesn't seem too useful, I agree.
OTOH being able to adjust it gradually has been in the past demontrated
to help performance measureably.

> This could be especially relevant for devices, for which adjusting the nu=
mber of used descriptors is impractical after descriptors have already been=
 fetched.
> I agree that if this requirement conflicts with specific driver needs, it=
 will not be negotiated, and the device will either underperform in certain=
 scenarios, or will not come up at all.

Right so that makes it a challenge. Device says it prefers fixed
buffers. Is that preference more or less important than ability
to efficiently support workloads such as TCP small queues?
Driver has no idea and I suspect neither does the device.
So I don't see how will a Linux driver know that it should enable this,
neither how will device know it's okay to just refuse features_ok.


On the other hand, current drivers already have logic that tries to
change buffer sizes in a smooth way.  So simply caching the last buffer
size and assuming all the others will be exactly the same will go a long
way towards limiting how much does device need to fetch.  This does
imply extra logic on the device to recover if things change and the
first read did not fetch enough buffers, but then it would be required
anyway if as you say above the failure is not catastrophic.


The feature thus only seems useful for small, feature-restrained devices
- which are prepared to sacrifice some performance to cut costs, and
which can't recover at all. Is this what you are trying to do?

> Could you specify what issue do you see with the Linux driver?

See logic around struct ewma.

The first relevant commit is I guess
commit ab7db91705e95ed1bba1304388936fccfa58c992
    virtio-net: auto-tune mergeable rx buffer size for improved performance

this claims a gain of about 10% with large packets which
isn't earth shattering but also not something we can
ignore completely. And I suspect it can be bigger with
smaller packets.

> >> >>
> >> >> >
> >> >> > So device does not really know the exact # of descriptors:
> >> >> > current drivers do 1 descriptor per buffer but nothing prevents
> >> >> > more.
> >> >> >
> >> >> >
> >> >> > Thoughts?
> >> >> >
> >> >> >
> >> >> > > >    \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process
> >> >> > > > duplicated
> >> >ACKs
> >> >> > > >        and report number of coalesced segments and duplicated
> >> >> > > > ACKs @@ -2854,8 +2858,8 @@ \subsubsection{Legacy Interface:
> >> >Feature bits}\label{sec:Device Types / Network
> >> >> > > >    \subsection{Device configuration layout}\label{sec:Device
> >> >> > > > Types /
> >> >Network Device / Device configuration layout}
> >> >> > > >    \label{sec:Device Types / Block Device / Feature bits /
> >> >> > > > Device configuration layout} -Three driver-read-only
> >> >> > > > configuration fields are currently defined.
> >> >> > > > The \field{mac} address field -always exists (though is only
> >> >> > > > valid if VIRTIO_NET_F_MAC is set), and
> >> >> > > > +The driver-read-only \field{mac} address field always exists
> >> >> > > > +(though is only valid if VIRTIO_NET_F_MAC is set), and
> >> >> > > >    \field{status} only exists if VIRTIO_NET_F_STATUS is set. =
Two
> >> >> > > >    read-only bits (for the driver) are currently defined for
> >> >> > > > the status
> >> >field:
> >> >> > > >    VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_ANNOUNCE.
> >> >> > > > @@ -2875,12 +2879,17 @@ \subsection{Device configuration
> >> >layout}\label{sec:Device Types / Network Device
> >> >> > > >    VIRTIO_NET_F_MTU is set. This field specifies the maximum
> >> >> > > > MTU for
> >> >the driver to
> >> >> > > >    use.
> >> >> > > > +The device-read-only field \field{rx_buf_len} only exists if
> >> >> > >
> >> >> > > Should be driver-read-only.
> >> >> > >
> >> >> > >
> >> >> > > > +VIRTIO_NET_F_CONST_RXBUF_LEN is negotiated. This field
> >> >> > > > +specifies the receive buffers length.
> >> >> > > > +
> >> >> > > >    \begin{lstlisting}
> >> >> > > >    struct virtio_net_config {
> >> >> > > >            u8 mac[6];
> >> >> > > >            le16 status;
> >> >> > > >            le16 max_virtqueue_pairs;
> >> >> > > >            le16 mtu;
> >> >> > > > +        le32 rx_buf_len;
> >> >> > > >    };
> >> >> > > >    \end{lstlisting}
> >> >> > > > @@ -2933,6 +2942,13 @@ \subsection{Device configuration
> >> >> > > > layout}\label{sec:Device Types / Network Device
> >> >> > > >    A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature
> >> >> > > > if
> >> >the device offers it.
> >> >> > > > +A driver SHOULD accept the VIRTIO_NET_F_CONST_RXBUF_LEN
> >> >feature if offered.
> >> >> > > > +
> >> >> > > > +If VIRTIO_NET_F_CONST_RXBUF_LEN feature has been
> >negotiated,
> >> >> > > > +the driver MUST set \field{rx_buf_len}.
> >> >> > >
> >> >> > > I think it's device that set the field?
> >> >> > Makes more sense for the driver, but if you want this set e.g.
> >> >> > before buffers are added, you must say so.
> >> >> >
> >> >> > > > +
> >> >> > > > +A driver MUST NOT modify \field{rx_buf_len} once it has been
> >set.
> >> >> > > > +
> >> >> >
> >> >> > This seems very unflexible. I can see how e.g. XDP would benefit
> >> >> > from big buffers while skbs benefit from small buffers.
> >> >> >
> >> >> > This calls for ability to change this.
> >> >>
> >> >>
> >> >> Yes, but it requires non trivial cleanups for the old length and
> >> >> place them with new ones.
> >> >>
> >> >> Thanks
> >> >
> >> >
> >> >Let's see:
> >> >1=09- making buffer smaller: just update config space,
> >> >=09  then make new buffers smaller
> >> >
> >> >2=09- making buffers bigger: add larger buffers,
> >> >=09once all small ones are consumed update config space
> >> >
> >> >2 is tricky I agree. Thoughts?
> >> >
> >> >
> >> Agree. It's doable, provided that the driver will follow the update
> >procedure.
> >> >
> >> >>
> >> >> >
> >> >> > > >    \subsubsection{Legacy Interface: Device configuration
> >> >layout}\label{sec:Device Types / Network Device / Device
> >> >configuration layout / Legacy Interface: Device configuration layout}
> >> >> > > >    \label{sec:Device Types / Block Device / Feature bits /
> >> >> > > > Device
> >> >configuration layout / Legacy Interface: Device configuration layout}
> >> >> > > >    When using the legacy interface, transitional devices and
> >> >> > > > drivers @@
> >> >> > > > -3241,6 +3257,11 @@ \subsubsection{Setting Up Receive
> >> >Buffers}\label{sec:Device Types / Network Devi
> >> >> > > >    If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots
> >> >receiveqN
> >> >> > > >    that will be used SHOULD be populated with receive buffers=
.
> >> >> > > > +If VIRTIO_NET_F_CONST_RXBUF_LEN feature has been
> >negotiated,
> >> >> > > > +the driver MUST initialize all receive virtqueue descriptors
> >> >> > > > +\field{len} field with the value configured in
> >> >> > > > +\field{rx_buf_len} device configuration field, and allocate
> >> >> > > > +receive
> >> >buffers accordingly.
> >> >> > > > +
> >> >> > > >    \devicenormative{\paragraph}{Setting Up Receive
> >> >> > > > Buffers}{Device Types / Network Device / Device Operation /
> >> >> > > > Setting Up Receive Buffers}
> >> >> > > >    The device MUST set \field{num_buffers} to the number of
> >> >> > > > descriptors used to @@ -3396,6 +3417,10 @@
> >> >\subsubsection{Processing of Incoming Packets}\label{sec:Device Types
> >> >/ Network
> >> >> > > >    checksum (in case of multiple encapsulated protocols, one =
level
> >> >> > > >    of checksums is validated).
> >> >> > > > +If VIRTIO_NET_F_CONST_RXBUF_LEN has been negotiated, the
> >> >device
> >> >> > > > +MAY use \field{rx_buf_len} as a buffer length (instead of
> >> >> > > > +reading it from virtqueue descriptor \field{len} field).
> >> >> > >
> >> >> > > Is this safe? What if driver submit a small buffer, then device
> >> >> > > can read
> >> >more than what is allowed?
> >> >> > >
> >> >> > > Thanks
> >> >> > >
> >> >> > >
> >> >> > > > +
> >> >> > > >    \drivernormative{\paragraph}{Processing of Incoming
> >> >> > > >    Packets}{Device Types / Network Device / Device Operation =
/
> >> >> > > >    Processing of Incoming Packets}
> >> >> > > > --
> >> >> > >
> >> >> > > This publicly archived list offers a means to provide input to
> >> >> > > theOASIS Virtual I/O Device (VIRTIO) TC.In order to verify user
> >> >> > > consent to the Feedback License terms andto minimize spam in
> >> >> > > the list archive, subscription is requiredbefore posting.Subscr=
ibe:
> >> >> > > virtio-comment-subscribe@lists.oasis-open.orgUnsubscribe:
> >> >> > > virtio-comment-unsubscribe@lists.oasis-open.orgList help:
> >> >> > > virtio-comment-help@lists.oasis-open.orgList archive:
> >> >> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oa=
si
> >> >> > > s-2
> >> >> > > Dopen.org_archives_virtio-
> >> >2Dcomment_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7
> >> >> > >
> >>
> >>xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LR
> >g
> >> >5F7
> >> >> > >
> >>
> >>_7jB6uHCHA2n_Tn6303zez2N4VkSfU&s=3DZvYuXs3LuhkeJxW_zoADv1L4RisDy
> >G
> >> >H_v
> >> >> > > p7scO91w9s&e=3D Feedback License:
> >> >> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasi=
s-
> >> >2Do
> >> >> > > pen.org_who_ipr_feedback-
> >> >5Flicense.pdf&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPa
> >> >> > >
> >>
> >>z7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3
> >L
> >> >Rg5
> >> >> > > F7_7jB6uHCHA2n_Tn6303zez2N4VkSfU&s=3D7Hf-O4ss-
> >> >rLdNJsAbIOg5ruheBcfAYF
> >> >> > > dXWuks_HJfFQ&e=3D List Guidelines:
> >> >> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasi=
s-
> >> >2Do
> >> >> > > pen.org_policies-2Dguidelines_mailing-
> >> >2Dlists&d=3DDwIFaQ&c=3DnKjWec2b6
> >> >> > >
> >>
> >>R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m
> >=3D
> >> >KkXM
> >> >> > >
> >>
> >>gr3LRg5F7_7jB6uHCHA2n_Tn6303zez2N4VkSfU&s=3D7oMwlBy4fdYwjT2_f9BT
> >w
> >> >HRm
> >> >> > > 2GFtIYL-x8e4C0jlrpM&e=3D Committee:
> >> >> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasi=
s-
> >> >2Do
> >> >> > >
> >>
> >>pen.org_committees_virtio_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3Dl
> >> >DH
> >> >> > >
> >>
> >>J2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6u
> >H
> >> >CHA
> >> >> > > 2n_Tn6303zez2N4VkSfU&s=3D-
> >> >K2akZ06PY7r4TquQY4T4UWdZ6JyAsBDFZIEZFNsWHk
> >> >> > > &e=3D Join OASIS:
> >> >> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasi=
s-
> >> >2Do
> >> >> > >
> >>
> >>pen.org_join_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3l
> >q
> >> >qs
> >> >> > >
> >>
> >>ArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCHA2n_Tn630
> >3
> >> >zez2
> >> >> > > N4VkSfU&s=3DlR1SlzXT71tjw7DDuD6XaHefJQSTBCAvRcdp45ureB8&e=3D
> >> >> > >
> >> >> > This publicly archived list offers a means to provide input to
> >> >> > the OASIS Virtual I/O Device (VIRTIO) TC.
> >> >> >
> >> >> > In order to verify user consent to the Feedback License terms and
> >> >> > to minimize spam in the list archive, subscription is required
> >> >> > before posting.
> >> >> >
> >> >> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >> >> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >> >> > List help: virtio-comment-help@lists.oasis-open.org
> >> >> > List archive:
> >> >> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasi=
s-
> >> >> > 2Do
> >> >> > pen.org_archives_virtio-
> >> >2Dcomment_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ
> >> >> >
> >>
> >>&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DB_vcfjTktm5RY1
> >R
> >> >Td67
> >> >> >
> >>
> >>ln4UY3Qz2I8T0_t4KwDaM0Ow&s=3DJjvHrIJI6KbQVxPovjCYXudvXtlvyYp3u7l56t
> >c
> >> >gZ
> >> >> > SU&e=3D Feedback License:
> >> >> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> >> >2Dope
> >> >> > n.org_who_ipr_feedback-
> >> >5Flicense.pdf&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xt
> >> >> >
> >>
> >>fQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DB_vcfjTktm5
> >RY
> >> >1RTd
> >> >> > 67ln4UY3Qz2I8T0_t4KwDaM0Ow&s=3DF-
> >> >1nqbZJyAZ3cYJgplGpxopp7wXt26y2UR97jmR
> >> >> > ZSEQ&e=3D List Guidelines:
> >> >> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> >> >2Dope
> >> >> > n.org_policies-2Dguidelines_mailing-
> >> >2Dlists&d=3DDwIFaQ&c=3DnKjWec2b6R0mO
> >> >> >
> >>
> >>yPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DB_vcf
> >j
> >> >Tktm
> >> >> >
> >>
> >>5RY1RTd67ln4UY3Qz2I8T0_t4KwDaM0Ow&s=3D0JXzYENjagm_cdHWwpZZ9Apv
> >P
> >> >qBLKHhg
> >> >> > ifl_rDNqEP0&e=3D
> >> >> > Committee:
> >> >> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> >> >2Dope
> >> >> >
> >>
> >>n.org_committees_virtio_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlD
> >HJ
> >> >2FW
> >> >> >
> >>
> >>52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DB_vcfjTktm5RY1RTd67ln4UY
> >3
> >> >Qz2I
> >> >> > 8T0_t4KwDaM0Ow&s=3DC1VTV-Oeidqxe7sJ-
> >> >ctzZXEHto03VJEKs9BqAt2qObc&e=3D
> >> >> > Join OASIS:
> >> >> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> >> >2Dope
> >> >> >
> >>
> >>n.org_join_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqq
> >s
> >> >ArgF
> >> >> >
> >>
> >>Rdcevq01tbLQAw4A_NO7xgI&m=3DB_vcfjTktm5RY1RTd67ln4UY3Qz2I8T0_t4K
> >w
> >> >DaM0O
> >> >> > w&s=3DSNZGlaiIO4-mL1Ct2MIUCBntMVTf8JUglBIv_RGloCY&e=3D
> >> >> >
> >> >
> >> >This publicly archived list offers a means to provide input to
> >> >theOASIS Virtual I/O Device (VIRTIO) TC.In order to verify user
> >> >consent to the Feedback License terms andto minimize spam in the list
> >> >archive, subscription is requiredbefore
> >> >posting.Subscribe: virtio-comment-subscribe@lists.oasis-
> >> >open.orgUnsubscribe:
> >> >virtio-comment-unsubscribe@lists.oasis-open.orgList
> >> >help: virtio-comment-help@lists.oasis-open.orgList archive:
> >> >https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-
> >> >2Dopen.org_archives_virtio-
> >>
> >>2Dcomment_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3l
> >q
> >>
> >>qsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DB_vcfjTktm5RY1RTd67ln4UY3Qz2I8T
> >0
> >> >_t4KwDaM0Ow&s=3DJjvHrIJI6KbQVxPovjCYXudvXtlvyYp3u7l56tcgZSU&e=3D
> >> >Feedback License: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> >> >3A__www.oasis-2Dopen.org_who_ipr_feedback-
> >>
> >>5Flicense.pdf&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lq
> >q
> >>
> >>sArgFRdcevq01tbLQAw4A_NO7xgI&m=3DB_vcfjTktm5RY1RTd67ln4UY3Qz2I8T0
> >_
> >> >t4KwDaM0Ow&s=3DF-1nqbZJyAZ3cYJgplGpxopp7wXt26y2UR97jmRZSEQ&e=3D
> >> >List Guidelines: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> >> >3A__www.oasis-2Dopen.org_policies-2Dguidelines_mailing-
> >>
> >>2Dlists&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgF
> >R
> >>
> >>dcevq01tbLQAw4A_NO7xgI&m=3DB_vcfjTktm5RY1RTd67ln4UY3Qz2I8T0_t4Kw
> >D
> >> >aM0Ow&s=3D0JXzYENjagm_cdHWwpZZ9ApvPqBLKHhgifl_rDNqEP0&e=3D
> >> >Committee: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> >> >3A__www.oasis-
> >>
> >>2Dopen.org_committees_virtio_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ
> >&
> >>
> >>r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DB_vcfjTktm5RY1R
> >T
> >> >d67ln4UY3Qz2I8T0_t4KwDaM0Ow&s=3DC1VTV-Oeidqxe7sJ-
> >> >ctzZXEHto03VJEKs9BqAt2qObc&e=3D Join OASIS:
> >> >https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> >>
> >>2Dopen.org_join_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52
> >o
> >>
> >>J3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DB_vcfjTktm5RY1RTd67ln4UY3Qz
> >2I
> >> >8T0_t4KwDaM0Ow&s=3DSNZGlaiIO4-
> >> >mL1Ct2MIUCBntMVTf8JUglBIv_RGloCY&e=3D
> >>
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

