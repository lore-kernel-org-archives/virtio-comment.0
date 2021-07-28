Return-Path: <mst@redhat.com>
Date: Wed, 28 Jul 2021 08:53:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <20210728085136-mutt-send-email-mst@kernel.org>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <YP/ffFbeJpDJ3sTG@stefanha-x1.localdomain>
 <87im0v4yrj.fsf@redhat.com>
 <3657bbc8-3299-97a5-b45a-04030da35c51@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <3657bbc8-3299-97a5-b45a-04030da35c51@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jul 27, 2021 at 06:29:49PM +0300, Max Gurtovoy wrote:
> Vendor specific is also important to allow vendors develop their special
> souse.

Most of the value of virtio is that it's generic.
So we added VIRTIO_PCI_CAP_VENDOR_CFG which is very easy for
the hypervisor to intercept. Maybe that is not enough but that
needs justification, I am not sure it's a good idea to add multiple
ways devices can differ without a lot of thought.

-- 
MST

