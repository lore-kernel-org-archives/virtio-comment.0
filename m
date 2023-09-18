Return-Path: <virtio-comment-return-7448-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C8FCD37B0
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 11:26:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 58EBA45B28
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 11:26:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 399B89863AD
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 11:26:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 289FA98638E; Mon, 18 Sep 2023 11:26:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1880E9863A4
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Sep 2023 11:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tKAYzcTQMz6E3IRnuJJnzQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695036401; x=1695641201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJ7BoBZN9LUb0RT6bjzaqnZSnRVm8LvjKIFfYqfKexU=;
        b=HZJ3SgXYBlP/zZUvGy/JkM8KvGBiWt4FzZ+fc3ay5vh4qo/dnH6r5DzObrfqH461Xx
         t14iSzi7WfIduE/9mG/I2y5nRY/egD1qSYai4FKtqp24u7a7B3pfn/Pp0+FTIyf79Sfu
         x+pg6YPsQEbphWB2NMh/P8GQG21vn5U0lGB/keDFjcNVyMDnbyxwEJnoyGZIsxjzG7p6
         VfF/hlAMn4Q9BLog3ndpzc5Btc5YeCaw2IY4d5eR7d8ylROCRm0HAxoAEa6dMzHTRRWk
         ieemwYYyj5fZt6lHgkVh39PSewXTToBt4ovTJWgo6j6NCqeXvbnxpC1ycL9Q6XjZCFMR
         cIRg==
X-Gm-Message-State: AOJu0YwsW6TrcM9LuTMtCe9xt5iyjirYRSIlCHK0y1/A23YXBUPU6WCv
	SNXec9F4Rx5h9II6pCtfZlaxlkV1Gy5ogWp1QdFfdRrX5V9LFTsZWGTNwsVH9WljhZ6xzZ7fwDf
	acicHtSEUt1jLgasVb/Zps60/h1lkQ3eqRbmXtFeZStbi2tvbaTaBLjqfu0IF
X-Received: by 2002:a05:6102:ecc:b0:452:7601:e80b with SMTP id m12-20020a0561020ecc00b004527601e80bmr737481vst.35.1695036400819;
        Mon, 18 Sep 2023 04:26:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNCWcywyIXv7Y3LrOm5D3fU8hdQ+F+t/4dVoHOizyxfivsLUDxqoZ/xj2wSTnbF1jJNQB1+fQQQsN8kBq0PAA=
X-Received: by 2002:a05:6102:ecc:b0:452:7601:e80b with SMTP id
 m12-20020a0561020ecc00b004527601e80bmr737475vst.35.1695036400586; Mon, 18 Sep
 2023 04:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <ZQHPeD0fds9sYzHO@pc-79.home> <CABgObfbXsHN6=ZmL0s+mtCypXs11LNECECO3Uud_J6PMr+JwNA@mail.gmail.com>
 <ZQgwzAgIdjyWn5nE@fedora>
In-Reply-To: <ZQgwzAgIdjyWn5nE@fedora>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Mon, 18 Sep 2023 13:26:29 +0200
Message-ID: <CAHYGQ0w5OUcBL+wPxn7uR6TvB1AUs=fcwRvRxtUOZikKk18byg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: virtualization@lists.linux-foundation.org, 
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com, 
	stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] virtio-sound linux driver conformance to spec

On Mon, Sep 18, 2023 at 1:13=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> On Wed, Sep 13, 2023 at 05:50:48PM +0200, Paolo Bonzini wrote:
> > On Wed, Sep 13, 2023 at 5:05=E2=80=AFPM Matias Ezequiel Vara Larsen
> > <mvaralar@redhat.com> wrote:
> > >
> > > Hello,
> > >
> > > This email is to report a behavior of the Linux virtio-sound driver t=
hat
> > > looks like it is not conforming to the VirtIO specification. The kern=
el
> > > driver is moving buffers from the used ring to the available ring
> > > without knowing if the content has been updated from the user. If the
> > > device picks up buffers from the available ring just after it is
> > > notified, it happens that the content is old. This problem can be fix=
ed
> > > by waiting a period of time after the device dequeues a buffer from t=
he
> > > available ring. The driver should not be allowed to change the conten=
t
> > > of a buffer in the available ring. When buffers are enqueued in the
> > > available ring, the device can consume them immediately.
> > >
> > > 1. Is the actual driver implementation following the spec?
> >
> > If I understand the issue correctly, it's not. As you say, absent any
> > clarification a buffer that has been placed in the available ring
> > should be unmodifiable; the driver should operate as if the data in
> > the available ring is copied to an internal buffer instantly when the
> > buffer id is added to the ring.
> >
> > I am assuming this is a playback buffer. To clarify, does the driver
> > expect buffers to be read only as needed, which is a fraction of a
> > second before the data is played back?
> >
> The driver expects that device to read buffers a fraction of a second
> before playing them back. If the device reads it just when they are
> exposed in the available ring, the content is old. The device has to
> read it just when the audio engine is going to consume it.
>
> > > 2. Shall the spec be extended to support such a use-case?
> >
> > If it places N buffers, I think it's a reasonable expectation (for the
> > sound device only!) that the Nth isn't read until the (N-1)th has
> > started playing. With two buffers only, the behavior you specify would
> > not be permissible (because as soon as buffer 1 starts playing, the
> > device can read buffer 2; there is never an idle buffer). With three
> > buffers, you could write buffer 3 while buffer 1 plays; write buffer 1
> > while buffer 2 plays; and write buffer 2 while buffer 3 plays. Is this
> > enough?
> >
> > That said, being reasonable isn't enough for virtio-sound to do it and
> > deviate from other virtio devices. Why does the Linux driver behave
> > like this? Is it somehow constrained by the kernel->userspace APIs?
> >
> AFAIU, the driver sends four requests before starting playing, e.g.,
> aplay 'FrontLeft.wav', each with PERIOD_SIZE bytes. PERIOD_SIZE is
> negotiated between the device and the driver before playback begins.
> The requests are split into multiple buffers.  After a PERIOD_SIZE is
> played, the device notifies the guest.  These buffers are part of a ring
> buffer shared with the user application.

I mean the user application in the guest.

> The device just picks the last
> used set of buffers and enqueues again in the available ring. For

In this sentence, I mean the driver, not the device.

Matias


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

