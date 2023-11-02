Return-Path: <virtio-comment-return-8114-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AEAC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 11:25:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EB0A042D74
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 11:25:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA8AA986BF8
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 11:25:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AD136986BF4; Thu,  2 Nov 2023 11:25:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9CC26986BF5
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 11:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iJEx4BoMMiq4ysyVv1HxUA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698924316; x=1699529116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih27gt5hpIV4i/CvAiwBfRZQMYWZSmP6MP4xnpNHSYA=;
        b=thRvNAYXfN0vlEBqWFfAe9xVHSdwW7ORj/82BdmYqoIHVY6G14Ol+xhIRBD+OZo+Yk
         qCiEuSp/MoHWiqV6y8lalu2Kd8/hTN0bd306sj48nE99wXiQClIPPsVe1r2gypwwcmzJ
         kVeAl5GxLBCtn6+bpyFgMrpZ6BQN7nBK701PaLF50MDEmuQCqTwYJtUHO3YeSnfuwY+r
         bIUJJN4xacLWnCUl16BNfr/QaFluXMgsEGjinlhhmITcQDyfaVwMGfoN9lej6fhIAgVf
         905LHMpqEnclYsVhxbRXF9+aWVKqLnerHROwQoPEQUPuvtS3CbL4WAxqY7btXvnosYJM
         rfLw==
X-Gm-Message-State: AOJu0Ywv6N+hVSQbSPTtPG9684PMvfBB2V0z3OBWGEcYFbWja9/7/Hdc
	+3k5jSAprCbxE3+8M4ZN3iUCS274cp2twcotDBqP1w4ALZLX6cnXOJzrLVLne6FzQDI4VoK8A1D
	HuyeeSK2MKJy6U3WkKhDxqMa9aAThuGFCRQ==
X-Received: by 2002:adf:e94d:0:b0:32d:857c:d51d with SMTP id m13-20020adfe94d000000b0032d857cd51dmr13341356wrn.60.1698924316343;
        Thu, 02 Nov 2023 04:25:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWKG5LJFxc6gIwenDIXRv11XJDUmqPzKAcJX7oHLr4t2MtogRezs+C6R3ag7ORGInBTuwF1Q==
X-Received: by 2002:adf:e94d:0:b0:32d:857c:d51d with SMTP id m13-20020adfe94d000000b0032d857cd51dmr13341335wrn.60.1698924315946;
        Thu, 02 Nov 2023 04:25:15 -0700 (PDT)
Date: Thu, 2 Nov 2023 07:25:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Babis Chalios <bchalios@amazon.es>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	"Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Graf (AWS), Alexander" <graf@amazon.de>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, aams@amazon.de
Message-ID: <20231102072055-mutt-send-email-mst@kernel.org>
References: <e75d9667-2ea0-44d0-a26f-fa3d5fe05651@amazon.es>
 <20230918091506-mutt-send-email-mst@kernel.org>
 <a22ba2cb-9b03-481a-b66e-0b78fbfb21f0@amazon.es>
 <20230918100355-mutt-send-email-mst@kernel.org>
 <4ab1b10e-4524-4b6c-a3df-863360fd225d@amazon.es>
 <c2e7076b-b07e-43cd-a912-9314d742a678@amazon.es>
 <20230919055811-mutt-send-email-mst@kernel.org>
 <4c6d6710-43c8-402b-9ae6-d2f4cafbe9a7@amazon.es>
 <20230922110329-mutt-send-email-mst@kernel.org>
 <c0c5b159-997f-4ddf-ab3e-1c749ad93e10@amazon.es>
MIME-Version: 1.0
In-Reply-To: <c0c5b159-997f-4ddf-ab3e-1c749ad93e10@amazon.es>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH RFC 3/3] rng: leak detection support

On Fri, Sep 22, 2023 at 05:40:50PM +0200, Babis Chalios wrote:
> 
> 
> On 22/9/23 17:06, Michael S. Tsirkin wrote:
> > On Tue, Sep 19, 2023 at 12:11:37PM +0200, Babis Chalios wrote:
> > > On 19/9/23 12:01, Michael S. Tsirkin wrote:
> > > > On Tue, Sep 19, 2023 at 09:32:08AM +0200, Babis Chalios wrote:
> > > > > Resending to fix e-mail formatting issues (sorry for the spam)
> > > > > 
> > > > > On 18/9/23 18:30, Babis Chalios wrote:
> > > > > > > > > > Yes, that's what the driver does now in the RFC patch.
> > > > > > > > > > However, this just
> > > > > > > > > > decreases
> > > > > > > > > > the race window, it doesn't eliminate it. If a third
> > > > > > > > > > leak event happens it
> > > > > > > > > > might not
> > > > > > > > > > find any buffers to use:
> > > > > > > > > > 
> > > > > > > > > > 1. available buffers to queue 1-X
> > > > > > > > > > 2. available buffers to queue X
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > 3. poll queue X
> > > > > > > > > > 4. used buffers in queue X       <- leak event 1 will
> > > > > > > > > > use buffers in X
> > > > > > > > > > 5. avail buffers in queue X
> > > > > > > > > > 6. poll queue 1-X                <- leak event 2 will
> > > > > > > > > > use buffers in 1-X
> > > > > > > > > > 7. used buffers in queue 1-X
> > > > > > > > > > 8. avail buffers in queue 1-X
> > > > > > > > > >                                      <- leak event 3 (it
> > > > > > > > > > needs buffers in X, race with step 5)
> > > > > > > > > > 9. goto 3
> > > > > > > > > I don't get it. we added buffers in step 5.
> > > > > > > > What if the leak event 3 arrives before step 5 had time to
> > > > > > > > actually add the
> > > > > > > > buffers in X and make
> > > > > > > > them visible to the device?
> > > > > > > Then it will see a single event in 1-X instead of two events.  A leak is
> > > > > > > a leak though, I don't see does it matter how many triggered.
> > > > > > > 
> > > > > So the scenario I have in mind is the following:
> > > > > 
> > > > > (Epoch here is terminology that I used in the Linux RFC. It is a value
> > > > > maintained by random.c
> > > > > that changes every time a leak event happens).
> > > > > 
> > > > > 1. add buffers to 1-X
> > > > > 2. add buffers to X
> > > > > 3. poll queue X
> > > > > 4. vcpu 0: get getrandom() entropy and cache epoch value
> > > > > 5. Device: First snapshot, uses buffers in X
> > > > > 6. vcpu 1: sees used buffers
> > > > > 7. Device: Second snapshot, uses buffers in 1-X
> > > > > 8. vcpu 0: getrandom() observes new  epoch value & caches it
> > > > > 9. Device: Third snapshot, no buffers in either queue, (vcpu 1 from step 6
> > > > > has not yet finished adding new buffers).
> > > > > 10. vcpu 1 adds new buffer in X
> > > > > 11. vcpu 0: getrandom() will not see new epoch and gets stale entropy.
> > > > > 
> > > > > 
> > > > > In this succession of events, when the third snapshot will happen, the
> > > > > device won't find
> > > > > any buffers in either queue, so it won't increase the RNG epoch value. So,
> > > > > any entropy
> > > > > gathered after step 8 will be the same across all snapshots. Am I missing
> > > > > something?
> > > > > 
> > > > > Cheers,
> > > > > Babis
> > > > > 
> > > > Yes but notice how this is followed by:
> > > > 
> > > > 12. vcpu 1: sees used buffers in 1-X
> > > > 
> > > > Driver can notify getrandom I guess?
> > > It could, but then we have the exact race condition that VMGENID had,
> > > userspace has already consumed stale entropy and there's nothing we
> > > can do about that.
> > > 
> > > Although this is indeed a corner case, it feels like it beats the purpose
> > > of having the hardware update directly userspace (via copy on leak).
> > > 
> > > How do you feel about the proposal a couple of emails back? It looks to
> > > me that it avoids completely the race condition.
> > > 
> > > Cheers,
> > > Babis
> > It does. The problem of course is that this means that e.g.
> > taking a snapshot of a guest that is stuck won't work well.
> 
> That is true, but does it matter? The intention of the proposal
> is that if it is not safe to take snapshots (i.e. no buffers in the
> queue) don't take snapshots.

OK. Basically I think if there's a way for device to detect that
guest is stuck and not refilling the queue in a timely
manner, then we are ok - host will make its own decisions
on whether to snapshot or not.

However, I feel in that case we need a way to create a big
backlog of buffers for guest to fill such that this
ring empty condition is very unlikely.
One or even 2 queues does not seem enough then.

For example, I can see a "stop" command that will
tell device: "stop consuming buffers" and device
will stop consuming buffers until the next leak event.




> > I have been thinking of adding MAP/UNMAP descriptors for
> > a while now. Thus it will be possible to modify
> > userspace memory without consuming buffers.
> > Would something like this solve the problem?
> 
> I am not familiar with MAP/UNMAP descriptors. Is there
> a link where I can read about them?
> 
> Cheers,
> Babis


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

