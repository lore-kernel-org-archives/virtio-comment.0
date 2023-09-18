Return-Path: <virtio-comment-return-7449-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1226FCD37B0
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 12:41:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4C64768463
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 12:41:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40E0198640C
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 12:41:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 30AD19863A4; Mon, 18 Sep 2023 12:41:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 200759863A5
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Sep 2023 12:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: M9ar5LL5PUuwm3sXjtYuIw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695040878; x=1695645678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrMFQS5sZcARltujxH/verYlSLMdipqBaVjT64xauG4=;
        b=JNhvDyN4feBZXQpfyCP4uQp5WMD8us5IXc+T302RXsOS13JxGvTJvSy107xa/90edH
         GwdKmqLymUgVCZaw3+tvmJ0wM76bO10F+e+6BsmG3q8KjarEpCZHowmSDjyZw3nBw6ML
         MbFZWFZ01woPGCf1kJEEGjCLRBs9c7I+wvOaTDqv+OWUt5gQdN0GG/dge0EyoC2jidtq
         ayr12ox5uDeFO+rU/cstUvBndM3DkifrLfC9Ut7PRvXGDHSMwjjffn7T/vLLyC+H78bw
         lHgGOmClw4s4xqzvdjkwf3mhJUJuXEendG8th1rRNdqNrEOTYGwcC0pheUV1QQU0AOw3
         zwDA==
X-Gm-Message-State: AOJu0YwQrKn5u1e4G3tIcHx1+XYHM11Jx+PBem0kyAjRuPwphQ+8PFJ1
	lAvOjt44aAY1DEByryq0nuSxzEXhNYaFboXpshsRnMXX7+CepPTZ8dSqlbhf1oY4XRod4//tZz2
	UrBOlEQmLJrxQ0kw+icEmn/gawG0J4ewRhw==
X-Received: by 2002:a17:906:2d1:b0:9a5:b8ca:9b76 with SMTP id 17-20020a17090602d100b009a5b8ca9b76mr6656500ejk.72.1695040877808;
        Mon, 18 Sep 2023 05:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDQctlFZiL2TsBZ1WpeFMVqUfhoFV+9Boxrg3ipDUBnYP9blIuA/q7FtdwA7S1i0Kjc1u4iA==
X-Received: by 2002:a17:906:2d1:b0:9a5:b8ca:9b76 with SMTP id 17-20020a17090602d100b009a5b8ca9b76mr6656489ejk.72.1695040877504;
        Mon, 18 Sep 2023 05:41:17 -0700 (PDT)
Date: Mon, 18 Sep 2023 08:41:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Babis Chalios <bchalios@amazon.es>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	"Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Graf (AWS), Alexander" <graf@amazon.de>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, aams@amazon.de
Message-ID: <20230918083722-mutt-send-email-mst@kernel.org>
References: <20221121162756.350032-1-mst@redhat.com>
 <20221121162756.350032-4-mst@redhat.com>
 <0abb7518-16e0-4227-bfe1-a29bd27124e8@amazon.es>
 <20230912170032-mutt-send-email-mst@kernel.org>
 <e738e7f0-dd13-44db-806c-543746aa6967@amazon.es>
 <20230913053707-mutt-send-email-mst@kernel.org>
 <d7d17e9f-e6ad-4106-a408-99281382a93f@amazon.es>
MIME-Version: 1.0
In-Reply-To: <d7d17e9f-e6ad-4106-a408-99281382a93f@amazon.es>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] [PATCH RFC 3/3] rng: leak detection support

On Wed, Sep 13, 2023 at 01:19:49PM +0200, Babis Chalios wrote:
> 
> 
> On 13/9/23 11:37, Michael S. Tsirkin wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On Wed, Sep 13, 2023 at 11:32:57AM +0200, Babis Chalios wrote:
> > > > I do not understand why this matters though. we know there was a leak,
> > > > why does it matter whether there was one or two leaks?
> > > > 
> > > > > In the last RFC implementing this in Linux we sent to LKML [1] we avoid
> > > the
> > > > > issue by pre-populating both
> > > > > queues, but that does not solve the problem if a third entropy leak
> > > event
> > > > > arrives. The probability of this
> > > > > happening is indeed small, but we thought of a potential solution to
> > > this.
> > > > > What if we modify the spec here to instruct the VMM to deny taking a
> > > > > snapshot if there are not any buffers
> > > > > in the active leak queue? If we did this, we could even simplify the
> > > spec to
> > > > > just introduce a single entropy
> > > > > leak queue, so we could avoid the complexity of switching between active
> > > > > leak queues in the driver and
> > > > > the device. WDYT?
> > > > here's the problem:
> > > > 
> > > > - driver adds batch 1 of buffers
> > > > - leak
> > > > - device starts using buffers from batch 1
> > > > - driver sees some buffers and starts adding batch 2
> > > If understand this clause:
> > > 
> > > > > +\item Upon detecting that buffers have been used, driver
> > > > > +      switches to another leak queue making it active
> > > > > +      (e.g. from \field{leakq1} to \field{leakq2} or vice versa).
> > > > > +      It then starts adding buffers to the new leak queue.
> > > correctly:
> > > 
> > > At this point, the driver will first switch active leak queue and
> > > then add batch 2 to the new leak queue.
> > > 
> > > and due to this:
> > > 
> > > > > +\item Device will keep using buffers in the active leak queue
> > > > > +      until it detects that both the current leak queue is empty and
> > > another
> > > > > +      leak queue has buffers. At that point device switches to
> > > > > +      another leak queue, making it active.
> > > > > +\item After the switch, buffers from the new leak queue are not
> > > > > +      used until an information leak is detected.
> > > > > +\end{enumerate}
> > > the following won't happen:
> > > 
> > > > - device sees batch 2 and thinks this is part of batch 1
> > > >      consumes them all
> > > Does it make sense?
> > > 
> > > Cheers,
> > > Babis
> > yes, the queue switch is used as a barrier to detect a new leak event.
> 
> Right, so I think that there is a race condition between the time the driver
> sees the used buffers of the first
> batch and until it adds the second batch on the next leak queue.
> 
> 1. driver adds batch 1
> 2. leak event
> 3. device uses batch 1
> 4. driver sees the used buffers and
>     a. switches leak queues
>     b. adds batch 2.
> 5. devices finds initial leak queue empty and sees buffers in second leak
> queue.
> 
> If a second leak event happens after step 3 above and before all of steps 4
> complete then batch 2 will not
> be processed as part of the second leak event.

driver can just pre-add buffers in the second queue.

1. available buffers to queue 1-X
2. available buffers to queue X


3. poll queue X
4. used buffers in queue X
5. avail buffers in queue X
6. poll queue 1-X
7. used buffers in queue X
8. avail buffers in queue X
9. goto 3




> > --
> > MST
> > 
> > 
> > ---------------------------------------------------------------------
> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> > 
> 
> 
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org


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

