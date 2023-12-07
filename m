Return-Path: <virtio-comment-return-8756-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C9FC4167B
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Dec 2023 04:16:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4E21145B42
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Dec 2023 04:16:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DBBDF98691A
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Dec 2023 04:16:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C1BC69868FB; Thu,  7 Dec 2023 04:16:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF162986901
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Dec 2023 04:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: YukxxtoXMOyv1kwk1TLxMg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701922581; x=1702527381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeQc/ktMnF15e5g/6Dn7zE7VISQ16CQ6tOArmf6ZKms=;
        b=mGtzHjtZ2tBaUdrjnGOMpsN3EHtjI6r7gfGHKD8iCbUt/bjjVhVH2ZpznWKTBvML+o
         5ie5A6bg6mRiaqJrw9Zm9T7sbn8abPoNF0lckv7AF+xRy1c2rkDG3R7LFOc5Wd+PanMz
         cvweIdkAlgtDkIXxjNA+BvCW7lSBpTNaW4gsAHzFiU9jtgdQFlcM/l96Yr8DeiwdKblS
         Jru7ZXrRgp7L6rmCWVmaIbmbK0tFIa0A6TkZ5g4YlqJsiUpUuIlHO1e+fVLtrzMDRCOz
         HrGmBkdl/OBPB8mAT3pAHsCBEkDd4Evg0bLcOLKM4qCZ+zYn6e9BnCi9AHJWjQEQt6wp
         4cpw==
X-Gm-Message-State: AOJu0YwCXcECmF400s6ngdq7nU99oIrdRQcpZQszwDiQLHbWwVDkUOhQ
	alKHLv54MlXz8JR0Y67K7YorEiMQJblF/R7smL9GadLv7yw3DGcnow4HNyXBXb3j/Rl0D2mSkFe
	vvtE5kFUuPRxEx1P7hYUHsCJUzzg9ASr5FfutWNW26lrltzhLIwi3CQMJ8pVT3to=
X-Received: by 2002:a17:90b:1c85:b0:286:cf0b:3cec with SMTP id oo5-20020a17090b1c8500b00286cf0b3cecmr1882318pjb.4.1701922581283;
        Wed, 06 Dec 2023 20:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMd6CDwkN//51J4Lwy42YiEkBby4nCtfO6gQYPfxc2k2AYviAt9d9ndzdSVQxgvHDSO6MGf8yS5EoZOYdZppc=
X-Received: by 2002:a17:90b:1c85:b0:286:cf0b:3cec with SMTP id
 oo5-20020a17090b1c8500b00286cf0b3cecmr1882309pjb.4.1701922580907; Wed, 06 Dec
 2023 20:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20231204094123.856214-1-stevensd@chromium.org>
 <20231204094123.856214-2-stevensd@chromium.org> <CACGkMEuHLs=+8_RHVa9eTXfHLqo_Ra6hSrnT9k8DAG_0yz0pvQ@mail.gmail.com>
 <CAD=HUj6bBOOCWmrbxBHKymfAr3UVUL7S57FtffHi0vEzVmewDA@mail.gmail.com>
 <CACGkMEuGY9y5Zt9UdL+4V3tntnR4EyHHCRqX_P4QtmAOL0-Pew@mail.gmail.com> <20231206051652-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231206051652-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 7 Dec 2023 12:16:09 +0800
Message-ID: <CACGkMEvKo-c0XNRyJSrbkrgqLrWdXc9sju1JHx=y8QOLYCfffw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Stevens <stevensd@chromium.org>, virtio-comment@lists.oasis-open.org, 
	virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v3 1/1] Define a low power mode for devices

On Wed, Dec 6, 2023 at 6:17=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Dec 06, 2023 at 05:16:04PM +0800, Jason Wang wrote:
> > On Tue, Dec 5, 2023 at 6:58=E2=80=AFPM David Stevens <stevensd@chromium=
.org> wrote:
> > >
> > > On Tue, Dec 5, 2023 at 1:18=E2=80=AFPM Jason Wang <jasowang@redhat.co=
m> wrote:
> > > >
> > > > On Mon, Dec 4, 2023 at 5:41=E2=80=AFPM David Stevens <stevensd@chro=
mium.org> wrote:
> > > > >
> > > > > Define a low power mode for virtio devices where the devices are
> > > > > expected to maintain their state. This gives drivers an option fo=
r power
> > > > > management besides simply resetting their device. In the virtuali=
zation
> > > > > use case, this allows the guest to be suspended even with statefu=
l
> > > > > virtio devices like gpu and fs.
> > > > >
> > > > > Low power mode is primarily defined at the transport layer. The o=
nly
> > > > > part that depends on device-type specific details is whether a gi=
ven
> > > > > virtqueue is device driven or driver driven.
> > > > >
> > > > > This change only defines the transport-specific implementation fo=
r
> > > > > Virtio over PCI.
> > > >
> > > > A dumb question, if this is only for PCI, can the device just
> > > > implement no_soft_reset via PMC?
> > >
> > > This is basically No_Soft_Reset, yes. If a change similar to [1] woul=
d
> > > be acceptable based only on the No_Soft_Reset bit even with no concep=
t
> > > of power management in the virtio spec, then I personally don't have
> > > any problems with that.
> > >
> > > [1] https://lore.kernel.org/lkml/20231113055138.117392-1-stevensd@chr=
omium.org/
> >
> > So if I read the code correctly, the current Qemu advertises PM but
> > without no_soft_reset.
> >
> > So this patch seems to break e.g virtio-net and doesn't fix virtio-GPU.
> >
> > Thanks
> >
> > >
> > > -David
> > >
>
> what is the breakage exactly?

It looks to me we need:

1) Device side, if device can preserve state on d3hot, it may
advertise no_soft_reset
2) Driver side, if driver sees no_soft_reset, it doesn't need to
manually suspend and resume. But in the above patch, it only checks
the existence of PM, it looks to me it needs to check no_soft_reset
instead.

> Maybe we need a new feature bit?

Probably not.

Thanks

>
> --
> MST
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

