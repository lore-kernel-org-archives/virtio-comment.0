Return-Path: <virtio-comment-return-6540-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E72EB64DC
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 08:09:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5E9B912D8B3
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 08:08:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4CB5E986413
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 08:08:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 44EEE9843C5; Tue, 27 Jun 2023 08:08:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 338FA98635B
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Jun 2023 08:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: jn5NiqjROti81HTDcnw9Vw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687853330; x=1690445330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL/759AaPMH0st9GXVcOOnv/nZ/V/khCTZbNkw/HAw0=;
        b=cpEIJ3AjQpdZNdpoCw8lI7kZAg1rYs4Hd9a36gkFlHFOZnIMk9Q47uZVq414dclkTF
         DAPaSLKLDs07ti7Mf0MfuqEBsVbuJr//2i7YyRHzXB8tj4oj0UC2bOAjOFM+WPiBXrgc
         aIDdlGXCGbvA4imoV/I7hFJIyZD5tWGG5Pn5iTK74mWZpfU/SUZ3+JcRcPVfccXS+Bqi
         tBH+L6hbLS/yKz89nypB3MhA19Cls+ntISejzWIVA1VhqQDgM/4oflz2GeR2On1I/Ndr
         zEfxyyP72CkjYA0MFKwjf9/t4VgilBd26ifqmV6VTzBwzeSghoweuySsumiu8aex2w94
         LBkQ==
X-Gm-Message-State: AC+VfDxmWFSL2bz14JnW4+ReE24XjUA2xpAjf9fPvXVa7mplwA+nHyUa
	hg5QZD8Miz3CAhXbw8yM3LI9secMm8otvXsEqxkpIpILU/+JMgkQmjb5cdJbjCf17rNcUlLRdRw
	Qqt08S5UsVBJW2cBWqId3DbeT1fdM7PvGc5cqNj/PLd+uet5o6XrWYCKDdd0k95s=
X-Received: by 2002:a2e:9d10:0:b0:2b5:7f93:b3b0 with SMTP id t16-20020a2e9d10000000b002b57f93b3b0mr13105361lji.17.1687853329778;
        Tue, 27 Jun 2023 01:08:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4CBowdqVjKy99Rf2VFemax8Aih0a0S4pAsIgVfUcvF64ji64Awo1dZ2FjgSHSu5ws/A8B3dW030rOM7CTivrQ=
X-Received: by 2002:a2e:9d10:0:b0:2b5:7f93:b3b0 with SMTP id
 t16-20020a2e9d10000000b002b57f93b3b0mr13105343lji.17.1687853329451; Tue, 27
 Jun 2023 01:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230626062210.49020-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20230626062210.49020-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 27 Jun 2023 16:08:38 +0800
Message-ID: <CACGkMEt=zfQn9ZY466opvwJNxamoj8fr=tSP4dQQFAFXymrwXA@mail.gmail.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org, 
	mst@redhat.com, parav@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [RFC PATCH] admin-queue: bind the group member
 to the device

On Mon, Jun 26, 2023 at 2:22=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> The VFs of the SR-IOV are created by the user inside the guest OS, so the=
 virtio
> devices don't know about these VFs. Because each VF may be assigned a dif=
ferent role
> by the user, the virtio device can not choose one VF to bind random.
> So only the user knows how to bind the virtio devices to the VFs.
> On the other hand, generally the virtio devices are not created by the us=
er
> inside the guest OS. This requires some management platform to participat=
e.
>
> So the usage of this command:
> 1. The user purchases a virtio network card on the management platform,
>    and sets the ip, queue number, etc. The user obtains the identity of
>    the network card.

Any reason we can't do this through IPC of software layers?

Thanks

> 2. The user creates a VF with echo 8 > sriov_numvfs
> 3. The user binds the net crad to a VF with identity through the command
>    of the patch
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  admin.tex | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/admin.tex b/admin.tex
> index 2efd4d7..64d0667 100644
> --- a/admin.tex
> +++ b/admin.tex
> @@ -115,7 +115,8 @@ \subsection{Group administration commands}\label{sec:=
Basic Facilities of a Virti
>  \hline \hline
>  0x0000 & VIRTIO_ADMIN_CMD_LIST_QUERY & Provides to driver list of comman=
ds supported for this group type    \\
>  0x0001 & VIRTIO_ADMIN_CMD_LIST_USE & Provides to device list of commands=
 used for this group type \\
> -0x0002 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    =
\\
> +0x0002 & VIRTIO_ADMIN_CMD_BIND_DEVICE & Bind the device to one group mem=
ber \\
> +0x0003 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    =
\\
>  \hline
>  0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a dif=
ferent structure)    \\
>  \hline
> @@ -429,6 +430,44 @@ \subsection{Group administration commands}\label{sec=
:Basic Facilities of a Virti
>  \field{VF Enable} refer to registers within the SR-IOV Extended
>  Capability as specified by \hyperref[intro:PCIe]{[PCIe]}.
>
> +\subsubsection{Bind the device for member}
> +
> +The VFs of the SR-IOV are created by the user inside the guest OS, so th=
e virtio
> +devices don't know about these VFs. Because each VF may be assigned a di=
fferent role
> +by the user, the virtio device can not choose one VF to bind random.
> +So only the user knows how to bind the virtio devices to the VFs.
> +On the other hand, generally the virtio devices are not created by the u=
ser
> +inside the guest OS. This requires some management platform to participa=
te.
> +
> +So we introduce a new admin queue command to bind the VFs and the virtio
> +devices.
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_bind {
> +    u64 identity;
> +};
> +\end{lstlisting}
> +
> +The user got the \field{identity} from the management platform, that is =
not
> +included by this spec.
> +
> +\drivernormative{\paragraph}{Group administration commands}{Basic Facili=
ties of a Virtio Device / Device groups / Group administration commands / B=
ind the device for member}
> +
> +VIRTIO_ADMIN_CMD_BIND_DEVICE requires that the \field{group_member_id} M=
UST be set.
> +
> +The \field{identity} is passed by the user. It is the identity of the vi=
rtio
> +device.
> +
> +\devicenormative{\paragraph}{Group administration commands}{Basic Facili=
ties of a Virtio Device / Device groups / Group administration commands / B=
ind the device for member}
> +
> +Every device MUST have one unique \field{identity} in the host.
> +
> +If the PF device can not find the device by the \field{identity},
> +the \field{status} MUST be set to VIRTIO_ADMIN_STATUS_EINVAL.
> +
> +If the device is found by the \field{identity}, the device MUST work as =
the
> +device of this group member specified by the \field{group_member_id}.
> +
>  \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virt=
io Device / Administration Virtqueues}
>
>  An administration virtqueue of an owner device is used to submit
> --
> 2.32.0.3.g01195cf9f
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

