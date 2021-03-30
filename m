Return-Path: virtio-comment-return-1806-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C2A7986299
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Mar 2021 07:55:37 +0000 (UTC)
References: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
 <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
 <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
 <230d95fd-29e8-465b-0ab2-b406d614c11b@kaspersky.com>
 <20210329212818.qdeprjhep745yeur@steredhat>
 <d6d92105-f7d4-74a3-4acc-fcfb40872b76@kaspersky.com>
 <20210330073210.cxur42unvhbsux5e@steredhat>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <135f1de6-a2d1-4046-c1aa-357f1acb5c7f@kaspersky.com>
Date: Tue, 30 Mar 2021 10:55:31 +0300
MIME-Version: 1.0
In-Reply-To: <20210330073210.cxur42unvhbsux5e@steredhat>
Subject: [virtio-comment] Re: [MASSMAIL KLMS] Re: [virtio-comment] Re: [MASSMAIL KLMS] Re:
 [virtio-comment] [RFC PATCH v4 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 30.03.2021 10:32, Stefano Garzarella wrote:
> On Tue, Mar 30, 2021 at 09:15:39AM +0300, Arseny Krasnov wrote:
>> On 30.03.2021 00:28, Stefano Garzarella wrote:
>>> On Mon, Mar 29, 2021 at 08:33:27PM +0300, Arseny Krasnov wrote:
>>>> On 29.03.2021 19:11, Stefan Hajnoczi wrote:
>>>>> On Fri, Mar 26, 2021 at 12:02:50PM +0300, Arseny Krasnov wrote:
>>>>>> This adds description of SOCK_SEQPACKET socket type
>>>>>> support for virtio-vsock.
>>>>>>
>>>>>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>>>>>> ---
>>>>>>  virtio-vsock.tex | 65 +++++++++++++++++++++++++++++++++++++++++++--=
---
>>>>>>  1 file changed, 59 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>>>>>> index ad57f9d..c366de7 100644
>>>>>> --- a/virtio-vsock.tex
>>>>>> +++ b/virtio-vsock.tex
>>>>>> @@ -17,6 +17,10 @@ \subsection{Virtqueues}\label{sec:Device Types / =
Socket Device / Virtqueues}
>>>>>>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / =
Feature bits}
>>>>>>
>>>>>>  There are currently no feature bits defined for this device.
>>>>> ^ This line is now out of date :)
>>>> Ack
>>>>>> +\begin{description}
>>>>>> +\item VIRTIO_VSOCK_F_SEQPACKET (0) SOCK_SEQPACKET socket type is
>>>>>> +    supported.
>>>>>> +\end{description}
>>>>>>
>>>>>>  \subsection{Device configuration layout}\label{sec:Device Types / S=
ocket Device / Device configuration layout}
>>>>>>
>>>>>> @@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Device T=
ypes / Socket Device / Device Op
>>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
>>>>>>  /* Request the peer to send the credit info to us */
>>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
>>>>>> +/* Message begin for SOCK_SEQPACKET */
>>>>>> +#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
>>>>>> +/* Message end for SOCK_SEQPACKET */
>>>>>> +#define VIRTIO_VSOCK_OP_SEQ_END        9
>>>>> The struct virtio_vsock_hdr->flags field is le32 and currently unused=
.
>>>>> Could 24 bits be used for a unique message id and 8 bits for flags? 1
>>>>> flag bit could be used for end-of-message and the remaining 7 bits co=
uld
>>>>> be reserved. That way SEQ_BEGIN and SEQ_END are not necessary.
>>>>> Pressure
>>>>> on the virtqueue would be reduced and performance should be comparabl=
e
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
>>
> This is true, but where can a packet be lost?
>
> The channel is lossless, so it can be lost either by the transmitter or=
=20
> the receiver, but only in critical cases where for example the whole=20
> system has run out of memory, but in this case we can't do much, maybe=20
> only reset the connection.

I think, in this case i also can remove 'msg_id', keeping only EOR

bit in flags of RW packet. Because it is a little bit strange, to use

'msg_id', which=A0 purpose is to maintain integrity of message,

while 'msg_len' which was added for the same, was removed.

Usage of 'msg_id' allows to detect missing of last EOR packet.

Use of 'msg_len' allows to detect missing of first packet or some RW

packets in the middle of message.

So may be i will use only special EOR bit in flags?

>
> Thanks,
> Stefano
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>

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

