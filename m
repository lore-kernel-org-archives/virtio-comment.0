Return-Path: <virtio-comment-return-8053-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A21FC4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 01:43:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CD1B02B122
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 01:43:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DBEF986B5E
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 01:43:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 82C2E986B5A; Tue, 31 Oct 2023 01:43:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 727F8986B5B
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 Oct 2023 01:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QxwSAdvsPt-7ofi_3zJDiw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698716598; x=1699321398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWw1Z17YZOkJzAtgSn/5LaTD5hPsFqKSIyLW74mS/Us=;
        b=Dt+rX5DFVqRlXGEh3/VFhgQB7XyweLp8BdNXO9a6OqXKHrmjVl9FCM9CgSfXlSgu/c
         meLq/qDs/2lF/qG4mM1oz3bFCeFBP5LhKIcRyHaMTf+MdO9GUVuMDKMD6SiZx1RtANQG
         usDx64bR7uACIMuwtgrRFjHI8HiI+zbyu1RwqXcXCnR+CVn0DDY6uqcYwtDyRAOU77gl
         ivRqQ4eQBUvgpk1v9heO5a5HoOfhfqrNktDaC3MN7TpTQzQ9vNn9IdfCQE4Ab8IY0Ebb
         0UdonEBrK3NRf5DjVOTIV0AK5CT6mdih8osGlfF1v3buBCpjP90zAFdZmmZD0VDCr/eg
         Vqfg==
X-Gm-Message-State: AOJu0Yy0nXlWVYmrUuuNoZ/yKGhyVNeVjxntP3J14W/RYZbFYydBdjHM
	1DOrEvDqJB6Hhyp5krPRObKVNAx342u0nNtXi1i3Me5RQ1IlaO4NQmhUcVcTkM13aN32HW7coEo
	kEZU826du1Y3Hs/0WVxDKijBpMZXLfncCCuzcXNidMWpDelpVBg==
X-Received: by 2002:a19:7605:0:b0:502:f2a8:d391 with SMTP id c5-20020a197605000000b00502f2a8d391mr8323652lff.45.1698716598590;
        Mon, 30 Oct 2023 18:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbd7Pik+3HaKpeMo2jLMSRR8l2PcJ+4iZPjZdk4pMBKjIX1kfAy6Ykshg4/M6AhVw9SmxHfqijeWSijkAcuyg=
X-Received: by 2002:a19:7605:0:b0:502:f2a8:d391 with SMTP id
 c5-20020a197605000000b00502f2a8d391mr8323647lff.45.1698716598310; Mon, 30 Oct
 2023 18:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231030131959.1386107-1-parav@nvidia.com> <20231030131959.1386107-7-parav@nvidia.com>
In-Reply-To: <20231030131959.1386107-7-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 31 Oct 2023 09:43:07 +0800
Message-ID: <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, 
	sburla@marvell.com, shahafs@nvidia.com, maorg@nvidia.com, yishaih@nvidia.com, 
	lingshan.zhu@intel.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
> During a device migration flow (typically in a precopy phase of the
> live migration), a device may write to the guest memory. Some
> iommu/hypervisor may not be able to track these written pages.
> These pages to be migrated from source to destination hypervisor.
>
> A device which writes to these pages, provides the page address record
> of the to the owner device. The owner device starts write
> recording for the device and queries all the page addresses written by
> the device.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Satananda Burla <sburla@marvell.com>
> ---
> changelog:
> v1->v2:
> - addressed comments from Michael
> - replaced iova with physical address
> ---
>  admin-cmds-device-migration.tex | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migratio=
n.tex
> index ed911e4..2e32f2c 100644
> --- a/admin-cmds-device-migration.tex
> +++ b/admin-cmds-device-migration.tex
> @@ -95,6 +95,21 @@ \subsubsection{Device Migration}\label{sec:Basic Facil=
ities of a Virtio Device /
>  The owner driver can discard any partially read or written device contex=
t when
>  any of the device migration flow should be aborted.
>
> +During the device migration flow, a passthrough device may write data to=
 the
> +guest virtual machine's memory, a source hypervisor needs to keep track =
of these
> +written memory to migrate such memory to destination hypervisor.
> +Some systems may not be able to keep track of such memory write addresse=
s at
> +hypervisor level. In such a scenario, a device records and reports these
> +written memory addresses to the owner device. The owner driver enables w=
rite
> +recording for one or more physical address ranges per device during devi=
ce
> +migration flow. The owner driver periodically queries these written phys=
ical
> +address records from the device.

I wonder how PA works in this case. Device uses untranslated requests
so it can only see IOVA. We can't mandate ATS anyhow.

Thanks


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

