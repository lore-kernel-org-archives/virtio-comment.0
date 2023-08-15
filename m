Return-Path: <virtio-comment-return-7105-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87F8C001DB
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 50E5F613E4
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:35:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A0EB9865E1
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:35:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B849898634B; Tue, 15 Aug 2023 00:35:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B9AF983C28
	for <virtio-comment@lists.oasis-open.org>; Tue, 15 Aug 2023 00:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Rur3TGavOseWsItGuzscwQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692059676; x=1692664476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTmJDvoat24bg6vfrH8Ag23Z5dg1bg0d8Nh/SQtSCSE=;
        b=eaeCPKcB2GZpaXTZM1yvkob9mvoZuglHUODaIoyV9Bl8DtNzwj03SAmQWb8tAAadfL
         2fcYg3fEjxE/lYCHmEuoo07tSeaz/sePOONGtW/lxMPFmKNT4P517UtjTeSkDaAKlH8F
         7yzCptZkYJ7SpcMXrEfAEy/fNMVnSCHovBRnHVk36HUZa3c1/Blk9keKOp5WIfePn0h0
         SKQA7qXCNoLO8cUrMvljRDYTpfAxmDUaJQtI/LxXpWFSbOv7RD+8l4MHCBI5hxdx7ken
         lO6CzeRbD3EjfDma0OxMQHdXYI4/RZCxPOL7f3cHdMat3n/meuGeUAWguuPlsktF16t+
         goEg==
X-Gm-Message-State: AOJu0YzGQoaffZ/LP0SX9tRAmcXSKWHIQUvaNq/f5QkgPxEe15QqwA9O
	K/0u+0RUzzTJwP6lK34ZJuu8AIt8MCL8dW7RbkVf36kGcf7kFjnN7IyvG+JFYkNDzFTRXwxpsTr
	NH9TYxHjmMDKXx5l8sJywon6bOsQzoibaqc8oRLoe2zjMsCLJXw==
X-Received: by 2002:a2e:7014:0:b0:2b9:ac48:d7fe with SMTP id l20-20020a2e7014000000b002b9ac48d7femr7787144ljc.38.1692059676639;
        Mon, 14 Aug 2023 17:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnDAnDiUv2bhMctSQxVaCoKV65A0MIvFGqm2N22Cw4Vz6NXMd/K43yB1fsPdSK7wtmagU4FR2XX4Anh0Dd6/s=
X-Received: by 2002:a2e:7014:0:b0:2b9:ac48:d7fe with SMTP id
 l20-20020a2e7014000000b002b9ac48d7femr7787133ljc.38.1692059676354; Mon, 14
 Aug 2023 17:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230814192904.30062-1-lingshan.zhu@intel.com> <20230814192904.30062-5-lingshan.zhu@intel.com>
In-Reply-To: <20230814192904.30062-5-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 15 Aug 2023 08:34:25 +0800
Message-ID: <CACGkMEtkdXrTZ_=NkuPsmhUooCgKPiCiVo-nJMaDnJ5fufzGwQ@mail.gmail.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: mst@redhat.com, eperezma@redhat.com, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [RFC PATCH 4/5] virtqueue: constraints for virtqueue state

On Mon, Aug 14, 2023 at 7:29=E2=80=AFPM Zhu Lingshan <lingshan.zhu@intel.co=
m> wrote:
>
> This commit specifies the constraints of the virtqueue state,
> and the actions should be taken by the device when SUSPEND
> and DRIVER_OK is set
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  content.tex | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 43bd5de..f6ac581 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -587,6 +587,37 @@ \subsection{\field{Used State} Field}
>
>  See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Counte=
rs}.
>
> +\drivernormative{\subsection}{Virtqueue State}{Basic Facilities of a Vir=
tio Device / Virtqueue State}
> +
> +If VIRTIO_F_QUEUE_STATE has been negotiated, the driver MUST set SUSPEND=
 in \field{device status}
> +first before getting or setting Virtqueue State of any virtqueues.

I don't get why this is a must. It could be useful for debugging.

> +
> +If VIRTIO_F_QUEUE_STATE has been negotiaged but VIRTIO_RING_F_PACKED not=
 been negotiated,

typo

> +the driver MUST NOT access \field{Used State} of any virtqueues, it shou=
ld use the
> +used index in the used ring.
> +
> +\devicenormative{\subsection}{Virtqueue State}{Basic Facilities of a Vir=
tio Device / Virtqueue State}
> +
> +If VIRTIO_F_QUEUE_STATE has been negotiated but SUSPEND is not set in \f=
ield{device status},
> +the device MUST ignore any accesses against Virtqueue State of any virtq=
ueues.

Btw, do we need to clarify the behavior of ring reset after suspending?

> +
> +When VIRTIO_F_QUEUE_STATE has been negotiated but VIRTIO_RING_F_PACKED i=
s not,
> +the device MUST ignore any accesses against \field{Used State}.
> +
> +If VIRTIO_F_QUEUE_STATE has been negotiaged, the device MUST reset
> +the Virtqueue State of every virtqueue upon a reset.

Need to define the meaning of "reset" this is important for packed virtqueu=
e.

> +
> +If VIRTIO_F_QUEUE_STATE and VIRTIO_RING_F_PACKED have been negotiaged, w=
hen SUSPEND is set,
> +the device MUST record the Virtqueue State of every enabled virtqueue
> +in \field{Available State} and \field{Used State} respectively,
> +and correspondingly restore the Virtqueue State of every enabled virtque=
ue
> +from \field{Avaiable State} and \field{Used State} when DRIVER_OK is set=
.

We can just let the device report those states in any case then we
don't need to care about those details, or did you see any blockers?

Thanks

> +
> +If VIRTIO_F_QUEUE_STATE has been negotiated but VIRTIO_RING_F_PACKED has=
 been not, when SUSPEND is set,
> +the device MUST record the available state of every enabled virtqueue in=
 \field{Available State},
> +and restore the available state of every enabled virtqueue from \field{A=
vaiable State}
> +when DRIVER_OK is set.
> +
>  \input{admin.tex}
>
>  \chapter{General Initialization And Device Operation}\label{sec:General =
Initialization And Device Operation}
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

