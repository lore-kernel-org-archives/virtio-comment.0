Return-Path: <virtio-comment-return-2843-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42D269862AF
	for <virtio-comment@lists.oasis-open.org>; Mon, 21 Mar 2022 16:36:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <15118124.lv8FRMpzUk@silver>
References: <4735344.EBYxvr1mta@silver> <11686863.Z9n2BMzBuM@silver>
 <20220318170625.0d2be174.pasic@linux.ibm.com> <15118124.lv8FRMpzUk@silver>
Date: Mon, 21 Mar 2022 17:36:26 +0100
Message-ID: <87pmmfqn3p.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field
 "indirect_num"
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Halil Pasic <pasic@linux.ibm.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sat, Mar 19 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Freitag, 18. M=C3=A4rz 2022 17:06:25 CET Halil Pasic wrote:

>> I agree that the "including" is important, but I'm not sure about the
>> "its contents are undefined". I don't really understand why should we us=
e
>> a plural here. What speaks against specifying that in SHOULD be stored
>> as 0 by the device, and MUST be ignored by the driver?
>
> Both solutions would be viable. Personally I would just use something lik=
e=20
> "Should be zero" if there is a value in recommending that, but I don't se=
e a=20
> value in recommending to set something to zero and at the same time requi=
ring=20
> to not access it in the first place.
>
>> Currently we say that \field{max_indirect_num} exists like a be32 field
>> even if VIRTIO_RING_F_INDIRECT_SIZE is not negotiated. Which kind of
>> implies that at least type invariants should hold. Of course, there is
>> none here (i.e. every bits value is also a be32 value), but for somethin=
g
>> like an enum interesting corner cases can pop up.
>
> I can't follow you on that one. What has that do with enums in this case?
>
> Anyway, I won't persist on my suggestion to use the (IMO more compact for=
m)=20
> "undefined". If you guys prefer the more specific solution "SHOULD be 0 a=
nd=20
> MUST not be accessed" then I will go that way.

I'm not sure what mandating 0 and non-access would buy us here... the
driver can of course read the field (e.g. when copying the structure
wholesale); it just can't make use of the contents when it did not
negotiate the feature (but why would it do so in that case anyway?)

Also, I think junk remains junk, whether it is a be32 field or
interpreted as an enum. It is simply not valid, even if it might by
accident end up to be a defined enum value.

So I think "undefined" should be fine.


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

