Return-Path: virtio-comment-return-1401-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B1233985D9C
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Aug 2020 14:55:49 +0000 (UTC)
MIME-Version: 1.0
References: <CAP_G_RUJHvsi1VcP2UGtzp4VoEdWevEOA6X5uA_3TkytHkyYdw@mail.gmail.com>
 <20200813121524.GA6559@stefanha-x1.localdomain> <CAP_G_RWD68EuSDMurKL=upd=nVeAyis8wAKLD4S7r2Ee8Ouxhg@mail.gmail.com>
In-Reply-To: <CAP_G_RWD68EuSDMurKL=upd=nVeAyis8wAKLD4S7r2Ee8Ouxhg@mail.gmail.com>
From: Krasnov Arseniy <oxffffaa@gmail.com>
Date: Thu, 13 Aug 2020 19:55:36 +0500
Message-ID: <CAP_G_RUHng2KO=dsux0FzJH5GV-d1P2j=pSpjMRAz9_Uo4hNhA@mail.gmail.com>
Subject: Re: [virtio-comment] multibuffer in packed queue
Content-Type: multipart/alternative; boundary="000000000000e47f6905acc37fbd"
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000e47f6905acc37fbd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 13 =D0=B0=D0=B2=D0=B3. 2020 =D0=B3. =D0=B2 17:29, Krasnov Ars=
eniy <oxffffaa@gmail.com>:

> Ok, i understand about how virtio-net merge works. I asked about the
> following thing, consider we have two buffers(two descriptors each):
>
> buffer 1(two descriptors):
> | buf_1_1, NEXT, !USED, 1KB | | buf_1_2, !NEXT, !USED, 1KB|
>
> buffer 2(two descriptors):
>  | buf_2_1, NEXT, !USED, 1KB | | buf_2_2, !NEXT, !USED, 1KB|
>
> Both four descriptors placed sequentially in queue: buf_1_1, buf_1_2,
> buf_2_1, buf_2_2.
>
> Then 3KB network packet arrived and device fills buffers:
>   | buf_1_1, NEXT, USED, 0KB | | buf_1_2, !NEXT, USED, 0KB|
>
>
>
>  | buf_2_1, NEXT, USED, 0KB | | buf_2_2, !NEXT, USED, 512B|
>
> Is device allowed to flip NEXT bit of buf_1_2, two make chain of four
> descriptors(linking buf_1_2 and buf_2_1)?
>
> =D1=87=D1=82, 13 =D0=B0=D0=B2=D0=B3. 2020 =D0=B3. =D0=B2 15:16, Stefan Ha=
jnoczi <stefanha@redhat.com>:
>
>> On Thu, Aug 13, 2020 at 10:57:52AM +0300, Krasnov Arseniy wrote:
>>
>>
>> > Hellow, I've got question about chapter 2.7.9:
>>
>>
>> >
>>
>>
>> > *  2.7.9 Multi-buffer requests Some devices combine multiple buffers a=
s
>>
>>
>> > part of processing of a single request. These devices always mark the
>>
>>
>> > descriptor corresponding to the first buffer in the request used after
>> the
>>
>>
>> > rest of the descriptors (corresponding to rest of the buffers) in the
>>
>>
>> > request - which follow the first descriptor in ring order - has been
>> marked
>>
>>
>> > used and written out into the ring. This guarantees that the driver wi=
ll
>>
>>
>> > never observe a partial request in the ring.  *
>>
>>
>> >
>>
>>
>> > Does it mean, that device can use sequence(chain) of descriptor unil
>>
>>
>> > descriptor with VIRTQ_DESC_F_NEXT  =3D=3D 0 bit is found, OR device ca=
n use
>>
>>
>> > descriptors as many as it needs, don't care about  VIRTQ_DESC_F_NEXT
>> bit,
>>
>>
>> > and finally set  VIRTQ_DESC_F_NEXT bit in all used descriptors.
>>
>>
>>
>>
>>
>> 2.7.9 talks about 3 concepts:
>>
>>
>> 1. Requests (highest-level concept)
>>
>>
>> 2. Buffers
>>
>>
>> 3. Descriptors (lowest-level concept)
>>
>>
>>
>>
>>
>> They are distinct. A request is something like a received packet from a
>>
>>
>> network card. A buffer is a descriptor chain (1 or more descriptors with
>>
>>
>> the F_NEXT bit set). A descriptor is a single memory [start, end) range
>>
>>
>> that the device may read from or write to.
>>
>>
>>
>>
>>
>> The paragraph descibes how some devices complete one request by
>>
>>
>> combining multiple buffers. If a 8KB network packet arrives on a NIC and
>>
>>
>> the driver provided two 4KB buffers consisting of 1 4KB descriptor each
>>
>>
>> then the device may "merge" those two buffers (see virtio-net for
>>
>>
>> details). When doing so it must ensure that the first 4KB buffer of the
>>
>>
>> packet is marked used and written out to the ring *after* the second 4KB
>>
>>
>> buffer so that the driver sees the beginning of the network packet and
>>
>>
>> not the second half with the first half missing.
>>
>>
>>
>>
>>
>> Merging buffers is done at the device type-level (e.g. virtio-net), not
>>
>>
>> at a virtqueue-level (i.e. core virtio code). The device type must
>>
>>
>> specify exactly how merging works and device type-specific header fields
>> are
>>
>>
>> be used by the device to indicate which buffers have been merged into a
>>
>>
>> single request (see virtio-net's VIRTIO_NET_F_MRG_RXBUF feature bit and
>>
>>
>> num_buffers header field).
>>
>>
>>
>>
>>
>> > Also, in packed queue device can't modify descriptors except USED bit.
>>
>>
>>
>>
>>
>> No, the device *must* overwrite descriptors in the packed ring. Imagine
>>
>>
>> a device that completes buffers out-of-order:
>>
>>
>>
>>
>>
>> 1. The driver submits two buffers (F_NEXT is not set because a chain of
>>
>>
>>    descriptors would make the ASCII diagram more complex) and waits for
>>
>>
>>    the device:
>>
>>
>>
>>
>>
>>   | buf#1 !USED LEN=3D4KB | buf#2 !USED LEN=3D4KB |
>>
>>
>>
>>
>>
>> 2. The device completes buf#2 first (1KB of the 4KB descriptor was
>>
>>
>>    written) and writes the used descriptor to the ring:
>>
>>
>>
>>
>>
>>   | buf#2 USED LEN=3D1KB | buf#2 !USED LEN=3D4KB |
>>
>>
>>
>>
>>
>> 3. Let's say the driver waits for buf#1 to complete (3KB of the 4KB
>>
>>
>>    descriptor was written):
>>
>>
>>
>>
>>
>>   | buf#2 USED LEN=3D1KB | buf#1 USED LEN=3D3KB |
>>
>>
>>
>>
>>
>> You can see that the ring was overwritten by the device and the
>>
>>
>> descriptors were modified (e.g. the 4KB avail length was replaced by the
>>
>>
>> 1KB used length value).
>>
>>
>>
>>
>>
>> > In
>>
>>
>> > split queue, device also can't modify descriptor(it touches used buffe=
r
>>
>>
>> > with index and length fields). Is that true?
>>
>>
>>
>>
>>
>> Yes, the device does not modify split queue descriptors. It only fills
>>
>>
>> in used ring elements and updates the used ring index.
>>
>>
>>
>>
>>
>> Stefan
>>
>>
>>
>
>

--000000000000e47f6905acc37fbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">=D1=87=D1=82, 13 =D0=B0=D0=B2=D0=B3. 2020 =D0=B3. =D0=B2 17=
:29, Krasnov Arseniy &lt;<a href=3D"mailto:oxffffaa@gmail.com">oxffffaa@gma=
il.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Ok=
, i understand about how virtio-net merge=C2=A0works. I asked about the fol=
lowing thing, consider we have two buffers(two descriptors each):<div><br><=
/div><div>buffer 1(two descriptors):</div><div>| buf_1_1, NEXT, !USED, 1KB =
| | buf_1_2, !NEXT, !USED, 1KB|</div><div><br></div><div>buffer 2(two descr=
iptors):</div><div>=C2=A0| buf_2_1, NEXT, !USED, 1KB | | buf_2_2, !NEXT, !U=
SED, 1KB|=C2=A0<br></div><div><br></div><div>Both four descriptors placed s=
equentially in queue: buf_1_1, buf_1_2, buf_2_1, buf_2_2.</div><div><br></d=
iv><div>Then 3KB network packet arrived and device fills buffers:</div><div=
>=C2=A0 | buf_1_1, NEXT, USED, 0KB | | buf_1_2, !NEXT, USED, 0KB|=C2=A0=C2=
=A0<br><br><br><br>=C2=A0| buf_2_1, NEXT, USED, 0KB | | buf_2_2, !NEXT, USE=
D, 512B|=C2=A0<br></div><div><br></div><div>Is device allowed to flip NEXT =
bit of buf_1_2, two make chain of four descriptors(linking buf_1_2 and buf_=
2_1)?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">=D1=87=D1=82, 13 =D0=B0=D0=B2=D0=B3. 2020 =D0=B3. =D0=B2 15:16, =
Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=3D"_blank=
">stefanha@redhat.com</a>&gt;:<br></div></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Aug 13, 2020 at 10:=
57:52AM +0300, Krasnov Arseniy wrote:<br><br><br>&gt; Hellow, I&#39;ve got =
question about chapter 2.7.9:<br><br><br>&gt; <br><br><br>&gt; *=C2=A0 2.7.=
9 Multi-buffer requests Some devices combine multiple buffers as<br><br><br=
>&gt; part of processing of a single request. These devices always mark the=
<br><br><br>&gt; descriptor corresponding to the first buffer in the reques=
t used after the<br><br><br>&gt; rest of the descriptors (corresponding to =
rest of the buffers) in the<br><br><br>&gt; request - which follow the firs=
t descriptor in ring order - has been marked<br><br><br>&gt; used and writt=
en out into the ring. This guarantees that the driver will<br><br><br>&gt; =
never observe a partial request in the ring.=C2=A0 *<br><br><br>&gt; <br><b=
r><br>&gt; Does it mean, that device can use sequence(chain) of descriptor =
unil<br><br><br>&gt; descriptor with VIRTQ_DESC_F_NEXT=C2=A0 =3D=3D 0 bit i=
s found, OR device can use<br><br><br>&gt; descriptors as many as it needs,=
 don&#39;t care about=C2=A0 VIRTQ_DESC_F_NEXT bit,<br><br><br>&gt; and fina=
lly set=C2=A0 VIRTQ_DESC_F_NEXT bit in all used descriptors.<br><br><br><br=
><br><br>2.7.9 talks about 3 concepts:<br><br><br>1. Requests (highest-leve=
l concept)<br><br><br>2. Buffers<br><br><br>3. Descriptors (lowest-level co=
ncept)<br><br><br><br><br><br>They are distinct. A request is something lik=
e a received packet from a<br><br><br>network card. A buffer is a descripto=
r chain (1 or more descriptors with<br><br><br>the F_NEXT bit set). A descr=
iptor is a single memory [start, end) range<br><br><br>that the device may =
read from or write to.<br><br><br><br><br><br>The paragraph descibes how so=
me devices complete one request by<br><br><br>combining multiple buffers. I=
f a 8KB network packet arrives on a NIC and<br><br><br>the driver provided =
two 4KB buffers consisting of 1 4KB descriptor each<br><br><br>then the dev=
ice may &quot;merge&quot; those two buffers (see virtio-net for<br><br><br>=
details). When doing so it must ensure that the first 4KB buffer of the<br>=
<br><br>packet is marked used and written out to the ring *after* the secon=
d 4KB<br><br><br>buffer so that the driver sees the beginning of the networ=
k packet and<br><br><br>not the second half with the first half missing.<br=
><br><br><br><br><br>Merging buffers is done at the device type-level (e.g.=
 virtio-net), not<br><br><br>at a virtqueue-level (i.e. core virtio code). =
The device type must<br><br><br>specify exactly how merging works and devic=
e type-specific header fields are<br><br><br>be used by the device to indic=
ate which buffers have been merged into a<br><br><br>single request (see vi=
rtio-net&#39;s VIRTIO_NET_F_MRG_RXBUF feature bit and<br><br><br>num_buffer=
s header field).<br><br><br><br><br><br>&gt; Also, in packed queue device c=
an&#39;t modify descriptors except USED bit.<br><br><br><br><br><br>No, the=
 device *must* overwrite descriptors in the packed ring. Imagine<br><br><br=
>a device that completes buffers out-of-order:<br><br><br><br><br><br>1. Th=
e driver submits two buffers (F_NEXT is not set because a chain of<br><br><=
br>=C2=A0 =C2=A0descriptors would make the ASCII diagram more complex) and =
waits for<br><br><br>=C2=A0 =C2=A0the device:<br><br><br><br><br><br>=C2=A0=
 | buf#1 !USED LEN=3D4KB | buf#2 !USED LEN=3D4KB |<br><br><br><br><br><br>2=
. The device completes buf#2 first (1KB of the 4KB descriptor was<br><br><b=
r>=C2=A0 =C2=A0written) and writes the used descriptor to the ring:<br><br>=
<br><br><br><br>=C2=A0 | buf#2 USED LEN=3D1KB | buf#2 !USED LEN=3D4KB |<br>=
<br><br><br><br><br>3. Let&#39;s say the driver waits for buf#1 to complete=
 (3KB of the 4KB<br><br><br>=C2=A0 =C2=A0descriptor was written):<br><br><b=
r><br><br><br>=C2=A0 | buf#2 USED LEN=3D1KB | buf#1 USED LEN=3D3KB |<br><br=
><br><br><br><br>You can see that the ring was overwritten by the device an=
d the<br><br><br>descriptors were modified (e.g. the 4KB avail length was r=
eplaced by the<br><br><br>1KB used length value).<br><br><br><br><br><br>&g=
t; In<br><br><br>&gt; split queue, device also can&#39;t modify descriptor(=
it touches used buffer<br><br><br>&gt; with index and length fields). Is th=
at true?<br><br><br><br><br><br>Yes, the device does not modify split queue=
 descriptors. It only fills<br><br><br>in used ring elements and updates th=
e used ring index.<br><br><br><br><br><br>Stefan<br><br><br></blockquote></=
div><br><br></blockquote></div></div>

--000000000000e47f6905acc37fbd--

