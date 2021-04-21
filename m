Return-Path: virtio-comment-return-1826-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ADF2B9864A5
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Apr 2021 07:45:30 +0000 (UTC)
Date: Wed, 21 Apr 2021 09:45:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20210421074523.s7wna25hsy65vc75@steredhat>
References: <20210413125217.3416876-1-arseny.krasnov@kaspersky.com>
 <20210413125333.3419315-1-arseny.krasnov@kaspersky.com>
 <20210413090642-mutt-send-email-mst@kernel.org>
 <92a6b268-a36a-5f1b-2d67-02accfde70ce@kaspersky.com>
 <20210413155316-mutt-send-email-mst@kernel.org>
 <783d12e5-50b6-2363-f953-bc95d4b59d72@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <783d12e5-50b6-2363-f953-bc95d4b59d72@kaspersky.com>
Subject: [virtio-comment] Re: [RFC PATCH v5 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Apr 14, 2021 at 09:04:47AM +0300, Arseny Krasnov wrote:
>
>On 13.04.2021 22:55, Michael S. Tsirkin wrote:
>> On Tue, Apr 13, 2021 at 05:22:44PM +0300, Arseny Krasnov wrote:
>>> On 13.04.2021 16:10, Michael S. Tsirkin wrote:
>>>> On Tue, Apr 13, 2021 at 03:53:29PM +0300, Arseny Krasnov wrote:
>>>>> This adds description of SOCK_SEQPACKET socket type
>>>>> support for virtio-vsock.
>>>>>
>>>>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>>>>> ---
>>>>>  virtio-vsock.tex | 26 +++++++++++++++++++++-----
>>>>>  1 file changed, 21 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>>>>> index ad57f9d..00e59cc 100644
>>>>> --- a/virtio-vsock.tex
>>>>> +++ b/virtio-vsock.tex
>>>>> @@ -16,7 +16,10 @@ \subsection{Virtqueues}\label{sec:Device Types / S=
ocket Device / Virtqueues}
>>>>>
>>>>>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / F=
eature bits}
>>>>>
>>>>> -There are currently no feature bits defined for this device.
>>>>> +\begin{description}
>>>>> +\item VIRTIO_VSOCK_F_SEQPACKET (0) SOCK_SEQPACKET socket type is
>>>>> +    supported.
>>>> Does it make sense to only support seqpacket and not stream?
>>>> I am guessing not since seqpacket is more or less
>>>> a superset ...
>>> You mean, this sentence must be "Both SOCK_SEQPACKET and SOCK_STREAM ty=
pes
>>>
>>> are supported"?
>>
>> No. I am asking whether we want a feature bit for SOCK_STREAM too?
>
>I think=A0 there is no practical sense in SOCK_STREAM bit, because SOCK_SE=
QPACKET
>
>is stream + message boundaries and potential DGRAM is completely different
>
>thing. Of course i can implement it in my patches and also add it to spec =
patch, but=A0 i see only
>
>esthetic in this: all three socket types have own feature bits.
>

I agree that it may make sense to have a bit for SOCK_STREAM. For=20
example we may have devices in the future that want to implement only=20
DGRAM for simplicity.

I'm just worried about backwards compatibility with current devices=20
where we don't have any feature bit.

Should we add a negative feature flag? (e.g. VIRTIO_VSOCK_F_NO_STREAM)
I don't like it much, but I can't think of anything better.

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

