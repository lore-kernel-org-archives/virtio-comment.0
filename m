Return-Path: <virtio-comment-return-7588-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB12E71D4F
	for <virtio-comment@archiver.kernel.org>; Thu,  5 Oct 2023 16:54:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EAAA870FE7
	for <virtio-comment@archiver.kernel.org>; Thu,  5 Oct 2023 16:54:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D87829867FD
	for <virtio-comment@archiver.kernel.org>; Thu,  5 Oct 2023 16:54:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CF2719867EC; Thu,  5 Oct 2023 16:54:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C1C0B9867ED
	for <virtio-comment@lists.oasis-open.org>; Thu,  5 Oct 2023 16:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iRzecRZ-N0KSBtvBeuAq9w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696524870; x=1697129670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2ULArmmmfd4XflHGYy3NRyN+8a60d12JAKbiWhs+Dw=;
        b=VX9PcSft14Vh5/WtomH92lXj74bNJWG+qEfhaHIiLnZTJZSN1zGbYOeJBkiqVqJ5bd
         2LpWI8HUDN7HJZqDwkwuEReGTdN3+mJvfghzg+yhkHujaFSiyLPvbK4n5dyFSL4PHCxq
         WVPkBJIlvTRap0yDmA+KBVbiXM0ECrko76KwO/s84xkL/BCugcOhGKR3PbiBTuauC30B
         h/0hU7QzwQPHMt16cwXGFLCwNd0lNDw4cSmkXwkFtuaQRpKpNNAh1ec20NlJtUtRXQvd
         iwF+AaUKWlxn/IDwkUomPyeZ5yyp9OcfacwN/25rtmS/oJtW+ntHRfRsc8q5UPl1h4Qc
         5cqw==
X-Gm-Message-State: AOJu0YydeaBikewq0BcsmojSiAUoj3NLhwwAKvJQO3YAfMXIhOvkXkA4
	2NnYiMuo/0IdPYIyI9oMd1x17lNGJUfnXgDVMWJIlqhmn+KdAOo2ZhLZ0cy7v6+Hl4NxqHdGB0Y
	+yZZfDrvwK825Nw2z6DUqpGd6D2OYTIMkcZ9BSErzQ2o95bPEezi5l2nyja7L
X-Received: by 2002:a81:4a87:0:b0:59f:519e:3e9a with SMTP id x129-20020a814a87000000b0059f519e3e9amr5605393ywa.20.1696524870047;
        Thu, 05 Oct 2023 09:54:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjEydLusq5NXuFvgU6oNI71eFBR6CxD3eL6gKlsa3n2n2HebFDvxoz7cYrgPBfCjHOP7VyORb362WifSQ3EYY=
X-Received: by 2002:a81:4a87:0:b0:59f:519e:3e9a with SMTP id
 x129-20020a814a87000000b0059f519e3e9amr5605382ywa.20.1696524869784; Thu, 05
 Oct 2023 09:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231002051601.6626-1-parav@nvidia.com> <20231002051601.6626-2-parav@nvidia.com>
In-Reply-To: <20231002051601.6626-2-parav@nvidia.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 5 Oct 2023 18:53:53 +0200
Message-ID: <CAJaqyWd9y4URri8TndYa5xXScirka6PhEod0RYy6DnyoRmgfBg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, 
	hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com, shahafs@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v3 1/2] conformance: Add missing
 virtqueue reset conformance references

On Mon, Oct 2, 2023 at 7:16=E2=80=AFAM Parav Pandit <parav@nvidia.com> wrot=
e:
>
> Add the missing references to the virtqueue reset related conformance
> requirements.
>

acked-by was not carried from v1:

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
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

