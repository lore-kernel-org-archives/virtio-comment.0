Return-Path: <virtio-comment-return-2842-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1C0D9862AF
	for <virtio-comment@lists.oasis-open.org>; Mon, 21 Mar 2022 16:26:01 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <4949755.hfBhaMJRe6@silver>
References: <4735344.EBYxvr1mta@silver> <11686863.Z9n2BMzBuM@silver>
 <871qyzs0lh.fsf@redhat.com> <4949755.hfBhaMJRe6@silver>
Date: Mon, 21 Mar 2022 17:25:55 +0100
Message-ID: <87sfrbqnl8.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field
 "indirect_num"
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sat, Mar 19 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Freitag, 18. M=C3=A4rz 2022 17:10:34 CET Cornelia Huck wrote:
>> On Fri, Mar 18 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrot=
e:
>> > Oh, you are suggesting two different names for those two fields?
>> > "max_indirect_num" vs. "indirect_num". If yes, why?
>>=20
>> The "max_indirect_num" goes with the "max_num": this is the maximum
>> value that the device supports (the "maximum maximum", in a way :).
>> "indirect_num" is the actual upper limit while the device is in use.
>
> Ok, I understand your motivation now, your interpretation aspect for this=
 was:
>
> =09device's value >=3D driver's value
>
> Another interpretation aspect would be though from driver PoV: 'what is t=
he=20
> maximum bulk size I could send to device?', and in this case you would ca=
ll=20
> both fields 'max_indirect_num'.
>
> Therefore I would prefer using the same name 'max_indirect_num' on both=
=20
> structs, to also make it clear they are about negotiating the same thing.

So, maybe the 'max' is what is confusing? 'max_indirect_num_limit' vs
'max_indirect_num', perhaps? I'd really like to keep distinct names for
the two fields, though, as they are fields in two distinct structures,
one used for the device advertising what it supports, and one for the
driver advertising what it will actually use. (This is different from
PCI or MMIO, where both device and driver interact on the same value.)


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

