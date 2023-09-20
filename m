Return-Path: <virtio-comment-return-7507-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841BACE79D1
	for <virtio-comment@archiver.kernel.org>; Wed, 20 Sep 2023 13:18:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C5FCD45B2A
	for <virtio-comment@archiver.kernel.org>; Wed, 20 Sep 2023 13:18:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3F0C986673
	for <virtio-comment@archiver.kernel.org>; Wed, 20 Sep 2023 13:18:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8F65098666A; Wed, 20 Sep 2023 13:18:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E71B98666B
	for <virtio-comment@lists.oasis-open.org>; Wed, 20 Sep 2023 13:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: soBKJU_MPzayL-pEXurAfg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695215913; x=1695820713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ft0Hvww98DIVI9AAi+gO6RxI47Nc/V9+mUfEY+K4xFY=;
        b=XqH1+UoOvt0OqaiB+gPANPQ1dyEvLwPttmWSTwG6DnPvLYoCa9ReH2p3oCUuiep9nz
         Nceaq93m8A+DAlHoi4nlwnEEw+dMB43GQbTNy/XAEABauIYJwfLeeIsbjVniXZntCWSf
         YGw87fn620x9nslkSaeSl2W6rXlQCqFqf5Qxz2Ra1CrTRJkaEfSStGYz4RIG0BvDQisL
         c1B4UZBujo5/g0Pv+TenDdb8TYt0o4JlN02Qu2wK1ZXAwTBlkn7CNm5z+vaMk5qrVz4h
         Ou3WLPkd8DkqeIVgBFVQ4hOd3w96uTuQXP+7/LfzfNO5PhPpkRVoh89SjtuXN95ULveQ
         5Ojg==
X-Gm-Message-State: AOJu0Yx5i51GuIXBRR9HvDPB/Iq66wZYY3IuiSeJGWBKzBcxqcPxlyds
	68nEOburG2bh3kvDtmCa4OS3QanoCtqiEyn7inBhrqtVCUNl7r9oKoSk7of7LnkMxDUulwgj6Uu
	TVBPsTXPwWS24C28DyIa6I7UTukL+mvr1lg==
X-Received: by 2002:a05:600c:224b:b0:3ff:516b:5c4c with SMTP id a11-20020a05600c224b00b003ff516b5c4cmr2304960wmm.18.1695215912949;
        Wed, 20 Sep 2023 06:18:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGabC1hwv/xqFBYRbrp9O89UlJtSsJ98NuuHoD1jnD2tJsRjwSepgqimuIq55Kap6Xk3Gd70Q==
X-Received: by 2002:a05:600c:224b:b0:3ff:516b:5c4c with SMTP id a11-20020a05600c224b00b003ff516b5c4cmr2304951wmm.18.1695215912588;
        Wed, 20 Sep 2023 06:18:32 -0700 (PDT)
Date: Wed, 20 Sep 2023 15:18:30 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.linux-foundation.org,
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com,
	stefanha@redhat.com, jasowang@redhat.com
Message-ID: <ZQrxJnzYHSH0OhiR@fedora>
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <20230919054054-mutt-send-email-mst@kernel.org>
 <ZQmt0Z8lbPMuFzR+@fedora>
 <20230919102250-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230919102250-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: virtio-sound linux driver conformance to spec

On Tue, Sep 19, 2023 at 11:52:27AM -0400, Michael S. Tsirkin wrote:
> On Tue, Sep 19, 2023 at 04:18:57PM +0200, Matias Ezequiel Vara Larsen wrote:
> > On Tue, Sep 19, 2023 at 05:43:56AM -0400, Michael S. Tsirkin wrote:
> > > On Wed, Sep 13, 2023 at 05:04:24PM +0200, Matias Ezequiel Vara Larsen wrote:
> > > > Hello,
> > > > 
> > > > This email is to report a behavior of the Linux virtio-sound driver that
> > > > looks like it is not conforming to the VirtIO specification. The kernel
> > > > driver is moving buffers from the used ring to the available ring
> > > > without knowing if the content has been updated from the user. If the
> > > > device picks up buffers from the available ring just after it is
> > > > notified, it happens that the content is old.
> > > 
> > > Then, what happens, exactly? Do things still work?
> > 
> > We are currently developing a vhost-user backend for virtio-sound and
> > what happens is that if the backend implementation decides to copy the
> > content of a buffer from a request that just arrived to the available
> > ring, it gets the old content thus reproducing some sections two times.
> > For example, we observe that when issuing `aplay FrontLeft.wav`, we hear
> > `Front, front left...`. To fix this issue, our current implementation
> > delays reading from guest memory just until the audio engine requires.
> > However, the first implementation shall also work since it is conforming
> > to the specification.
> > 
> > Matias
> 
> Sounds like it. How hard is it to change the behaviour though?
> Does it involve changing userspace?

AFAIU, a fix for the driver may be to somehow wait until userspace
updates the buffer before add it in the available ring.  
So far, when the device notifies the driver that a new buffer is in the
used ring, the driver calls the virtsnd_pcm_msg_complete() function to
do:
``` 
schedule_work(&vss->elapsed_period);

virtsnd_pcm_msg_send(vss); 
``` 
It first defers the notification to userspace regarding an elapse period
and then it enqueues the request again in the available
ring.`schedule_work()` defers the calling to the
`virtsnd_pcm_period_elapsed()` function that issues
`snd_pcm_period_elapsed(vss->substream);` to notify userspace.  
My proposal would be that the driver could also defer
`virtsnd_pcm_msg_send(vss)` to execute just after
`snd_pcm_period_elapsed(vss->substream)`. Something like this:

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index c10d91fff2fb..41f1e74c8478 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -309,6 +309,7 @@ static void virtsnd_pcm_period_elapsed(struct work_struct *work)
                container_of(work, struct virtio_pcm_substream, elapsed_period);
 
        snd_pcm_period_elapsed(vss->substream);
+       virtsnd_pcm_msg_send(vss);
 }
 
 /**
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index aca2dc1989ba..43f0078b1152 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -321,7 +321,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 
                schedule_work(&vss->elapsed_period);
 
-               virtsnd_pcm_msg_send(vss);
        } else if (!vss->msg_count) {
                wake_up_all(&vss->msg_empty);
        }


I tested it and it looks it fixes the issue. However, I am not sure if
this is enough since I do not know if when `snd_pcm_period_elapsed()`
returns, the buffers have been already updated.

Matias


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

