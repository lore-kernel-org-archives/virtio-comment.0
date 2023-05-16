Return-Path: <virtio-comment-return-5931-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA06AC77B75
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 04:13:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A92151318F7
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 04:13:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B87898670A
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 04:13:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E1799986783; Tue, 16 May 2023 04:13:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B372B98670B
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 May 2023 04:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: aH5FLW4RNBqN1fu8-PahLQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684210386; x=1686802386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwlPpIHPiMhlaGPr2kjj+GWduEqbPSymhbswgtEXn9w=;
        b=Sb+cudMHrQq1W5BR6QBJQnx5MvD5p17uuaP5+W+/ToXB93Pyb0OTwclBIzITQa2tiO
         wiXM1Yh0M32PNuV1ejDwedmY/PbO1hkla3aRsZZJE+2nKe4eSYTKYqr2LZ8ZDnkin0iv
         wjfFYOkBJfdqL610TflCSR+gkDOigXe347dRalbPLVcCpIn4MLS+i21NUuZkMWjFlp9W
         uHyiIRcH6rslBNE4HuOqoeMnhipd0+f0OJZ/fP0rSQ2i6L/JbqGCFJFLSv36Ffrn9CoT
         2lAJYg1jRKa0uk3KU9RTUmt78pDXZrHm20ew7YIRi9W5nv7WOkPtIcznHRZq3E5VfnNQ
         pAMA==
X-Gm-Message-State: AC+VfDwRboj1JHkKXKLGiWKTfohoNd6wdNIjQevWaJDVbBwIJwVnjZ8l
	huK3B6qVigLe3nfOWaNJjKQ+LNAv6T1BmgxPzGoZCkqLfQPkm2rVSoSyeOWfKvzCFwzR/qTuNAe
	RqxWmUUIHHEZbqJ3ioJntixsglu4nd2Umu5R/BYbTFmDzncH6eXxNXOoIinz+
X-Received: by 2002:ac2:4208:0:b0:4f0:206a:9fae with SMTP id y8-20020ac24208000000b004f0206a9faemr6144352lfh.11.1684210386761;
        Mon, 15 May 2023 21:13:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4XcgOMLWyRUrYdmvLdb0S7Ly943Vaf6XwsABKIRWswnWEAN99m8ytXLLS4m7bI20BNVt0y6deELrest0GIrjU=
X-Received: by 2002:ac2:4208:0:b0:4f0:206a:9fae with SMTP id
 y8-20020ac24208000000b004f0206a9faemr6144344lfh.11.1684210386455; Mon, 15 May
 2023 21:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230516030139.767838-1-parav@nvidia.com>
In-Reply-To: <20230516030139.767838-1-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 16 May 2023 12:12:55 +0800
Message-ID: <CACGkMEuyNy-JkX_Uy7TnS4qg=xmd2yjwuuLDFw6SO=dZeUe1=w@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, 
	virtio-dev@lists.oasis-open.org, shahafs@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH] content: Replace guest OS with driver

On Tue, May 16, 2023 at 11:02=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
> Currently device status field description and driver requirements
> section uses mix of terminology for the driver. These two sections
> sometimes call the driver as 'the guest OS' or 'the driver'.
>
> Most of the cleanup around 'guest Os' was already done around commit
> 212c0cf3 in past. Clean up the remaining few references to just
> refer it as 'driver'.
>
> This is an editorial change.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Do we plan to replace the "hypervisor" with "device" as well?

Thanks

> ---
>  content.tex | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index 9df81b8..417d476 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -26,10 +26,10 @@ \section{\field{Device Status} Field}\label{sec:Basic=
 Facilities of a Virtio Dev
>  following bits are defined (listed below in the order in which
>  they would be typically set):
>  \begin{description}
> -\item[ACKNOWLEDGE (1)] Indicates that the guest OS has found the
> +\item[ACKNOWLEDGE (1)] Indicates that the driver has found the
>    device and recognized it as a valid virtio device.
>
> -\item[DRIVER (2)] Indicates that the guest OS knows how to drive the
> +\item[DRIVER (2)] Indicates that the driver knows how to drive the
>    device.
>    \begin{note}
>      There could be a significant (or infinite) delay before setting
> @@ -473,13 +473,13 @@ \section{Device Initialization}\label{sec:General I=
nitialization And Device Oper
>  \begin{enumerate}
>  \item Reset the device.
>
> -\item Set the ACKNOWLEDGE status bit: the guest OS has noticed the devic=
e.
> +\item Set the ACKNOWLEDGE status bit: the driver has noticed the device.
>
> -\item Set the DRIVER status bit: the guest OS knows how to drive the dev=
ice.
> +\item Set the DRIVER status bit: the driver knows how to drive the devic=
e.
>
>  \item\label{itm:General Initialization And Device Operation /
>  Device Initialization / Read feature bits} Read device feature bits, and=
 write the subset of feature bits
> -   understood by the OS and driver to the device.  During this step the
> +   understood by the driver to the device.  During this step the
>     driver MAY read (but MUST NOT write) the device-specific configuratio=
n fields to check that it can support the device before accepting it.
>
>  \item\label{itm:General Initialization And Device Operation / Device Ini=
tialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The driver =
MUST NOT accept
> --
> 2.26.2
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

