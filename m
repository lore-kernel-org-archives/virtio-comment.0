Return-Path: <virtio-comment-return-7161-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B321EC0015E
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 02:05:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 04C9D157EE6
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 02:05:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E09B19863FE
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 02:05:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C969298633B; Wed, 16 Aug 2023 02:05:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EDE829863D7
	for <virtio-comment@lists.oasis-open.org>; Wed, 16 Aug 2023 02:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3bC72_ngMimwF760jCl1cw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692151514; x=1692756314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCLNCuomc2Yfe5HLnuPvE5absiI1cV1tBKr/SKiX0As=;
        b=LEzBH+0s1RHruS1LGc6jJKhAr4U28Au9oEaeHDhgWerJJYsXxbRzwf1+ap9dNoWdYl
         qR2psO5ARKYej/7xkEbgDgm4NWqrF/CoCzKB7Kv49dK/0wnMpUN4HKj2Dn2ZbZ7FUm4W
         9M/wa2QiNGvZtFcakMDWNcUgOQmvWhdaZCAbNZ11GLwgj/xe1QcKhryJr5vbgTqktDAp
         qFfegJD8ta3/cW3rtZQoRMJtGSRYQEqUIEyWvSlHbZU6F5YZp9XKsFG+aMnvFjhZsG/B
         ImR0llcbRLVTBGAwq2n8MLTPJqGvLTBlbCSd60feOyfvZY0l4atD8kYqMXuwu0oKRA5m
         VvvA==
X-Gm-Message-State: AOJu0YziKp9a8Brm5CwHzziwWr5ssniE9av102uvDu2ov/ZXkpyQ3PGI
	j58+hfsS2yil55VWP5AoGDk0Eq9j3IDfpIeXxqwCEmiiSgDyp4ez3ZylN3ncHHMd1+1sJ+RrVBh
	IxWWPDSthU/AZHV5mU18z/y6MW8ruKEH524rkBFdJNtrRDm09Yg==
X-Received: by 2002:a2e:320d:0:b0:2b6:cdfb:d06a with SMTP id y13-20020a2e320d000000b002b6cdfbd06amr386161ljy.22.1692151513811;
        Tue, 15 Aug 2023 19:05:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa41j2HrsEqwHrx5QFfRfZVERa1TxBAV02QjHZGfMvO3KsJ0Slxmh7JmhrX3hetveRlZ1F01nWiqEXfgaypbM=
X-Received: by 2002:a2e:320d:0:b0:2b6:cdfb:d06a with SMTP id
 y13-20020a2e320d000000b002b6cdfbd06amr386144ljy.22.1692151513497; Tue, 15 Aug
 2023 19:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230814192904.30062-1-lingshan.zhu@intel.com>
 <20230814192904.30062-2-lingshan.zhu@intel.com> <CACGkMEvmYqKTk1Hveo96oKYw4hbEDJD2x5Ye3_nkeBTH0rcMMw@mail.gmail.com>
 <CACGkMEt4mYmf+6+WC=WEZqiJgO2tNo96Ekr5bbyN6akxpjwFqw@mail.gmail.com> <47cc93ea-47e9-6390-4752-02f10f2bdc6e@intel.com>
In-Reply-To: <47cc93ea-47e9-6390-4752-02f10f2bdc6e@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 16 Aug 2023 10:05:02 +0800
Message-ID: <CACGkMEvuJ7iBL6NWesi8UO3Vw5216DobkL2bb525Hhh34x3h0w@mail.gmail.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: mst@redhat.com, eperezma@redhat.com, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [RFC PATCH 1/5] virtio: introduce SUSPEND
 bit in device status

On Tue, Aug 15, 2023 at 6:50=E2=80=AFPM Zhu, Lingshan <lingshan.zhu@intel.c=
om> wrote:
>
>
>
> On 8/15/2023 8:37 AM, Jason Wang wrote:
> > On Tue, Aug 15, 2023 at 8:26=E2=80=AFAM Jason Wang <jasowang@redhat.com=
> wrote:
> >> On Mon, Aug 14, 2023 at 7:29=E2=80=AFPM Zhu Lingshan <lingshan.zhu@int=
el.com> wrote:
> >>> This patch introudces a new status bit in the device status: SUSPEND.
> >>>
> >>> This SUSPEND bit can be used by the driver to suspend a device,
> >>> in order to stablize the device states and virtqueue states.
> >>>
> >>> Its main use case is live migration.
> >> I think patch 3 needs to be squashed into this one.
> >>
> >>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >>> Signed-off-by: Eugenio P=C3=83rez <eperezma@redhat.com>
> >>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >>> ---
> >>>   content.tex | 18 ++++++++++++++++++
> >>>   1 file changed, 18 insertions(+)
> >>>
> >>> diff --git a/content.tex b/content.tex
> >>> index 0a62dce..1bb4401 100644
> >>> --- a/content.tex
> >>> +++ b/content.tex
> >>> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Bas=
ic Facilities of a Virtio Dev
> >>>   \item[DRIVER_OK (4)] Indicates that the driver is set up and ready =
to
> >>>     drive the device.
> >>>
> >>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates t=
hat the
> >>> +  device has been suspended by the driver.
> >>> +
> >>>   \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experi=
enced
> >>>     an error from which it can't recover.
> >>>   \end{description}
> >>> @@ -73,6 +76,10 @@ \section{\field{Device Status} Field}\label{sec:Ba=
sic Facilities of a Virtio Dev
> >>>   recover by issuing a reset.
> >>>   \end{note}
> >>>
> >>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set.
> >>> +
> >>> +When set SUSPEND, the driver MUST re-read \field{device status} to e=
nsure the SUSPEND bit is set.
> >>> +
> >>>   \devicenormative{\subsection}{Device Status Field}{Basic Facilities=
 of a Virtio Device / Device Status Field}
> >>>
> >>>   The device MUST NOT consume buffers or send any used buffer
> >>> @@ -82,6 +89,13 @@ \section{\field{Device Status} Field}\label{sec:Ba=
sic Facilities of a Virtio Dev
> >>>   that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_=
NEEDS_RESET, the device
> >>>   MUST send a device configuration change notification to the driver.
> >>>
> >>> +The device MUST ignore SUSPEND if FEATURES_OK is not set.
> >> Is there any value to allow SUSPEND to be set without DRIVER_OK?
> >>
> >>> +
> >>> +The deivce MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated=
.
> >> typo.
> >>
> >> Thanks
> > Btw, it's not clear to me if driver is allowed to clear this bit.
> To allow terminate a live migration process or resume from a failed live
> migration,
> we allow DRIVER_OK to clear SUSPEND, in patch 1.

Does this imply DRIVER_OK is cleared during SUSPEND? This seems more
complicated than simply allowing clearing this bit?

Thanks

>
> Thanks
> >
> > Thanks
> >
> >>> +
> >>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device MUS=
T clear SUSPEND
> >>> +and resumes operation upon DRIVER_OK.
> >>> +
> >>>   \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Devic=
e / Feature Bits}
> >>>
> >>>   Each virtio device offers all the features it understands.  During
> >>> @@ -872,6 +886,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserv=
ed Feature Bits}
> >>>          \ref{devicenormative:Basic Facilities of a Virtio Device / F=
eature Bits} for
> >>>          handling features reserved for future use.
> >>>
> >>> +  \item[VIRTIO_F_SUSPEND(41)] This feature indicates that the driver=
 can
> >>> +   SUSPEND the device.
> >>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status =
Field}.
> >>> +
> >>>   \end{description}
> >>>
> >>>   \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature =
Bits}
> >>> --
> >>> 2.35.3
> >>>
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

