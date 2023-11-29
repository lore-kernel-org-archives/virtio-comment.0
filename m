Return-Path: <virtio-comment-return-8671-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66092C4167B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 08:00:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9978D45B39
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 08:00:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 749FA986656
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 08:00:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53FE39865EB; Wed, 29 Nov 2023 08:00:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 430AC9865ED
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Nov 2023 08:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qwk8OBpiOeeF1_U9xKc6Pg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701244832; x=1701849632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUZ9oTdf7ssws+XoYISFr+STceQL0B5UmcXyFnQ96cM=;
        b=WAKUHd+T3teMMr1PCQcvkkgxbAdLl1iYoxG7plSkGKVjBNn81mLh0tZ8cErDMTj4zi
         GF0D4fj5GVCGNv5DK+yxbfLuz+kPzH/+Oxo3266PtFdqWiYTGSo63PNAm2viP377AU4g
         Cu3yub1Jq3TgvSbClOnFVT+MLvjYhpFPWisi2y4JgYuh4tSRQSO3iJfYdVAq+QePkyn9
         hpn09ls6XRWMoPYy6pRZa1STLDR9vgjgQ/fRnpb56S9XkAcH8SvU09Ix/uav61l07K+0
         xtwr9qb1m6c6di8dgJDbqPs/H5FpNBLjusOLdPGV7wozY575xXU1pIFYLOjFYNiMD24a
         7M5A==
X-Gm-Message-State: AOJu0Yxe8c/i1O4pomO/77FAWm1aWpZ6eymx8t+ZAw9rzAIqJXvfOBUS
	TsXap+dercj7Ks3AHYuyK/Eaw/0YXjHEt4tH2WzO0P84XeYINqNt8tZhszbvLm8leXD6UWrT6SB
	nEAoCVWqZwTONTtWO5omD48YYK1alHmTYFQwzUtxEoWdWK7HQ+Q==
X-Received: by 2002:ac2:46ce:0:b0:50b:bf66:c47b with SMTP id p14-20020ac246ce000000b0050bbf66c47bmr2234285lfo.1.1701244832589;
        Wed, 29 Nov 2023 00:00:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8heK0glvuH6GUP05MyySHdXk4MGDYxU/B02NWVcjaYJfyIBcId+CAu1KuyhS2n4igrHFk+8h2FCqIVQ6nTzw=
X-Received: by 2002:ac2:46ce:0:b0:50b:bf66:c47b with SMTP id
 p14-20020ac246ce000000b0050bbf66c47bmr2234265lfo.1.1701244832233; Wed, 29 Nov
 2023 00:00:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701158152.git.hengqi@linux.alibaba.com> <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
In-Reply-To: <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 29 Nov 2023 16:00:21 +0800
Message-ID: <CACGkMEuN20TaSF1OeFgwEF85ZadxPomnsoMmprS3=DpCFPJKhQ@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update description for VIRTIO_NET_F_GUEST_CSUM.

On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
> To prevent readers from misunderstanding that the driver can
> only handles packets with partial checksum when
> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the description.
>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
>  device-types/net/description.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index aff5e08..529f470 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device Types / Netw=
ork Device / Feature bits
>  \begin{description}
>  \item[VIRTIO_NET_F_CSUM (0)] Device handles packets with partial checksu=
m offload.
>
> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial c=
hecksum.
> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial c=
hecksum or full checksum.

So patch 2 said

"
+\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets with
full checksum.
 \end{description}
"

Is there any difference between the two "full checksum" here?

Thanks

>
>  \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel offloads
>          reconfiguration support.
> --
> 2.19.1.6.gb485710b
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

