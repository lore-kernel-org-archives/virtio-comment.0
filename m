Return-Path: virtio-comment-return-1206-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E662985AFD
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Apr 2020 08:45:20 +0000 (UTC)
References: <6774E3D0-4DA4-4CAA-B4D8-370982260E62@amazon.com>
 <20200410100922.wynrrzmbagjsaxd6@steredhat>
 <20200414105031.GC127149@stefanha-x1.localdomain>
 <696c2be6-6a7a-cfe5-91d6-f75d2e74299f@amazon.com>
 <20200417103327.GE9261@stefanha-x1.localdomain>
 <15906829-2e85-ed4c-7b06-431d6e856ae9@amazon.de>
 <20200429100632.GA124407@stefanha-x1.localdomain>
From: "Eftime, Petre" <epetre@amazon.com>
Message-ID: <0684ffcd-eb0c-b45e-e6ff-74625d376992@amazon.com>
Date: Thu, 30 Apr 2020 11:44:59 +0300
MIME-Version: 1.0
In-Reply-To: <20200429100632.GA124407@stefanha-x1.localdomain>
Content-Language: en-US
Subject: Re: [virtio-comment] Seeking guidance for custom virtIO device
Content-Type: multipart/alternative;
	boundary="------------BCED9BAB37473D416A980F6F"
To: Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <graf@amazon.de>
Cc: sgarzare@redhat.com, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--------------BCED9BAB37473D416A980F6F
MIME-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable


On 2020-04-29 13:06, Stefan Hajnoczi wrote:
> On Fri, Apr 17, 2020 at 01:09:16PM +0200, Alexander Graf wrote:
>> On 17.04.20 12:33, Stefan Hajnoczi wrote:
>>> On Wed, Apr 15, 2020 at 02:23:48PM +0300, Eftime, Petre wrote:
>>>> On 2020-04-14 13:50, Stefan Hajnoczi wrote:
>>>>> On Fri, Apr 10, 2020 at 12:09:22PM +0200, Stefano Garzarella wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Fri, Apr 10, 2020 at 09:36:58AM +0000, Eftime, Petre wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> I am looking for guidance on how to proceed with regards to either =
reserving a virtio device ID for a specific device for a particular usecase=
  or for formalizing a device type that could be potentially used by others=
.
>>>>>>>
>>>>>>> We have developed a virtio device that acts as a transport for API =
calls between a guest userspace library and a backend server in the host sy=
stem.
>>>>>>> Our requirements are:
>>>>>>> * multiple clients in the guest (multiple servers is not required)
>>>>>>> * provide an in-order, reliable datagram transport mechanism
>>>>>>> * datagram size should be either negotiable or large (16k-64k?)
>>>>>>> * performance is not a big concern for our usecase
>>>>>> It looks really close to vsock.
>>>>>>
>>>>>>> The reason why we used a special device and not something else is t=
he following:
>>>>>>> * vsock spec does not contain a datagram specification (eg. SOCK_DG=
RAM, SOCK_SEQPACKET) and the effort of updating the Linux driver and other =
implementations for this particular purpose=A0=A0seemed relatively high. Th=
e path to approach this problem wasn't clear. Vsock today only works in SOC=
K_STREAM mode and this is not ideal: the receiver must implement additional=
 state and buffer incoming data,=A0=A0adding complexity and host resource u=
sage.
>>>>>> AF_VSOCK itself supports SOCK_DGRAM, but virtio-vsock doesn't provid=
e
>>>>>> this feature. (vmci provides SOCK_DGRAM support)
>>>>>>
>>>>>> The changes should not be too intrusive in the virtio-vsock specs an=
d
>>>>>> implementation, we already have the "type" field in the packet heade=
r
>>>>>> to address this new feature.
>>>>>>
>>>>>> We also have the credit-mechanism to provide in-order and reliable
>>>>>> packets delivery.
>>>>>>
>>>>>> Maybe the hardest part could be change something in the core to hand=
le
>>>>>> multiple transports that provide SOCK_DGRAM, for nested VMs.
>>>>>> We already did for stream sockets, but we didn't handle the datagram
>>>>>> socket for now.
>>>>>>
>>>>>> I am not sure how convenient it is to have two very similar devices.=
..
>>>>>>
>>>>>> If you decide to give virtio-vsock a chance to get SOCK_DGRAM, I can=
 try to
>>>>>> give you a more complete list of changes to make. :-)
>>>>> I although think this sounds exactly like adding SOCK_DGRAM support t=
o
>>>>> virtio-vsock.
>>>>>
>>>>> The reason why the SOCK_DGRAM code was dropped from early virtio-vsoc=
k
>>>>> patches is that the prototocol design didn't ensure reliable delivery
>>>>> semantics.  At that time there were no real users for SOCK_DGRAM so i=
t
>>>>> was left as a feature to be added later.
>>>>>
>>>>> The challenge with reusing the SOCK_STREAM credit mechanism for
>>>>> SOCK_DGRAM is that datagrams are connectionless.  The credit mechanis=
m
>>>>> consists per-connection state.  Maybe it can be extended to cover
>>>>> SOCK_DGRAM too.
>>>>>
>>>>> I would urge you to add SOCK_DGRAM to virtio-vsock instead of trying =
to
>>>>> create another device that does basically what is within the scope of
>>>>> virtio-vsock.  It took quite a bit of time and effort to get AF_VSOCK
>>>>> support into various software components, and doing that again for
>>>>> another device is more effort than one would think.
>>>>>
>>>>> If you don't want to modify the Linux guest driver, then let's just
>>>>> discuss the device spec and protocol.  Someone else could make the Li=
nux
>>>>> driver changes.
>>>>>
>>>>> Stefan
>>>>
>>>> I think it would be great if we could get the virtio-vsock driver to s=
upport
>>>> SOCK_DGRAM/SOCK_SEQPACKET as it would make a lot of sense.
>>>>
>>>>
>>>> But one of the reasons that I don't really like virtio-vsock at the mo=
ment
>>>> for my use-case in particular is that it doesn't seem well fitted to s=
upport
>>>> non-cooperating live-migrateable VMs all that well.=A0 One problem is =
that to
>>>> avoid guest-visible disconnections to any service while doing a live
>>>> migration there might be performance impact if using vsock for any oth=
er
>>>> reasons.
>>>>
>>>> I'll try to exemplify what I mean with this setup:
>>>>
>>>>   =A0=A0=A0 * workload 1 sends data constantly via an AF_VSOCK SOCK_ST=
REAM
>>>>
>>>>   =A0=A0=A0 * workload 2 sends commands / gets replies once in a while=
 via an
>>>> AF_VSOCK SOCK_SEQPACKET.
>>> af_vsock.ko doesn't support SOCK_SEQPACKET.  Is this what you are
>>> considering adding?
>>>
>>> Earlier in this thread I thought we were discussing SOCK_DGRAM, which
>>> has different semantics than SOCK_SEQPACKET.
>>>
>>> The good news is that SOCK_SEQPACKET should be easier to add to
>>> net/vmw_vsock than SOCK_DGRAM because the flow control credit mechanism
>>> used for SOCK_STREAM should just work for SOCK_SEQPACKET.
>>>
>>>> Assume the VM needs to be migrated:
>>>>
>>>>   =A0=A0=A0 =A0=A0=A0 1) If workload 2 currently not processing anythi=
ng, even if there
>>>> are some commands for it queued up, everything is fine, VMM can pause =
the
>>>> guest and serialize.
>>>>
>>>>   =A0=A0=A0=A0=A0=A0=A0 2) If there's an outstanding command the VMM n=
eeds to wait for it to
>>>> finish and wait for the receive queue of the request to have enough ca=
pacity
>>>> for the reply, but since this capacity is guest driven, this second pa=
rt can
>>>> take a while / forever. This is definitely not ideal.
>>> I think you're describing how to reserve space for control packets so
>>> that the device never has to wait on the driver.
>>>
>>> Have you seen the drivers/vhost/vsock.c device implementation?  It has =
a
>>> strategy for suspending tx queue processing until the rx queue has more
>>> space.  Multiple implementation-specific approaches are possible, so
>>> this isn't in the specification.
>>>
>>>> I short, I think workload 2 needs to be in control of its own queues f=
or
>>>> this to work reasonably well, I don't know if sharing ownership of que=
ues
>>>> can work. The device we defined doesn't have this problem: first of al=
l,
>>>> it's on a separate queue, so workload 1 never competes in any way with
>>>> workload 2, and workload 2 always has where to place replies, since it=
 has
>>>> an attached reply buffer by design.
>>> Flow control in vsock works like this:
>>>
>>> 1. Data packets are accounted against per-socket buffers and removed
>>>      from the virtqueue immediately.  This allows multiple competing da=
ta
>>>      streams to share a single virtqueue without starvation.  It's the
>>>      per-socket buffer that can be exhausted, but that only affects the
>>>      application that isn't reading the socket socket.  The other side
>>>      will stop sending more data when credit is exhausted so that deliv=
ery
>>>      can be guaranteed.
>>>
>>> 2. Control packet replies can be sent in response to pretty much any
>>>      packet.  Therefore, it's necessary to suspend packet processing wh=
en
>>>      the other side's virtqueue is full.  This way you don't need to wa=
it
>>>      for them midway through processing a packet.
>>>
>>> There is a problem with #2 which hasn't been solved.  If both sides are
>>> operating at N-1 queue capacity (they are almost exhausted), then can w=
e
>>> reach a deadlock where both sides suspend queue processing because they
>>> are waiting for the other side?  This has not been fully investigated o=
r
>>> demonstrated, but it's an area that needs attention sometime.
>>>
>>>> Perhaps a good compromise would be to have a multi-queue virtio-vsock =
or
>>> That would mean we've reached the conclusion that it's impossible to
>>> have bi-directional communication with guaranteed delivery over a share=
d
>>> communications channel.
>>>
>>> virtio-serial did this to avoid having to come up with a scheme to avoi=
d
>>> starvation.
>> Let me throw in one more problem:
>>
>> Imagine that we want to have virtio-vsock communication terminated in
>> different domains, each of which has ownership of their own device
>> emulation.
>>
>> The easiest case where this happens is to have vsock between hypervisor =
and
>> guest as well as between a PCIe implementation via VFIO and a guest. But=
 the
>> same can be true for stub domain like setups, where each connection end
>> lives in its own stub domain (vhost-user in the vsock case I suppose).
>>
>> In that case, it's impossible to share the one queue we have, no?
> By the way, "dedicated virtqueues" could be interesting as a separate
> feature.
>
> I just think that SOCK_SEQPACKET should be implemented with flow control
> like SOCK_STREAM.
>
> Then, as a separate feature, the device could advertise dedicated
> virtqueues allowing SOCK_STREAM and SOCK_SEQPACKET communication
> directly in the virtqueue.  The dedicated virtqueue approach should be
> faster since it eliminates the need for a memcpy to socket receive
> buffers.
>
> Stefan

Yes, SOCK_SEQPACKET seems relatively easy to implement.

Would devices need to add a feature flag to advertise the fact that they=20
support SOCK_SEQPACKET? Not sure I understand all the backwards=20
compatibility issues adding this might introduce, but I think it would=20
be required since the idea is that if you write a message on a=20
SOCK_SEQPACKET socket it can't be split into multiple messages to the=20
receiver, and both the driver and the device would need to know that.

A marker in the header should denote that there is more data to come in=20
the same packet, in the next descriptor, so that message boundaries can=20
be preserved, even if the driver doesn't place large enough descriptors=20
in the RX queue. The device would split and mark messages accordingly=20
and then the driver would re-assemble them before sending them to af_vsock.

Otherwise, minimal descriptor sizes should be part of the specification=20
such that you can rely on some specific message size rather than what=20
the driver decides to place in the queue, which so far is implementation=20
defined. The first option seems more flexible to me.

Best,
Petre Eftime





Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.

--------------BCED9BAB37473D416A980F6F
Content-Type: text/html; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2020-04-29 13:06, Stefan Hajnoczi
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20200429100632.GA124407@stefanha-x1.localdomain">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Apr 17, 2020 at 01:09:=
16PM +0200, Alexander Graf wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 17.04.20 12:33, Stefan Ha=
jnoczi wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, Apr 15, 2020 at 02=
:23:48PM +0300, Eftime, Petre wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">On 2020-04-14 13:50, Ste=
fan Hajnoczi wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Apr 10, 2020 a=
t 12:09:22PM +0200, Stefano Garzarella wrote:
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">Hi,

On Fri, Apr 10, 2020 at 09:36:58AM +0000, Eftime, Petre wrote:
</pre>
                <blockquote type=3D"cite">
                  <pre class=3D"moz-quote-pre" wrap=3D"">Hi all,

I am looking for guidance on how to proceed with regards to either reservin=
g a virtio device ID for a specific device for a particular usecase  or for=
 formalizing a device type that could be potentially used by others.

We have developed a virtio device that acts as a transport for API calls be=
tween a guest userspace library and a backend server in the host system.
Our requirements are:
* multiple clients in the guest (multiple servers is not required)
* provide an in-order, reliable datagram transport mechanism
* datagram size should be either negotiable or large (16k-64k?)
* performance is not a big concern for our usecase
</pre>
                </blockquote>
                <pre class=3D"moz-quote-pre" wrap=3D"">It looks really clos=
e to vsock.

</pre>
                <blockquote type=3D"cite">
                  <pre class=3D"moz-quote-pre" wrap=3D"">The reason why we =
used a special device and not something else is the following:
* vsock spec does not contain a datagram specification (eg. SOCK_DGRAM, SOC=
K_SEQPACKET) and the effort of updating the Linux driver and other implemen=
tations for this particular purpose=A0=A0seemed relatively high. The path t=
o approach this problem wasn't clear. Vsock today only works in SOCK_STREAM=
 mode and this is not ideal: the receiver must implement additional state a=
nd buffer incoming data,=A0=A0adding complexity and host resource usage.
</pre>
                </blockquote>
                <pre class=3D"moz-quote-pre" wrap=3D"">AF_VSOCK itself supp=
orts SOCK_DGRAM, but virtio-vsock doesn't provide
this feature. (vmci provides SOCK_DGRAM support)

The changes should not be too intrusive in the virtio-vsock specs and
implementation, we already have the "type" field in the packet header
to address this new feature.

We also have the credit-mechanism to provide in-order and reliable
packets delivery.

Maybe the hardest part could be change something in the core to handle
multiple transports that provide SOCK_DGRAM, for nested VMs.
We already did for stream sockets, but we didn't handle the datagram
socket for now.

I am not sure how convenient it is to have two very similar devices...

If you decide to give virtio-vsock a chance to get SOCK_DGRAM, I can try to
give you a more complete list of changes to make. :-)
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">I although think this =
sounds exactly like adding SOCK_DGRAM support to
virtio-vsock.

The reason why the SOCK_DGRAM code was dropped from early virtio-vsock
patches is that the prototocol design didn't ensure reliable delivery
semantics.  At that time there were no real users for SOCK_DGRAM so it
was left as a feature to be added later.

The challenge with reusing the SOCK_STREAM credit mechanism for
SOCK_DGRAM is that datagrams are connectionless.  The credit mechanism
consists per-connection state.  Maybe it can be extended to cover
SOCK_DGRAM too.

I would urge you to add SOCK_DGRAM to virtio-vsock instead of trying to
create another device that does basically what is within the scope of
virtio-vsock.  It took quite a bit of time and effort to get AF_VSOCK
support into various software components, and doing that again for
another device is more effort than one would think.

If you don't want to modify the Linux guest driver, then let's just
discuss the device spec and protocol.  Someone else could make the Linux
driver changes.

Stefan
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">

I think it would be great if we could get the virtio-vsock driver to suppor=
t
SOCK_DGRAM/SOCK_SEQPACKET as it would make a lot of sense.


But one of the reasons that I don't really like virtio-vsock at the moment
for my use-case in particular is that it doesn't seem well fitted to suppor=
t
non-cooperating live-migrateable VMs all that well.=A0 One problem is that =
to
avoid guest-visible disconnections to any service while doing a live
migration there might be performance impact if using vsock for any other
reasons.

I'll try to exemplify what I mean with this setup:

 =A0=A0=A0 * workload 1 sends data constantly via an AF_VSOCK SOCK_STREAM

 =A0=A0=A0 * workload 2 sends commands / gets replies once in a while via a=
n
AF_VSOCK SOCK_SEQPACKET.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">
af_vsock.ko doesn't support SOCK_SEQPACKET.  Is this what you are
considering adding?

Earlier in this thread I thought we were discussing SOCK_DGRAM, which
has different semantics than SOCK_SEQPACKET.

The good news is that SOCK_SEQPACKET should be easier to add to
net/vmw_vsock than SOCK_DGRAM because the flow control credit mechanism
used for SOCK_STREAM should just work for SOCK_SEQPACKET.

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
Assume the VM needs to be migrated:

 =A0=A0=A0 =A0=A0=A0 1) If workload 2 currently not processing anything, ev=
en if there
are some commands for it queued up, everything is fine, VMM can pause the
guest and serialize.

 =A0=A0=A0=A0=A0=A0=A0 2) If there's an outstanding command the VMM needs t=
o wait for it to
finish and wait for the receive queue of the request to have enough capacit=
y
for the reply, but since this capacity is guest driven, this second part ca=
n
take a while / forever. This is definitely not ideal.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">
I think you're describing how to reserve space for control packets so
that the device never has to wait on the driver.

Have you seen the drivers/vhost/vsock.c device implementation?  It has a
strategy for suspending tx queue processing until the rx queue has more
space.  Multiple implementation-specific approaches are possible, so
this isn't in the specification.

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">I short, I think workloa=
d 2 needs to be in control of its own queues for
this to work reasonably well, I don't know if sharing ownership of queues
can work. The device we defined doesn't have this problem: first of all,
it's on a separate queue, so workload 1 never competes in any way with
workload 2, and workload 2 always has where to place replies, since it has
an attached reply buffer by design.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">
Flow control in vsock works like this:

1. Data packets are accounted against per-socket buffers and removed
    from the virtqueue immediately.  This allows multiple competing data
    streams to share a single virtqueue without starvation.  It's the
    per-socket buffer that can be exhausted, but that only affects the
    application that isn't reading the socket socket.  The other side
    will stop sending more data when credit is exhausted so that delivery
    can be guaranteed.

2. Control packet replies can be sent in response to pretty much any
    packet.  Therefore, it's necessary to suspend packet processing when
    the other side's virtqueue is full.  This way you don't need to wait
    for them midway through processing a packet.

There is a problem with #2 which hasn't been solved.  If both sides are
operating at N-1 queue capacity (they are almost exhausted), then can we
reach a deadlock where both sides suspend queue processing because they
are waiting for the other side?  This has not been fully investigated or
demonstrated, but it's an area that needs attention sometime.

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Perhaps a good compromis=
e would be to have a multi-queue virtio-vsock or
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">
That would mean we've reached the conclusion that it's impossible to
have bi-directional communication with guaranteed delivery over a shared
communications channel.

virtio-serial did this to avoid having to come up with a scheme to avoid
starvation.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Let me throw in one more problem:

Imagine that we want to have virtio-vsock communication terminated in
different domains, each of which has ownership of their own device
emulation.

The easiest case where this happens is to have vsock between hypervisor and
guest as well as between a PCIe implementation via VFIO and a guest. But th=
e
same can be true for stub domain like setups, where each connection end
lives in its own stub domain (vhost-user in the vsock case I suppose).

In that case, it's impossible to share the one queue we have, no?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
By the way, "dedicated virtqueues" could be interesting as a separate
feature.

I just think that SOCK_SEQPACKET should be implemented with flow control
like SOCK_STREAM.

Then, as a separate feature, the device could advertise dedicated
virtqueues allowing SOCK_STREAM and SOCK_SEQPACKET communication
directly in the virtqueue.  The dedicated virtqueue approach should be
faster since it eliminates the need for a memcpy to socket receive
buffers.

Stefan</pre>
    </blockquote>
    <p><tt>Yes, SOCK_SEQPACKET seems relatively easy to implement.<br>
      </tt></p>
    <p><tt>Would devices need to add a feature flag to advertise the
        fact that they support SOCK_SEQPACKET? Not sure I understand all
        the backwards compatibility issues adding this might introduce,
        but I think it would be required since the idea is that if you
        write a message on a SOCK_SEQPACKET socket it can't be split
        into multiple messages to the receiver, and both the driver and
        the device would need to know that.</tt></p>
    <p><tt>A marker in the header should denote that there is more data
        to come in the same packet, in the next descriptor, so that
        message boundaries can be preserved, even if the driver doesn't
        place large enough descriptors in the RX queue. The device would
        split and mark messages accordingly and then the driver would
        re-assemble them before sending them to af_vsock.<br>
      </tt></p>
    <p><tt>Otherwise, minimal descriptor sizes should be part of the
        specification such that you can rely on some specific message
        size rather than what the driver decides to place in the queue,
        which so far is implementation defined. The first option seems
        more flexible to me.<br>
      </tt></p>
    <tt><span class=3D"pcrr8t-x-x-80"><span class=3D"pcrr8t-x-x-80">Best,</=
span></span></tt><br>
    <tt><span class=3D"pcrr8t-x-x-80"><span class=3D"pcrr8t-x-x-80">Petre
          Eftime<br>
        </span></span></tt>
    <p><span class=3D"pcrr8t-x-x-80"><span class=3D"pcrr8t-x-x-80"><br>
        </span></span></p>
    <blockquote type=3D"cite"
      cite=3D"mid:20200429100632.GA124407@stefanha-x1.localdomain">
    </blockquote>
  <p></p>

<p><br>
Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.</p>
</body>
</html>

--------------BCED9BAB37473D416A980F6F--

