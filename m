Return-Path: <mst@redhat.com>
Date: Mon, 2 Aug 2021 13:05:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <20210802130043-mutt-send-email-mst@kernel.org>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
 <20210731175617-mutt-send-email-mst@kernel.org>
 <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com>
 <874kc727pi.fsf@redhat.com>
 <738e1458-2a54-f534-df62-3be198487e91@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <738e1458-2a54-f534-df62-3be198487e91@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 02, 2021 at 07:03:11PM +0300, Max Gurtovoy wrote:
> There is no much bits left in the generic feature field for all the features
> we would like to add.
> I mentioned only 5-6 in the above example and it will bring us to bit 46
> already.
> 
> please think of 5-10 years from today.
> 

IIUC nothing prevents adding more once we exhaust 64 bits. IMHO it's actually
pretty important to make sure the feature negotiation works well
and covers relevant usecases. If we have limitations preventing that
I'd like to at least try to fix that not replacing feature negotiation with
something else.

> 
> > 
> > What actually makes sense to use the admin vq is also worth further
> > discussion.
> > 
> > > 
> > > > > > > > > As virtio evolves beyond the para-virt/sw-emulated world, it's mandatory
> > > > > > > > > for the specification to become flexible and allow a wider feature set.
> > > > > > > > > The corrent ctrl virtq that is defined for some of the virtio devices is
> > > > > > > > > device specific and wasn't designed to be a generic virtq for
> > > > > > > > > admininistration.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > > > > > > Lots of things on this list seem to make sense when
> > > > > > > > done from PF and affecting a VF.
> > > > > > > > I think from this POV the generic structure should include
> > > > > > > > a way to address one device from another.
> > > > > > > This will be defined per command.
> > > > > > > 
> > > > > > > For example, funcion_id will be given as command data.
> > > > > > Why? Sounds like a generic thing to me.
> > > > > Generic to a command that handles virtualization management.
> > > > It could be that mixing up virtualization management and arbitrary
> > > > other management commands in the same interface is a mistake.
> > > It's not a mistake.
> > > 
> > > This is the right design.
> > Well, we're clearly not all in agreement what the "right design"
> > is. Figuring that out is the whole point of this discussion.
> 
> I suggested a solid infrastructure for adding any feature easily in the
> future without having half a year waste on debates.

Well we don't really normally waste time on debating adding feature bits.
We do that a lot without a lot of fuss.

-- 
MST

