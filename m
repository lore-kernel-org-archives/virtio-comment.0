Return-Path: <mst@redhat.com>
Date: Mon, 2 Aug 2021 13:28:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <20210802132034-mutt-send-email-mst@kernel.org>
References: <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <87zgu41dt4.fsf@redhat.com>
 <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
 <20210731181746-mutt-send-email-mst@kernel.org>
 <6828669b-4d05-e4bf-99c8-e14481b99358@nvidia.com>
 <ebf614d7-0503-cafe-3db4-055a601157b9@redhat.com>
 <9b7ddc04-2669-0ab8-1304-1bfdf3b8e96c@nvidia.com>
 <877dh3293d.fsf@redhat.com>
 <abbc3417-5636-4e06-d47b-123473f8bc4a@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <abbc3417-5636-4e06-d47b-123473f8bc4a@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 02, 2021 at 06:27:58PM +0300, Max Gurtovoy wrote:
> The spec allows vendor specific stuff today that are not usable

Maybe start there and explain what are the issues you are
trying to address. I think there's a wide consensus in the
TC that significant features should be part of the spec
not a vendor specific thing. Existing vendor specific
capability is thus geared towards enabling minor extensions
such as bug work arounds.

> trying to create a usable API without adding one line of vendor code to
> driver.

Driver in the virtio terminology is taken widely to mean all software
interacting with the device through the virtio interface. Your
virtio-cli tool would be part of the driver.
-- 
MST

