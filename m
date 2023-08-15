Return-Path: <virtio-comment-return-7106-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A0AC001DB
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:35:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 04368C6100
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB3F39863AD
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 00:35:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E0F02983C28; Tue, 15 Aug 2023 00:35:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBDFF98636E
	for <virtio-comment@lists.oasis-open.org>; Tue, 15 Aug 2023 00:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kPkGPIGYMXiOxUORm5p0Dw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692059717; x=1692664517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0vaDuEVUIjlj6UOtXtTItR2rsgTMIiTlrPleYbnPSk=;
        b=BMRjuSrCH+GnH6M1EoJWNrDfvLCXBMq3bjq1yzWIqShog2E9diMc3B62oEOflLDkzw
         v6EuiKpyLlxzhR+5cRjaa1Ie704locFCaGWXaeYqVGod4KFXJ5uT91JoYNuYOv1PD/Zi
         NFptTdyt3+v+TfeFOmNnZS8Yi+ZFpCRojkbX/kx42VGVs1oqBf4fY7HT0XNH9mHmjCWA
         p2oHE56BzVus8VxmL5O72gOiABqnoWlkbmubWDPzG3OjqLhNKFVclMj4RlWqXvBXLRlY
         K/p44ZHyR/UrIqfPt5tTdUSFLGBhtjlYUAjoBBVmQcRhHlIIqVYr0yBMrFfekH+4bQu/
         wbDg==
X-Gm-Message-State: AOJu0YxpvKJVu22P2PPAKpAAAUYiWXE99TfTl72JN/f5M6FJN3eZK0zi
	N4xXq9wsjwZ2X2U3+nnzzwBHl1nyBe0d1wmtZTTUrJBxQHGah1nPZbvEesePMhxTzrkm5kZaZIJ
	kh0hkPRyzPaOCygtY6AnMoLxxLGh1rTNQB/VBpxpTOopl+MgTtw==
X-Received: by 2002:a2e:9a90:0:b0:2b6:df71:cff1 with SMTP id p16-20020a2e9a90000000b002b6df71cff1mr7795245lji.52.1692059717372;
        Mon, 14 Aug 2023 17:35:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOACkFTRnoaWV5zTq8piXeyteWkVb7+B/oNyn9pt+gV8YWyYKYtvG9/KH+Ee+aDoD7l8RYr95IlPwr35Xzn3o=
X-Received: by 2002:a2e:9a90:0:b0:2b6:df71:cff1 with SMTP id
 p16-20020a2e9a90000000b002b6df71cff1mr7795241lji.52.1692059717208; Mon, 14
 Aug 2023 17:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230814192904.30062-1-lingshan.zhu@intel.com> <20230814192904.30062-6-lingshan.zhu@intel.com>
In-Reply-To: <20230814192904.30062-6-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 15 Aug 2023 08:35:05 +0800
Message-ID: <CACGkMEsHvg8W_UA_nn-UdU7rAEgxseSSC9tBoaF__-AS6a-1BA@mail.gmail.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: mst@redhat.com, eperezma@redhat.com, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [RFC PATCH 5/5] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Mon, Aug 14, 2023 at 7:29=E2=80=AFPM Zhu Lingshan <lingshan.zhu@intel.co=
m> wrote:
>
> This patch adds two new le16 fields to common configruation structure
> to support VIRTIO_F_QUEUE_STATE in PCI tranport layer.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  transport-pci.tex | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..d9bccb0 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -321,6 +321,8 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio Transport
>          le64 queue_device;              /* read-write */
>          le16 queue_notif_config_data;   /* read-only for driver */
>          le16 queue_reset;               /* read-write */
> +        le16 queue_avail_state;         /* read-write */
> +        le16 queue_used_state;          /* read-write */

Those need to be placed at the end of this structure at least or we
need a dedicated new capability.

>
>          /* About the administration virtqueue. */
>          le16 admin_queue_index;         /* read-only for driver */
> @@ -415,6 +417,16 @@ \subsubsection{Common configuration structure layout=
}\label{sec:Virtio Transport
>          This field exists only if VIRTIO_F_RING_RESET has been
>          negotiated. (see \ref{sec:Basic Facilities of a Virtio Device / =
Virtqueues / Virtqueue Reset}).
>
> +\item[\field{queue_avail_state}]
> +        This field is vaild only if VIRTIO_F_QUEUE_STATE has been
> +        negotiated. The driver sets and gets the available state of
> +        the virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> +
> +\item[\field{queue_used_state}]
> +        This field is vaild only if VIRTIO_F_QUEUE_STATE has been
> +        negotiated. The driver sets and gets the used state of the
> +        virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> +
>  \item[\field{admin_queue_index}]
>          The device uses this to report the index of the first administra=
tion virtqueue.
>          This field is valid only if VIRTIO_F_ADMIN_VQ has been negotiate=
d.
> @@ -488,6 +500,9 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio Transport
>  present either a value of 0 or a power of 2 in
>  \field{queue_size}.
>
> +If VIRTIO_F_QUEUE_STATE has not been negotiated, the device MUST ignore
> +any accesses against \field{queue_avail_state} and \field{queue_used_sta=
te}.
> +
>  If VIRTIO_F_ADMIN_VQ has been negotiated, the value
>  \field{admin_queue_index} MUST be equal to, or bigger than
>  \field{num_queues}; also, \field{admin_queue_num} MUST be
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

