Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <20211011113828.309458-1-cohuck@redhat.com> <CACGkMEtb8P76pu0VM+B-Dt1BMi1edxv18BmAN0S6Z6_vHLHKSA@mail.gmail.com>
 <87sfx6wl0i.fsf@redhat.com> <a8481ea4-31a8-149d-70df-6ccabdf8bce9@redhat.com>
 <87h7dlwgqm.fsf@redhat.com> <87lf2ms5wo.fsf@redhat.com> <20211022013520.1a92ebfe.pasic@linux.ibm.com>
In-Reply-To: <20211022013520.1a92ebfe.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 25 Oct 2021 09:29:20 +0800
Message-ID: <CACGkMEvD1yihytUSarjqD2NjrUv_=YsM82pvG0OnhaqRqq1iWg@mail.gmail.com>
Subject: Re: [virtio] Re: [PATCH] ccw: clarify device reset
Content-Type: text/plain; charset="UTF-8"
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Oct 22, 2021 at 7:35 AM Halil Pasic <pasic@linux.ibm.com> wrote:
>
> On Thu, 21 Oct 2021 18:23:51 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
>
> > >
> > > Halil, do you know if this has moved somewhere else? If yes, we need to
> > > update the link.
> >
>
> I can't remember they told me about moving it ;)
>
> I've found this one, and my guess is it works form the outside:
>
> https://www.ibm.com/resources/publications/OutputPubsDetails?PubID=SA22720401
>
>
> > Also, do you have any feedback on this patch?
>
> I didn't see anything obviously wrong.
>
> """
> +The device signals completion of the reset operation by making the subchannel
> +status pending to indicate successful completion of the channel command.
> """
>
> may be little ambiguous. IMHO the point we should make is that the
> successful completion of the virtio reset happens before the
> successful completion of the ccw that requested the operation. "Status
> pending" is a little broad. We could get status pending with something
> like alert status, at least in theory. And if somebody silly would put
> the reset command with more commands following it in a channel program,
> we would not have to wait for the channel to complete and to see a status pending
> indicated at the subchannel.
>
> Another interesting question for the reset is system boundary. I.e. what
> exactly is reset.  Some publications describe possible electric
> signaling interfaces, and I doubt this kind of a reset would be a
> complete reset of the device from that perspective. But that  question is
> not what this patch is about. It just came to my mind.

Since virtio is built on top of the transport. I think the lower level
(transport) reset implies a virtio reset.

Thanks

>
> Sorry guys I'm already with one foot in vacation. This is the extent to
> which I can contribute right now.
>
> Regards,
> Halil
>

