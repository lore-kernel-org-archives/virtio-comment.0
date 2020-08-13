Return-Path: virtio-comment-return-1399-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B44C985D8F
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Aug 2020 07:58:03 +0000 (UTC)
MIME-Version: 1.0
From: Krasnov Arseniy <oxffffaa@gmail.com>
Date: Thu, 13 Aug 2020 10:57:52 +0300
Message-ID: <CAP_G_RUJHvsi1VcP2UGtzp4VoEdWevEOA6X5uA_3TkytHkyYdw@mail.gmail.com>
Subject: [virtio-comment] multibuffer in packed queue
Content-Type: multipart/alternative; boundary="000000000000d73be805acbda9dc"
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000d73be805acbda9dc
Content-Type: text/plain; charset="UTF-8"

Hellow, I've got question about chapter 2.7.9:

*  2.7.9 Multi-buffer requests Some devices combine multiple buffers as
part of processing of a single request. These devices always mark the
descriptor corresponding to the first buffer in the request used after the
rest of the descriptors (corresponding to rest of the buffers) in the
request - which follow the first descriptor in ring order - has been marked
used and written out into the ring. This guarantees that the driver will
never observe a partial request in the ring.  *

Does it mean, that device can use sequence(chain) of descriptor unil
descriptor with VIRTQ_DESC_F_NEXT  == 0 bit is found, OR device can use
descriptors as many as it needs, don't care about  VIRTQ_DESC_F_NEXT bit,
and finally set  VIRTQ_DESC_F_NEXT bit in all used descriptors.

Also, in packed queue device can't modify descriptors except USED bit. In
split queue, device also can't modify descriptor(it touches used buffer
with index and length fields). Is that true?

Thank You

--000000000000d73be805acbda9dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hellow, I&#39;ve got question about chapter 2.7.9:<div><b>=
<br></b></div><div><b>=C2=A0 2.7.9 Multi-buffer requests
Some devices combine multiple buffers as part of processing of a single req=
uest. These devices always
mark the descriptor corresponding to the first buffer in the request used a=
fter the rest of the descriptors
(corresponding to rest of the buffers) in the request - which follow the fi=
rst descriptor in ring order - has been
marked used and written out into the ring. This guarantees that the driver =
will never observe a partial request
in the ring.=C2=A0=C2=A0</b><br></div><div><b><br></b></div><div>Does it me=
an, that device can use sequence(chain) of descriptor unil descriptor with =
VIRTQ_DESC_F_NEXT=C2=A0 =3D=3D 0 bit is found, OR device can use descriptor=
s as many as it needs, don&#39;t care about=C2=A0

VIRTQ_DESC_F_NEXT bit, and finally set=C2=A0

VIRTQ_DESC_F_NEXT bit in all used descriptors.</div><div><br></div><div>Als=
o, in packed queue device can&#39;t modify descriptors except USED bit. In =
split queue, device also can&#39;t modify descriptor(it touches used buffer=
 with index and length fields). Is that true?</div><div><br></div><div>Than=
k You</div></div>

--000000000000d73be805acbda9dc--

