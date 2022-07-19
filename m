Return-Path: <sgarzare@redhat.com>
Date: Tue, 19 Jul 2022 10:04:15 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [External] [PATCH v2] virtio-vsock: add
 VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit
Message-ID: <20220719080415.36faik2cic7tzvhm@sgarzare-redhat>
References: <20220718142653.42310-1-sgarzare@redhat.com>
 <CALa-AnDWjE67j0RMg3kaErLLEL+qgos4XxJDYHY_uB3T7+heCg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALa-AnDWjE67j0RMg3kaErLLEL+qgos4XxJDYHY_uB3T7+heCg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Cc: virtio-comment@lists.oasis-open.org, jiang.wang@bytedance.com, Stefan Hajnoczi <stefanha@redhat.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Bobby,

On Mon, Jul 18, 2022 at 11:17:26AM -0700, Bobby Eshleman wrote:
>Hey Stefano,
>
>Please excuse the late reply to this thread.

No problems at all!

>
>I am trying to think through the imagined usage of this bit. Following the
>referenced threads,
>I am not sure I can clearly see under what version combinations of
>driver/device that the bit will be used.
>

The main reason is to continue to support the current implementation.

If we had F_STREAM from the beginning when we introduced virtio-vsock, 
then there would have been no need for F_NO_IMPLIED_STREAM, but 
unfortunately, that was not the case.

If we look at the current implementation in Linux (virtio-vsock and 
vhost-vsock), F_STREAM is not negotiated. We added it in the 
specification, but not yet implemented.

That's because the driver and device were designed to support only 
stream sockets, so it was implied as a feature.
Then we added seqpacket, which is somehow an extension of stream 
sockets, so we only negotiated F_SEQPACKET (unfortunately we merged the 
patch too early before we better defined F_STREAM). Leaving support for 
stream sockets implied.

At this point we realized that if we would add another type, completely 
unrelated to stream (e.g. datagram), it would be complicated to 
negotiate only datagram support without stream.

>Given that feature bits being zero imply stream support, and
>VIRTIO_VSOCK_F_{STREAM,SEQPACKET,DGRAM}
>all existing (dgram in the future), how does NO_IMPLIED_STREAM=1 differ
>from STREAM=0, SEQPACKET=0,
>and DGRAM=1 (for example)?

Unfortunately, even when the feature bits are non-zero (F_SEQPACKET 
negotiated), we still support stream sockets implicitly.

So adding F_NO_IMPLIED_STREAM, just to make sure that if F_STREAM is not 
negotiated, then really the device/driver doesn't support it.
As we wrote in the specification, all drivers and devices in the future 
should negotiate F_NO_IMPLIED_STREAM to avoid ambiguity.

It's basically a way to be compatible with the current implementation 
and have backward compatibility in the future.

Thanks,
Stefano

