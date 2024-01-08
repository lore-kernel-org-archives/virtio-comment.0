Return-Path: <virtio-comment-return-8895-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072C6C47073
	for <virtio-comment@archiver.kernel.org>; Mon,  8 Jan 2024 03:46:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 253172AF7F
	for <virtio-comment@archiver.kernel.org>; Mon,  8 Jan 2024 03:46:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0408E98633D
	for <virtio-comment@archiver.kernel.org>; Mon,  8 Jan 2024 03:46:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DEF3F98620A; Mon,  8 Jan 2024 03:46:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA4DE98620C
	for <virtio-comment@lists.oasis-open.org>; Mon,  8 Jan 2024 03:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QW-8f0AiOjakDu2FVMjfIA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704685561; x=1705290361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdv8S26jnE7rQ730++crjiLjxFBXa44XOmHiUiU1gXE=;
        b=JgEgAHf/wWqzI5grrpfntmg0RRy0dpfeDWw0PbEV66XI+WZEbQL2FuT4JlMt/Xw6K7
         KxRUjtnHbmngGoGx85sv5eyPchBXQG4lkRYfKwU3EPabapAWOVpgYKMnFc2yiC1uBLiJ
         gYrQFwzmLjjE+1ODzWkXmqGMpZlKC9XjA0DdWz2oZNUOVNGp3CeszyQ7pKdoO/t47YUv
         m6vDNASc6MGdViDkfICDy0nTznaJSusLV67/re3lgIcVnRTndVIu58bp7fMQMOVNlnpz
         LloJDAIGlSEy2JKZWYYBCY3YWhM5jxqw311KTL9kd9RwYOpYPdSZMKNynWXcnXjcN9gD
         zf2Q==
X-Gm-Message-State: AOJu0Yz+3ic9X5EEqyWlLVy43Bl8DvIoi3W6ok39Wsa2Hd9F+JIOgqmI
	rafSKzjfNT3jOC0HbGYvP4lGQ2V8TQo3CglM3AMgVwwHgCo2YXe2+WfCmacugMPOTKafgxsULfp
	5tYH6u9pyL0s7X4igEOGMrz59qkl9tNexOBrOjyJTTeR42Q62nLcocmj5Jw==
X-Received: by 2002:a05:6808:148e:b0:3bd:3439:5acc with SMTP id e14-20020a056808148e00b003bd34395accmr105012oiw.48.1704685561463;
        Sun, 07 Jan 2024 19:46:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcDlF0T44dJCpjRw/VY0X1TQ8Mba6iCjsXGLVOWsDOKxUirA9IYPKiPkL5IRlrvFGbd/P+PgfcMenVt8uBCy4=
X-Received: by 2002:a05:6808:148e:b0:3bd:3439:5acc with SMTP id
 e14-20020a056808148e00b003bd34395accmr105006oiw.48.1704685561236; Sun, 07 Jan
 2024 19:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20240105094536.3771166-1-maxime.coquelin@redhat.com>
In-Reply-To: <20240105094536.3771166-1-maxime.coquelin@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 8 Jan 2024 11:45:50 +0800
Message-ID: <CACGkMEt4=-PdfQnr_8GV_mo8-a1Hm-ebpmYt-evA8uToCTFfFg@mail.gmail.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH] virtio-net: list requirement for guest offloads feature

On Fri, Jan 5, 2024 at 5:45=E2=80=AFPM Maxime Coquelin
<maxime.coquelin@redhat.com> wrote:
>
> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS requires VIRTIO_NET_F_CTRL_VQ,
> but it was not mentioned in the requirements list.
>
> This patch adds it to the list.
>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

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

