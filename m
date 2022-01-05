Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Date: Wed, 05 Jan 2022 14:52:46 +0100
Message-ID: <1666446.X5bIldzbpb@silver>
In-Reply-To: <87ilv13qgm.fsf@redhat.com>
References: <cover.1639494803.git.qemu_oss@crudebyte.com> <1920878.uA8gqIOdmR@silver> <87ilv13qgm.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Montag, 3. Januar 2022 14:21:13 CET Cornelia Huck wrote:
> On Wed, Dec 29 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Donnerstag, 23. Dezember 2021 12:03:50 CET Cornelia Huck wrote:
> >> On Wed, Dec 15 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> 
wrote:
> >> > On Dienstag, 14. Dezember 2021 18:20:28 CET Cornelia Huck wrote:
> >> >> Also, this is only for split ring; does packed ring need any updates?
> >> > 
> >> > I have not reviewed the packed ring as much as I did the split ring, so
> >> > I
> >> > could not say reliably all the parts that shall be updated for the
> >> > packed
> >> > ring. There are some obvious parts like:
> >> > 
> >> > 2.7.5 Scatter-Gather Support
> >> > 
> >> > "The device limits the number of descriptors in a list through a
> >> > transport-
> >> > specific and/or device-specific value. If not limited, the maximum
> >> > number
> >> > of descriptors in a list is the virt queue size."
> >> > 
> >> > However the question is, would anybody want large descriptor chains
> >> > with
> >> > the packaged ring in the first place? If I understand it correctly, the
> >> > benefits of the packed ring over the split ring only manifest for
> >> > devices
> >> > that interchange a very large number of rather small bulk data (e.g.
> >> > network devices), no?
> >> 
> >> If we think that the feature does not make sense for packed ring, they
> >> should probably conflict with each other. Otherwise, I think we need at
> >> least a statement that the higher limit does not take effect for packed
> >> ring, or touch all the places where it would be relevant.
> >> 
> >> What do others think?
> > 
> > It would indeed be very useful if other people express their opinion about
> > this issue (packed ring scenario) as well before I continue on this issue.
> > 
> > Probably the fact that my patches never made it through to the list were
> > not necessarily supporting this. Should I contact somebody regarding this
> > ML issue? Do members of the other ML also read this virtio-comment list?
> Yes, this situation is very unsatisfactory :( (I have contacted the
> people running this list, but there have not yet been any fixes...)

Only my emails with patches are refused by the list. All my other emails are 
accepted. So not sure if the cause is really DKIM or something else. Maybe the 
admins can suggest a workaround for me.

> Not sure which other lists would be appropriate to cc: -- maybe
> virtualization@lists.linux-foundation.org, but that one also suffers
> from DKIM issues :(

What I thought was wether subscribers of virtio-dev would typically read 
virtio-comment as well. Because AFAICS people who more frequently deal with 
virtio for their companies rather seem to post to virtio-dev.

> > I tried to compensate the current situation by updating the corresponding
> > issue description on Github in a very defailed and verbose way:
> > https://github.com/oasis-tcs/virtio-spec/issues/122
> 
> Thanks. Hopefully me quoting this makes it more visible (I tried to
> quote more than I usually would in my other replies already...)
> 
> Just to feature it more prominently for people who collapse quotes:
> 
> https://github.com/oasis-tcs/virtio-spec/issues/122
> 
> > If nobody replies early January, I would suggest to continue by ignoring
> > the packed ring. Because if somebody wants this for packed ring in
> > future, this can still be added to the specs without breaking things,
> > because this feature is negotiated per queue, not for the entire device.
> 
> The problem is that we need to specify what is supposed to happen if
> packed ring *and* this feature are negotiated. If we do not want to add
> statements for the packed ring case, my suggestion would be
> - make packed ring and this feature mutually exclusive
> - add a new feature bit that works with packed ring later, if we think
>   it is useful

Mja, I have to correct myself on that: I wrote in my previous email that this 
was negotiated per queue. That's false of course as all virtio features are 
currently negotiated for the entire device.

So you are right, if this new indirect size feature was negotiated then it 
would apply to both a) split rings and b) packed rings a device might have. 
Which is unfortunate.

Stefan, you are aware about this circumstance as well, right? Because I 
remember we originally had a discussion on qemu-devel where you wanted to have 
this configurable per queue, not per device.

Best regards,
Christian Schoenebeck


