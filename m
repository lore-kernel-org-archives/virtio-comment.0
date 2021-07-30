Return-Path: <virtio-comment-return-2096-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 444D19864BF
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Jul 2021 06:45:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210728085136-mutt-send-email-mst@kernel.org>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <YP/ffFbeJpDJ3sTG@stefanha-x1.localdomain> <87im0v4yrj.fsf@redhat.com>
 <3657bbc8-3299-97a5-b45a-04030da35c51@nvidia.com>
 <20210728085136-mutt-send-email-mst@kernel.org>
Date: Fri, 30 Jul 2021 08:45:09 +0200
Message-ID: <8735rw2tca.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain
To: "Michael S. Tsirkin" <mst@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jul 28 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Jul 27, 2021 at 06:29:49PM +0300, Max Gurtovoy wrote:
>> Vendor specific is also important to allow vendors develop their special
>> souse.
>
> Most of the value of virtio is that it's generic.
> So we added VIRTIO_PCI_CAP_VENDOR_CFG which is very easy for
> the hypervisor to intercept. Maybe that is not enough but that
> needs justification, I am not sure it's a good idea to add multiple
> ways devices can differ without a lot of thought.

Agreed, we should be careful about adding devices that differ in a lot
of little things.

My thought is that the default should be to concentrate on common
features that can be specified, just to keep things movable between
different implementations. If a device is really very different from the
generic one, it should probably become a different device type. But my
preference would be that everyone tries to make their device stick to
a common specification.


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

