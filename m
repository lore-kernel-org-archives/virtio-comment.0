Return-Path: <virtio-comment-return-7446-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122E2CD37B0
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 11:13:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3BA652AC4F
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 11:13:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 221D6986419
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 11:13:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0C85C98638E; Mon, 18 Sep 2023 11:13:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F10D89863A4
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Sep 2023 11:13:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: X3oA3WxjO1yOTUhPXNDvug-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695035600; x=1695640400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dwROEaWuFVAn1odUaI8CMOXiLtYYzOFVr+CEmmfiTI=;
        b=HTabVjizBEegmdJpqQfo5+smWxPFlWR9c0kYpJN7VlXLIpBfIsWo1unb/zkefheIj7
         y9lDNFxtP59yGY5xV5HWkAJsTHl7oLsAIB5BHezDsKXaOGXBrpywHwKaU286gZrIhVF1
         X0vK7uyNWC0cXKTAbCSQd7l8izmXTyH7044Tq+dV4amqPeVvol9eajuGrUlEIHREihps
         b7DYAUHELZHGIHkOKXad8pS3CWCZR5Hedg8HNDMLT2bcyxt4r3jf3E2kEuiX2uWq4o8P
         uZ8/zQOm34+tb6w8aYZoXQpGNvYqwpKuS09ZxNoH3XEt1Uh7QgS30JxsbybKcLSVRCxY
         aPxQ==
X-Gm-Message-State: AOJu0Yz7DPHhlEteyKCLGbIgy1lhe3OEo6gQnX+yznRs/LEZFkFYCq/9
	SCh7Lono+ygOofXAcPVM3yxfZtTCV0xErorhsUv062Tj8EUX+sRhwIKXyoFAVBSJMOZ1vDnaBtF
	W5sZ4Ry/5vDFT4hxzJKqaF2cKnvAQpQ5llA==
X-Received: by 2002:a05:6870:3515:b0:1d5:a905:5681 with SMTP id k21-20020a056870351500b001d5a9055681mr9462541oah.26.1695035600761;
        Mon, 18 Sep 2023 04:13:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuC85lj0uJTOsELLpzZtvuWYxaaU91P9QNlISPYC7bivjxYpuTLiQDZbAjZDo0ugvsee6wqw==
X-Received: by 2002:a05:6870:3515:b0:1d5:a905:5681 with SMTP id k21-20020a056870351500b001d5a9055681mr9462521oah.26.1695035600425;
        Mon, 18 Sep 2023 04:13:20 -0700 (PDT)
Date: Mon, 18 Sep 2023 13:13:16 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: virtualization@lists.linux-foundation.org,
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com,
	stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com
Message-ID: <ZQgwzAgIdjyWn5nE@fedora>
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <CABgObfbXsHN6=ZmL0s+mtCypXs11LNECECO3Uud_J6PMr+JwNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfbXsHN6=ZmL0s+mtCypXs11LNECECO3Uud_J6PMr+JwNA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] virtio-sound linux driver conformance to spec

On Wed, Sep 13, 2023 at 05:50:48PM +0200, Paolo Bonzini wrote:
> On Wed, Sep 13, 2023 at 5:05 PM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
> >
> > Hello,
> >
> > This email is to report a behavior of the Linux virtio-sound driver that
> > looks like it is not conforming to the VirtIO specification. The kernel
> > driver is moving buffers from the used ring to the available ring
> > without knowing if the content has been updated from the user. If the
> > device picks up buffers from the available ring just after it is
> > notified, it happens that the content is old. This problem can be fixed
> > by waiting a period of time after the device dequeues a buffer from the
> > available ring. The driver should not be allowed to change the content
> > of a buffer in the available ring. When buffers are enqueued in the
> > available ring, the device can consume them immediately.
> >
> > 1. Is the actual driver implementation following the spec?
> 
> If I understand the issue correctly, it's not. As you say, absent any
> clarification a buffer that has been placed in the available ring
> should be unmodifiable; the driver should operate as if the data in
> the available ring is copied to an internal buffer instantly when the
> buffer id is added to the ring.
> 
> I am assuming this is a playback buffer. To clarify, does the driver
> expect buffers to be read only as needed, which is a fraction of a
> second before the data is played back?
> 
The driver expects that device to read buffers a fraction of a second
before playing them back. If the device reads it just when they are
exposed in the available ring, the content is old. The device has to
read it just when the audio engine is going to consume it.

> > 2. Shall the spec be extended to support such a use-case?
> 
> If it places N buffers, I think it's a reasonable expectation (for the
> sound device only!) that the Nth isn't read until the (N-1)th has
> started playing. With two buffers only, the behavior you specify would
> not be permissible (because as soon as buffer 1 starts playing, the
> device can read buffer 2; there is never an idle buffer). With three
> buffers, you could write buffer 3 while buffer 1 plays; write buffer 1
> while buffer 2 plays; and write buffer 2 while buffer 3 plays. Is this
> enough?
> 
> That said, being reasonable isn't enough for virtio-sound to do it and
> deviate from other virtio devices. Why does the Linux driver behave
> like this? Is it somehow constrained by the kernel->userspace APIs?
> 
AFAIU, the driver sends four requests before starting playing, e.g.,
aplay 'FrontLeft.wav', each with PERIOD_SIZE bytes. PERIOD_SIZE is
negotiated between the device and the driver before playback begins.
The requests are split into multiple buffers.  After a PERIOD_SIZE is
played, the device notifies the guest.  These buffers are part of a ring
buffer shared with the user application. The device just picks the last
used set of buffers and enqueues again in the available ring. For
example, in the case of 4 requests of PERIOD_SIZE bytes each, the
mechanism is roughly as follows. The driver pre-buffers 4 requests. When
it starts to play, the device starts with [0]. After [0] is played, it
adds this request to the used ring and it picks up [1] for playing. The
driver gets the notification that [0] has been consumed, and moves the
request to the available ring thus notifying the device. At this point,
the device should not get the content of [0] since it is still old. The
content shall be read only BEFORE [0] is consumed again, e.g., after 4
periods.

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

