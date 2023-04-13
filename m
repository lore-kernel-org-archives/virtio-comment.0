Return-Path: <virtio-comment-return-5455-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDD2C77B61
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 06:29:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 817212AEF6
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 06:29:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6BA7F986601
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 06:29:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 574C69865F7; Thu, 13 Apr 2023 06:29:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 460109865F8
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Apr 2023 06:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681367395; x=1683959395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COfjOeq0eD2PzUENBiCPoxPGXtJHgwSsnLb7Pm4TfpM=;
        b=lHm0viILwCnjQ0BGsrLJpNeOskz5I1J2Be6+0UyM/c/9o6A8FZUguEV0f60amV4srm
         hRWQoE+CvtH6d30XkiAmfkpoCp7BdY7nx3eOx8DR/EXY0Fo0CbY8LCWSqS2XBEscDzcI
         5uHVWE0rejlDtWQTla+M6s/wqQC1KwIhclHuDI9kG3bSenGDmgxH4JLDvx2f7Inj722L
         zLdMXYcNd5vpQBXKHd8B7ziFGxuzR1WAdKSYBfdj71R7mO8346mBS+zgNYFmo7uuBkok
         i9aleQu/E9Cchc05l0T+SQCQp0sNObw5O51uYfsmDeqxBpksuDAf/qabFHMmQlsqxKWb
         Qduw==
X-Gm-Message-State: AAQBX9fKUWd2McsrhmYxbuFGYEVvz5MaMdPmFuVMdysb8zyiwTaVwPBW
	cE0ITT6Nr1o5PQSPraVCAFkA4imbf6ST5kvP6NX/7w==
X-Google-Smtp-Source: AKy350YNpJX7II076WW6+ujabZqkeiodhgX3JHVvXRG0ANoHbArCIgAsguxaRw1wyYBsN9oLShTpetH39bx6E9YqoYY=
X-Received: by 2002:a2e:8ec9:0:b0:2a1:d819:f0ae with SMTP id
 e9-20020a2e8ec9000000b002a1d819f0aemr369156ljl.9.1681367395125; Wed, 12 Apr
 2023 23:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230406073002.3642873-1-stevensd@chromium.org> <20230407072507-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230407072507-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 13 Apr 2023 15:29:43 +0900
Message-ID: <CAD=HUj53_M_H6wC9q8qB5b6HC8n-F7KyOFRsO0qsjDpXWhaS6Q@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [RFC] Define a low power state for devices

On Fri, Apr 7, 2023 at 8:27=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
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
> >
> > diff --git a/content.tex b/content.tex
> > index cff548ab9675..01da6f62ef20 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -449,6 +449,28 @@ \section{Exporting Objects}\label{sec:Basic Facili=
ties of a Virtio Device / Expo
> >  types. It is RECOMMENDED that devices generate version 4
> >  UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
> >
> > +\section{Low Power Mode}\label{sec:Basic Facilities of a Virtio Device=
 / Low Power Mode}
> > +
> > +A virtio device can be put into a low power state when the
> > +VIRTIO_F_LOW_POWER bit is negotiated. How a driver puts a
> > +device into a low power state is transport specific.
> > +
> > +In general, a virtio device in a low power state should
> > +avoid initating any communication with the driver. However,
> > +certain device-specific functionality is exempt from this
> > +requirement. Such functionality is detailed in the device
> > +type specifications.
> > +
> > +% One example of such functionality would be allowing
> > +% the virtio-net device to wake up the guest to deliver
> > +% incoming network packets.
> > +
> > +While a virtio device is in a low power state, it should
> > +maintain any type specific state in such a way that it is
> > +able to immediately resume functioning upon leaving the low
> > +power state, without the need for any additional
> > +communication with the driver.
> > +
> >  \chapter{General Initialization And Device Operation}\label{sec:Genera=
l Initialization And Device Operation}
> >
> >  We start with an overview of device initialization, then expand on the
> > @@ -803,6 +825,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
> >    that the driver can reset a queue individually.
> >    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virt=
queue Reset}.
> >
> > +  \item[VIRTIO_F_LOW_POWER(41)] This feature indicates
> > +  that the driver can put the device into a low power mode.
> > +  See \ref{sec:Basic Facilities of a Virtio Device / Low Power Mode}.
> > +
> >  \end{description}
> >
> >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bit=
s}
>
> So what purpose does this flag serve exactly?  I guess transports also
> provide ways to enumerate supported power states, no?

This is mostly here to parallel the VIRTIO_F_SR_IOV feature flag.
Generally speaking, it does seem redundant with the transport-specific
enumeration.

The two potential uses I can think of would be to allow devices to
support transport level power management without supporting virtio
level power management (might apply to existing devices?) and to allow
devices to behave differently if they know that the driver doesn't
support virtio power management. But I don't know how useful these are
in practice.

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

