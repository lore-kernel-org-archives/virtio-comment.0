Return-Path: virtio-comment-return-687-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C565985E3F
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Mar 2019 17:57:19 +0000 (UTC)
MIME-Version: 1.0
From: Frank Yang <lfy@google.com>
Date: Mon, 4 Mar 2019 09:57:06 -0800
Message-ID: <CAEkmjvXUGA0m42hnGWkLL2J4YhL7f6=_cW7pzacTG8u8J12j0w@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bea0510583487ce4"
Subject: [virtio-comment] RFC v2: virtio-hostmem: static, guest-owned memory regions
To: virtio-comment@lists.oasis-open.org, Roman Kiryanov <rkir@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Christoffer Dall <christoffer.dall@arm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000bea0510583487ce4
Content-Type: text/plain; charset="UTF-8"

+Christopher Dall who has tried to standardize goldfish before.

Link:
https://github.com/741g/virtio-spec/blob/67602f232386a1782a35b9cb41087586ac3d19e2/virtio-hostmem.tex

This is the next version of virtio-hostmem that makes the following
revisions:

*A. Guest ownership of host memory + guaranteed backing.*

This is accomplished by having a static set of sub-device-specific physical
regions that are realized once
on guest bootup, even if the hostmem device is not plugged in.

- The host is assumed to always back those regions in some way, even if it
is just mapping the same page over and over to save memory.
- The host may change mappings at runtime in a driver/device
implementation-specific way.
- Do not allow alloc/free of physical ranges dynamically. Setup is once and
permanent even if PCI device is not plugged.
- Security model is pushed to the guest-specific layers like selinux; it is
possible (and this is useful) for a physical page to be shared across guest
processes, and it is up to the guest's current security model to enforce
malicious apps not having access.
- The physical ranges are configured on startup to also never overlap or
allow sharing between two sub-device types.

In summary this greatly simplifies allocation of physical memory while
retaining flexibility via sub-allocation into those regions from the
sub-device-specific implementation.

It also fits much better the actual use cases where a large arena is
allocated up front once;
the new spec simply makes this required.

More specifically, "Guest ownership of host memory + guaranteed backing"
addresses the following comments in the following ways:

From Roman Kiryanov:

"Should we note here what happens if a guest releases (a user process
dies) the region without asking the host to un-back it?"

Nothing will happen as we will not need to ask the host to un-back anything;
we always guarantee the physical region is accessible.
The physical region is also suballocated across guest user processes
according to the driver implementation.

From Dr. David Alan Gilbert:

"Note that a mapping missing on the host wont necessarily turn into a
page fault in the guest; on qemu for example, if you have a memory
region like this where the guest accesses an area with no mapping, I
think we hit a kvm error."

With up-front pre-backed host memory, this is not a concern anymore;
there will be no page faults or kvm errors.

Also, I'm thinking about how this proposal can better fit with your current
host memory regions scheme. Ideally, I'd like to propose this device
in terms of your current proposal, with as much precise, shared definitions
as possible.

From Michael S. Tsirkin:

"Virtio uses the terms "available buffer notification" and
"used buffer notification". If this follows vhost-pci design
tnen available buffer notification is sent host to guest,
and used buffer notification is sent guest to host.
Virtio is the reverse."

The spec adds languages where
the memory transaction associated with each notification message
is considered completed by the guest on available,
and completed by the host on used.

"Especially in this case, this needs some security model enforced by
guest kernel."

We will rely on SELinux in the Linux case.

"Right. Details on how memory is allocated in the proposed scheme are
scant but above I think shows that it can't all be up to guest."

By moving all the memory regions to be initialized once on startup and
enforcing a guarantee that the physical regions are usable as RAM,
the host must back them in some way.

"Right. Details on how memory is allocated in the proposed scheme are
scant but above I think shows that it can't all be up to guest."

We effectively now have an invariant that the host must service all such
physical ranges as ram.
It can lazily allocate/change the allocation, but there should not be any
situation where
the ranges are unmapped.

*B. Redesigned virtqueue layout to have one virtqueue per instance*
*and renamed to "notification" virtqueue.*
*Also, added definitions of what are the guarantees about memory
transactions*
*named in each virtqueue upon available and used.*

Addresses comment:

From Michael S. Tsirkin:

"Virtio uses the terms "available buffer notification" and
"used buffer notification". If this follows vhost-pci design
tnen available buffer notification is sent host to guest,
and used buffer notification is sent guest to host.
Virtio is the reverse."

The spec adds language where
the memory transaction associated with each notification message
is considered completed by the guest on available,
and completed by the host on used.

Not addressed yet:

"This might work. Note that host page size might be different.
If it's bigger host needs to be careful about allocating
full host pages anyway."

This is not addressed yet due to the need to tackle more fundamental issues
first,
but I imagine we should be using the lowest common denominator of
guest/host page size
to ensure safe access, and any pre-existing device configuration would
round up to that.

Frank

--000000000000bea0510583487ce4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>+Christopher Dall w=
ho has tried to standardize goldfish before.<br></div><div><br></div><div d=
ir=3D"ltr">Link: <a href=3D"https://github.com/741g/virtio-spec/blob/67602f=
232386a1782a35b9cb41087586ac3d19e2/virtio-hostmem.tex">https://github.com/7=
41g/virtio-spec/blob/67602f232386a1782a35b9cb41087586ac3d19e2/virtio-hostme=
m.tex</a><br></div><div dir=3D"ltr"><br></div><div>This is the next version=
 of virtio-hostmem that makes the following revisions:</div><div><br></div>=
<div><b>A. Guest ownership of host memory=C2=A0+ guaranteed backing.</b><br=
></div><div><br></div><div>This is accomplished by having a static set of s=
ub-device-specific physical regions that are realized once</div><div>on gue=
st bootup, even if the hostmem device is not plugged in.</div><div><br></di=
v><div>- The host is assumed to always back those regions in some way, even=
 if it is just mapping the same page over and over to save memory.</div><di=
v>- The host may change mappings at runtime in a driver/device implementati=
on-specific way.</div><div>- Do not allow alloc/free of physical ranges dyn=
amically. Setup is once and permanent even if PCI device is not plugged.</d=
iv><div>- Security model is pushed to the guest-specific layers like selinu=
x; it is possible (and this is useful) for a physical page to be shared acr=
oss guest processes, and it is up to the guest&#39;s current security model=
 to enforce malicious apps not having access.</div><div>- The physical rang=
es are configured on startup to also never overlap or allow sharing between=
 two sub-device types.</div><div><br></div><div>In summary this greatly sim=
plifies allocation of physical memory while retaining flexibility via sub-a=
llocation into those regions from the sub-device-specific implementation.</=
div><div><br></div><div>It also fits much better the actual use cases where=
 a large arena is allocated up front once;</div><div>the new spec simply ma=
kes this required.</div><div><br></div><div><div>More specifically, &quot;G=
uest ownership of host memory=C2=A0+ guaranteed backing&quot; addresses the=
 following comments in the following ways:</div><div><br></div><div>From Ro=
man Kiryanov:</div><div><br></div><div>&quot;Should we note here what happe=
ns if a guest releases (a user process</div>dies) the region without asking=
 the host to un-back it?&quot;</div><div><br></div><div>Nothing will happen=
 as we will not need to ask the host to un-back anything;</div><div>we alwa=
ys guarantee the physical region is accessible.</div><div>The physical regi=
on is also suballocated across guest user processes</div><div>according to =
the driver implementation.</div><div><div><br></div><div>From Dr. David Ala=
n Gilbert:</div><div><br></div><div>&quot;Note that a mapping missing on th=
e host wont necessarily turn into a<br>page fault in the guest; on qemu for=
 example, if you have a memory<br>region like this where the guest accesses=
 an area with no mapping, I<br>think we hit a kvm error.&quot;</div><div><b=
r></div><div>With up-front pre-backed host memory, this is not a concern an=
ymore;</div><div>there will be no page faults or kvm errors.</div><div><br>=
</div><div>Also, I&#39;m thinking about how this proposal can better fit wi=
th your current</div><div>host memory regions scheme. Ideally, I&#39;d like=
 to propose this device</div><div>in terms of your current proposal, with a=
s much precise, shared definitions as possible.</div><div><br></div><div><d=
iv><div>From Michael S. Tsirkin:</div><div><br></div><div>&quot;<span class=
=3D"gmail-il">Virtio</span>=C2=A0uses the terms &quot;available buffer noti=
fication&quot; and<br>&quot;used buffer notification&quot;. If this follows=
 vhost-pci design<br>tnen available buffer notification is sent host to gue=
st,<br>and used buffer notification is sent guest to host.<br><span class=
=3D"gmail-il">Virtio</span>=C2=A0is the reverse.&quot;</div></div><div><br>=
</div><div>The spec adds languages where=C2=A0</div><div>the memory transac=
tion associated with each notification message</div><div>is considered comp=
leted by the guest on available,</div><div>and completed by the host on use=
d.</div><br class=3D"gmail-Apple-interchange-newline"></div></div><div>&quo=
t;Especially in this case, this needs some security model enforced by</div>=
guest kernel.&quot;</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">We wil=
l rely on SELinux in the Linux case.<div><br></div><div>&quot;Right. Detail=
s on how memory is allocated in the proposed scheme are</div>scant but abov=
e I think shows that it can&#39;t all be up to guest.&quot;</div><div dir=
=3D"ltr"><br></div><div>By moving all the memory regions to be initialized =
once on startup and</div><div>enforcing a guarantee that the physical regio=
ns are usable as RAM,</div><div>the host must back them in some way.</div><=
div><br></div><div dir=3D"ltr">&quot;Right. Details on how memory is alloca=
ted in the proposed scheme are</div>scant but above I think shows that it c=
an&#39;t all be up to guest.&quot;</div><div dir=3D"ltr"><br></div><div>We =
effectively now have an invariant that the host must service all such physi=
cal ranges as ram.</div><div>It can lazily allocate/change the allocation, =
but there should not be any situation where</div><div>the ranges are unmapp=
ed.</div><div dir=3D"ltr"><div dir=3D"ltr"><br><div><b>B. Redesigned virtqu=
eue layout to have one virtqueue per instance</b></div><div><b>and renamed =
to &quot;notification&quot; virtqueue.</b></div><div><b>Also, added definit=
ions of what are the guarantees about memory transactions</b></div><div><b>=
named in each virtqueue upon available and used.</b></div><div><br></div><d=
iv>Addresses comment:</div><div><br></div><div><div><div>From Michael S. Ts=
irkin:</div><div><br></div><div>&quot;<span class=3D"gmail-il">Virtio</span=
>=C2=A0uses the terms &quot;available buffer notification&quot; and<br>&quo=
t;used buffer notification&quot;. If this follows vhost-pci design<br>tnen =
available buffer notification is sent host to guest,<br>and used buffer not=
ification is sent guest to host.<br><span class=3D"gmail-il">Virtio</span>=
=C2=A0is the reverse.&quot;</div></div><div><br></div><div>The spec adds la=
nguage where=C2=A0</div><div>the memory transaction associated with each no=
tification message</div><div>is considered completed by the guest on availa=
ble,</div><div>and completed by the host on used.</div></div><div><br></div=
><div><div>Not addressed yet:</div><div><br></div><div dir=3D"ltr"><div>&qu=
ot;This might work. Note that host page size might be different.</div>If it=
&#39;s bigger host needs to be careful about allocating<br>full host pages =
anyway.&quot;</div><div dir=3D"ltr"><br></div><div>This is not addressed ye=
t due to the need to tackle more fundamental issues first,</div><div>but I =
imagine we should be using the lowest common denominator of guest/host page=
 size</div><div>to ensure safe access, and any pre-existing device configur=
ation would round up to that.</div></div></div><div dir=3D"ltr"><div><br></=
div><div><div>Frank</div></div></div></div></div>

--000000000000bea0510583487ce4--
