Return-Path: virtio-comment-return-1682-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B5EA598656B
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Jan 2021 08:48:11 +0000 (UTC)
Date: Wed, 27 Jan 2021 03:48:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20210127034559-mutt-send-email-mst@kernel.org>
References: <20210125055202.29001-1-jasowang@redhat.com>
 <20210125135456.514bca2b.cohuck@redhat.com>
 <7cba572c-0dcd-1b35-616b-a80629f2d4a8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7cba572c-0dcd-1b35-616b-a80629f2d4a8@redhat.com>
Subject: [virtio-comment] Re: [PATCH V2] virtio-net: introduce admin control virtqueue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jan 27, 2021 at 11:30:14AM +0800, Jason Wang wrote:
> > 
> > Does the management device get to choose if it wants to trust a virtual
> > device, i.e. can it fail enabling the trust?
> 
> 
> Yes, the idea is to let management device to choose which virtual device is
> trust. For the possible failure, I think we should allow the device to fail
> the enabling, e.g when the device is lacking resources for virtual devices
> (e.g mac address tables etc).
> 
> Thanks

Wrt SRIOV at least, the standard model is to have the PF control VFs.
I am not saying trusting some VF instead has no uses but
unless someone requested it I'd stick to the standard model
initially.

-- 
MST


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

