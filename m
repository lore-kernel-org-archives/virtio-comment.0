Return-Path: <virtio-comment-return-5487-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7C2C77B70
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 08:03:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 106692AC64
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 08:03:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1373A986613
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 08:03:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 00698984140; Fri, 14 Apr 2023 08:03:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1356986600
	for <virtio-comment@lists.oasis-open.org>; Fri, 14 Apr 2023 08:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681459412; x=1684051412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3jm+LjUjhXNbTBwmcWiB7EQHlWdERZUgCJ9jcqTEgM=;
        b=bSKjlTSm3b7d4OQNY+kxksx0Xoy19V9tlxZSRjQdPTJz5Xp7NF+4AbSft2knsRUmzw
         PF8wnWA/TZPwZfVXrCcZ7yeqkYIqMvVQt2TV1rx0vuC4vuYpvemFM2sJtJzUgIZ13CD6
         6MlZrUT2JfuyLbM4VcUnUt1xshCnqiteg3NBBedPheuu8PEjazKFIptX54e0IAxRTMR+
         tJ05JCclBeWDL8DsAzAXa4VhgAqX3jOZstCZicGu5/+Q0XYb29nZIQu03srTx2Eab45O
         NdsMeGW/Fahuppq9Jg2Yp3S5kEpDylRVKx9PHYRrhKOXrN0GAviZihy2CMes6Ebc+LGp
         mpJQ==
X-Gm-Message-State: AAQBX9cGUfdlsnDUMINKXNf8ymPX2UXuNLkG1PskOeMQQ5vOQbhfuuE+
	qyASZyZp87Rsm/UGsBV4GvqSsVAALtjacxT/TcolrA==
X-Google-Smtp-Source: AKy350Z9S2ubQB+pSOzM+xqhQGZ2RM8exsEy1rcdHJ0QdQHGvCzqSjy09iB2k2gUXhb0OqBrqiIdaDC8JI1snH0t2+Q=
X-Received: by 2002:a2e:8255:0:b0:2a8:aefd:c6c6 with SMTP id
 j21-20020a2e8255000000b002a8aefdc6c6mr132124ljh.9.1681459412477; Fri, 14 Apr
 2023 01:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230406073002.3642873-1-stevensd@chromium.org>
 <20230407072507-mutt-send-email-mst@kernel.org> <CAD=HUj53_M_H6wC9q8qB5b6HC8n-F7KyOFRsO0qsjDpXWhaS6Q@mail.gmail.com>
 <20230413115008-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230413115008-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Fri, 14 Apr 2023 17:03:21 +0900
Message-ID: <CAD=HUj6xs3o_CRzOO-EU=BFkVi0=8YC34meVWCUAXWzht_sC9A@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [RFC] Define a low power state for devices

On Fri, Apr 14, 2023 at 12:57=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Thu, Apr 13, 2023 at 03:29:43PM +0900, David Stevens wrote:
> > On Fri, Apr 7, 2023 at 8:27=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Thu, Apr 06, 2023 at 04:30:02PM +0900, David Stevens wrote:
> > > > This RFC defines a low power state for virtio devices, to gives
> > > > drivers an option for power management besides simply resetting the=
ir
> > > > device.
> > > >
> > > > This patch is a draft aimed at starting a discussion, rather than b=
eing
> > > > a finalized patch.
> > > >
> > > > To provide some context on where this is coming from, I'm working o=
n
> > > > reducing the power overhead of ARCVM (virtualized Android running o=
n
> > > > ChromeOS). One of the big gaps in ARCVM power management is that it=
 does
> > > > not implement Android's partial wake locks - i.e. the (virtualized)=
 CPUs
> > > > are always on, even if the (virtualized) screen is off. This means =
we
> > > > can't force apps to stop running when they shouldn't be running, wh=
ich
> > > > can lead to higher power consumption compared to the ChromeOS basel=
ine.
> > > >
> > > > Partial wake locks are built on s2idle, but unfortunately the curre=
nt
> > > > power management of virtio drivers does not let us use s2idle. The =
fact
> > > > that power management is based around resetting the virtio device m=
eans
> > > > that it doesn't work with stateful devices (e.g. virtio-fs). Even f=
or
> > > > stateless devices, re-initializing all of the devices takes longer =
than
> > > > we would like, especially on lower end hardware.
> > > >
> > > > My rough idea for how to address this would be to make the existing
> > > > virtio power management targeted at S4 specifically (i.e. the freez=
e
> > > > device callback). For S0/S1/S3 (i.e. the suspend device callback), =
this
> > > > new lighter weight low power state would be used if available -
> > > > otherwise it would fall back to the existing S4 power management co=
de.
> > > >
> > > > I have a very rough prototype that seems to work, and I haven't see=
n
> > > > anything that makes me think this approach is fundamentally unworka=
ble.
> > > > That said, I would like to get feedback on the approach earlier rat=
her
> > > > than later.
> > > > ---
> > > >  content.tex | 26 ++++++++++++++++++++++++++
> > > >  1 file changed, 26 insertions(+)
> > > >
> > > > diff --git a/content.tex b/content.tex
> > > > index cff548ab9675..01da6f62ef20 100644
> > > > --- a/content.tex
> > > > +++ b/content.tex
> > > > @@ -449,6 +449,28 @@ \section{Exporting Objects}\label{sec:Basic Fa=
cilities of a Virtio Device / Expo
> > > >  types. It is RECOMMENDED that devices generate version 4
> > > >  UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
> > > >
> > > > +\section{Low Power Mode}\label{sec:Basic Facilities of a Virtio De=
vice / Low Power Mode}
> > > > +
> > > > +A virtio device can be put into a low power state when the
> > > > +VIRTIO_F_LOW_POWER bit is negotiated. How a driver puts a
> > > > +device into a low power state is transport specific.
> > > > +
> > > > +In general, a virtio device in a low power state should
> > > > +avoid initating any communication with the driver. However,
> > > > +certain device-specific functionality is exempt from this
> > > > +requirement. Such functionality is detailed in the device
> > > > +type specifications.
> > > > +
> > > > +% One example of such functionality would be allowing
> > > > +% the virtio-net device to wake up the guest to deliver
> > > > +% incoming network packets.
> > > > +
> > > > +While a virtio device is in a low power state, it should
> > > > +maintain any type specific state in such a way that it is
> > > > +able to immediately resume functioning upon leaving the low
> > > > +power state, without the need for any additional
> > > > +communication with the driver.
> > > > +
> > > >  \chapter{General Initialization And Device Operation}\label{sec:Ge=
neral Initialization And Device Operation}
> > > >
> > > >  We start with an overview of device initialization, then expand on=
 the
> > > > @@ -803,6 +825,10 @@ \chapter{Reserved Feature Bits}\label{sec:Rese=
rved Feature Bits}
> > > >    that the driver can reset a queue individually.
> > > >    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / =
Virtqueue Reset}.
> > > >
> > > > +  \item[VIRTIO_F_LOW_POWER(41)] This feature indicates
> > > > +  that the driver can put the device into a low power mode.
> > > > +  See \ref{sec:Basic Facilities of a Virtio Device / Low Power Mod=
e}.
> > > > +
> > > >  \end{description}
> > > >
> > > >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature=
 Bits}
> > >
> > > So what purpose does this flag serve exactly?  I guess transports als=
o
> > > provide ways to enumerate supported power states, no?
> >
> > This is mostly here to parallel the VIRTIO_F_SR_IOV feature flag.
> > Generally speaking, it does seem redundant with the transport-specific
> > enumeration.
> >
> > The two potential uses I can think of would be to allow devices to
> > support transport level power management without supporting virtio
> > level power management (might apply to existing devices?) and to allow
> > devices to behave differently if they know that the driver doesn't
> > support virtio power management. But I don't know how useful these are
> > in practice.
> >
> > -David
>
> I'm a bit confused by all this. So there are actually two types of PM?

At least in the PCI case, there are two different specifications
involved (VIRTIO and PCI/PCIe), so I think it's fair to say there are
two different types of power management. If we want any specific
behavior when devices are in the "VIRTIO" low power mode, if we don't
have a feature bit somewhere, then we'd be mandating that feature for
any virtio device which implements PCI power management.

In particular, I would like to require that VIRTIO low power mode
preserves state, which is stricter than the PCI/PCIe spec. Reading the
spec again, keying on No_Soft_Reset =3D 1b might be sufficient, although
it's not completely clear to me whether No_Soft_Reset is a static
property of a given device or a property of a specific D3_Hot -> D0
transition. If it's a static property of the device, then I guess we
can probably avoid defining a top level feature bit in favor of device
type feature bits for any device-specific changes that we hash out
later.

> What does initiating communication involve? Is consuming buffers
> initiating communication? Sending interrupts?

I think I was coming at defining what low power state means from the
wrong way. Rather than defining what a device can't do, I think it's
easier to define what a device must do. How about this definition:

+ A driver MUST not interact with a device in low power mode device
+ in any way except for to take the device out of low power mode or to
+ handle wakeup events generated by the device. How wakeup events
+ are implemented is transport specific, and when a device should
+ generate wakeup events is device type specific.
+
+ A device in low power mode MUST maintain its state such that all driver
+ visible state after exiting low power mode exactly matches driver visible
+ state before entering low power mode. A device in low power mode
+ SHOULD minimize its resource usage, although what steps to take are
+ specific to a particular device implementation.

This modified definition would let us replace the part about
"initiating communication" in the PCI changes to just be

+ Wakeup events are implemented as PMEs.

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

