Return-Path: <virtio-return-3605-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20211022013520.1a92ebfe.pasic@linux.ibm.com>
References: <20211011113828.309458-1-cohuck@redhat.com>
 <CACGkMEtb8P76pu0VM+B-Dt1BMi1edxv18BmAN0S6Z6_vHLHKSA@mail.gmail.com>
 <87sfx6wl0i.fsf@redhat.com>
 <a8481ea4-31a8-149d-70df-6ccabdf8bce9@redhat.com>
 <87h7dlwgqm.fsf@redhat.com> <87lf2ms5wo.fsf@redhat.com>
 <20211022013520.1a92ebfe.pasic@linux.ibm.com>
Date: Mon, 25 Oct 2021 09:34:02 +0200
Message-ID: <87czntsglx.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio] Re: [PATCH] ccw: clarify device reset
Content-Type: text/plain
To: Halil Pasic <pasic@linux.ibm.com>
Cc: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Oct 22 2021, Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 21 Oct 2021 18:23:51 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> >
>> > Halil, do you know if this has moved somewhere else? If yes, we need to
>> > update the link.  
>> 
>
> I can't remember they told me about moving it ;)
>
> I've found this one, and my guess is it works form the outside:
>
> https://www.ibm.com/resources/publications/OutputPubsDetails?PubID=SA22720401

Hm, this one is accessible; however, the 'view' link leads to the same
500 again, and the 'download' link does not seem to do anything for me...

>
>
>> Also, do you have any feedback on this patch?
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

Right, chaining something else to reset was not something that I had
considered. I basically wanted a condition that says "the device has
finished processing the reset ccw, and the driver has a way of knowing
about this." The driver can find out by looking at the ccw address in
the scsw, but has to keep the complicated rules for validity of that
field in mind; that might be too esoteric for the virtio spec. Maybe

"If the reset command is the last or only channel command in the command
chain, the device signals completion..."

Or is simply enough to note that reset is done once the device has
processed the reset ccw? We should not need to explain the fine details
of channel I/O processing in the spec.

>
> Another interesting question for the reset is system boundary. I.e. what
> exactly is reset.  Some publications describe possible electric
> signaling interfaces, and I doubt this kind of a reset would be a
> complete reset of the device from that perspective. But that  question is
> not what this patch is about. It just came to my mind.

As Jason noted in his mail, that's just virtio-specific reset.

>
> Sorry guys I'm already with one foot in vacation. This is the extent to
> which I can contribute right now.

Enjoy your vacation!


---------------------------------------------------------------------
To unsubscribe from this mail list, you must leave the OASIS TC that 
generates this mail.  Follow this link to all your TCs in OASIS at:
https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php 

