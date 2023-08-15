Return-Path: <virtio-comment-return-7103-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7DAC001DB
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:26:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B20B229FD0
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:26:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E2999863A4
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:26:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 93E1B983C28; Tue, 15 Aug 2023 00:26:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 813CB98634B
	for <virtio-comment@lists.oasis-open.org>; Tue, 15 Aug 2023 00:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: nLtsib-BN4KdvQZhdSH3fA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692059209; x=1692664009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Wi+j0slIr+zbwfw2qSE/SSyT7XHZ0bWHuKPipFt8E=;
        b=EMzhM46VSWtXL388ejfPdTWJRbrWK4u8tKo7BP+Z0fRos9n58dvSpOK2QbRUHMhySH
         Unc8gvvw4RYWxwVgGY65VOHJxpxGcY84rNYiL2yECmJDZReB4XGZPOz7/Rl4Sp8gzh+f
         uvliM82eMSxqRTWpNqFfgc1vRl8of2Gxv1XN60IC1EWlmxi0wJ8/x/6dtCuo7ag/l/G+
         mHwaJKUCq/fkA8ms9WdDyuoBXxYKF7W+EE9uDEG3ROZoylGz76iYCMx6iyacu7HF+aKc
         LsuE82nzIQTuSH6pVNecTnMk1aieJDOL2PJ9NHT3dYg2H2sOsgDiXIasHI/i0+Uj/2vu
         afag==
X-Gm-Message-State: AOJu0YwnUyYbTHNK6WCenqqlug8EYrL5vfBZUUtZthBiVIrjS8GQOaXV
	e9sq6ktQGD7d8lQtZvZKzc0EU9eNrcYKTd0XuNCw+dxU8UQoTsRiKP20PmGD6+52S61QFqNMNVf
	SFQf5o+sCzgq+ghyXrrG5pox13Kf4hR+mZhpDIKpBwTuYFyeD0Q==
X-Received: by 2002:a2e:2404:0:b0:2b9:f1ad:9503 with SMTP id k4-20020a2e2404000000b002b9f1ad9503mr7200725ljk.35.1692059209663;
        Mon, 14 Aug 2023 17:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH50RKmtyZ7OjEFFplf3IEsWJD5ihuO9/oAEu9QrHDydBHpwZXDtq9Cq5trvmfxah8qy6STG+goh/Q/o2z1BVY=
X-Received: by 2002:a2e:2404:0:b0:2b9:f1ad:9503 with SMTP id
 k4-20020a2e2404000000b002b9f1ad9503mr7200715ljk.35.1692059209260; Mon, 14 Aug
 2023 17:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230814192904.30062-1-lingshan.zhu@intel.com> <20230814192904.30062-2-lingshan.zhu@intel.com>
In-Reply-To: <20230814192904.30062-2-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 15 Aug 2023 08:26:38 +0800
Message-ID: <CACGkMEvmYqKTk1Hveo96oKYw4hbEDJD2x5Ye3_nkeBTH0rcMMw@mail.gmail.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: mst@redhat.com, eperezma@redhat.com, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [RFC PATCH 1/5] virtio: introduce SUSPEND bit in device status

On Mon, Aug 14, 2023 at 7:29=E2=80=AFPM Zhu Lingshan <lingshan.zhu@intel.co=
m> wrote:
>
> This patch introudces a new status bit in the device status: SUSPEND.
>
> This SUSPEND bit can be used by the driver to suspend a device,
> in order to stablize the device states and virtqueue states.
>
> Its main use case is live migration.

I think patch 3 needs to be squashed into this one.

>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Eugenio P=C3=83rez <eperezma@redhat.com>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  content.tex | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 0a62dce..1bb4401 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Basic F=
acilities of a Virtio Dev
>  \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>    drive the device.
>
> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that =
the
> +  device has been suspended by the driver.
> +
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
>  \end{description}
> @@ -73,6 +76,10 @@ \section{\field{Device Status} Field}\label{sec:Basic =
Facilities of a Virtio Dev
>  recover by issuing a reset.
>  \end{note}
>
> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set.
> +
> +When set SUSPEND, the driver MUST re-read \field{device status} to ensur=
e the SUSPEND bit is set.
> +
>  \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a=
 Virtio Device / Device Status Field}
>
>  The device MUST NOT consume buffers or send any used buffer
> @@ -82,6 +89,13 @@ \section{\field{Device Status} Field}\label{sec:Basic =
Facilities of a Virtio Dev
>  that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS=
_RESET, the device
>  MUST send a device configuration change notification to the driver.
>
> +The device MUST ignore SUSPEND if FEATURES_OK is not set.

Is there any value to allow SUSPEND to be set without DRIVER_OK?

> +
> +The deivce MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated.

typo.

Thanks

> +
> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device MUST cl=
ear SUSPEND
> +and resumes operation upon DRIVER_OK.
> +
>  \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / F=
eature Bits}
>
>  Each virtio device offers all the features it understands.  During
> @@ -872,6 +886,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved F=
eature Bits}
>         \ref{devicenormative:Basic Facilities of a Virtio Device / Featur=
e Bits} for
>         handling features reserved for future use.
>
> +  \item[VIRTIO_F_SUSPEND(41)] This feature indicates that the driver can
> +   SUSPEND the device.
> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Fiel=
d}.
> +
>  \end{description}
>
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> --
> 2.35.3
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

