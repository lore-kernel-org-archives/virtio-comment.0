Return-Path: <virtio-comment-return-7536-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D5ECE7A81
	for <virtio-comment@archiver.kernel.org>; Mon, 25 Sep 2023 14:33:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 94C16613C3
	for <virtio-comment@archiver.kernel.org>; Mon, 25 Sep 2023 14:33:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8669D986387
	for <virtio-comment@archiver.kernel.org>; Mon, 25 Sep 2023 14:33:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 72D2898637D; Mon, 25 Sep 2023 14:33:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 615C298637B
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Sep 2023 14:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ceuv7mW3MKOZDyDsTdAnCg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695652421; x=1696257221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYzJ5V4E8C0wj9J8fVAJVvVv5Gl2yEjT3moeQQdvrhQ=;
        b=N0fmENyrN1GKymvnogfX0Cxxs60eCK5wVlL09IKu7CKGsSyOpBpdqYmxub4KjU5fEx
         cvrEn41tOCX+KjXE8ve8Y/YocYwO9VBXA35MfoaPhUn/hBH/KXFWjy3Lm91GOVQfAyto
         UQCclaiawmfpnKQm1p1Ctx+5exh8GHnfVhGuLO8gCS7xQp5va1C9YoQoVCIAul2oxnbS
         4oky4dlt9wp9ghsheH/iZAStwCkg4uBd3vTrKYi3Z27jR55lYwvESAs75gp5nxr+eE36
         2gRmpZyA04RRT9gJYuu2kdgFaysbCrnxp8pOxaqiTAc7ZdDEyL69bhjh1zpEuOKrwZUP
         f1Gw==
X-Gm-Message-State: AOJu0YyHyywBg40HYCSrFxxYQ8F7Sdv99oS4qksgfQRWE6/Wvlmcz6B0
	fDQm+GQdFVNiRFdNLl/kBie4sDbyiQ0a5vtTeA0EWRsPrV2wooF50thLUirQZZDLQGpJlhJ3jU2
	2mr4uJfE2eLKifyDwH8Bs4FAtp2et7SbBqQ==
X-Received: by 2002:ac8:4e84:0:b0:412:1e0a:772d with SMTP id 4-20020ac84e84000000b004121e0a772dmr9670230qtp.12.1695652421406;
        Mon, 25 Sep 2023 07:33:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrVTM+y4dsWarhzq0K88LNdGBEmRN1dbe8sMBcIW8VRcYqCh2brXlGxtqJnFwmxhCwEjO2YA==
X-Received: by 2002:ac8:4e84:0:b0:412:1e0a:772d with SMTP id 4-20020ac84e84000000b004121e0a772dmr9670205qtp.12.1695652421032;
        Mon, 25 Sep 2023 07:33:41 -0700 (PDT)
Date: Mon, 25 Sep 2023 16:33:37 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux-foundation.org,
	virtio-comment@lists.oasis-open.org, stefanha@redhat.com,
	jasowang@redhat.com
Message-ID: <ZRGaQU/I6Qfz8cLP@fedora>
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <20230919054054-mutt-send-email-mst@kernel.org>
 <ZQmt0Z8lbPMuFzR+@fedora>
 <20230919102250-mutt-send-email-mst@kernel.org>
 <ZQrxJnzYHSH0OhiR@fedora>
 <0f377606-ac93-4be1-9e5e-80bce31e6bce@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <0f377606-ac93-4be1-9e5e-80bce31e6bce@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: virtio-sound linux driver conformance to spec

On Mon, Sep 25, 2023 at 10:04:33AM +0900, Anton Yakovlev wrote:
> Hello Matias,
> 
> On 20.09.2023 22:18, Matias Ezequiel Vara Larsen wrote:
> > On Tue, Sep 19, 2023 at 11:52:27AM -0400, Michael S. Tsirkin wrote:
> > > On Tue, Sep 19, 2023 at 04:18:57PM +0200, Matias Ezequiel Vara Larsen wrote:
> > > > On Tue, Sep 19, 2023 at 05:43:56AM -0400, Michael S. Tsirkin wrote:
> > > > > On Wed, Sep 13, 2023 at 05:04:24PM +0200, Matias Ezequiel Vara Larsen wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > This email is to report a behavior of the Linux virtio-sound driver that
> > > > > > looks like it is not conforming to the VirtIO specification. The kernel
> > > > > > driver is moving buffers from the used ring to the available ring
> > > > > > without knowing if the content has been updated from the user. If the
> > > > > > device picks up buffers from the available ring just after it is
> > > > > > notified, it happens that the content is old.
> > > > > 
> > > > > Then, what happens, exactly? Do things still work?
> > > > 
> > > > We are currently developing a vhost-user backend for virtio-sound and
> > > > what happens is that if the backend implementation decides to copy the
> > > > content of a buffer from a request that just arrived to the available
> > > > ring, it gets the old content thus reproducing some sections two times.
> > > > For example, we observe that when issuing `aplay FrontLeft.wav`, we hear
> > > > `Front, front left...`. To fix this issue, our current implementation
> > > > delays reading from guest memory just until the audio engine requires.
> > > > However, the first implementation shall also work since it is conforming
> > > > to the specification.
> > > > 
> > > > Matias
> > > 
> > > Sounds like it. How hard is it to change the behaviour though?
> > > Does it involve changing userspace?
> > 
> > AFAIU, a fix for the driver may be to somehow wait until userspace
> > updates the buffer before add it in the available ring.
> > So far, when the device notifies the driver that a new buffer is in the
> > used ring, the driver calls the virtsnd_pcm_msg_complete() function to
> > do:
> > ```
> > schedule_work(&vss->elapsed_period);
> > 
> > virtsnd_pcm_msg_send(vss);
> > ```
> > It first defers the notification to userspace regarding an elapse period
> > and then it enqueues the request again in the available
> > ring.`schedule_work()` defers the calling to the
> > `virtsnd_pcm_period_elapsed()` function that issues
> > `snd_pcm_period_elapsed(vss->substream);` to notify userspace.
> > My proposal would be that the driver could also defer
> > `virtsnd_pcm_msg_send(vss)` to execute just after
> > `snd_pcm_period_elapsed(vss->substream)`. Something like this:
> > 
> > diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
> > index c10d91fff2fb..41f1e74c8478 100644
> > --- a/sound/virtio/virtio_pcm.c
> > +++ b/sound/virtio/virtio_pcm.c
> > @@ -309,6 +309,7 @@ static void virtsnd_pcm_period_elapsed(struct work_struct *work)
> >                  container_of(work, struct virtio_pcm_substream, elapsed_period);
> >          snd_pcm_period_elapsed(vss->substream);
> > +       virtsnd_pcm_msg_send(vss);
> >   }
> >   /**
> > diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
> > index aca2dc1989ba..43f0078b1152 100644
> > --- a/sound/virtio/virtio_pcm_msg.c
> > +++ b/sound/virtio/virtio_pcm_msg.c
> > @@ -321,7 +321,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
> >                  schedule_work(&vss->elapsed_period);
> > -               virtsnd_pcm_msg_send(vss);
> >          } else if (!vss->msg_count) {
> >                  wake_up_all(&vss->msg_empty);
> >          }
> > 
> > 
> > I tested it and it looks it fixes the issue. However, I am not sure if
> > this is enough since I do not know if when `snd_pcm_period_elapsed()`
> > returns, the buffers have been already updated.
> 
> It's just a lucky coincidence that this change helped in your case.
> 
> Instead, to solve the problem, it's necessary to implement read/write()
> operations for the substream, and disable MMAP access mode.
> 
> I'll try, but I'm not sure I'll have enough time for this in the near future.
> 
> 
Hello Anton,

Thanks, I will try to propose a better fix in the next few weeks. I
am not familiar with sound drivers so I may require some help. I'll let
you know if I have any question.

Thanks, Matias.


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

