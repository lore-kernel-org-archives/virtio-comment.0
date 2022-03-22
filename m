Return-Path: <virtio-comment-return-2847-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CCD759863D4
	for <virtio-comment@lists.oasis-open.org>; Tue, 22 Mar 2022 09:57:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220322025617.3f9df5c1.pasic@linux.ibm.com>
References: <4735344.EBYxvr1mta@silver> <11686863.Z9n2BMzBuM@silver>
 <20220318170625.0d2be174.pasic@linux.ibm.com> <15118124.lv8FRMpzUk@silver>
 <87pmmfqn3p.fsf@redhat.com> <20220322025617.3f9df5c1.pasic@linux.ibm.com>
Date: Tue, 22 Mar 2022 10:57:00 +0100
Message-ID: <87k0cmqphv.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field
 "indirect_num"
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Mar 22 2022, Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 21 Mar 2022 17:36:26 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> On Sat, Mar 19 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrot=
e:
>>=20
>> > On Freitag, 18. M=C3=A4rz 2022 17:06:25 CET Halil Pasic wrote: =20
>>=20
>> >> I agree that the "including" is important, but I'm not sure about the
>> >> "its contents are undefined". I don't really understand why should we=
 use
>> >> a plural here. What speaks against specifying that in SHOULD be store=
d
>> >> as 0 by the device, and MUST be ignored by the driver? =20
>> >
>> > Both solutions would be viable. Personally I would just use something =
like=20
>> > "Should be zero" if there is a value in recommending that, but I don't=
 see a=20
>> > value in recommending to set something to zero and at the same time re=
quiring=20
>> > to not access it in the first place.
>> > =20
>> >> Currently we say that \field{max_indirect_num} exists like a be32 fie=
ld
>> >> even if VIRTIO_RING_F_INDIRECT_SIZE is not negotiated. Which kind of
>> >> implies that at least type invariants should hold. Of course, there i=
s
>> >> none here (i.e. every bits value is also a be32 value), but for somet=
hing
>> >> like an enum interesting corner cases can pop up. =20
>> >
>> > I can't follow you on that one. What has that do with enums in this ca=
se?
>> >
>> > Anyway, I won't persist on my suggestion to use the (IMO more compact =
form)=20
>> > "undefined". If you guys prefer the more specific solution "SHOULD be =
0 and=20
>> > MUST not be accessed" then I will go that way. =20
>>=20
>> I'm not sure what mandating 0 and non-access would buy us here... the
>> driver can of course read the field (e.g. when copying the structure
>> wholesale); it just can't make use of the contents when it did not
>> negotiate the feature (but why would it do so in that case anyway?)
>
> My train of thought was that making the device give us a well defined
> 0 could benefit robustness. The idea was, that even if the driver was
> buggy, and used the value we would still end up with some sane behavior.

I'm not sure a 0 would lead to sane behaviour in an already buggy
driver... operating with a limit of 0 would imply that the driver cannot
really do anything, and I'm not sure a driver buggy enough to access the
field would heed that. There's nothing wrong with a device using 0 if
the feature had not been negotiated, but I don't think it will help much
with already buggy drivers.

>
>>=20
>> Also, I think junk remains junk, whether it is a be32 field or
>> interpreted as an enum. It is simply not valid, even if it might by
>> accident end up to be a defined enum value.
>
> What I had in mind is the difference between "trap representation" and
> "unspecified value" in terms of the C standard. Using a "trap
> representation" is undefined behavior, while using an "unspecified value"
> is far less serious. As far as I remember, there are no trap
> representations for enumerated types in C, so the example ain't perfect.
> But if some code was to assume that all it can see it the values defined
> in the enum, strange stuff may happen.

While the struct definitions look suspiciously like C, they are not in
fact C :) I don't think the spec defines anything of the above, and I
don't think it should.

>
>
>>=20
>> So I think "undefined" should be fine.
>>=20
>
> BTW the C standard uses the term "indeterminate value" in this situation.

"Indeterminate value" is a bit of a mouthful, though; "undefined" or
"unpredictable" from the driver's point of view should already capture
it, as the driver is not supposed to do anything with the value anyway.


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

