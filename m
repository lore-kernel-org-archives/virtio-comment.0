Return-Path: <sgarzare@redhat.com>
Date: Tue, 8 Feb 2022 12:37:31 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v10 0/3] virtio-vsock: SOCK_SEQPACKET description
Message-ID: <20220208113731.iq4bb4imhmzh7yoo@step1g3>
References: <20220105163505.192146-1-sgarzare@redhat.com>
 <20220204064424-mutt-send-email-mst@kernel.org>
 <20220207113559.nut5dt5ma67xzifw@step1g3>
 <20220207084422-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220207084422-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, cohuck@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Feb 07, 2022 at 08:45:43AM -0500, Michael S. Tsirkin wrote:
>On Mon, Feb 07, 2022 at 12:35:59PM +0100, Stefano Garzarella wrote:
>> On Fri, Feb 04, 2022 at 06:57:10AM -0500, Michael S. Tsirkin wrote:
>> > On Wed, Jan 05, 2022 at 05:35:02PM +0100, Stefano Garzarella wrote:
>> > > v9: https://markmail.org/message/4s6kfbeblxw4vzk4
>> > >
>> > > Linux kernel and QEMU already merged SOCK_SEQPACKET support,
>> > > so I'm resending Arseny's patches to have consistent virtio-spec
>> > > and implementation.
>> > >
>> > > I added patch 2, following the discussion about F_STREAM feature bit:
>> > > https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
>> > >
>> > > About patch 2, the vhost-vsock device in the Linux kernel doesn't set bit 0
>> > > (F_STREAM), so at this point I don't know if it's better to use a negative
>> > > feature flag (e.g. F_NO_STREAM) or we go for F_STREAM and send a patch to
>> > > linux-stable (and QEMU?) to solve this issue.
>> > >
>> > > Thanks,
>> > > Stefano
>> >
>> > I thought a lot about this.  Given things are in the field, I think
>> > fundamentally F_NO_STREAM is a good idea,
>>
>> Yep, last weeks, I've been trying to write patches for QEMU and Linux to
>> align with the spec, but actually using just F_STREAM or a
>> F_SEQPACKET/F_STREAM combination is a little confusing.
>>
>> > however I think maybe
>> > we should split it:
>> > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM meaning "stream is not implied"
>> > VIRTIO_VSOCK_F_STREAM meaning "stream is supported"
>>
>> Yes, that's probably the best thing to do.
>>
>> What do you think if we use a more generic VIRTIO_VSOCK_F_NO_IMPLIED_TYPES
>> meaning "support of any socket types is not implied" ?
>
>Fine too.
>
>> Maybe it's superfluous since we only supported STREAM, but from the point of
>> view of the final result of the specifications, it should be clearer... But
>> if it is not set we imply that STREAM is supported, so no, maybe better
>> VIRTIO_VSOCK_F_NO_IMPLIED_STREAM.
>
>my thinking too.
>
>> Can we make this change before the release of 1.2?
>>
>> Stefano
>
>I don't think we should rush it into 1.2, but we can just
>fork 1.next and merge it for 1.3
>

Okay, so if it's ok with you, I can send a followup patch later.

Thanks,
Stefano

