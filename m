Return-Path: <virtio-comment-return-2790-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0BD40986355
	for <virtio-comment@lists.oasis-open.org>; Mon,  7 Mar 2022 17:41:41 +0000 (UTC)
Date: Mon, 7 Mar 2022 17:41:38 +0000
From: Bobby Eshleman <beshleman.devbox@gmail.com>
Message-ID: <20220307174116.aek246gqq3wfgllb@ip-10-100-118-60.ec2.internal>
References: <20210528040118.3253836-1-jiang.wang@bytedance.com>
 <20220224221547.2436395-1-beshleman.devbox@gmail.com>
 <20220224221547.2436395-2-beshleman.devbox@gmail.com>
 <20220302160958.62s34i2n2tccsscz@sgarzare-redhat>
 <20220303032801.yvlfu5vqqibu7eyo@ip-10-100-118-60.ec2.internal>
 <20220303063001-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220303063001-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] [PATCH v5 1/2] virtio-vsock: add description
 for datagram type
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, cong.wang@bytedance.com, duanxiongchun@bytedance.com, jiang.wang@bytedance.com, virtualization@lists.linux-foundation.org, xieyongji@bytedance.com, chaiwen.cc@bytedance.com, stefanha@redhat.com, asias@redhat.com, arseny.krasnov@kaspersky.com, jhansen@vmware.com, bobby.eshleman@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Mar 03, 2022 at 06:41:11AM -0500, Michael S. Tsirkin wrote:
> On Thu, Mar 03, 2022 at 03:29:31AM +0000, Bobby Eshleman wrote:
> > On Wed, Mar 02, 2022 at 05:09:58PM +0100, Stefano Garzarella wrote:
> > > Hi Bobby,
> > > Sorry for the delay, but I saw these patches today.
> > > Please, can you keep me in CC?
> > > 
> > 
> > Hey Stefano, sorry about that. I'm not sure how I lost your CC on this
> > one. I'll make sure you are there moving forward.
> > 
> > I want to mention that I'm taking a look at
> > https://gitlab.com/vsock/vsock/-/issues/1 in parallel with my dgram work
> > here. After sending out this series we noticed potential overlap between
> > the two issues. The additional dgram queues may become redundant if a
> > fairness mechanism that solves issue #1 above also applies to
> > connection-less protocols (similar to how the TC subsystem works). I've
> > just begun sorting out potential solutions so no hard results yet. Just
> > putting on your radar that the proposal here in v5 may be impacted if my
> > investigation into issue #1 yields something adequate.
> 
> 
> With respect to datagram, there is actually another issue which also
> exists for stream but is smaller there - per message overhead is not
> accounted for.  For stream we can work around that by copying payload
> data.  For datagram we can't as we need to preserve message boundaries.
> One way to address that is to add config for host/guest per-message
> overhead, and have sender decrement fwd counter by that value for
> each message sent.
> 

As I'm just becoming acquainted with the code excuse me if this question is
naive: is the overhead not knowable by the implementation, and that is why a
configuration would be required? My naive assumption was that overhead is
coming from headers (and maybe other packet metadata?) which are known by the
implementation?

Thanks,
Bobby

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

