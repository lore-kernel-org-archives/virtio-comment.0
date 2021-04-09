Return-Path: virtio-comment-return-1815-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC6CB986405
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Apr 2021 14:27:14 +0000 (UTC)
Date: Fri, 9 Apr 2021 16:27:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20210409142705.xsp56d5negdww6lc@steredhat>
References: <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
 <230d95fd-29e8-465b-0ab2-b406d614c11b@kaspersky.com>
 <20210329212818.qdeprjhep745yeur@steredhat>
 <d6d92105-f7d4-74a3-4acc-fcfb40872b76@kaspersky.com>
 <YGLnfAxvy83jLkmG@stefanha-x1.localdomain>
 <2061f2ab-f3fc-c059-7cfc-a34b06f061fe@kaspersky.com>
 <YGMuVWL1waLpTkFI@stefanha-x1.localdomain>
 <64023aef-2e6b-b4bf-6569-ea71f7ee53de@kaspersky.com>
 <YGSLreQSCe5CBZbY@stefanha-x1.localdomain>
 <486fe58d-4472-d5e6-11d9-062408c59c1e@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <486fe58d-4472-d5e6-11d9-062408c59c1e@kaspersky.com>
Subject: Re: [virtio-comment] Re: [MASSMAIL KLMS] Re: [virtio-comment] Re:
 [MASSMAIL KLMS] Re: [virtio-comment] [RFC PATCH v4 2/2] virtio-vsock:
 SOCK_SEQPACKET description
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sat, Apr 03, 2021 at 12:45:54PM +0300, Arseny Krasnov wrote:
>
>On 31.03.2021 17:48, Stefan Hajnoczi wrote:
>> On Tue, Mar 30, 2021 at 05:24:19PM +0300, Arseny Krasnov wrote:
>>> On 30.03.2021 16:57, Stefan Hajnoczi wrote:
>>>> On Tue, Mar 30, 2021 at 12:50:06PM +0300, Arseny Krasnov wrote:
>>>>> On 30.03.2021 11:55, Stefan Hajnoczi wrote:
>>>>>> On Tue, Mar 30, 2021 at 09:15:39AM +0300, Arseny Krasnov wrote:
>>>>>>> On 30.03.2021 00:28, Stefano Garzarella wrote:
>>>>>>>> On Mon, Mar 29, 2021 at 08:33:27PM +0300, Arseny Krasnov wrote:
>>>>>>>>> On 29.03.2021 19:11, Stefan Hajnoczi wrote:
>>>>>>>>>> On Fri, Mar 26, 2021 at 12:02:50PM +0300, Arseny Krasnov wrote:
>>>>>>>>>>> @@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Dev=
ice Types / Socket Device / Device Op
>>>>>>>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
>>>>>>>>>>>  /* Request the peer to send the credit info to us */
>>>>>>>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
>>>>>>>>>>> +/* Message begin for SOCK_SEQPACKET */
>>>>>>>>>>> +#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
>>>>>>>>>>> +/* Message end for SOCK_SEQPACKET */
>>>>>>>>>>> +#define VIRTIO_VSOCK_OP_SEQ_END        9
>>>>>>>>>> The struct virtio_vsock_hdr->flags field is le32 and currently u=
nused.
>>>>>>>>>> Could 24 bits be used for a unique message id and 8 bits for fla=
gs? 1
>>>>>>>>>> flag bit could be used for end-of-message and the remaining 7 bi=
ts could
>>>>>>>>>> be reserved. That way SEQ_BEGIN and SEQ_END are not necessary.
>>>>>>>>>> Pressure
>>>>>>>>>> on the virtqueue would be reduced and performance should be comp=
arable
>>>>>>>>>> to SOCK_STREAM.
>>>>>>>>> Well, my first versions of SOCK_SEQPACKET implementation, worked
>>>>>>>>> something like this: i used flags field of header as length of wh=
ole
>>>>>>>>> message. I discussed it with Stefano Garzarella, and he told that=
 it
>>>>>>>>> will
>>>>>>>>> be better to use special "header" in packet's payload, to keep so=
me
>>>>>>>>> SOCK_SEQPACKET specific data, instead of reusing packet's header
>>>>>>>>> fields.
>>>>>>>> IIRC in the first implementation SEQ_BEGIN was an empty message an=
d we
>>>>>>>> didn't added the msg_id yet. So since we needed to carry both id a=
nd
>>>>>>>> total length, I suggested to use the payload to put these extra
>>>>>>>> information.
>>>>>>>>
>>>>>>>> IIUC what Stefan is suggesting is a bit different and I think it s=
hould
>>>>>>>> be cool to implement: we can remove the boundary packets, use only=
 8
>>>>>>>> bits for the flags, and add a new field to reuse the 24 unused bit=
s,
>>>>>>>> maybe also 16 bits would be enough.
>>>>>>>> At that point we will only use the EOR flag to know the last packe=
t.
>>>>>>>>
>>>>>>>> The main difference will be that the receiver will know the total =
size
>>>>>>>> only when the last packet is received.
>>>>>>>>
>>>>>>>> Do you see any issue on that approach?
>>>>>>> It will work, except we can't check that any packet of message,
>>>>>>>
>>>>>>> except last(with EOR bit) was dropped, since receiver don't know
>>>>>>>
>>>>>>> real length of message. If it is ok, then i can implement it.
>>>>>> The credit mechanism ensures that packets are not dropped, so it's n=
ot
>>>>>> necessary to check for this condition.
>>>>>>
>>>>>> By the way, is a unique message ID needed? My understanding is:
>>>>>>
>>>>>> If two messages are being sent on a socket at the same time either t=
heir
>>>>>> order is serialized (whichever message began first) or it is undefin=
ed
>>>>>> (whichever message completes first).
>>>>> If we are talking about case, when two threads writes to one socket a=
t the same time,
>>>>>
>>>>> in Linux it is possible that two message will interleave(for vsock). =
But as i know, for example
>>>>>
>>>>> when TCP socket is used, both 'write()' calls will be serialized. May=
 be it is bug of vsock: when
>>>>>
>>>>> first writer goes out of space, it will sleep. Then second writer tri=
es to send something, but
>>>>>
>>>>> as free space is over, it will sleep too. Then, credit update is rece=
ived from peer. Both sender's
>>>>>
>>>>> will be woken up, but sender which grab socket lock first will contin=
ue to send it's message.
>>>>>
>>>>> So may be we can add something like semaphore to new/vmw_vsock/af_vso=
ck.c which will
>>>>>
>>>>> serialize two 'write()' calls: second sender enters 'write()' path, o=
nly when first left this path.
>>>>>
>>>>> My implementation doesn't care about that, because i wanted to add se=
maphore later, by another
>>>>>
>>>>> patch.
>>>> Yes, that is definitely an issue that the driver needs to take care of
>>>> if we don't have unique message IDs. Thanks for explaining!
>>> So may I=A0 include patch with serializer to next version of my patchse=
t?
>> Sounds good!
>
>There is small problem with approach, when we remove SEQ_BEGIN/SEQ_END=20
>
>bounds of messages in flags field(EOR bit ) of packet header: consider cas=
e, when vhost sends data
>
>to guest(let it be 64kb). In vhost vsock driver, big buffer of packet(for =
example 64kb) will
>
>be splitted to small buffers, to fit guests's virtio rx descriptors(in cur=
rent implementation of
>
>Linux it is 4kb). All fields of new headers in rx queue will be copied fro=
m fields of header
>
>of big packet(except len field).=A0 Thus we get 16 headers with=A0 EOR bit=
 set.
>set.
>
>
>May be it is possible to:
>
>1) Handle such bit in vhost driver(set EOR bit in flags only for last smal=
l buffer of guests rx queue)
>
>OR
>
>2) I can remove SEQ_BEGIN, msg_len and msg_id. But keep SEQ_END op. This w=
ill be special
>
>packet which marks end of message without any payload. In this case, such =
packet will be
>
>processed by vhost "as is".
>
>
>What do You think?
>

IMHO option 1 is the best and should not be too complicated to=20
implement.

Do you see a specific issue?

Thanks,
Stefano


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

