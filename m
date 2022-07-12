Return-Path: <sgarzare@redhat.com>
Date: Tue, 12 Jul 2022 11:01:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [virtio-comment] [PATCH] virtio-vsock: add
 VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit
Message-ID: <20220712090110.qj7vyucnylir6bf6@sgarzare-redhat>
References: <20220708133923.46608-1-sgarzare@redhat.com>
 <87zghf6emg.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87zghf6emg.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, bobby.eshleman@bytedance.com, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, jiang.wang@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jul 11, 2022 at 02:03:03PM +0200, Cornelia Huck wrote:
>On Fri, Jul 08 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
>> Initially virtio-vsock only supported the stream type, which is why
>> there was no feature. Later we added the seqpacket type and in the future
>> we may have other types (e.g. datagram).
>>
>> seqpacket is an extension of stream, so it might be implied that if
>> seqpacket is supported, stream is too, but this might not be true for
>> other types.
>>
>> As we discussed here [1] should be better to add a new
>> VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit to avoid this implication.
>>
>> Let's also add normative sections to better define the behavior when
>> VIRTIO_VSOCK_F_NO_IMPLIED_STREAM is negotiated or not.
>>
>> [1] http://markmail.org/message/2s3qd74drgjxkvte
>>
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>
>> The two normative sections seem repetitive, I don't know whether it's
>> better to have the "If ..." parts only in one section.
>>
>> Suggestions?
>> ---
>>  virtio-vsock.tex | 30 ++++++++++++++++++++++++++----
>>  1 file changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>> index d79984d..45f041a 100644
>> --- a/virtio-vsock.tex
>> +++ b/virtio-vsock.tex
>> @@ -16,15 +16,37 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>>
>>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>>
>> -If no feature bit is set, only stream socket type is supported.
>> -If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the device MAY act
>> -as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
>> -
>>  \begin{description}
>>  \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>>  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>> +\item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
>>  \end{description}
>>
>> +\drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>> +
>> +The driver SHOULD accept the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature if
>> +offered by the device.
>> +
>> +If the device does not offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature
>> +bit, and if no feature bit has been negotiated, the driver SHOULD act as if
>> +VIRTIO_VSOCK_F_STREAM has been negotiated.
>> +
>> +If the device does not offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature
>> +bit, and if VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the driver MAY act
>> +as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
>
>These statements talk about what happens if the device did not offer
>NO_IMPLIED_STREAM in the first place; we instruct that the driver SHOULD
>accept the flag, but do we still need to define what is supposed to
>happen if the driver does not, after all, accept NO_IMPLIED_STREAM?
>
>That would make the statements "If no feature bit has been negotiated,
>..." and "If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, but not
>VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, ...", which is also a bit shorter (and
>less repetivive :)

Yep, much better!

>
>> +
>> +\devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>> +
>> +The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
>> +
>> +If the driver does not accept the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature
>> +bit, and if no feature bit has been negotiated, the device SHOULD act as if
>> +VIRTIO_VSOCK_F_STREAM has been negotiated.
>
>Maybe make this "If no feature bit has been negotiated, ..." (similar
>reasoning as above)?

Agree.

>
>> +
>> +If the driver does not accept the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature
>> +bit, and if VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the device MAY act
>> +as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
>
>And maybe "If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, but not
>VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, ..." here as well.

Yep.

>
>> +
>>  \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>>
>>  Socket device configuration uses the following layout structure:
>
>In any case, the new conformance sections need to be hooked up in
>conformance.tex.
>

Ooops, I'll do in the next version!

Thanks for the review,
Stefano

