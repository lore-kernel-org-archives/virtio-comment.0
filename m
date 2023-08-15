Return-Path: <virtio-comment-return-7104-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E84C001E0
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:29:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B462B42A75
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:29:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F4B09863EF
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:29:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 306B19863AD; Tue, 15 Aug 2023 00:29:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A213983C28
	for <virtio-comment@lists.oasis-open.org>; Tue, 15 Aug 2023 00:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XIEZL6LsPJ2AO9cYa9_yog-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692059359; x=1692664159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/rjsJ4Hhv24RRgnHfHk1xNtahQpfnvp5HyRGzDH9Vg=;
        b=Q4E9yUy0y1tbP/cFgA4npkItsh+1l7myPUKuHPcu3b7f7EB/rYM8Nv+mDXbOTfot7u
         Jt3ZWbuxmnZLDNgsVsmEZ8wZBkDWuc2VqKy8plCiCmUs9DV0K3ZwxpxuUSfgr4KNMMqh
         2hp3qq0iqiTVuGGJPl7Pu28xReDS53hLt9qpBC4FqKUEP6ZQlY1r6FxmWMqDXK/YfQEI
         vbTPuYTRH2AIFOt+GIOxevRtHGqp3oeHx92TpGceYzQXP3M/ESf9fYU9QA7cC/3fnhY0
         5A0imY3RCXKyEFZfAIympklfwfHT549326X+hfJjQgxeWvqdwCgD7x8VaOVgGIjM3xxZ
         bb/g==
X-Gm-Message-State: AOJu0YxZS6sgtVg0vR075/dcuOK+3FPZ39XQK4YJQ9be8rjC7F9eVadX
	edc5xYzNVP01fMd4rULQ2nKlgn1BefxJFUfDsQDeyI+GMX9oOpom9to6cicbO16B/3vaImIBlcS
	e2TZu9e6XfU28WRxl+xIOSbWyH+JqRLE6aMrxUjyIllv1iBrjwgs2Cz6uh31O
X-Received: by 2002:a2e:9c92:0:b0:2bb:7b85:2a01 with SMTP id x18-20020a2e9c92000000b002bb7b852a01mr2186114lji.31.1692059359469;
        Mon, 14 Aug 2023 17:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcyoyvOpXRwR3e43qAGJl1aW+pu7b06Mw4HtcD9NjQyBlzhwxJQvHbh2sVvFOnD3s2fKKjyHlKf8YaahD5s8s=
X-Received: by 2002:a2e:9c92:0:b0:2bb:7b85:2a01 with SMTP id
 x18-20020a2e9c92000000b002bb7b852a01mr2186107lji.31.1692059359194; Mon, 14
 Aug 2023 17:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230814192904.30062-1-lingshan.zhu@intel.com> <20230814192904.30062-4-lingshan.zhu@intel.com>
In-Reply-To: <20230814192904.30062-4-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 15 Aug 2023 08:29:08 +0800
Message-ID: <CACGkMEuS8xnKi8Nh10T4KCXCYSa-yYmN5X+=ZkCHUrb0jbH-XA@mail.gmail.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: mst@redhat.com, eperezma@redhat.com, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [RFC PATCH 3/5] virtio: The actions by the device upon SUSPEND

On Mon, Aug 14, 2023 at 7:29=E2=80=AFPM Zhu Lingshan <lingshan.zhu@intel.co=
m> wrote:
>
> This commit specifies the actions to be taken by the device upon
> SUSPEND.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Eugenio P=C3=83rez <eperezma@redhat.com>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  content.tex | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 074f43e..43bd5de 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -96,6 +96,15 @@ \section{\field{Device Status} Field}\label{sec:Basic =
Facilities of a Virtio Dev
>  If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device MUST cl=
ear SUSPEND
>  and resumes operation upon DRIVER_OK.
>
> +If VIRTIO_F_SUSPEND is negotiated, when SUSPEND is set, the device MUST =
perform the following operations:
> +\begin{itemize}
> +\item Stop comsuming any descriptors

Typo.

> +\item Mark all finished descriptors as used and send used buffer notific=
ation to the driver

What happens to the unfinished descriptors?

> +\item Record Virtqueue State of each enabled virtqueue, see section \ref=
{sec:Virtqueues / Virtqueue State}

This basically means those states are only available after suspending
or not? It would be still useful for debugging if we allow it without
suspending.

> +\item Pause its operation and preserve all configurations in its Device =
Configuration Space, see \ref{sec:Basic Facilities of a Virtio Device / Dev=
ice Configuration Space}

We probably need to define the "pause" here (e.g what happens to the
inflight descriptors).

Thanks

> +\item Present SUSPEND in \field{device status}
> +\end{itemize}
> +
>  \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / F=
eature Bits}
>
>  Each virtio device offers all the features it understands.  During
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

