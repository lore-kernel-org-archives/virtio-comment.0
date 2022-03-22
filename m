Return-Path: <pasic@linux.ibm.com>
Date: Tue, 22 Mar 2022 12:21:28 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field
 "indirect_num"
Message-ID: <20220322122128.75045d04.pasic@linux.ibm.com>
In-Reply-To: <87k0cmqphv.fsf@redhat.com>
References: <4735344.EBYxvr1mta@silver>
	<11686863.Z9n2BMzBuM@silver>
	<20220318170625.0d2be174.pasic@linux.ibm.com>
	<15118124.lv8FRMpzUk@silver>
	<87pmmfqn3p.fsf@redhat.com>
	<20220322025617.3f9df5c1.pasic@linux.ibm.com>
	<87k0cmqphv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 22 Mar 2022 10:57:00 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, Mar 22 2022, Halil Pasic <pasic@linux.ibm.com> wrote:
>=20
> > On Mon, 21 Mar 2022 17:36:26 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> > =20
> >> On Sat, Mar 19 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wr=
ote:
> >>  =20
> >> > On Freitag, 18. M=C3=A4rz 2022 17:06:25 CET Halil Pasic wrote:   =20
> >>  =20
> >> >> I agree that the "including" is important, but I'm not sure about t=
he
> >> >> "its contents are undefined". I don't really understand why should =
we use
> >> >> a plural here. What speaks against specifying that in SHOULD be sto=
red
> >> >> as 0 by the device, and MUST be ignored by the driver?   =20
> >> >
> >> > Both solutions would be viable. Personally I would just use somethin=
g like=20
> >> > "Should be zero" if there is a value in recommending that, but I don=
't see a=20
> >> > value in recommending to set something to zero and at the same time =
requiring=20
> >> > to not access it in the first place.
> >> >   =20
> >> >> Currently we say that \field{max_indirect_num} exists like a be32 f=
ield
> >> >> even if VIRTIO_RING_F_INDIRECT_SIZE is not negotiated. Which kind o=
f
> >> >> implies that at least type invariants should hold. Of course, there=
 is
> >> >> none here (i.e. every bits value is also a be32 value), but for som=
ething
> >> >> like an enum interesting corner cases can pop up.   =20
> >> >
> >> > I can't follow you on that one. What has that do with enums in this =
case?
> >> >
> >> > Anyway, I won't persist on my suggestion to use the (IMO more compac=
t form)=20
> >> > "undefined". If you guys prefer the more specific solution "SHOULD b=
e 0 and=20
> >> > MUST not be accessed" then I will go that way.   =20
> >>=20
> >> I'm not sure what mandating 0 and non-access would buy us here... the
> >> driver can of course read the field (e.g. when copying the structure
> >> wholesale); it just can't make use of the contents when it did not
> >> negotiate the feature (but why would it do so in that case anyway?) =
=20
> >
> > My train of thought was that making the device give us a well defined
> > 0 could benefit robustness. The idea was, that even if the driver was
> > buggy, and used the value we would still end up with some sane behavior=
. =20
>=20
> I'm not sure a 0 would lead to sane behaviour in an already buggy
> driver... operating with a limit of 0 would imply that the driver cannot
> really do anything, and I'm not sure a driver buggy enough to access the
> field would heed that. There's nothing wrong with a device using 0 if
> the feature had not been negotiated, but I don't think it will help much
> with already buggy drivers.
>=20

I don't consider this awfully important. While I do see some value in
devices presenting some saneish value in this situation over presenting
junk, I am fine with junk as well. Actually implementations can still do
whatever they want.

> > =20
> >>=20
> >> Also, I think junk remains junk, whether it is a be32 field or
> >> interpreted as an enum. It is simply not valid, even if it might by
> >> accident end up to be a defined enum value. =20
> >
> > What I had in mind is the difference between "trap representation" and
> > "unspecified value" in terms of the C standard. Using a "trap
> > representation" is undefined behavior, while using an "unspecified valu=
e"
> > is far less serious. As far as I remember, there are no trap
> > representations for enumerated types in C, so the example ain't perfect=
.
> > But if some code was to assume that all it can see it the values define=
d
> > in the enum, strange stuff may happen. =20
>=20
> While the struct definitions look suspiciously like C, they are not in
> fact C :)=20

I'm aware. I actually merely used the C standard lingo, because most of
us are familiar with C, and it is easy to read up on the precise meaning.

I pointed out the difference between using an unspecified value and
using a trap representation to showcase, that the difference between the
two might matter.

>I don't think the spec defines anything of the above, and I
> don't think it should.

Never stated the spec defines anything of the above.

>=20
> >
> > =20
> >>=20
> >> So I think "undefined" should be fine.
> >>  =20
> >
> > BTW the C standard uses the term "indeterminate value" in this situatio=
n. =20
>=20
> "Indeterminate value" is a bit of a mouthful, though; "undefined" or
> "unpredictable" from the driver's point of view should already capture
> it, as the driver is not supposed to do anything with the value anyway.
>=20

Yes the reader is more than likely to figure out what "undefined value"
or "unpredictable value" is supposed to mean in this context from the
context.  I should really stop splitting hairs. Nevertheless given
that revision >=3D 3 and was VIRTIO_RING_F_INDIRECT_SIZE negotiated, is
the value of indirect_max_num predictable by the driver? In my opinion
it is not. And neither is the value defined by this spec. The semantic
of the value is defined, but the value itself isn't really any more
defined than when VIRTIO_RING_F_INDIRECT_SIZE is not negotiated.=20

We could say that when VIRTIO_RING_F_INDIRECT_SIZE is not negotiated
Queue Indirect Size is undefined. But I should really stop splitting
hairs. Sorry.

Regards,
Halil

