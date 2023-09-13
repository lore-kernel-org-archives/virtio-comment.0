Return-Path: <virtio-comment-return-7406-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA2BEDEC7C
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:58:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CD2D2C623E
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:58:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF76A98663F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:58:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AE780986633; Wed, 13 Sep 2023 15:58:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9EC28986634
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 15:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694620727; x=1695225527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCKZa/WcwJ4Qzi26zCFAMj1Tqa+822/TJ3nfCGszCFw=;
        b=ExIoT970EI2uq7QwnltOFcIQP+WGb6w15UvGkTpXT3wanxelqMtE8PwOY3jFY6UUeu
         qrPBkbtR9v9/rMBja82bFwVKR7MACUFP3ieAQloCk20r8+wA1+7GSC0T6jOgUuSNjIVU
         T+9Tvj9S0VUJbr5YzJ0yVecYSADxLf5P5d/h5JW2S1KUkenvTW7GaNePh+e4FZbe+Dml
         RsTR/+78+sTFmJZo8WywHa8DU5W/Eb4xCohawpn7QUtomqd3Oc6ew903ayXlaP+xdBQy
         LKEG0T1XSmSYNafUBOQ+cE77e2HjW+xIB5fOJUjcaPF/3QqxTn+mLdu3U5Xh6s3sDLpJ
         pfag==
X-Gm-Message-State: AOJu0Yz2na4LfvQL/r2sccTjG3jsPs+7FqBA45lpIJ2el5/0ojtDUDO4
	kYBwbz41T0g6yU6WVaqM/GgVWOacbxwe+cf7V1u223sv7EuYI49A
X-Google-Smtp-Source: AGHT+IHidAZUFquxivpGr+wBBptOPYZExo//J7atIBnbPtPQvGMTYjAY3G2CVlCrS6m8EyzB3jtvL3owU4cVtMZljIg=
X-Received: by 2002:a17:906:1da9:b0:9a5:8155:6de with SMTP id
 u9-20020a1709061da900b009a5815506demr2316255ejh.45.1694620726811; Wed, 13 Sep
 2023 08:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <ZQHPeD0fds9sYzHO@pc-79.home> <CABgObfbXsHN6=ZmL0s+mtCypXs11LNECECO3Uud_J6PMr+JwNA@mail.gmail.com>
In-Reply-To: <CABgObfbXsHN6=ZmL0s+mtCypXs11LNECECO3Uud_J6PMr+JwNA@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 13 Sep 2023 18:58:30 +0300
Message-ID: <CAAjaMXbjRn27fpZHK982m4MyJGXWQTR99WHPAZQfcun+pe3GBw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, virtualization@lists.linux-foundation.org, 
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com, 
	stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] virtio-sound linux driver conformance to spec

Hello Matias,

Please show and refer to code snippets from the kernel tree that you
think are related to your question. It'd help us make sure we all talk
about the same thing.

On Wed, 13 Sept 2023 at 18:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Wed, Sep 13, 2023 at 5:05=E2=80=AFPM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
> >
> > Hello,
> >
> > This email is to report a behavior of the Linux virtio-sound driver tha=
t
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
> Paolo
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>

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

