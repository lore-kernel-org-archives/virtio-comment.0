Return-Path: <virtio-comment-return-8242-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5658C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:46:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 257E26E6D0
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:46:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1BECA9867FF
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:46:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 11BD39867FB; Tue,  7 Nov 2023 10:46:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 033339867FC
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 10:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: FL2VkNnrNoCyT-LSN0bxcg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354004; x=1699958804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF7nkDz6eA+b8bHc+Dub+v1V70O+7SF4eKHZzjacjZ4=;
        b=h+9Tx0ildbYnmLuhde36Rad/JUS1s1fa/1Z5In2n/mZW+NMjlMgap/CSfo389Yvrgj
         2AK5lKhb1r5bNMGMZKPJATFy/PboMX/RRGKK7qZI625aP0DATHwsGb8+hI9tJaSsbP+G
         Y/ePS1rg7yjiiugnMSbUB+vWXYmk+LDCmGRlf3c1Js7Gkc/7kgOg6fNjn2lc1eNTRa04
         Jeol3vXXDYGHkCNHvxhMboGnD7XEfdRU/921HN3mQl7ikiQLNxm0n8z4LWlVAXfx5PFY
         BD4G7ZVTM1uDzpIjziGsTQ6utWqSEt+sdOVkAAdRYLaSM3uF+Hyy6Ii5i5mNQkY0BZPH
         5ngQ==
X-Gm-Message-State: AOJu0YytZt89xjfr+7Tz3pOBQQu4DOqJOkFgczaSBHaad6cAS4iahiT8
	KLpL0G6kEPYnWuKOYVwq4LLBNBH1sQFHPYEnPQuMnO+y04zjvF7UmhslobhxVDbAIeq+gu3TwqN
	rKm30NkmEb938M83f/cRGc9G+YFJOERVBOKUBBMqbXxkFnVvhmTMWGbz2wQ==
X-Received: by 2002:a05:6102:2083:b0:45d:9224:a898 with SMTP id h3-20020a056102208300b0045d9224a898mr9549767vsr.16.1699354004235;
        Tue, 07 Nov 2023 02:46:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4TS6sUX/7Obf02U2PFq9o1RPemlMQiekDEs4Rq7RhKm6XtiyhECfsDebo4btE9lmZ3zcM3MgKYyJvpJPO19Q=
X-Received: by 2002:a05:6102:2083:b0:45d:9224:a898 with SMTP id
 h3-20020a056102208300b0045d9224a898mr9549757vsr.16.1699354003929; Tue, 07 Nov
 2023 02:46:43 -0800 (PST)
MIME-Version: 1.0
References: <ZR6EzpQb6J1TxbM8@fedora>
In-Reply-To: <ZR6EzpQb6J1TxbM8@fedora>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Tue, 7 Nov 2023 11:46:33 +0100
Message-ID: <CAHYGQ0yw+ejG9TY57gVZeG3ucDxofebW5FDwhwLDS1HM6VfzaQ@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH] virtio-sound: add latency_bytes definition

Ping Anton.

Thanks, Matias.

On Thu, Oct 5, 2023 at 11:41=E2=80=AFAM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> This commit aims at providing a better definition of latency_bytes. To
> do so, this commit defines latency_bytes as is defined in Crosvm.
>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
>  device-types/sound/description.tex | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/sound/description.tex b/device-types/sound/desc=
ription.tex
> index 54c9c8e..1349765 100644
> --- a/device-types/sound/description.tex
> +++ b/device-types/sound/description.tex
> @@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Ty=
pes / Sound Device / Device
>  \begin{description}
>  \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is succes=
sful,
>  and VIRTIO_SND_S_IO_ERR otherwise.
> -\item[\field{latency_bytes}] indicates the current device latency.
> +\item[\field{latency_bytes}] indicates the current device latency. For
> +playback, this is the amount of bytes that must be consumed before
> +the current request can be played. For capture, this is the latency in t=
erms of
> +bytes that the capture buffer was recorded.
>  \end{description}
>
>  Since all buffers in the queue (with one exception) should be of the siz=
e
> --
> 2.41.0
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

