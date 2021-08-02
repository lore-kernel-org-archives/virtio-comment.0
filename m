Return-Path: <mst@redhat.com>
Date: Mon, 2 Aug 2021 13:07:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <20210802130602-mutt-send-email-mst@kernel.org>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <6de5eb17-1d0d-45d5-b1fa-e21989341b4f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6de5eb17-1d0d-45d5-b1fa-e21989341b4f@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment@lists.oasis-open.org, cohuck@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 02, 2021 at 10:25:33AM +0800, Jason Wang wrote:
> Yes, so I think it makes sense to make the admin virtqueue as a transport
> and then build other stuffs on top.

As an alternative to pci/mmio etc? We'd need to better define what
we are trying to achieve here ...

-- 
MST

