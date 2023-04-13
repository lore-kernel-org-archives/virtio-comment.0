Return-Path: <virtio-comment-return-5457-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B2DC77B61
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 15:57:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 842D62AEEA
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 15:57:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6BAB99865FF
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 15:57:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 59EBF9865FD; Thu, 13 Apr 2023 15:57:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 46F8C9865FE
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Apr 2023 15:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: j7q0ZriiNrWzAOIjog5bbA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681401451; x=1683993451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rsprKwroaWMnMl7gEdUC3Tab6/Ival6pFMQj11FGeVg=;
        b=T4IXsfreNcsHQHJ0rRPmKXsIibzmOdncOXbWah0Sfqb44wlgqojPBgXVQIOlPQ/iFu
         I97NlBlPgajSYcczeuKp4WWNwlRa8cliCDizAr7g7z68eNC/MtBSwPIjP+1fPfGAmzXL
         2NrVQZ0w/BHRQCRy3jBPfEm+/7eDajBOe144TkZR6RvEvsP9HUx9BgcEecYXNjApQoiD
         kU3f2aKfRcHgmYxE1aC+c+t1XDqP0KX/+Bat24M2JMfoPjpJ4CaFo4tg4FMpuxIf701i
         h+smasIL+2Kl0utk9NVifJV1+SwtOC60v5rC0fHRsffBJZOzuXTOJjywrqX64coplbmD
         xFKg==
X-Gm-Message-State: AAQBX9eW4uXHdFJLuYHwu6tVPfn9oplDCgnv9oKxuUCnrW/bN1t2dd1g
	17FVeQkBp6lh9cs6C+ju1mxbYZy/v1AGjo3hNXitT4opXqm/tEV7ADXQ8qTX9Erb09do6xf6GSR
	7rajDA/peyOWaajthLM/uhtYUU58mthLtjQ==
X-Received: by 2002:adf:eb0b:0:b0:2d8:47c7:7b50 with SMTP id s11-20020adfeb0b000000b002d847c77b50mr2030325wrn.1.1681401450717;
        Thu, 13 Apr 2023 08:57:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZHU5D4Nb3vr0DSt+tEkAQwAYdTsYd1xdQyCHlJXTggNzu1ExsFNj4iCweDq6tzPcm0wM0tfA==
X-Received: by 2002:adf:eb0b:0:b0:2d8:47c7:7b50 with SMTP id s11-20020adfeb0b000000b002d847c77b50mr2030314wrn.1.1681401450381;
        Thu, 13 Apr 2023 08:57:30 -0700 (PDT)
Date: Thu, 13 Apr 2023 11:57:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Cc: virtio-comment@lists.oasis-open.org
Message-ID: <20230413115008-mutt-send-email-mst@kernel.org>
References: <20230406073002.3642873-1-stevensd@chromium.org>
 <20230407072507-mutt-send-email-mst@kernel.org>
 <CAD=HUj53_M_H6wC9q8qB5b6HC8n-F7KyOFRsO0qsjDpXWhaS6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj53_M_H6wC9q8qB5b6HC8n-F7KyOFRsO0qsjDpXWhaS6Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [RFC] Define a low power state for devices

On Thu, Apr 13, 2023 at 03:29:43PM +0900, David Stevens wrote:
> On Fri, Apr 7, 2023 at 8:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Apr 06, 2023 at 04:30:02PM +0900, David Stevens wrote:
> > > This RFC defines a low power state for virtio devices, to gives
> > > drivers an option for power management besides simply resetting their
> > > device.
> > >
> > > This patch is a draft aimed at starting a discussion, rather than being
> > > a finalized patch.
> > >
> > > To provide some context on where this is coming from, I'm working on
> > > reducing the power overhead of ARCVM (virtualized Android running on
> > > ChromeOS). One of the big gaps in ARCVM power management is that it does
> > > not implement Android's partial wake locks - i.e. the (virtualized) CPUs
> > > are always on, even if the (virtualized) screen is off. This means we
> > > can't force apps to stop running when they shouldn't be running, which
> > > can lead to higher power consumption compared to the ChromeOS baseline.
> > >
> > > Partial wake locks are built on s2idle, but unfortunately the current
> > > power management of virtio drivers does not let us use s2idle. The fact
> > > that power management is based around resetting the virtio device means
> > > that it doesn't work with stateful devices (e.g. virtio-fs). Even for
> > > stateless devices, re-initializing all of the devices takes longer than
> > > we would like, especially on lower end hardware.
> > >
> > > My rough idea for how to address this would be to make the existing
> > > virtio power management targeted at S4 specifically (i.e. the freeze
> > > device callback). For S0/S1/S3 (i.e. the suspend device callback), this
> > > new lighter weight low power state would be used if available -
> > > otherwise it would fall back to the existing S4 power management code.
> > >
> > > I have a very rough prototype that seems to work, and I haven't seen
> > > anything that makes me think this approach is fundamentally unworkable.
> > > That said, I would like to get feedback on the approach earlier rather
> > > than later.
> > > ---
> > >  content.tex | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/content.tex b/content.tex
> > > index cff548ab9675..01da6f62ef20 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -449,6 +449,28 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
> > >  types. It is RECOMMENDED that devices generate version 4
> > >  UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
> > >
> > > +\section{Low Power Mode}\label{sec:Basic Facilities of a Virtio Device / Low Power Mode}
> > > +
> > > +A virtio device can be put into a low power state when the
> > > +VIRTIO_F_LOW_POWER bit is negotiated. How a driver puts a
> > > +device into a low power state is transport specific.
> > > +
> > > +In general, a virtio device in a low power state should
> > > +avoid initating any communication with the driver. However,
> > > +certain device-specific functionality is exempt from this
> > > +requirement. Such functionality is detailed in the device
> > > +type specifications.
> > > +
> > > +% One example of such functionality would be allowing
> > > +% the virtio-net device to wake up the guest to deliver
> > > +% incoming network packets.
> > > +
> > > +While a virtio device is in a low power state, it should
> > > +maintain any type specific state in such a way that it is
> > > +able to immediately resume functioning upon leaving the low
> > > +power state, without the need for any additional
> > > +communication with the driver.
> > > +
> > >  \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
> > >
> > >  We start with an overview of device initialization, then expand on the
> > > @@ -803,6 +825,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >    that the driver can reset a queue individually.
> > >    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
> > >
> > > +  \item[VIRTIO_F_LOW_POWER(41)] This feature indicates
> > > +  that the driver can put the device into a low power mode.
> > > +  See \ref{sec:Basic Facilities of a Virtio Device / Low Power Mode}.
> > > +
> > >  \end{description}
> > >
> > >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> >
> > So what purpose does this flag serve exactly?  I guess transports also
> > provide ways to enumerate supported power states, no?
> 
> This is mostly here to parallel the VIRTIO_F_SR_IOV feature flag.
> Generally speaking, it does seem redundant with the transport-specific
> enumeration.
> 
> The two potential uses I can think of would be to allow devices to
> support transport level power management without supporting virtio
> level power management (might apply to existing devices?) and to allow
> devices to behave differently if they know that the driver doesn't
> support virtio power management. But I don't know how useful these are
> in practice.
> 
> -David

I'm a bit confused by all this. So there are actually two types of PM?
What does initiating communication involve? Is consuming buffers
initiating communication? Sending interrupts?


-- 
MST


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

