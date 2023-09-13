Return-Path: <virtio-comment-return-7402-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2432EDEC6A
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 14:52:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DEF032CAD2
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 14:52:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C867F986641
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 14:52:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B51A7986633; Wed, 13 Sep 2023 14:52:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A7017986634
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 14:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ll9dBmKnPQCCpeoTvSs3HQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694616769; x=1695221569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHZCs3Bz75JCanjgL5VRjNx3LasRHwLHPnDIsDrX7lQ=;
        b=eGt5fypxQti1P6a4hGgBDuB/edsjYD4usCacv41MOU6uyEkhCUKXW1dbscIZv7kbEd
         sTJhg81ud6xhdXnnWulh9hQmE0LRmUMo1YzNTWNix2nrEcQT43/99z3qGR3bXi49l8ph
         zDncciXwIU3N20ZlWhdtHsYSrlYmc6ZrdXHUe0q9Sr5d9fOqos1+NEdHsmbTNfumrTlY
         yhBzra420n2ArBNtR13f9tbaWNfeHzhs7OpuyLWQVK3kVB62hm8/uSUm6NPo/V1ONt0X
         Mf0SLhr8hndqkl2RbIR4ZEwrl16diBIQ5GQSDawkO62dk8f/qxpyxLyiaez1zwc52O3X
         DJEw==
X-Gm-Message-State: AOJu0Yw/FYxsoJS3HjWUmCClibzHmq88QfGJSYVEfv3d34i4hffrdV/e
	I1rNyESD76slMyS7cXVb0l99W2/0bQeEmUwBwqzNcOA461oEulQylbo2xko6kG1mPWsux4RAZLP
	+Bt+1TeTcFfA8Z1UhkzbLt/h8wlt8FGT0Ro91Uac3XDTflJHa4A==
X-Received: by 2002:a25:b9ce:0:b0:d7a:c572:f8e with SMTP id y14-20020a25b9ce000000b00d7ac5720f8emr2606370ybj.64.1694616769287;
        Wed, 13 Sep 2023 07:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu/rKIGxkStWaNIMGlLEhy7vWJ87st2Zp2IKv4aodFfya5gDzA0b/kL7iX2OabDWiQDW89IpH108EmAhfVtSk=
X-Received: by 2002:a25:b9ce:0:b0:d7a:c572:f8e with SMTP id
 y14-20020a25b9ce000000b00d7ac5720f8emr2606357ybj.64.1694616769055; Wed, 13
 Sep 2023 07:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230913135507.560540-1-parav@nvidia.com> <20230913135507.560540-2-parav@nvidia.com>
In-Reply-To: <20230913135507.560540-2-parav@nvidia.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 13 Sep 2023 16:52:13 +0200
Message-ID: <CAJaqyWcuoV9jrgLCtOfsy+uGjF5Y_F2c9XHE8skKEApVCZcqtA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, 
	hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com, shahafs@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/2] conformance: Add missing
 virtqueue reset conformance references

On Wed, Sep 13, 2023 at 3:55=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
> Add the missing references to the virtqueue reset related conformance
> requirements.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Reviewed-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> ---
>  conformance.tex | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/conformance.tex b/conformance.tex
> index dc00e84..863f9c5 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -76,6 +76,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device =
Reset}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device =
Configuration Space}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues / Virtqueue Reset / Virtqueue Reset}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message=
 Framing}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues / The Virtqueue Descriptor Table}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues / The Virtqueue Descriptor Table / Indirect Descriptors}
> @@ -162,6 +163,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature=
 Bits}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device =
Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device =
Configuration Space}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtque=
ues / Virtqueue Reset / Virtqueue Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message=
 Framing}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtque=
ues / The Virtqueue Descriptor Table}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtque=
ues / The Virtqueue Descriptor Table / Indirect Descriptors}
> --
> 2.34.1
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

