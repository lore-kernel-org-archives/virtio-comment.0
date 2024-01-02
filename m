Return-Path: <virtio-comment-return-8876-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1387C4706F
	for <virtio-comment@archiver.kernel.org>; Tue,  2 Jan 2024 01:50:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 18C432AF8C
	for <virtio-comment@archiver.kernel.org>; Tue,  2 Jan 2024 01:50:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E2D6A9864C2
	for <virtio-comment@archiver.kernel.org>; Tue,  2 Jan 2024 01:50:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BAABE986148; Tue,  2 Jan 2024 01:50:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D1A449863AF
	for <virtio-comment@lists.oasis-open.org>; Tue,  2 Jan 2024 01:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: EJpxFNkgMbCDHzjQ7gGOyQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704160148; x=1704764948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boM2TKXxCXYLN9Dq1yWT+PBBFgQs15678ubm+KVXQZU=;
        b=JAQZnHzIW4WJwv3+UcOKx8mNHqGIZPnYYroyN1IjAlrodgmAgdQnqc7pWRAfqezKRL
         e5/epPmahLUvOCIIuJyc8G9/mte+eGby9D/rLfVtYteAdwD/vj394rxxV05kNziBoJx+
         OKm8fmzT3HAOHqSXB/1VO0uLDZ1lyLYVJrHUnBYLtpakNUco532ugVCe0W8VmVvTvR9X
         K4bt2rW6zFoGprY/GQcDafl3t5x4EJtYncxcC7m05fgS97Lp6Jk7UwnnFfpN8l3JRzX5
         A9BBkQ2AtE73BaqsMl/3MAllbVGX5Pe2isQvQr306/++/UVJQ0EtHqMIXnSGaPlh4Wer
         7mcQ==
X-Gm-Message-State: AOJu0Yx0wZjsnB4OGb4Y4lJM66uCsf5TkM+CAMYpwUcqnhpPVexjRAqw
	wZ4BDQ6vizWGabwmCvl3ZvcLEYbOfpQ8Cpdiyu02YL6SDUugN6GoTGvYikNTPXlCQD+7PNR542E
	BG8mtbKph+96qQmz3FoqIIvfnw0TSP1hDiJIlOEsCrtXHTfv9gnOBkzaUDA==
X-Received: by 2002:a05:6808:2388:b0:3bb:f6a0:f34a with SMTP id bp8-20020a056808238800b003bbf6a0f34amr4810402oib.31.1704160148638;
        Mon, 01 Jan 2024 17:49:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+J8rxTtGRk/lxzvi9dN9mG4/SE9bHz+78auvQMHKsfaP4zLV1rF9DyRPiewCH/lqj31Ai+lbba1+Cd6DgNrg=
X-Received: by 2002:a05:6808:2388:b0:3bb:f6a0:f34a with SMTP id
 bp8-20020a056808238800b003bbf6a0f34amr4810394oib.31.1704160148423; Mon, 01
 Jan 2024 17:49:08 -0800 (PST)
MIME-Version: 1.0
References: <1703749573-2786-1-git-send-email-hengqi@linux.alibaba.com> <1703749573-2786-2-git-send-email-hengqi@linux.alibaba.com>
In-Reply-To: <1703749573-2786-2-git-send-email-hengqi@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 2 Jan 2024 09:48:43 +0800
Message-ID: <CACGkMEu5_fgsvkvCscXc8CbH-kP1APx2EYEap7V5e4nYg8sVRQ@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v7 1/2] virtio-net: correct conditions for devices to
 validate packet checksum

On Thu, Dec 28, 2023 at 3:46=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
> There is a historical error in virtio spec:
>   "If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device *MUST* set fl=
ags to zero
>    and SHOULD supply a fully checksummed packet to the driver."
>
> Currently in Linux and virtio-related implementations, the device validat=
es
> the packet checksum and sets DATA_VALID regardless of whether
> VIRTIO_NET_F_GUEST_CSUM is negotiated.
>
> Please refer to the following summary and thread[1] for details and reaso=
ns:
>
> Summary:
> 1. GUEST_CSUM at virtio spec 0.95 is intended to be compatible with parti=
ally
> checksummed packets (NEEDS_CSUM <-> CHECKSUM_PARTIAL). So GUEST_CSUM is m=
apped
> to NETIF_F_RXCSUM.
> GUEST_CSUM only indicates whether the driver handles partially checksumme=
d packets.
> When XDP is loaded, the offload of GUEST_CSUM will be disabled, which mea=
ns that
> packets have NEEDS_CSUM set will be dropped, but packets have DATA_VALID =
set will
> still be received because NETIF_F_RXCSUM still exists.
>
> 2. When DATA_VALID was added to Linux in 2011[2] and virtio1.0, it was ac=
tually expected
> that rx checksum offload (the driver can set CHECKSUM_UNNECESSARY) had no=
thing to do
> with whether GUEST_CSUM was negotiated. But due to an error, below descti=
ption was
> added incorrectly:
>   "If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device *MUST* set fl=
ags to zero
>    and SHOULD supply a fully checksummed packet to the driver."
>
> 3. We now hope to correct this error. Let the setting of DATA_VALID not b=
e controlled by
> whether GUEST_CSUM is negotiated, but only controlled by whether rx check=
sum offload is
> enabled on the OS side. The state of this rx checksum offload is also not=
 aware of the device.
>
> 4 NETIF_RXCSUM corresponding to rx checksum offload should be added to de=
v->hw_features.
> When the user turns off rx checksum offload through ethtool -K, neither N=
EEDS_CSUM nor
> DATA_VALID should be taken care of, that is, all packets will be CHECKSUM=
_NONE.
>
> 5. GUEST_FULLY_CSUM is added to disable the offload of GUEST_CSUM:
> When a packet have NEEDS_CSUM set is received, it is either dropped or a =
fully checksummed
> packet is calculated.
> When the corresponding offload of the GUEST_FULLY_CSUM is disabled, it is=
 as if only
> GUEST_CSUM was negotiated.
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202312/msg00135.=
html
> [2] 10a8d94a9574 ("virtio_net: introduce VIRTIO_NET_HDR_F_DATA_VALID")
>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
>  device-types/net/description.tex | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index aff5e08..a5210f2 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -723,8 +723,7 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
>    \field{num_buffers} is one, then the entire packet will be
>    contained within this buffer, immediately following the struct
>    virtio_net_hdr.
> -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> -  VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> +\item The VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>    set: if so, device has validated the packet checksum.
>    In case of multiple encapsulated protocols, one level of checksums
>    has been validated.
> @@ -783,7 +782,7 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
>  packet together, such that at least \field{num_buffers} are
>  observed by driver as used.
>
> -If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device MUST set
> +If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device MAY set
>  \field{flags} to zero and SHOULD supply a fully checksummed
>  packet to the driver.

I think it would more clearer if we just drop the flags part:

"
If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device SHOULD supply
a fully checksummed packet to the driver.
"

>
> @@ -842,8 +841,7 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
>  not less than the length of the headers, including the transport
>  header.
>
> -If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> -device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
> +The device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
>  \field{flags}, if so, the device MUST validate the packet
>  checksum (in case of multiple encapsulated protocols, one level
>  of checksums is validated).

And drop this part.

Thanks

> --
> 1.8.3.1
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

