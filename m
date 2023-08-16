Return-Path: <virtio-comment-return-7160-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11750C001DE
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 01:59:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B49B7EEA2F
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 01:59:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1FBE698648A
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 01:59:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 119B79863D8; Wed, 16 Aug 2023 01:59:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF5D49863D7
	for <virtio-comment@lists.oasis-open.org>; Wed, 16 Aug 2023 01:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DN3tmUzgMvy7oN0IYyxLgQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692151151; x=1692755951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhnM3d7+kGQVCR9geB3DVYn7WC3MrpU3nOGM0Pu6axk=;
        b=CJWHNApAhkVeTgtosNvVbnpaTTmu7StmPoa5Y0iIG4tKJvmKuruVNxVXtQicA7/WKg
         CdwHEIBqw+kFiBezB7ptagJkXvz1Q7WagBSb45Sz+dJQjcXGuAneYZJRlfVLuyuPaWRp
         2W2sJIBGkl4A6Vxr55IIID9SFUx+xHEkeqAgdEmZpDOkZ4MXdUqyoS63tUBIoM1Avlul
         EtkfHZ6sI4R13RWO2ShHZRgYNJzRi8Vcn2Ddj+hVRsdokxdP/ICbkwHLxti5EflU9/u2
         NaE4n33hno3BrOg+mlSsIu/yKrR5U6Z57PGCyQDYVTW1rrzgTnnf6QPvqMH/2OuvKKGq
         K1uw==
X-Gm-Message-State: AOJu0Yxfjy1ixuyPN+YxNqulhmpUYDuaMSWvvyXRoJEuA5FRFbbyQ5z8
	ZGFoFNrw5qzGhAzNqRMpBfg1pAJGjGv8KHzs91UoWDL/2TzKozwwKMWljxzuMJFCNn9snsKVwf/
	2WB7UFF8hSA6OYETs+lm1h4GtEYDIHEJ5iY/vYqhvwAWzOA0cbA==
X-Received: by 2002:a2e:9942:0:b0:2b9:344c:181e with SMTP id r2-20020a2e9942000000b002b9344c181emr223307ljj.19.1692151151289;
        Tue, 15 Aug 2023 18:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkgHVjKv1f/puvO13lqiQd4Q8/dZ2ySCbW0zcs/kaZtUdbkW84N6hNSDSWQjn4G01P61/+TsuKOsWVdEcPuNk=
X-Received: by 2002:a2e:9942:0:b0:2b9:344c:181e with SMTP id
 r2-20020a2e9942000000b002b9344c181emr223274ljj.19.1692151147986; Tue, 15 Aug
 2023 18:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230814192904.30062-1-lingshan.zhu@intel.com>
 <20230814192904.30062-2-lingshan.zhu@intel.com> <CACGkMEvmYqKTk1Hveo96oKYw4hbEDJD2x5Ye3_nkeBTH0rcMMw@mail.gmail.com>
 <CACGkMEt4mYmf+6+WC=WEZqiJgO2tNo96Ekr5bbyN6akxpjwFqw@mail.gmail.com> <6d41cf4f-8cc2-6bad-7b22-2369fd6a620c@intel.com>
In-Reply-To: <6d41cf4f-8cc2-6bad-7b22-2369fd6a620c@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 16 Aug 2023 09:58:56 +0800
Message-ID: <CACGkMEte7KEi6XS17HFTa=xLSuA2NA5XDUUevJuieNZ00k5+gg@mail.gmail.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: mst@redhat.com, eperezma@redhat.com, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [RFC PATCH 1/5] virtio: introduce SUSPEND bit in device status

On Tue, Aug 15, 2023 at 6:48=E2=80=AFPM Zhu, Lingshan <lingshan.zhu@intel.c=
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
> Patch 3 mentions Virtqueue State that is introduced in patch 2,

Ok, so let's reorder the let patch 2 come first.

Thanks

> so I think patch 3 should placed after patch 2.
>
> Thanks
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
> If live migration happens when the guest initializing the device,
> maybe the guest driver has already configured some virtqueues or
> modified the config space. At that point, We should allow to suspend
> the device, because the hypervisor should not reset the device at
> that moment.
>
> SUSPEND requires FEATURES_OK because VIRTIO_F_SUSPEND has to be negotiate=
d.
> >>
> >>> +
> >>> +The deivce MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated=
.
> >> typo.
> Yes
> >>
> >> Thanks
> > Btw, it's not clear to me if driver is allowed to clear this bit.
> Patch 1 mentions that DRIVER_OK clears SUSPEND, so that the driver
> can resume the device if LM fails.
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

