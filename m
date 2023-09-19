Return-Path: <virtio-comment-return-7472-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC78CD54AB
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 10:01:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3F19942C2E
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 10:01:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 21581986555
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 10:01:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0AB79983E25; Tue, 19 Sep 2023 10:01:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC3EF9864D1
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Sep 2023 10:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QPoTGQa5M4qLz9tdmuWn9w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695117712; x=1695722512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bwl7TvWfLs16+XYKBU8hHV9w64CnwrrYpRxy8I9Ja7c=;
        b=skn2hZ4Qh2VPXXN/5j5x6GbVgVbg8pIUm8UQex15lHhKpQdfq3cRm/eafsW5IMQb7v
         RE+r7MsGLxCEc8Z+Wirjr64QaCA9RiX1AvmDyAuU6J6WUpKF6vrxYq1xit2maKKPoU2K
         usFsR38GvusECe2HT33T5B3gOTzS6Yrb8tKrKT9UBhKm5dF2wyUwnSyeLHXmyfvtSJUT
         CW0Sn6+zwC3QFuSVYVQ+HBqJOlOL4cRZ8q/p7W8ESkrdBZgO24tMOhzJ5Vphetu4lWYq
         gJVKBBk6oqZUa0b96F6OYUou4K7KSXg0UJpGL3UETT2hUiRpLfmunkNKI59Xj+IEiXmw
         REZA==
X-Gm-Message-State: AOJu0YxPwtaZReh9Hfe2ZBeSXzxp9/VFAqO83EyJH0J1lBXvXYi7iKnk
	FVr+iFyZrtDSieweJEw0988LFoZWQ3+o7C/26WAVz1gD5qFVUq3umaTF8YruMdzEKzm5ZIzc1Xi
	IJJ4+lDe9/k1EKcz+SufvAw3/yQHeYfXO+g==
X-Received: by 2002:a17:906:3158:b0:9a9:9c6c:c4ef with SMTP id e24-20020a170906315800b009a99c6cc4efmr10238893eje.23.1695117712401;
        Tue, 19 Sep 2023 03:01:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7xMQrZ/jhwhOjjuD7W0f06ojU65NyFDKrvfqerUDN6QHVQ29CSQoXj7CeVP9ZyD3QT//IGA==
X-Received: by 2002:a17:906:3158:b0:9a9:9c6c:c4ef with SMTP id e24-20020a170906315800b009a99c6cc4efmr10238875eje.23.1695117712089;
        Tue, 19 Sep 2023 03:01:52 -0700 (PDT)
Date: Tue, 19 Sep 2023 06:01:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Babis Chalios <bchalios@amazon.es>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	"Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Graf (AWS), Alexander" <graf@amazon.de>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, aams@amazon.de
Message-ID: <20230919055811-mutt-send-email-mst@kernel.org>
References: <e738e7f0-dd13-44db-806c-543746aa6967@amazon.es>
 <20230913053707-mutt-send-email-mst@kernel.org>
 <d7d17e9f-e6ad-4106-a408-99281382a93f@amazon.es>
 <20230918083722-mutt-send-email-mst@kernel.org>
 <e75d9667-2ea0-44d0-a26f-fa3d5fe05651@amazon.es>
 <20230918091506-mutt-send-email-mst@kernel.org>
 <a22ba2cb-9b03-481a-b66e-0b78fbfb21f0@amazon.es>
 <20230918100355-mutt-send-email-mst@kernel.org>
 <4ab1b10e-4524-4b6c-a3df-863360fd225d@amazon.es>
 <c2e7076b-b07e-43cd-a912-9314d742a678@amazon.es>
MIME-Version: 1.0
In-Reply-To: <c2e7076b-b07e-43cd-a912-9314d742a678@amazon.es>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] [PATCH RFC 3/3] rng: leak detection support

On Tue, Sep 19, 2023 at 09:32:08AM +0200, Babis Chalios wrote:
> Resending to fix e-mail formatting issues (sorry for the spam)
> 
> On 18/9/23 18:30, Babis Chalios wrote:
> > > > > > Yes, that's what the driver does now in the RFC patch.
> > > > > > However, this just
> > > > > > decreases
> > > > > > the race window, it doesn't eliminate it. If a third
> > > > > > leak event happens it
> > > > > > might not
> > > > > > find any buffers to use:
> > > > > > 
> > > > > > 1. available buffers to queue 1-X
> > > > > > 2. available buffers to queue X
> > > > > > 
> > > > > > 
> > > > > > 3. poll queue X
> > > > > > 4. used buffers in queue X       <- leak event 1 will
> > > > > > use buffers in X
> > > > > > 5. avail buffers in queue X
> > > > > > 6. poll queue 1-X                <- leak event 2 will
> > > > > > use buffers in 1-X
> > > > > > 7. used buffers in queue 1-X
> > > > > > 8. avail buffers in queue 1-X
> > > > > >                                    <- leak event 3 (it
> > > > > > needs buffers in X, race with step 5)
> > > > > > 9. goto 3
> > > > > I don't get it. we added buffers in step 5.
> > > > What if the leak event 3 arrives before step 5 had time to
> > > > actually add the
> > > > buffers in X and make
> > > > them visible to the device?
> > > 
> > > Then it will see a single event in 1-X instead of two events.  A leak is
> > > a leak though, I don't see does it matter how many triggered.
> > > 
> 
> 
> So the scenario I have in mind is the following:
> 
> (Epoch here is terminology that I used in the Linux RFC. It is a value
> maintained by random.c
> that changes every time a leak event happens).
> 
> 1. add buffers to 1-X
> 2. add buffers to X
> 3. poll queue X
> 4. vcpu 0: get getrandom() entropy and cache epoch value
> 5. Device: First snapshot, uses buffers in X
> 6. vcpu 1: sees used buffers
> 7. Device: Second snapshot, uses buffers in 1-X
> 8. vcpu 0: getrandom() observes new  epoch value & caches it
> 9. Device: Third snapshot, no buffers in either queue, (vcpu 1 from step 6
> has not yet finished adding new buffers).
> 10. vcpu 1 adds new buffer in X
> 11. vcpu 0: getrandom() will not see new epoch and gets stale entropy.
> 
> 
> In this succession of events, when the third snapshot will happen, the
> device won't find
> any buffers in either queue, so it won't increase the RNG epoch value. So,
> any entropy
> gathered after step 8 will be the same across all snapshots. Am I missing
> something?
> 
> Cheers,
> Babis
> 

Yes but notice how this is followed by:

12. vcpu 1: sees used buffers in 1-X

Driver can notify getrandom I guess?

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

