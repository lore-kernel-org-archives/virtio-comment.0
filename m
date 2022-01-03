Return-Path: <virtio-comment-return-2481-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC16F986204
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Jan 2022 13:21:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <1920878.uA8gqIOdmR@silver>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
 <2524173.IXtQ29OQN3@silver> <87bl1737mx.fsf@redhat.com>
 <1920878.uA8gqIOdmR@silver>
Date: Mon, 03 Jan 2022 14:21:13 +0100
Message-ID: <87ilv13qgm.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Content-Type: text/plain
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 29 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 23. Dezember 2021 12:03:50 CET Cornelia Huck wrote:
>> On Wed, Dec 15 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
>> > On Dienstag, 14. Dezember 2021 18:20:28 CET Cornelia Huck wrote:
>> >> Also, this is only for split ring; does packed ring need any updates?
>> > 
>> > I have not reviewed the packed ring as much as I did the split ring, so I
>> > could not say reliably all the parts that shall be updated for the packed
>> > ring. There are some obvious parts like:
>> > 
>> > 2.7.5 Scatter-Gather Support
>> > 
>> > "The device limits the number of descriptors in a list through a
>> > transport-
>> > specific and/or device-specific value. If not limited, the maximum number
>> > of descriptors in a list is the virt queue size."
>> > 
>> > However the question is, would anybody want large descriptor chains with
>> > the packaged ring in the first place? If I understand it correctly, the
>> > benefits of the packed ring over the split ring only manifest for devices
>> > that interchange a very large number of rather small bulk data (e.g.
>> > network devices), no?
>> 
>> If we think that the feature does not make sense for packed ring, they
>> should probably conflict with each other. Otherwise, I think we need at
>> least a statement that the higher limit does not take effect for packed
>> ring, or touch all the places where it would be relevant.
>> 
>> What do others think?
>
> It would indeed be very useful if other people express their opinion about 
> this issue (packed ring scenario) as well before I continue on this issue.
>
> Probably the fact that my patches never made it through to the list were not 
> necessarily supporting this. Should I contact somebody regarding this ML 
> issue? Do members of the other ML also read this virtio-comment list?

Yes, this situation is very unsatisfactory :( (I have contacted the
people running this list, but there have not yet been any fixes...)

Not sure which other lists would be appropriate to cc: -- maybe
virtualization@lists.linux-foundation.org, but that one also suffers
from DKIM issues :(

>
> I tried to compensate the current situation by updating the corresponding 
> issue description on Github in a very defailed and verbose way:
> https://github.com/oasis-tcs/virtio-spec/issues/122

Thanks. Hopefully me quoting this makes it more visible (I tried to
quote more than I usually would in my other replies already...)

Just to feature it more prominently for people who collapse quotes:

https://github.com/oasis-tcs/virtio-spec/issues/122

>
> If nobody replies early January, I would suggest to continue by ignoring the 
> packed ring. Because if somebody wants this for packed ring in future, this 
> can still be added to the specs without breaking things, because this feature 
> is negotiated per queue, not for the entire device.

The problem is that we need to specify what is supposed to happen if
packed ring *and* this feature are negotiated. If we do not want to add
statements for the packed ring case, my suggestion would be
- make packed ring and this feature mutually exclusive
- add a new feature bit that works with packed ring later, if we think
  it is useful


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

