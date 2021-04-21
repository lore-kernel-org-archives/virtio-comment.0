Return-Path: virtio-comment-return-1830-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9C77D9864A6
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Apr 2021 15:09:26 +0000 (UTC)
References: <20210413125217.3416876-1-arseny.krasnov@kaspersky.com>
 <20210413125333.3419315-1-arseny.krasnov@kaspersky.com>
 <20210413090642-mutt-send-email-mst@kernel.org>
 <92a6b268-a36a-5f1b-2d67-02accfde70ce@kaspersky.com>
 <20210413155316-mutt-send-email-mst@kernel.org>
 <783d12e5-50b6-2363-f953-bc95d4b59d72@kaspersky.com>
 <20210421074523.s7wna25hsy65vc75@steredhat>
 <20210421042335-mutt-send-email-mst@kernel.org>
 <20210421095425.3bkixnasl34g3t5p@steredhat>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <acd87b8c-f030-f757-130e-edab0e460cce@kaspersky.com>
Date: Wed, 21 Apr 2021 18:09:21 +0300
MIME-Version: 1.0
In-Reply-To: <20210421095425.3bkixnasl34g3t5p@steredhat>
Subject: Re: [virtio-comment] Re: [RFC PATCH v5 2/2] virtio-vsock:
 SOCK_SEQPACKET description
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 21.04.2021 12:54, Stefano Garzarella wrote:
> On Wed, Apr 21, 2021 at 04:24:36AM -0400, Michael S. Tsirkin wrote:
>> On Wed, Apr 21, 2021 at 09:45:23AM +0200, Stefano Garzarella wrote:
>>> On Wed, Apr 14, 2021 at 09:04:47AM +0300, Arseny Krasnov wrote:
>>>> On 13.04.2021 22:55, Michael S. Tsirkin wrote:
>>>>> On Tue, Apr 13, 2021 at 05:22:44PM +0300, Arseny Krasnov wrote:
>>>>>> On 13.04.2021 16:10, Michael S. Tsirkin wrote:
>>>>>>> On Tue, Apr 13, 2021 at 03:53:29PM +0300, Arseny Krasnov wrote:
>>>>>>>> This adds description of SOCK_SEQPACKET socket type
>>>>>>>> support for virtio-vsock.
>>>>>>>>
>>>>>>>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>>>>>>>> ---
>>>>>>>>  virtio-vsock.tex | 26 +++++++++++++++++++++-----
>>>>>>>>  1 file changed, 21 insertions(+), 5 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>>>>>>>> index ad57f9d..00e59cc 100644
>>>>>>>> --- a/virtio-vsock.tex
>>>>>>>> +++ b/virtio-vsock.tex
>>>>>>>> @@ -16,7 +16,10 @@ \subsection{Virtqueues}\label{sec:Device Types =
/ Socket Device / Virtqueues}
>>>>>>>>
>>>>>>>>  \subsection{Feature bits}\label{sec:Device Types / Socket Device =
/ Feature bits}
>>>>>>>>
>>>>>>>> -There are currently no feature bits defined for this device.
>>>>>>>> +\begin{description}
>>>>>>>> +\item VIRTIO_VSOCK_F_SEQPACKET (0) SOCK_SEQPACKET socket type is
>>>>>>>> +    supported.
>>>>>>> Does it make sense to only support seqpacket and not stream?
>>>>>>> I am guessing not since seqpacket is more or less
>>>>>>> a superset ...
>>>>>> You mean, this sentence must be "Both SOCK_SEQPACKET and SOCK_STREAM=
 types
>>>>>>
>>>>>> are supported"?
>>>>> No. I am asking whether we want a feature bit for SOCK_STREAM too?
>>>> I think=A0 there is no practical sense in SOCK_STREAM bit, because SOC=
K_SEQPACKET
>>>>
>>>> is stream + message boundaries and potential DGRAM is completely diffe=
rent
>>>>
>>>> thing. Of course i can implement it in my patches and also add it to s=
pec patch, but=A0 i see only
>>>>
>>>> esthetic in this: all three socket types have own feature bits.
>>>>
>>> I agree that it may make sense to have a bit for SOCK_STREAM. For examp=
le we
>>> may have devices in the future that want to implement only DGRAM for
>>> simplicity.
>>>
>>> I'm just worried about backwards compatibility with current devices whe=
re we
>>> don't have any feature bit.
>>>
>>> Should we add a negative feature flag? (e.g. VIRTIO_VSOCK_F_NO_STREAM)
>>> I don't like it much, but I can't think of anything better.
>>>
>>> Thanks,
>>> Stefano
>> We can simply specify that if there are no feature bits at all then
>> stream is assumed supported.
>>
> oh yeah, that sounds like a good idea!

So it is not necessary for my SEQPACKET patchset to support STREAM in both

kernel and spec?


Thank, Arseny

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

