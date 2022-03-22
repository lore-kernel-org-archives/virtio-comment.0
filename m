Return-Path: <pasic@linux.ibm.com>
Date: Tue, 22 Mar 2022 02:56:17 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field
 "indirect_num"
Message-ID: <20220322025617.3f9df5c1.pasic@linux.ibm.com>
In-Reply-To: <87pmmfqn3p.fsf@redhat.com>
References: <4735344.EBYxvr1mta@silver>
	<11686863.Z9n2BMzBuM@silver>
	<20220318170625.0d2be174.pasic@linux.ibm.com>
	<15118124.lv8FRMpzUk@silver>
	<87pmmfqn3p.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 21 Mar 2022 17:36:26 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Sat, Mar 19 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote=
:
>=20
> > On Freitag, 18. M=C3=A4rz 2022 17:06:25 CET Halil Pasic wrote: =20
>=20
> >> I agree that the "including" is important, but I'm not sure about the
> >> "its contents are undefined". I don't really understand why should we =
use
> >> a plural here. What speaks against specifying that in SHOULD be stored
> >> as 0 by the device, and MUST be ignored by the driver? =20
> >
> > Both solutions would be viable. Personally I would just use something l=
ike=20
> > "Should be zero" if there is a value in recommending that, but I don't =
see a=20
> > value in recommending to set something to zero and at the same time req=
uiring=20
> > to not access it in the first place.
> > =20
> >> Currently we say that \field{max_indirect_num} exists like a be32 fiel=
d
> >> even if VIRTIO_RING_F_INDIRECT_SIZE is not negotiated. Which kind of
> >> implies that at least type invariants should hold. Of course, there is
> >> none here (i.e. every bits value is also a be32 value), but for someth=
ing
> >> like an enum interesting corner cases can pop up. =20
> >
> > I can't follow you on that one. What has that do with enums in this cas=
e?
> >
> > Anyway, I won't persist on my suggestion to use the (IMO more compact f=
orm)=20
> > "undefined". If you guys prefer the more specific solution "SHOULD be 0=
 and=20
> > MUST not be accessed" then I will go that way. =20
>=20
> I'm not sure what mandating 0 and non-access would buy us here... the
> driver can of course read the field (e.g. when copying the structure
> wholesale); it just can't make use of the contents when it did not
> negotiate the feature (but why would it do so in that case anyway?)

My train of thought was that making the device give us a well defined
0 could benefit robustness. The idea was, that even if the driver was
buggy, and used the value we would still end up with some sane behavior.

>=20
> Also, I think junk remains junk, whether it is a be32 field or
> interpreted as an enum. It is simply not valid, even if it might by
> accident end up to be a defined enum value.

What I had in mind is the difference between "trap representation" and
"unspecified value" in terms of the C standard. Using a "trap
representation" is undefined behavior, while using an "unspecified value"
is far less serious. As far as I remember, there are no trap
representations for enumerated types in C, so the example ain't perfect.
But if some code was to assume that all it can see it the values defined
in the enum, strange stuff may happen.


>=20
> So I think "undefined" should be fine.
>=20

BTW the C standard uses the term "indeterminate value" in this situation.

