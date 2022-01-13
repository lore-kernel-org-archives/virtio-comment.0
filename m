Return-Path: <sgarzare@redhat.com>
MIME-Version: 1.0
References: <20220112170936.245410-1-sgarzare@redhat.com> <87fsprx63i.fsf@redhat.com>
 <20220113112203.pgwfwtnqti2g4xap@steredhat> <87czkvx41v.fsf@redhat.com>
 <20220113135758.nifr7hftqh57viku@steredhat> <877db3wwzl.fsf@redhat.com> <20220113100847-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220113100847-mutt-send-email-mst@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 13 Jan 2022 17:33:25 +0100
Message-ID: <CAGxU2F5sbOmnehjv-Tj1h6iqZ4CvFTknkPKD6xCK78-aPW4fuA@mail.gmail.com>
Subject: Re: [PATCH v11 0/3] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain; charset="UTF-8"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 13, 2022 at 4:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jan 13, 2022 at 03:06:54PM +0100, Cornelia Huck wrote:
> > On Thu, Jan 13 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > > On Thu, Jan 13, 2022 at 12:34:20PM +0100, Cornelia Huck wrote:
> > >>> Otherwise maybe we should write in the spec that if F_SEQPACKET is set
> > >>> this means that stream is supported even if F_STREAM is not set.
> > >>
> > >>Yes, if that works, it would probably be the less ugly option.
> > >
> > > Okay, let's go for F_STREAM (even Michael's comment seems to agree with
> > > that).
> > >
> > > Do you think we need to write this implication into the specification,
> > > or do we leave it to the implementation to solve this transient problem?
> >
> > I would add something like "if F_SEQPACKET has been negotiated, the
> > [device|driver] MUST act as if F_STREAM has also been negotiated".
>
> I don't think it's necessary really. A couple of months of drivers
> do not constitute a legacy that we have to maintain for ever if
> the failure mode is graceful enough.
> Certainly not for the driver,
> and even for device I'd make it MAY, i.e. device can allow
> a driver to create stream sockets without negotiating properly.

Ack, I'll use MAY and only for the device in v12.

Thanks,
Stefano

