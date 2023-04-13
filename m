Return-Path: <virtio-comment-return-5454-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92098C77B6C
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 05:47:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BA9E42AEEA
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 05:47:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6B4E9865FF
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 05:47:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 979939865F7; Thu, 13 Apr 2023 05:47:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 863809865F8
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Apr 2023 05:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681364835; x=1683956835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cq+3D1UNID/L21s76d9e2AuC546/rAYe13wBCtIeQ8I=;
        b=IvjwZmIKpbIBIplmSFhlmYnMtnWuTV+BLtdGgbDCGOKKgCbAX+JBOKfdgWCHj/wylr
         FCgk2OdA0jIbKSwXmQ473YKqbzElxyqJe9fLNVeO2cZ079zUOEd19lWeC435/KmLNrpo
         ceICt8Lo84E2BD0q8nq8SXmvlrzi5WKg4Y3dBX604XunLPnqNXY95ZpJM6p9ViOLBNfh
         AGaL7we9nIPcMlCutrl20MHoM9iqdBT6laaujU2yzn54XjA4BJMIiOd5TyhK9x1q46Tj
         AiPOkAl+89RHBYwpY8sy3j/LR7aKu4w9w1yy8zIJIscMUHXbgBvnXhsODV0qlA67cKyK
         6h4g==
X-Gm-Message-State: AAQBX9ePra+lKXAgMsUjI251fpm4U8CB8eUwJ37LR+3mCrsm4aQ6E7jL
	mfmreyctasaeYxeHI+dVt2i79NmRRyxl8o5w/jZfhg==
X-Google-Smtp-Source: AKy350b8xChEvuLrmyyBIne5GZIRB8KE3gTOAB6O4ZwgxS1ZY8Y/veRtl9wIM0+HZagyvnO+HjDurkhKKwOPea4qiJw=
X-Received: by 2002:a2e:8296:0:b0:2a7:73ce:93be with SMTP id
 y22-20020a2e8296000000b002a773ce93bemr340371ljg.9.1681364835460; Wed, 12 Apr
 2023 22:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230406073002.3642873-1-stevensd@chromium.org> <20230406123505.GA714885@fedora>
In-Reply-To: <20230406123505.GA714885@fedora>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 13 Apr 2023 14:47:04 +0900
Message-ID: <CAD=HUj7yocc+ijGKVmpTqOyiF0g7GjasPV-E22VdRM3CW83pcA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [RFC] Define a low power state for devices

On Thu, Apr 6, 2023 at 9:35=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
>
> On Thu, Apr 06, 2023 at 04:30:02PM +0900, David Stevens wrote:
> > This RFC defines a low power state for virtio devices, to gives
> > drivers an option for power management besides simply resetting their
> > device.
> >
> > This patch is a draft aimed at starting a discussion, rather than being
> > a finalized patch.
> >
> > To provide some context on where this is coming from, I'm working on
> > reducing the power overhead of ARCVM (virtualized Android running on
> > ChromeOS). One of the big gaps in ARCVM power management is that it doe=
s
> > not implement Android's partial wake locks - i.e. the (virtualized) CPU=
s
> > are always on, even if the (virtualized) screen is off. This means we
> > can't force apps to stop running when they shouldn't be running, which
> > can lead to higher power consumption compared to the ChromeOS baseline.
> >
> > Partial wake locks are built on s2idle, but unfortunately the current
> > power management of virtio drivers does not let us use s2idle. The fact
> > that power management is based around resetting the virtio device means
> > that it doesn't work with stateful devices (e.g. virtio-fs). Even for
> > stateless devices, re-initializing all of the devices takes longer than
> > we would like, especially on lower end hardware.
> >
> > My rough idea for how to address this would be to make the existing
> > virtio power management targeted at S4 specifically (i.e. the freeze
> > device callback). For S0/S1/S3 (i.e. the suspend device callback), this
> > new lighter weight low power state would be used if available -
> > otherwise it would fall back to the existing S4 power management code.
> >
> > I have a very rough prototype that seems to work, and I haven't seen
> > anything that makes me think this approach is fundamentally unworkable.
> > That said, I would like to get feedback on the approach earlier rather
> > than later.
> > ---
> >  content.tex | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
>
> I'm curious to see how this maps to virtio-pci and the underlying PCI
> power management features. Do you have a VIRTIO PCI transport spec
> proposal you can share?

Here's a proposal for the change to the VIRTIO PCI transport spec. In
my testing, this is sufficient for things to work with Linux's
existing PCI power management functionality. Although I'm far from an
expert in this area, so I definitely could be missing something.

diff --git a/transport-pci.tex b/transport-pci.tex
index 5d984673cd60..a2e78bd118f2 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -1146,3 +1146,15 @@ \subsubsection{Driver Handling
Interrupts}\label{sec:Virtio Transport Options /
         re-examine the configuration space to see what changed.
     \end{itemize}
 \end{itemize}
+
+\devicenormative{\paragraph}{Notification of Device Configuration
Changes}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific
Initialization And Device Operation / Low Power Mode}
+
+Low power mode corresponds to the device power management state
+D3\textsubscript{Hot}. A device offering VIRTIO_F_LOW_POWER MUST
+present the PCI Power Management Capability. Such a device MUST
+NOT perform an internal reset when transitioning from
+D3\textsubscript{Hot} to D0.
+
+When a device in a low power state initiates communication with
+the driver, it MUST generate a PME via the transport appropriate
+mechanism.

-David

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

