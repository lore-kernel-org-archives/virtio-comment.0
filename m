Return-Path: <virtio-comment-return-8894-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA914C3DA6E
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 10:05:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F02F46846D
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 10:05:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D2A699865DB
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 10:05:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B760E9865AB; Fri,  5 Jan 2024 10:05:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A7E379865B3
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Jan 2024 10:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WnED-rK_N92BQ1qn9nayqg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704449127; x=1705053927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpRC3fLvk6t31XoonWmbLP4p3xqJzAwjn5Etf0mEZP0=;
        b=QlfKl17f1vh61df4BbcP9c6dUbFAKKyZy0OkIqAH0H+LamqgLq9DIG4cbHLdBdMYQ6
         RfCgAuVOMJCRTHwJMaq+5UGO/dv048e7gpAdML4vJlZMtCAhgO72kUJzW3CUkoVN/csZ
         VCzuE5k1JOtG7x+eUIgtNGhXWABHzXi23hCU/+1/Vxj4iNftsA3Ea+86SVb/iANSTL/b
         4AYIM1Qx3+HrthlMzQ5ffk7ii7GvqZumIKJ7YdH0v1irH/alI2jctZ8AFy8wYAaQWDOf
         5aTKQRWIcxmbxkY0WZ62AZK15NLx72jBxAtVxrJRA+lCEDSTdVDxDmuIuUALF2OPXxi3
         RWsw==
X-Gm-Message-State: AOJu0Ywldi72j61APluLB2Z52ziRB5Cfw3aP3ruj9uS1z24DlIluoucV
	U3Pxrl8Hea1mFXN8uo45HnmoWQ0O3SMEPCQ2WmkSxRgNnyWIROJsH6ZG9CoHkH8/69fBijtuCK4
	11rhuJ/qqgySGirCA5514QrMZY3UK8QVX9bxE6VOwnqN8UQPH7W7LrYUHVhrLePogvGWh
X-Received: by 2002:a0d:f881:0:b0:5ec:c335:dfa7 with SMTP id i123-20020a0df881000000b005ecc335dfa7mr1843836ywf.42.1704449127148;
        Fri, 05 Jan 2024 02:05:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGil1P/lE8KIS71wLzWjb0HVgmoopyAFMAf4NRB9CQ4vFDQXncm4T2BHBsxN41j7WIat0MBSHsI4iDjaQcHaBo=
X-Received: by 2002:a0d:f881:0:b0:5ec:c335:dfa7 with SMTP id
 i123-20020a0df881000000b005ecc335dfa7mr1843831ywf.42.1704449126920; Fri, 05
 Jan 2024 02:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20240105094536.3771166-1-maxime.coquelin@redhat.com>
In-Reply-To: <20240105094536.3771166-1-maxime.coquelin@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 5 Jan 2024 11:04:50 +0100
Message-ID: <CAJaqyWduj0YGF=mEu4c8=4OknyeKLYZpO1aB3LeqYZ3JMyV7rA@mail.gmail.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH] virtio-net: list requirement for guest
 offloads feature

On Fri, Jan 5, 2024 at 10:45=E2=80=AFAM Maxime Coquelin
<maxime.coquelin@redhat.com> wrote:
>
> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS requires VIRTIO_NET_F_CTRL_VQ,
> but it was not mentioned in the requirements list.
>
> This patch adds it to the list.
>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>

Reviewed-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> ---
>  device-types/net/description.tex | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 76585b0..07e7054 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -150,6 +150,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
>  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with=
 VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> +\item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS] Requires VIRTIO_NET_F_CTRL_VQ.
>  \end{description}
>
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Network Device / Feature bits / Legacy Interface: Feature bits}
> --
> 2.43.0
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

