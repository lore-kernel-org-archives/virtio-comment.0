Return-Path: <virtio-comment-return-3872-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 79F70986651
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Jan 2023 11:23:03 +0000 (UTC)
Date: Wed, 18 Jan 2023 06:22:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20230118052859-mutt-send-email-mst@kernel.org>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <Y8bGYRN69UOv2o29@fedora>
 <20230117162114.GA24976@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230117162114.GA24976@lst.de>
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Christoph Hellwig <hch@lst.de>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jan 17, 2023 at 05:21:14PM +0100, Christoph Hellwig wrote:
> On Tue, Jan 17, 2023 at 11:01:37AM -0500, Stefan Hajnoczi wrote:
> > Each virtio-blk device is a single block device. There is no
> > standardized management protocol in virtio-blk for connecting to remote
> > block devices. I'm aware of hardware virtio-blk devices that connect to
> > remote storage. Configuration is performed through an out-of-band
> > management interface.
> > 
> > Maybe when you say virtio-blk doesn't support remote storage this is
> > what you mean?
> 
> That makes sense, but the same is true of non-fabrics nvme transports
> like nvme-pci and a hypothetical nvme-virtio.

I can hypothesise and come up more with theoretical use-cases
but I feel the question remains what motivates this proposal
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

