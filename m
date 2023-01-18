Return-Path: <virtio-comment-return-3873-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E62D986651
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Jan 2023 11:27:46 +0000 (UTC)
Message-ID: <feb36edc-44bd-8604-ac3b-333eddb05222@nvidia.com>
Date: Wed, 18 Jan 2023 13:27:35 +0200
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <40a63ca5-1273-d334-8d81-d5880e4fdff1@nvidia.com>
 <1DDD350DC1DCE386+2023011811234242045568@sudoinfotech.com>
 <9b0655f9-cf97-8d9a-cfd9-bf756821d7e3@nvidia.com>
 <20230118060518-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230118060518-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>, Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 18/01/2023 13:12, Michael S. Tsirkin wrote:
> On Wed, Jan 18, 2023 at 12:09:59PM +0200, Max Gurtovoy wrote:
>> The community agreed that in SR-IOV - VF migration is done via PF interface.
> Which community? You are sending this to virtio comment ML.
I meant Linux community is going to a direction of management device + 
managed device couple.
Management device is managing the migration process mastered by the 
migration SW.
Managed device is in the guest that is not aware of the process.
> At this point we don't yet have finalized support for migration in
> the virtio spec, just some WIP. While yes, this WIP is using
> PF for migration of VFs I think it is premature to claim that
> it's a done deal. E.g. Jason Wang is interested in looking
> into an in-band memory mapped transport for that. Probably in
> addition to the option of using the PF not instead of that.

I'm aware of the process that tries to make vDPA migration be merged 
before virtio but this just says that virtio will be behind other 
specifications that do believe that using a management device + managed 
device is the right thing to do.
What I don't understand is why we can't start merging the infrastructure 
we worked on almost 2 years in parallel to unrelated vDPA efforts.


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

