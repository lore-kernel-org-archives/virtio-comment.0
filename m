Return-Path: virtio-comment-return-1808-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26489986299
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Mar 2021 09:50:11 +0000 (UTC)
References: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
 <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
 <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
 <230d95fd-29e8-465b-0ab2-b406d614c11b@kaspersky.com>
 <20210329212818.qdeprjhep745yeur@steredhat>
 <d6d92105-f7d4-74a3-4acc-fcfb40872b76@kaspersky.com>
 <YGLnfAxvy83jLkmG@stefanha-x1.localdomain>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <2061f2ab-f3fc-c059-7cfc-a34b06f061fe@kaspersky.com>
Date: Tue, 30 Mar 2021 12:50:06 +0300
MIME-Version: 1.0
In-Reply-To: <YGLnfAxvy83jLkmG@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] Re: [MASSMAIL KLMS] Re: [virtio-comment] [RFC
 PATCH v4 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 30.03.2021 11:55, Stefan Hajnoczi wrote:
> On Tue, Mar 30, 2021 at 09:15:39AM +0300, Arseny Krasnov wrote:
>> On 30.03.2021 00:28, Stefano Garzarella wrote:
>>> On Mon, Mar 29, 2021 at 08:33:27PM +0300, Arseny Krasnov wrote:
>>>> On 29.03.2021 19:11, Stefan Hajnoczi wrote:
>>>>> On Fri, Mar 26, 2021 at 12:02:50PM +0300, Arseny Krasnov wrote:
>>>>>> @@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
>>>>>>  /* Request the peer to send the credit info to us */
>>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
>>>>>> +/* Message begin for SOCK_SEQPACKET */
>>>>>> +#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
>>>>>> +/* Message end for SOCK_SEQPACKET */
>>>>>> +#define VIRTIO_VSOCK_OP_SEQ_END        9
>>>>> The struct virtio_vsock_hdr->flags field is le32 and currently unused.
>>>>> Could 24 bits be used for a unique message id and 8 bits for flags? 1
>>>>> flag bit could be used for end-of-message and the remaining 7 bits could
>>>>> be reserved. That way SEQ_BEGIN and SEQ_END are not necessary.  
>>>>> Pressure
>>>>> on the virtqueue would be reduced and performance should be comparable
>>>>> to SOCK_STREAM.
>>>> Well, my first versions of SOCK_SEQPACKET implementation, worked
>>>> something like this: i used flags field of header as length of whole
>>>> message. I discussed it with Stefano Garzarella, and he told that it 
>>>> will
>>>> be better to use special "header" in packet's payload, to keep some
>>>> SOCK_SEQPACKET specific data, instead of reusing packet's header
>>>> fields.
>>> IIRC in the first implementation SEQ_BEGIN was an empty message and we 
>>> didn't added the msg_id yet. So since we needed to carry both id and 
>>> total length, I suggested to use the payload to put these extra 
>>> information.
>>>
>>> IIUC what Stefan is suggesting is a bit different and I think it should 
>>> be cool to implement: we can remove the boundary packets, use only 8 
>>> bits for the flags, and add a new field to reuse the 24 unused bits, 
>>> maybe also 16 bits would be enough.
>>> At that point we will only use the EOR flag to know the last packet.
>>>
>>> The main difference will be that the receiver will know the total size 
>>> only when the last packet is received.
>>>
>>> Do you see any issue on that approach?
>> It will work, except we can't check that any packet of message,
>>
>> except last(with EOR bit) was dropped, since receiver don't know
>>
>> real length of message. If it is ok, then i can implement it.
> The credit mechanism ensures that packets are not dropped, so it's not
> necessary to check for this condition.
>
> By the way, is a unique message ID needed? My understanding is:
>
> If two messages are being sent on a socket at the same time either their
> order is serialized (whichever message began first) or it is undefined
> (whichever message completes first).

If we are talking about case, when two threads writes to one socket at the same time,

in Linux it is possible that two message will interleave(for vsock). But as i know, for example

when TCP socket is used, both 'write()' calls will be serialized. May be it is bug of vsock: when

first writer goes out of space, it will sleep. Then second writer tries to send something, but

as free space is over, it will sleep too. Then, credit update is received from peer. Both sender's

will be woken up, but sender which grab socket lock first will continue to send it's message.

So may be we can add something like semaphore to new/vmw_vsock/af_vsock.c which will

serialize two 'write()' calls: second sender enters 'write()' path, only when first left this path.

My implementation doesn't care about that, because i wanted to add semaphore later, by another

patch.

> I wonder if POSIX specifies this
> and if Linux implements it (e.g. with AF_UNIX SOCK_SEQPACKET messages
> that are multiple pages long and exceed sndbuf)?
>
> Depending on these semantics maybe we don't need a unique message ID.
> Instead the driver transmits messages sequentially. RW packets for
> different messages on the same socket will never be interleaved.

Yes, in Linux driver, two sequential messages(when both 'write()' calls are serialized)

of one socket will never interleave. My implementation is based on that.

> Therefore the unique message ID is not needed and just the MSG_EOR flag
> is enough to indicate message boundaries.
I think, if i'll add some serializer to 'write()', then message ID is unneeded.
>
> What do you think?
>
> Stefan

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

