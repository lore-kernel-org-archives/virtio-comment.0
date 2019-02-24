Return-Path: virtio-comment-return-646-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E01A985A9A
	for <virtio-comment@lists.oasis-open.org>; Sun, 24 Feb 2019 21:22:29 +0000 (UTC)
MIME-Version: 1.0
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
In-Reply-To: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
From: Frank Yang <lfy@google.com>
Date: Sun, 24 Feb 2019 13:22:16 -0800
Message-ID: <CAEkmjvV3ogJ3NNSX0vwnst0VA=aCG043+jumACukuHaUEAWPow@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b722460582aa6b9c"
Subject: [virtio-comment] Re: RFC: virtio-hostmem (+ Continuation of discussion from
 [virtio-dev] Memory sharing device)
To: virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Roman Kiryanov <rkir@google.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000b722460582aa6b9c
Content-Type: text/plain; charset="UTF-8"

Missed this:

  > \item Large bidirectional transfers are possible without scatterlists,
because
>     the memory is always physically contiguous.

Michael: It might get fragmented though. I think it would be up to
host to try and make sure it's not too fragmented, right?

Response:

Yes, it's definitely possible to get fragmented, and it is up to the host
to make sure it's not too fragmented in the end.

This can be more likely achieved if the device is typically used in such a
way that allocations on host tend to be page granularity, and live for a
long time. For the use cases such as codec and graphics, allocations will
tend to be over a page and have that long lifetime discussed (well, at
least if we consider lifetime of a guest process using the device "long"
enough)


On Sun, Feb 24, 2019 at 1:18 PM Frank Yang <lfy@google.com> wrote:

> virtio-hostmem is a proposed way to share host memory to the guest and
> communicate notifications. One potential use case is to have userspace
> drivers for virtual machines.
>
> The latest version of the spec proposal can be found at
>
> https://github.com/741g/virtio-spec/blob/master/virtio-hostmem.tex
>
> The revision history so far:
>
>
> https://github.com/741g/virtio-spec/commit/7c479f79ef6236a064471c5b1b8bc125c887b948
> - originally called virtio-user
>
> https://github.com/741g/virtio-spec/commit/206b9386d76f2ce18000dfc2b218375e423ac8e0
> - renamed to virtio-hostmem and removed dependence on host callbacks
>
> https://github.com/741g/virtio-spec/commit/e3e5539b08cfbaab22bf644fd4e50c00ec428928
> - removed a straggling mention of a host callback
>
> https://github.com/741g/virtio-spec/commit/61c500d5585552658a7c98ef788a625ffe1e201c
> - Added an example usage of virtio-hostmem
>
> This first RFC email includes replies to comments from mst@redhat.com:
>
>   > \item Guest allocates into the PCI region via config virtqueue
> messages.
>
> Michael: OK so who allocates memory out of the PCI region?
> Response:
>
> Allocation will be split by guest address space versus host address space.
>
> Guest address space: The guest driver determines the offset into the BAR
> in which to allocate the new region. The implementation of the allocator
> itself may live on the host (while guest triggers such allocations via the
> config virtqueue messages), but the ownership of region offsets and sizes
> will be in the guest. This allows for the easy use of existing guest
> ref-counting mechanisms such as last close() calling release() to clean up
> the memory regions in the guest.
>
> Host address space: The backing of such memory regions is considered
> completely optional. The host may service a guest region with a memory of
> its choice that depends on the usage of the device. The time this servicing
> happens may be any time after the guest communicates the message to create
> a memory region, but before the guest destroys the memory region. In the
> meantime, some examples of how the host may respond to the allocation
> request:
>
>    - The host does not back the region at all and a page fault happens.
>    - The host has already allocated host RAM (from some source;
>    vkMapMemory, malloc(), mmap, etc) memory of some kind and maps a
>    page-aligned host pointer to the guest physical address corresponding to
>    the region.
>    - The host has already set up a MMIO region (such as via the
>    MemoryRegion API in QEMU) and maps that MMIO region to the guest physical
>    address, allowing for MMIO callbacks to happen on read/writes to that
>    memory region.
>
>   > \item Guest: After a packet of compressed video stream is downloaded
> to the
> >     buffer, another message, like a doorbell, is sent on the ping
> virtqueue to
> >         consume existing compressed data. The ping message's offset
> field is
> >         set to the proper offset into the shared-mem object.
>
> Michael: BTW is this terminology e.g. "download", "ping message" standard
> somewhere?
> Response:
>
> Conceptually, it has a lot in common with "virtqueue notification" or
> "doorbell register". We should resolve to a more standard terminology; what
> about "notification"?
>
>   > \item Large bidirectional transfers are possible with zero copy.
>
> Michael: However just to make sure, sending small amounts of data
> is slower since you get to do all the mmap dance.
>
> Reponse: Yes it will be very slow if the user chooses to perform mmap for
> each transfer. However, we expect that for users who want to perform
> frequent transfers of small amounts of data, such as for the sensors /
> codec use cases, that the mmap happens once on instance creation with a
> single message to create a memory region, and then every time a transfer
> hapens, only the notification message is needed, while the existing mmap'ed
> region is reused. We expect the regions to remain fairly stable over the
> use of the instance, in most cases; the guest userspace will also mmap()
> once to get direct access to the host memory, then reuse it many times
> while sending traffic.
>
>   > \item It is not necessary to use socket datagrams or data streams to
> >     communicate the ping messages; they can be raw structs fresh off the
> >         virtqueue.
>
> Michael: OK and ping messages are all fixed size?
> Response:
>
> Yes, all ping messages are fixed size.
>
> Michael: OK I still owe you that write-up about vhost pci.  will try to
> complete
> that early next week. But generally if I got it right that the host
> allocates buffers then what you describe does seem to fit a bit better
> with the vhost pci host/guest interface idea.
>
> One question that was asked about vhost pci is whether it is in fact
> necessary to share a device between multiple applications.
> Or is it enough to just have one id per device?
>
> Response:
> Yes, looking forward! I'm kind of getting some rough idea now of what you
> may be referring to with vhost pci, perhaps if we can use a shared memory
> channel like Chrome to drive vhost or something. I'll wait for the full
> response before designing more into this area though :)
>
> For now, it's not necessary to share the device between multiple VMs, but
> it is necessary to share between multiple guest processes, so multiple
> instance ids need to be supported for each device id.
>
> It is also possible to share one instance id across guest processes as
> well. In the codec example, the codec may run in a separate guest process
> from the guest process that consumes the data, so to prevent copies,
> ideally both would have a view of the same host memory. Similar things
> shows up when running Vulkan or gralloc/dmabuf-like mechanisms; in recent
> versions of gralloc for example, one process allocates the memory while
> other processes share that memory by mapping it directly.
>
> However those are between guest processes. For inter-VM communication, I
> am still a bit tentative on this but it shows that instance id's
> fundamentally reflect a host-side context and its resources. Two VMs could
> map the same host memory in principle (though I have not tried it with KVM,
> I'm not sure if things explode if set user memory region happens for the
> same host memory across two VMs), and if it makes sense for them to
> communicate over that memory, then it makes sense for the instance id to be
> shared across the two VMs as well.
>
> Anyway, thanks for the feedback!
>
> Best,
>
> Frank
>

--000000000000b722460582aa6b9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Missed this:<div><br></div><div>=C2=A0 &gt; \item Large bi=
directional transfers are possible without scatterlists, because<br>
&gt; =C2=A0 =C2=A0 the memory is always physically contiguous.<br>
<br>Michael: It might get fragmented though. I think it would be up to<br>
host to try and make sure it&#39;s not too fragmented, right?<br></div><div=
><br></div><div>Response:</div><div><br></div><div>Yes, it&#39;s definitely=
 possible to get fragmented, and it is up to the host to make sure it&#39;s=
 not too fragmented in the end.</div><div><br></div><div>This can be more l=
ikely achieved if the device is typically used in such a way that allocatio=
ns on host tend to be page granularity, and live for a long time. For the u=
se cases such as codec and graphics, allocations will tend to be over a pag=
e and have that long lifetime discussed (well, at least if we consider life=
time of a guest process using the device &quot;long&quot; enough)</div><div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sun, Feb 24, 2019 at 1:18 PM Frank Yang &lt;<a href=3D"mailto=
:lfy@google.com">lfy@google.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">virtio-hostmem =
is a proposed way to share host memory to the guest and communicate notific=
ations. One potential use case is to have userspace drivers for virtual mac=
hines.<div><br></div><div>The latest version of the spec proposal can be fo=
und at</div><div><br></div><div><a href=3D"https://github.com/741g/virtio-s=
pec/blob/master/virtio-hostmem.tex" target=3D"_blank">https://github.com/74=
1g/virtio-spec/blob/master/virtio-hostmem.tex</a></div><div><br></div><div>=
The revision history so far:</div><div><br></div><div><a href=3D"https://gi=
thub.com/741g/virtio-spec/commit/7c479f79ef6236a064471c5b1b8bc125c887b948" =
target=3D"_blank">https://github.com/741g/virtio-spec/commit/7c479f79ef6236=
a064471c5b1b8bc125c887b948</a> - originally called virtio-user</div><div><a=
 href=3D"https://github.com/741g/virtio-spec/commit/206b9386d76f2ce18000dfc=
2b218375e423ac8e0" target=3D"_blank">https://github.com/741g/virtio-spec/co=
mmit/206b9386d76f2ce18000dfc2b218375e423ac8e0</a> - renamed to virtio-hostm=
em and removed dependence on host callbacks</div><div><a href=3D"https://gi=
thub.com/741g/virtio-spec/commit/e3e5539b08cfbaab22bf644fd4e50c00ec428928" =
target=3D"_blank">https://github.com/741g/virtio-spec/commit/e3e5539b08cfba=
ab22bf644fd4e50c00ec428928</a> - removed a straggling mention of a host cal=
lback</div><div><a href=3D"https://github.com/741g/virtio-spec/commit/61c50=
0d5585552658a7c98ef788a625ffe1e201c" target=3D"_blank">https://github.com/7=
41g/virtio-spec/commit/61c500d5585552658a7c98ef788a625ffe1e201c</a> - Added=
 an example usage of virtio-hostmem</div><div><br></div><div>This first RFC=
 email includes replies to comments from <a href=3D"mailto:mst@redhat.com" =
target=3D"_blank">mst@redhat.com</a>:</div><div><br></div><div>=C2=A0 &gt; =
\item Guest allocates into the PCI region via config virtqueue messages.<br=
>
<br>Michael: OK so who allocates memory out of the PCI region?=C2=A0</div><=
div>Response:</div><div><br></div><div>Allocation will be split by guest ad=
dress space versus host address space.</div><div><br></div><div>Guest addre=
ss space: The guest driver determines the offset into the BAR in which to a=
llocate the new region. The implementation of the allocator itself may live=
 on the host (while guest triggers such allocations via the config virtqueu=
e messages), but the ownership of region offsets and sizes will be in the g=
uest. This allows for the easy use of existing guest ref-counting mechanism=
s such as last close() calling release() to clean up the memory regions in =
the guest.</div><div><br></div><div>Host address space: The backing of such=
 memory regions is considered completely optional. The host may service a g=
uest region with a memory of its choice that depends on the usage of the de=
vice. The time this servicing happens may be any time after the guest commu=
nicates the message to create a memory region, but before the guest destroy=
s the memory region. In the meantime, some examples of how the host may res=
pond to the allocation request:</div><div><ul><li>The host does not back th=
e region at all and a page fault happens.</li><li>The host has already allo=
cated host RAM (from some source; vkMapMemory, malloc(), mmap, etc) memory =
of some kind and maps a page-aligned host pointer to the guest physical add=
ress corresponding to the region.</li><li>The host has already set up a MMI=
O region (such as via the MemoryRegion API in QEMU) and maps that MMIO regi=
on to the guest physical address, allowing for MMIO callbacks to happen on =
read/writes to that memory region.</li></ul><div>=C2=A0 &gt; \item Guest: A=
fter a packet of compressed video stream is downloaded to the<br>
&gt; =C2=A0 =C2=A0 buffer, another message, like a doorbell, is sent on the=
 ping virtqueue to<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 consume existing compressed data. The ping=
 message&#39;s offset field is<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 set to the proper offset into the shared-m=
em object.<br><br></div><div>Michael: BTW is this terminology e.g. &quot;do=
wnload&quot;, &quot;ping message&quot; standard somewhere?</div></div><div>=
Response:</div><div><br></div><div>Conceptually, it has a lot in common wit=
h &quot;virtqueue notification&quot; or &quot;doorbell register&quot;. We s=
hould resolve to a more standard terminology; what about &quot;notification=
&quot;?</div><div><br></div><div>=C2=A0 &gt; \item Large bidirectional tran=
sfers are possible with zero copy.<br>
<br>Michael: However just to make sure, sending small amounts of data<br>
is slower since you get to do all the mmap dance.</div><div><br></div><div>=
Reponse: Yes it will be very slow if the user chooses to perform mmap for e=
ach transfer. However, we expect that for users who want to perform frequen=
t transfers of small amounts of data, such as for the sensors / codec use c=
ases, that the mmap happens once on instance creation with a single message=
 to create a memory region, and then every time a transfer hapens, only the=
 notification message is needed, while the existing mmap&#39;ed region is r=
eused. We expect the regions to remain fairly stable over the use of the in=
stance, in most cases; the guest userspace will also mmap() once to get dir=
ect access to the host memory, then reuse it many times while sending traff=
ic.</div><div><br>
=C2=A0 &gt; \item It is not necessary to use socket datagrams or data strea=
ms to<br>
&gt; =C2=A0 =C2=A0 communicate the ping messages; they can be raw structs f=
resh off the<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtqueue.<br>
<br>Michael: OK and ping messages are all fixed size?=C2=A0</div><div>Respo=
nse:</div><div><br></div><div>Yes, all ping messages are fixed size.=C2=A0<=
br></div><div><br></div><div>Michael: OK I still owe you that write-up abou=
t vhost pci.=C2=A0 will try to complete<br>
that early next week. But generally if I got it right that the host<br>
allocates buffers then what you describe does seem to fit a bit better<br>
with the vhost pci host/guest interface idea.</div><div>
<br>
One question that was asked about vhost pci is whether it is in fact<br>
necessary to share a device between multiple applications.<br>
Or is it enough to just have one id per device?=C2=A0=C2=A0<br></div><div><=
br></div><div>Response:</div><div>Yes, looking forward! I&#39;m kind of get=
ting some rough idea now of what you may be referring to with vhost pci, pe=
rhaps if we can use a shared memory channel like Chrome to drive vhost or s=
omething. I&#39;ll wait for the full response before designing more into th=
is area though :)</div><div><br></div><div>For now, it&#39;s not necessary =
to share the device between multiple VMs, but it is necessary to share betw=
een multiple guest processes, so multiple instance ids need to be supported=
 for each device id.</div><div><br></div><div>It is also possible to share =
one instance id across guest processes as well. In the codec example, the c=
odec may run in a separate guest process from the guest process that consum=
es the data, so to prevent copies, ideally both would have a view of the sa=
me host memory. Similar things shows up when running Vulkan or gralloc/dmab=
uf-like mechanisms; in recent versions of gralloc for example, one process =
allocates the memory while other processes share that memory by mapping it =
directly.=C2=A0</div><div><br></div><div>However those are between guest pr=
ocesses. For inter-VM communication, I am still a bit tentative on this but=
 it shows that instance id&#39;s fundamentally reflect a host-side context =
and its resources. Two VMs could map the same host memory in principle (tho=
ugh I have not tried it with KVM, I&#39;m not sure if things explode if set=
 user memory region happens for the same host memory across two VMs), and i=
f it makes sense for them to communicate over that memory, then it makes se=
nse for the instance id to be shared across the two VMs as well.</div><div>=
<br></div><div>Anyway, thanks for the feedback!</div><div><br></div><div>Be=
st,</div><div><br></div><div>Frank</div></div></div></div></div></div></div=
>
</blockquote></div>

--000000000000b722460582aa6b9c--
