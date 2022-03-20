Return-Path: <mst@redhat.com>
Date: Sun, 20 Mar 2022 12:06:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Message-ID: <20220320112548-mutt-send-email-mst@kernel.org>
References: <4735344.EBYxvr1mta@silver>
 <149799798.HqrVOTAGB4@silver>
 <20220320093409-mutt-send-email-mst@kernel.org>
 <3695921.aWz9qjfz3Z@silver>
MIME-Version: 1.0
In-Reply-To: <3695921.aWz9qjfz3Z@silver>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Mar 20, 2022 at 04:17:48PM +0100, Christian Schoenebeck wrote:
> On Sonntag, 20. M=E4rz 2022 14:55:59 CET Michael S. Tsirkin wrote:
> > On Sun, Mar 20, 2022 at 02:32:23PM +0100, Christian Schoenebeck wrote:
> > > On Sonntag, 20. M=E4rz 2022 13:31:51 CET Michael S. Tsirkin wrote:
> > > > On Sat, Mar 19, 2022 at 01:00:28PM +0100, Christian Schoenebeck wro=
te:
> > > > > On Samstag, 19. M=E4rz 2022 10:33:49 CET Michael S. Tsirkin wrote:
> > > > > > On Wed, Mar 16, 2022, 15:47 Christian Schoenebeck
> > > > > > <qemu_oss@crudebyte.com>
> > > > > >=20
> > > > > > wrote:
> > > > > > > This new feature flag allows to decouple the maximum amount of
> > > > > > > descriptors in indirect descriptor tables from the Queue Size.
> > > > > >=20
> > > > > > if we are extending these limits, I suggest reusing the feature=
 flag
> > > > > > to
> > > > > > also add a limit on total s/g list size. making it separate from
> > > > > > queue
> > > > > > size
> > > > > > was requested a while ago.
> > > > >=20
> > > > > What do you mean with "total s/g list size"? The maximum bulk data
> > > > > size
> > > > > per
> > > > > message?
> > > > > Sum of both in and out s/g lists' bulk data or only for one of th=
em?
> > > > > Or maximum size of exactly only one memory segment?
> > > >=20
> > > > I don't really know what does "bulk data size" mean. Suggest we use
> > > > terminology from the spec. A buffer includes a group of direct and/=
or
> > > > indirect descriptors, in turn indirect descriptors point to direct
> > > > descriptors.
> > >=20
> > > I already described why I think it makes sense not calling it "buffer=
" in
> > > this particular context. So I am against changing this to "buffer".
> >=20
> > Well spec just defines what buffers are.
> > If you are using a different term then you need to define it in the
> > spec.
>=20
> Sorry, but that sounds like nitpicking to me. From split-ring.tex:
>=20
> "When the driver wants to send a buffer to the device, it fills in
> a *slot* in the descriptor table (or chains several together)"
> So a "slot in the descriptor table" does not need further specification, =
but=20
> the term "vring slot" does?

One of the reasons is that it's an old text from pre-standard days.
It's therefore informal. We are trying to do better and unfortunately
this means you might need to clean up some old text to add your
feature.

Packed ring has the concept of "elements" maybe fixing up
split to use that teminology too can work.


Anothe reason I am not excited about "vring slots" is because
it is not concise - it's easy to just say "slots" and introduce
confusion.



>=20
> > > If other people
> > > support your position then I'll change it though of course.
> > >=20
> > > About "bulk data size": "Bulk data" is the user data actually being u=
sed
> > > on
> > > application/driver level, i.e. above virtio level, and "Bulk data siz=
e"
> > > the
> > > size of that data. See ASCII illustration here:
> > > https://github.com/oasis-tcs/virtio-spec/issues/122
> > >=20
> > > The terminology "bulk data" is already used in the spec already BTW.
> >=20
> > It does not refer to anything specific though, just generally
> > to vqs for passing lots of data as opposed to config space used
> > to pass small amount of data.
>=20
> Which is telling pretty much precise enough what it is, at least IMO.

Well saying generally there's a "bulk of data" just means there's a lot.
If you are talking about it's size then I guess you somehow
distinguish this data from some other data?

Please look at the Virtqueues chapter and see if any existing terms
fit your usage. It's hard enough for people to learn the spec without
us changing terminology each release.

> > > > What has been requested a while is ability to limit per vq the
> > > > # of direct descriptors in a buffer.
> > >=20
> > > So in cases where indirect descriptors are *not* used. This series is
> > > about
> > > indirect descriptors only though.
> >=20
> > No, in all cases.
>=20
> ?

what users in the field asked for is ability to increase VQ size to hold
more than 1024 buffers. However QEMU can not support requests with more
than 1024 elements. Thus the wish to limit buffer size below VQ size.
Whether there's an indirect element in the chain does not matter
for this use-case.


> > > > Since IIUC what you want to do is allow more descriptors
> > > > than VQ size, then one way to achieve that is just to have
> > > > a per VQ limit on descriptor size and have that limit > VQ size.
> > >=20
> > > Sorry, I can't follow you. What do you mean with "descriptor size"?
> > > For me a
> > > descriptor has a predefined constant struct size. You mean the size o=
f one
> > > memory segment referenced by one indirect descriptor? And why would i=
t be
> > > better than what this series suggests?
> >=20
> > My bad. What I meant is a "per VQ limit on # of direct descriptors
> > per buffer".
>=20
> Which is out of the scope of what this series was about.

Maybe the scope is too limited then.


> > > > Another thing related is that people wanted to block indirect
> > > > descriptors for some VQs. Not yet sure how to combine that
> > > > with this proposal, worth thinking about.
> > >=20
> > > This series allows both, increasing *and* decreasing the number of
> > > indirect
> > > descriptors per VQ already.
> >=20
> > I don't see how you block indirect descritors for a queue with this.
> > Did I miss it?
>=20
> By setting the proposed "Queue Indirect Size" value to zero?

I guess ... it is better to call this out explicitly in the spec.


> > Also I think you missed the fact that
> > a direct descriptor can point to an indirect one, the
> > result is that max # of descriptors in a buffer is then:
> >=20
> > queue size - 1 + indirect table size
> >=20
> > I don't see how your proposal limits the # of descriptors
> > below queue size since guest is never forced to use
> > indirect.
>=20
> No, I didn't miss that. The suggested changes were about the amount of=20
> *indirect* descriptors, not about the amount of *direct* descriptors. The=
=20
> amount of direct descriptors was still limited to the "Queue Size".

Confused.
The amount of indirect descriptors?
Not the size in each one? But your commit log says
	descriptors in indirect descriptor tables
descriptors in the indirect descriptor tables are not indirect
descriptors.

At this point I don't understand the motivation for the change.


> I am aware that QEMU currently has a limit per "buffer" which adds the am=
ount=20
> of direct descriptors *and* the amount of indirect ones together for that=
=20
> limit (which I also mentioned from the Github issue summary BTW). Which i=
s a=20
> device specific implementation feature of QEMU and would not stop QEMU th=
ough=20
> to handle this correctly by reducing the negotiated "Queue Indirect Size"=
=20
> value appropriately.

Except people want a deeper queue, I can probably find & forward links
to mailing list discussions.

> > > > > And are you suggesting this should become part of this series alr=
eady?
> > > >=20
> > > > yes since it's touching mostly same areas in the spec.
> > > :
> > > :/ Please note that I sent the first draft on this issue already in
> > > :November
> > >=20
> > > last year, and have not seen any response from your side so far. I
> > > actually
> > > assumed we were already at a point where it was just about precise wo=
rding
> > > et al., not restarting to redesign everything again from scratch now.
> > Sorry about that.
>=20
> I'm pretty sure you are.

Yes, I wish we could move faster.  If you are asking for advice about
avoiding such situations in the future then that would be to iterate
faster. It's just on v3 since november, and you did get comments on the
previous revisions.

> > > > > > > The new term "Queue Indirect Size" is introduced for this pur=
pose,
> > > > > > > which is a transport specific configuration whose negotiation=
 is
> > > > > > > further specified for each transport with subsequent patches.
> > > > > > >=20
> > > > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > > > > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > > > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > > > ---
> > > > > > >=20
> > > > > > >  content.tex     | 32 ++++++++++++++++++++++++++++++--
> > > > > > >  packed-ring.tex |  2 +-
> > > > > > >  split-ring.tex  |  8 ++++++--
> > > > > > >  3 files changed, 37 insertions(+), 5 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/content.tex b/content.tex
> > > > > > > index c6f116c..685525d 100644
> > > > > > > --- a/content.tex
> > > > > > > +++ b/content.tex
> > > > > > > @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic
> > > > > > > Facilities
> > > > > > > of a
> > > > > > > Virtio Device / Feature B
> > > > > > >=20
> > > > > > >  \begin{description}
> > > > > > >  \item[0 to 23, and 50 to 127] Feature bits for the specific
> > > > > > >  device
> > > > > > >  type
> > > > > > >=20
> > > > > > > -\item[24 to 40] Feature bits reserved for extensions to the =
queue
> > > > > > > and
> > > > > > > +\item[24 to 41] Feature bits reserved for extensions to the =
queue
> > > > > > > and
> > > > > > >=20
> > > > > > >    feature negotiation mechanisms
> > > > > > >=20
> > > > > > > -\item[41 to 49, and 128 and above] Feature bits reserved for
> > > > > > > future
> > > > > > > extensions.
> > > > > > > +\item[42 to 49, and 128 and above] Feature bits reserved for
> > > > > > > future
> > > > > > > extensions.
> > > > > > >=20
> > > > > > >  \end{description}
> > > > > > > =20
> > > > > > >  \begin{note}
> > > > > > >=20
> > > > > > > @@ -1051,6 +1051,10 @@ \subsubsection{Common configuration
> > > > > > > structure
> > > > > > > layout}\label{sec:Virtio Transport
> > > > > > >=20
> > > > > > >  present either a value of 0 or a power of 2 in
> > > > > > >  \field{queue_size}.
> > > > > > >=20
> > > > > > > +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the devi=
ce
> > > > > > > MUST
> > > > > > > provide the
> > > > > > > +Queue Indirect Size supported by device, which is a transport
> > > > > > > specific
> > > > > > > +configuration. It MUST allow the driver to set a lower value.
> > > > > > > +
> > > > > > >=20
> > > > > > >  \drivernormative{\paragraph}{Common configuration structure
> > > > > > >=20
> > > > > > > layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI
> > > > > > > Device
> > > > > > > Layout
> > > > > > > / Common configuration structure layout}
> > > > > > >=20
> > > > > > >  The driver MUST NOT write to \field{device_feature},
> > > > > > >  \field{num_queues},
> > > > > > >=20
> > > > > > > \field{config_generation}, \field{queue_notify_off} or
> > > > > > > \field{queue_notify_data}.
> > > > > > > @@ -6847,6 +6851,30 @@ \chapter{Reserved Feature
> > > > > > > Bits}\label{sec:Reserved
> > > > > > > Feature Bits}
> > > > > > >=20
> > > > > > >    that the driver can reset a queue individually.
> > > > > > >    See \ref{sec:Basic Facilities of a Virtio Device / Virtque=
ues /
> > > > > > >=20
> > > > > > > Virtqueue Reset}.
> > > > > > >=20
> > > > > > > +  \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indica=
tes
> > > > > > > that
> > > > > > > the
> > > > > > > +  Queue Indirect Size, i.e. the maximum amount of descriptor=
s in
> > > > > > > indirect
> > > > > > > +  descriptor tables, is independent from the Queue Size.
> > > > > > > +
> > > > > > > +  Without this feature, the Queue Size limits the length of =
the
> > > > > > > descriptor
> > > > > > > +  chain, including indirect descriptor tables as in
> > > > > > > \ref{sec:Basic
> > > > > > > Facilities of
> > > > > > > +  a Virtio Device / Virtqueues / The Virtqueue Descriptor Ta=
ble /
> > > > > > > Indirect
> > > > > > > +  Descriptors}, i.e. both the maximum amount of slots in the
> > > > > > > vring
> > > > > > > and
> > > > > > > the
> > > > > > > +  actual bulk data size transmitted per vring slot.
> > > > > >=20
> > > > > > spect does not call these  slots elsewhere.
> > > > >=20
> > > > > Yes, I intentionally used "vring slot" instead of "buffer" as I f=
ind
> > > > > the
> > > > > latter too vague in this context. A "buffer" can be a memory segm=
ent,
> > > > > a
> > > > > set of memory segments and what not. "vring slot" OTOH makes it c=
lear
> > > > > that it is about exactly one, atomic pointer (hence with fixed si=
ze)
> > > > > in a
> > > > > Ring Buffer, as depicted in the ASCII illustration here:
> > > > >=20
> > > > > https://github.com/oasis-tcs/virtio-spec/issues/122
> > > > >=20
> > > > > The maximum amount of vring slots is therefore the maximum amount=
 of
> > > > > messages that can be emplaced into a Ring Buffer, independent of =
any
> > > > > "bulk data buffer size".
> > > > >=20
> > > > > > +
> > > > > >=20
> > > > > > > +  With this feature enabled, the Queue Size only limits the
> > > > > > > maximum
> > > > > > > amount
> > > > > > > +  of slots in the vring, but does not limit the actual bulk =
data
> > > > > > > size
> > > > > > > +  being transmitted when indirect descriptors are used.
> > > > > > > Decoupling
> > > > > > > these
> > > > > > > +  two configuration parameters this way not only allows much
> > > > > > > larger
> > > > > > > bulk
> > > > > > > data
> > > > > > > +  being transferred per vring slot, but also avoids complica=
ted
> > > > > > > synchronization
> > > > > > > +  mechanisms if the device only supports a very small amount=
 of
> > > > > > > vring
> > > > > > > slots. Due
> > > > > > > +  to the 16-bit size of a descriptor's "next" field there is
> > > > > > > still an
> > > > > > > absolute
> > > > > > > +  limit of $2^{16}$ descriptors per indirect descriptor tabl=
e.
> > > > > > > However
> > > > > > > the
> > > > > > > +  actual maximum amount supported by either device or driver
> > > > > > > might be
> > > > > > > less,
> > > > > > > +  and therefore the bus specific Queue Indirect Size value M=
UST
> > > > > > > additionally
> > > > > > > +  be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiate=
d to
> > > > > > > subsequently
> > > > > > > +  negotiate the actual amount of maximum indirect descriptors
> > > > > > > supported
> > > > > > > +  by both sides.
> > > > > >=20
> > > > > > still not sure what exactly is the value. e.g. in a buffer incl=
uding
> > > > > > indirect and direct descriptors.
> > > > > >=20
> > > > > > +
> > > > > >=20
> > > > > > >  \end{description}
> > > > > > > =20
> > > > > > >  \drivernormative{\section}{Reserved Feature Bits}{Reserved
> > > > > > >  Feature
> > > > > > >  Bits}
> > > > > > >=20
> > > > > > > diff --git a/packed-ring.tex b/packed-ring.tex
> > > > > > > index a9e6c16..e26d112 100644
> > > > > > > --- a/packed-ring.tex
> > > > > > > +++ b/packed-ring.tex
> > > > > > > @@ -195,7 +195,7 @@ \subsection{Scatter-Gather Support}
> > > > > > >=20
> > > > > > >  The device limits the number of descriptors in a list throug=
h a
> > > > > > >  transport-specific and/or device-specific value. If not limi=
ted,
> > > > > > >  the maximum number of descriptors in a list is the virt queue
> > > > > > >=20
> > > > > > > -size.
> > > > > > > +size unless the VIRTIO_RING_F_INDIRECT_SIZE feature has been
> > > > > > > negotiated.
> > > > > > >=20
> > > > > > >  \subsection{Next Flag: Descriptor Chaining}
> > > > > > >  \label{sec:Packed Virtqueues / Next Flag: Descriptor Chainin=
g}
> > > > > > >=20
> > > > > > > diff --git a/split-ring.tex b/split-ring.tex
> > > > > > > index de94038..eaa90c3 100644
> > > > > > > --- a/split-ring.tex
> > > > > > > +++ b/split-ring.tex
> > > > > > > @@ -268,8 +268,12 @@ \subsubsection{Indirect
> > > > > > > Descriptors}\label{sec:Basic
> > > > > > > Facilities of a Virtio Devi
> > > > > > >=20
> > > > > > >  set the VIRTQ_DESC_F_INDIRECT flag within an indirect descri=
ptor
> > > > > > >  (ie.
> > > > > > >  only
> > > > > > >  one table per descriptor).
> > > > > > >=20
> > > > > > > -A driver MUST NOT create a descriptor chain longer than the =
Queue
> > > > > > > Size of
> > > > > > > -the device.
> > > > > >=20
> > > > > > +If VIRTIO_RING_F_INDIRECT_SIZE has not been negotiated, the dr=
iver
> > > > > > MUST
> > > > > >=20
> > > > > > > +NOT create a descriptor chain longer than the Queue Size of =
the
> > > > > > > device.
> > > > > > > +
> > > > > > > +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the numb=
er of
> > > > > > > +descriptors per indirect descriptor table MUST NOT exceed the
> > > > > > > negotiated
> > > > > > > +Queue Indirect Size.
> > > > > >=20
> > > > > > it is not negotiated is it?
> > > > >=20
> > > > > What makes you think it is not negotiated?
> > >=20
> > > Also see my previous question here ^
> >=20
> > Sorry, what I mean is that you don't define what does negotiation
> > involve. I think you mean this:
> >=20
> > 	The driver SHOULD write to \field{queue_indirect_size} if its maximum
> > 	number of descriptors per vring slot is lower than that reported by the
> > 	device.
> >=20
> > but driver can just read the value and that's it - and then the value
> > that is set by device applies, right?
> >=20
> > If you are going to use terms such as negotiated you need to define what
> > they mean. In this case I would just say something like
> > "the value of Queue Indirect Size".
>=20
> Which makes me wonder why you just didn't say that in the first place? An=
d I=20
> don't agree that it wasn't defined, because I actually think I did:
>=20
> +  \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indicates that the
> +  Queue Indirect Size, i.e. the maximum amount of descriptors in indirect
> +  descriptor tables, is independent from the Queue Size."
>=20
> Or is that definition of the new term "Queue Indirect Size" not clear eno=
ugh=20
> to you?

Maybe ... but I don't think this will jump out to the reader. I feel
we abuse of the word negotiate to the point where reader only has a
vague idea what it means. That's why I struggled to give concise
comments.  Consider:

+  and therefore the transport specific Queue Indirect Size value MUST
+  additionally be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiated=
 to
+  subsequently negotiate the actual amount of maximum indirect descriptors
+  supported by both sides.

sounds like a tongue-twister to me. Can't we find a term different from
"negotiate"?


It's already used for features, please find something else for this.
And why is a term even necessary?  How is this different from other
writeable fields?  Consider an example of similar functionality
from the spec:

\item[\field{queue_size}]
        Queue Size.  On reset, specifies the maximum queue size supported by
        the device. This can be modified by the driver to reduce memory req=
uirements.
        A 0 means the queue is unavailable.


Hope this helps.



> > > > > > >  A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and
> > > > > > >  VIRTQ_DESC_F_NEXT
> > > > > > >  in \field{flags}.
> > > > > > >=20
> > > > > > > --
> > > > > > > 2.30.2
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > This publicly archived list offers a means to provide input t=
o the
> > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > >=20
> > > > > > > In order to verify user consent to the Feedback License terms=
 and
> > > > > > > to minimize spam in the list archive, subscription is required
> > > > > > > before posting.
> > > > > > >=20
> > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > List archive:
> > > > > > > https://lists.oasis-open.org/archives/virtio-comment/
> > > > > > > Feedback License:
> > > > > > > https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > > > > List Guidelines:
> > > > > > > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > Join OASIS: https://www.oasis-open.org/join/
>=20

