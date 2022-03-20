Return-Path: <mst@redhat.com>
Date: Sun, 20 Mar 2022 12:07:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Message-ID: <20220320120628-mutt-send-email-mst@kernel.org>
References: <4735344.EBYxvr1mta@silver>
 <149799798.HqrVOTAGB4@silver>
 <20220320093409-mutt-send-email-mst@kernel.org>
 <3695921.aWz9qjfz3Z@silver>
 <20220320112548-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220320112548-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Mar 20, 2022 at 12:06:20PM -0400, Michael S. Tsirkin wrote:
> > No, I didn't miss that. The suggested changes were about the amount of 
> > *indirect* descriptors, not about the amount of *direct* descriptors. The 
> > amount of direct descriptors was still limited to the "Queue Size".
> 
> Confused.
> The amount of indirect descriptors?
> Not the size in each one?

length, to be exact

> But your commit log says
> 	descriptors in indirect descriptor tables
> descriptors in the indirect descriptor tables are not indirect
> descriptors.
> 
> At this point I don't understand the motivation for the change.

