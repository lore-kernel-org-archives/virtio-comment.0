Return-Path: <virtio-comment-return-7405-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C83EDEC7B
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:51:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 289107950E
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:51:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1834A986637
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:51:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 06B67986633; Wed, 13 Sep 2023 15:51:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB34A986634
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 15:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gMgPJodXM5OpXcK8BDapgg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694620260; x=1695225060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o7E166TQmYuEbLduCtQffKyw+M6tARG2eEx2M8sZN4=;
        b=TgAEXu6ASYaM09kboWuYhcxiKmEkGjj2Mg67PHgBdF4BN+1udFGKOVWhAQApsdYDTs
         n7Mvhxphu0iQ9PGYw+VS69bXYUW8OoEubQdDoZWm0yeg+IG9cH2ZjTz8KSiIcwzEfoo3
         AlkPPTaWtOynunS8PoL+c7Rcau48L61vknE/9S+igmV031JDNFO+NQB+Ke3FEV6rB7wU
         V1WvS0Sl2xTActY5DmKr+olS+sTaz+1X4/o/6gvDvnE4Red5T6gWg2DXEmKU/lLvh5XV
         RO9uAxmk46Hdmc6lFUhJbnh6OVklMV39+r3TUt/CwVbBBxSmtp2VlIZ/79CQkb7x6DBR
         5Avg==
X-Gm-Message-State: AOJu0YypJ390gWBFpgA8SXKFWEy+NON+F4ZX2l3OWZJzuTGRemueiKbj
	b8pcJ7DjLbsEWTBLhmAL9Gbero+QMdN/mlDw+d0DW4kz5n1VxhuEPnQ7OkBq4kMzio2WBMI41Rc
	dnOJwQO8JBuN/xM6kF+OLn3RhMFsSSp8voccGBkhkDIcIanAecg==
X-Received: by 2002:a67:e359:0:b0:44e:d729:2a04 with SMTP id s25-20020a67e359000000b0044ed7292a04mr2558157vsm.19.1694620260286;
        Wed, 13 Sep 2023 08:51:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbeLeQ3wYqoN2w95BnQoUbNi5ishPbz07VHpPLT+US55Vn8zpZMYdjEtUPjE3D1Fgjn66DURgo4KhNCziH3Eo=
X-Received: by 2002:a67:e359:0:b0:44e:d729:2a04 with SMTP id
 s25-20020a67e359000000b0044ed7292a04mr2558147vsm.19.1694620260047; Wed, 13
 Sep 2023 08:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <ZQHPeD0fds9sYzHO@pc-79.home>
In-Reply-To: <ZQHPeD0fds9sYzHO@pc-79.home>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 Sep 2023 17:50:48 +0200
Message-ID: <CABgObfbXsHN6=ZmL0s+mtCypXs11LNECECO3Uud_J6PMr+JwNA@mail.gmail.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtualization@lists.linux-foundation.org, 
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com, 
	stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] virtio-sound linux driver conformance to spec

On Wed, Sep 13, 2023 at 5:05=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> Hello,
>
> This email is to report a behavior of the Linux virtio-sound driver that
> looks like it is not conforming to the VirtIO specification. The kernel
> driver is moving buffers from the used ring to the available ring
> without knowing if the content has been updated from the user. If the
> device picks up buffers from the available ring just after it is
> notified, it happens that the content is old. This problem can be fixed
> by waiting a period of time after the device dequeues a buffer from the
> available ring. The driver should not be allowed to change the content
> of a buffer in the available ring. When buffers are enqueued in the
> available ring, the device can consume them immediately.
>
> 1. Is the actual driver implementation following the spec?

If I understand the issue correctly, it's not. As you say, absent any
clarification a buffer that has been placed in the available ring
should be unmodifiable; the driver should operate as if the data in
the available ring is copied to an internal buffer instantly when the
buffer id is added to the ring.

I am assuming this is a playback buffer. To clarify, does the driver
expect buffers to be read only as needed, which is a fraction of a
second before the data is played back?

> 2. Shall the spec be extended to support such a use-case?

If it places N buffers, I think it's a reasonable expectation (for the
sound device only!) that the Nth isn't read until the (N-1)th has
started playing. With two buffers only, the behavior you specify would
not be permissible (because as soon as buffer 1 starts playing, the
device can read buffer 2; there is never an idle buffer). With three
buffers, you could write buffer 3 while buffer 1 plays; write buffer 1
while buffer 2 plays; and write buffer 2 while buffer 3 plays. Is this
enough?

That said, being reasonable isn't enough for virtio-sound to do it and
deviate from other virtio devices. Why does the Linux driver behave
like this? Is it somehow constrained by the kernel->userspace APIs?

Paolo


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

