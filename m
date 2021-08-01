Return-Path: <mst@redhat.com>
Date: Sun, 1 Aug 2021 04:16:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <20210801040146-mutt-send-email-mst@kernel.org>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <87zgu41dt4.fsf@redhat.com>
 <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
 <20210731181746-mutt-send-email-mst@kernel.org>
 <6828669b-4d05-e4bf-99c8-e14481b99358@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <6828669b-4d05-e4bf-99c8-e14481b99358@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Aug 01, 2021 at 01:53:10AM +0300, Max Gurtovoy wrote:
> > 
> > And yes, it also allows you to unload the generic driver and load
> > a vendor driver. Which can then go wild if it wants to - nothing
> > we can or want to do about it.
> 
> I don't get your point.

Talking about virtio admin interface (you are using a VQ now), it seems
to include or be planned to include several unrelated features, which
I'm not sure is appropriate and it sure makes review harder. I would
advise focusing on hypervisor management features such as live migration
etc, or some other subset. Also, there's overlap with existing
functionality such as feature negotiation.

Talking about vendor specific commands, I don't feel you demonstrated a
need for these beyond what already exists in the spec. In particular it
is unclear why there a need to layer vendor specific commands on top of
virtio. Using the existing capability would work at the PCI level which
seems more appropriate as vendor things are likely to be low level.

It might be a good idea to address these concerns in your next revision,
narrowing the scope as much as possible and explaining the motivation
for the new interfaces.

Thanks!

-- 
MST

