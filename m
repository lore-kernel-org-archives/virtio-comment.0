Return-Path: virtio-comment-return-1058-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77539985A9A
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Feb 2020 17:07:46 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Mon, 10 Feb 2020 17:07:41 +0000
Message-ID: <BN6PR1801MB2067F25265C15D7DD2F312EEC5190@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: RE: [virtio-comment] Re: [PATCH v2] virtio-net: Add an optional
 device control over the receive buffers length
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

>> >
>> >I still think this is too restrictive. Switching between e.g.
>> >XDP/non-XDP workloads demands ability to change this without device res=
et.
>> >I am thinking about sending the avail index to device with a command
>> >to change the size, this way device can figure out where are the old
>> >and where are the new buffers.
>> >Doesn't look too hard on the hardware, does it?
>> >
>>
>> Changing descriptors size once in a while sounds reasonable and possible=
.
>> I see a problem though with this specific method - updating the rx descr=
iptors size is an asynchronous
>slow-path operation (in vDPA it would go through a SW emulation). So there=
 is no guarantee that the
>ring index, the driver requests, will be delivered on time to the device.
>> I can suggest another method, where the driver requests to change a desc=
riptor size through a slow-
>path, but fast-path synchronization will come from the device - it will se=
t a dedicated flag in the first
>used rx descriptor with the new size (from the device perspective).
>
>Now I'm confused.  The descriptor length is *already* in the descriptor.
>Why do we need a new flag?
>

If I understand correctly, the device will put a received packet length int=
o the descriptor's 'length' field. So the driver will have no way of knowin=
g when the device switches to the new descriptor length. More details below=
.

>
>> So the flow of changing the descriptor size could be as follows:
>>
>> For enlarging descriptors size:
>>  1. Driver enlarges descriptors size. All new descriptors are made avail=
able with the new size.
>Obviously, the buffers behind the descriptors must be enlarged as well.
>>  2. Driver requests the device to change descriptors size (by writing to=
 the device configuration
>space). At this stage the device still thinks that all descriptors are of =
an old (smaller) size. Although new
>descriptors are of a new size, the driver must treat them as if they were =
of an old size (i.e. the device
>would not fill the whole descriptor).
>>  3. At some point, the device receives the driver's request, and it chan=
ges internally the rx descriptors
>size. The device sets a new_size flag in the next descriptor used.
>>  4. When the driver receives a used descriptor with a new_size flag set,=
 from that point on it can treat
>all descriptors as being of a new size.
>
>So the only thing that happens with the flag is it's copied from source to=
 destination right? I guess in
>that case, just using descriptor ID is enough.
>

I'm not sure I understand what do you mean by "copied from source to destin=
ation".

When driver wants to change the descriptor length from X to Y (Y > X), ther=
e will be a period of time when descriptors' length is Y, but the device th=
inks it's X. For packets that are smaller than X, it doesn't really matter =
- the device will use a single descriptor per packet, and write out its len=
gth. For packets larger than X, the device will split the packet to buffers=
 pointed by multiple descriptors, but each buffer will be filled with up to=
 X bytes (and not Y).
Currently, there is a requirement in the spec, that "If a receive packet is=
 spread over multiple buffers, the device MUST use all buffers but the last=
 (i.e. the first num_buffers-1 buffers) completely up to the full length of=
 each buffer supplied by the driver.".
So we can tell the driver that till it sees the new_size flag, it should tr=
eat used descriptors length as if it was X and not Y.
Alternatively, perhaps the requirement can be changed, such that driver wil=
l always read the used descriptor's length, and will not assume that it was=
 fully populated. In this case a new flag will not be needed.

When Y < X, there will be a period of time when the device thinks that the =
descriptors' length is X, so the driver can't allocate smaller buffers. It =
must continue providing descriptors pointing to large buffers, till the dev=
ice signals that it has received the request, and from now on it will start=
 using smaller buffers. A new_size flag can be such a signal. From the mome=
nt the driver sees a new_size flag set in a used descriptor, it can start a=
llocating small buffers, and make new available descriptors with length Y. =
However, there could still be outstanding available descriptors with length=
 X, so the driver must treat them as if they were of length Y (like in the =
previous case).


>> For reducing descriptors size:
>>  1. Driver requests the device to change descriptors size.
>>  2. At some point, the device receives the driver's request, and it chan=
ges internally the rx descriptors
>size. the device sets a new_size flag in the next descriptor used.
>>  3. When the driver receives a used descriptor with a new_size flag set,=
 from that point on it must
>treat all the descriptors as being of the new size.
>>  4. Now the driver can actually reduce descriptors size. All new descrip=
tors will be made available with
>a new size.
>
>Except that we should be talking about buffers not descriptors, sounds ok.=
 Fundamentally, the main
>rule we are relaxing is that device uses a whole buffer. Need to update th=
e relevant spec part, making
>an exception and link to this process.
>

I was mostly talking about descriptors and not buffers, because this is wha=
t exposed to the device. As far as I understand, the device doesn't care ab=
out the buffer length, but only about the descriptor 'length' field.



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

