Return-Path: <mst@redhat.com>
Date: Sun, 6 Mar 2022 05:17:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] [PATCH v5 1/2] virtio-vsock: add description
 for datagram type
Message-ID: <20220306051658-mutt-send-email-mst@kernel.org>
References: <20210528040118.3253836-1-jiang.wang@bytedance.com>
 <20220224221547.2436395-1-beshleman.devbox@gmail.com>
 <20220224221547.2436395-2-beshleman.devbox@gmail.com>
 <20220302160958.62s34i2n2tccsscz@sgarzare-redhat>
 <20220303032801.yvlfu5vqqibu7eyo@ip-10-100-118-60.ec2.internal>
 <20220303021413-mutt-send-email-mst@kernel.org>
 <20220304234315.ccyecxidyh5rfvw5@ip-10-100-118-60.ec2.internal>
MIME-Version: 1.0
In-Reply-To: <20220304234315.ccyecxidyh5rfvw5@ip-10-100-118-60.ec2.internal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Bobby Eshleman <beshleman.devbox@gmail.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, cong.wang@bytedance.com, duanxiongchun@bytedance.com, jiang.wang@bytedance.com, virtualization@lists.linux-foundation.org, xieyongji@bytedance.com, chaiwen.cc@bytedance.com, stefanha@redhat.com, asias@redhat.com, arseny.krasnov@kaspersky.com, jhansen@vmware.com, bobby.eshleman@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Sat, Mar 05, 2022 at 01:25:44AM +0000, Bobby Eshleman wrote:
> On Thu, Mar 03, 2022 at 02:15:24AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Mar 03, 2022 at 03:29:31AM +0000, Bobby Eshleman wrote:
> > > On Wed, Mar 02, 2022 at 05:09:58PM +0100, Stefano Garzarella wrote:
> > > > Hi Bobby,
> > > > Sorry for the delay, but I saw these patches today.
> > > > Please, can you keep me in CC?
> > > > 
> > > 
> > > Hey Stefano, sorry about that. I'm not sure how I lost your CC on this
> > > one. I'll make sure you are there moving forward.
> > > 
> > > I want to mention that I'm taking a look at
> > > https://gitlab.com/vsock/vsock/-/issues/1 in parallel with my dgram work
> > > here. After sending out this series we noticed potential overlap between
> > > the two issues. The additional dgram queues may become redundant if a
> > > fairness mechanism that solves issue #1 above also applies to
> > > connection-less protocols (similar to how the TC subsystem works). I've
> > > just begun sorting out potential solutions so no hard results yet. Just
> > > putting on your radar that the proposal here in v5 may be impacted if my
> > > investigation into issue #1 yields something adequate.
> > 
> > 
> > Well not mergeable, but datagram is upstream in Linux, is it not?
> > So we do want it in the spec IMHO, even if in the future there
> > will be a better protocol.
> > 
> 
> As of right now, it is not upstream in Linux. The virtio transport just passes
> -EOPNOTSUPP up the stack when the sock invokes it.
> 
> I think what you're thinking of is the vsock dgram in VMWare's vmci and
> Hyper-V. They support dgrams, but are not compatible with virtio (e.g., don't
> use virtqueues).
> 
> -Bobby

Oh no, I was thinking about SEQPACKET actually. Which has the same issue
I noted on another thread with memory accounting as datagram by the way.

-- 
MST

