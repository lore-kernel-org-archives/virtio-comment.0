Return-Path: <virtio-comment-return-7529-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56111E6FE58
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 16:01:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 961CC2B02C
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 16:01:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 791319866AC
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 16:01:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 61FB09866A2; Fri, 22 Sep 2023 16:01:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51B4B9866A4
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Sep 2023 16:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OptsJ5mqPgGH_XgwJgnKng-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695398489; x=1696003289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ck2ltjArzlzGjJC14IWtZYvlWabDbDccqrNd/0+lCk=;
        b=EjL7sXN6HGeTWcehNvIqtGOkz4xuAmAyiu4gijuPr17YtsV/g75S8Ju5CNGR3dhuCn
         WNWD8/8VKJER+DaoLYOTqL2W1pJtTDL0eUfPMQvU7DC3HZW5OU9DJF/53Z5Z3TONAW7Q
         V3r/KN6SnILhqkQEpgtxelU60sU94rjEGV6NHN3y7dyWg9wbHkfaOLElQ1dLVtxfz992
         dTNdFQnzc/syegretAGrOpyrJ5hJjoCF+3rEE9tdwfKMOnmKrD7Z+HCP+oFSqfEoXMlT
         A7Vqh9uZu33hEDMsdt/8sbXyEH0E0ylndrFTGTlXzLXvZaeHSRrXX0NkwgYooc87ve+z
         ojsg==
X-Gm-Message-State: AOJu0Yxi3hw0JoPIhbj+V97jqkOSo85VW4hlhFYOxviTW6fCLwMFoVGN
	ddofLL7e/08FWrrv30vfRPw3lYWpO8De7NdLrlAwuDZUqvgq2oK5usMlPuJngoW8xsO/djfJTOm
	DcsbIjoq1TgFnM6gF+9kmTFDKLbZc36ztNg==
X-Received: by 2002:a17:906:309a:b0:99c:5056:4e31 with SMTP id 26-20020a170906309a00b0099c50564e31mr222740ejv.15.1695398489653;
        Fri, 22 Sep 2023 09:01:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkaZghu2g9JmY+fHalif7lY8IkbAq8RF9OcoTHJtPNahwsp+XGtn6qvw6Yfc4axI59VKfu1A==
X-Received: by 2002:a17:906:309a:b0:99c:5056:4e31 with SMTP id 26-20020a170906309a00b0099c50564e31mr222542ejv.15.1695398488016;
        Fri, 22 Sep 2023 09:01:28 -0700 (PDT)
Date: Fri, 22 Sep 2023 12:01:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Babis Chalios <bchalios@amazon.es>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	"Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Graf (AWS), Alexander" <graf@amazon.de>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, aams@amazon.de
Message-ID: <20230922115920-mutt-send-email-mst@kernel.org>
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
> 
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


Heh no I just came up with the name. Will write up in a couple
of days, but the idea is that driver does get_user_pages,
adds buffer to queue, and device will remember the address
and change that memory on a snapshot. If there are buffers
in the queue it will also use these to tell driver,
but if there are no buffers then it won't.

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

