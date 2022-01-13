Return-Path: <mst@redhat.com>
Date: Thu, 13 Jan 2022 08:19:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v11 0/3] virtio-vsock: SOCK_SEQPACKET description
Message-ID: <20220113081602-mutt-send-email-mst@kernel.org>
References: <20220112170936.245410-1-sgarzare@redhat.com>
 <87fsprx63i.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87fsprx63i.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, virtio-comment@lists.oasis-open.org, arseny.krasnov@kaspersky.com, stefanha@redhat.com, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 13, 2022 at 11:50:09AM +0100, Cornelia Huck wrote:
> On Wed, Jan 12 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:
> 
> > v11:
> > - reworked "Message and record boundaries" paragraph [stefanha]
> >
> > v10: https://markmail.org/message/aebu4zqp4kxdm4ej
> >
> > Linux kernel and QEMU already merged SOCK_SEQPACKET support,
> > so I'm resending Arseny's patches to have consistent virtio-spec
> > and implementation.
> 
> It really should not have been merged without a spec :( But now that it
> has happened already, we need to get a proper spec added sooner rather
> than later, and it would be nice if it could make virtio 1.2, which
> would mean that voting needs to start this week.
> 
> (I don't see an issue at https://github.com/oasis-tcs/virtio-spec/issues
> yet; creating one would be an obvious pre-req.)
> 
> >
> > I added patch 2, following the discussion about F_STREAM feature bit:
> > https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
> >
> > About patch 2, the vhost-vsock device in the Linux kernel doesn't set bit 0
> > (F_STREAM), so at this point I don't know if it's better to use a negative
> > feature flag (e.g. F_NO_STREAM) or we go for F_STREAM and send a patch to
> > linux-stable (and QEMU?) to solve this issue.
> 
> I fear that even with a patch for stable, there can still be old setups
> around for which "only F_SEQPACKET set" translates to "supports both
> stream and seqpacket"... so I guess it mostly becomes a question of
> whether ignoring those broken setups is tolerable. (The old setups not
> setting any feature bits are fine with the proposed patch.)

It's only been there since 5.14. If we fix it in 5.17 then I think
it's tolerable. And the broken part just would mean creating
sockets does not work, so easy to debug.

> Using a
> negative feature bit is uglier, but also clearer. I suppose we want to
> be able to make stream sockets optional? If so, I think the negative
> approach is the better option, unless we can live with some broken
> setups.

I think we can live with broken setups personally. new features
are often broken in linux, c'est la vie.

-- 
MST

