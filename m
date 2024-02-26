Return-Path: <virtio-comment-return-9141-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F46CC48BF6
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Feb 2024 06:42:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 771622AF89
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Feb 2024 06:42:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F9919863B6
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Feb 2024 06:42:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 45EC6983FE3; Mon, 26 Feb 2024 06:42:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3342E986339
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Feb 2024 06:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: S2ZFxm12O1CwYtFEJKE-OA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708929738; x=1709534538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxDUPagDvVtXFYNQzhzXprsOfNbHn672p3g9URdq+ZU=;
        b=bivSTzmuli0bwgB3Ge/EINsh9dOVfnWO3kbFciLVHT5QplXJW1ZWPaTuSJZLVDT0G/
         B+vJjAVAOb/zumuxZtLDy9UbCLZC7NfinJ8oPelvZgyecutElastQz2wv6Tnh/y5NDI5
         Ux+ETWmBVmtOA8t0Cf1Y7dqaoExJy8yfE665P7egaIis6qsHf/c2eD/7sXwacp/tAbEC
         dNWF2XctMFOOEAuUPQKcBkUMnQ8i92vq7ICWT8hst0gOP1IWgN3RnUOnDNjf17wneJ4D
         ypskfuWAtvnUwwLaB1MBkos9MHIQqdGc+zj3JKQ03igTfHRjdYopCU0FYN9TQgxvIWrP
         ggWA==
X-Forwarded-Encrypted: i=1; AJvYcCVNfD9y/FHPPJpfireUR6qui6h1/y0qsHUu6RF62u0kQjBwWnK89gTOTBCVnFRSfu9RYiI+sMchsxxSX5o1IKko6AEYT+s0TS4Lx+f1gEZLWgfxkw==
X-Gm-Message-State: AOJu0YwrIGB9TFBIUEk/Wkf08Exk2f7jVTLvoX0p6TpMQkOIRD4+u5El
	ZEu8Nl0lX9BiND4BHlFGhcJX6wksuyp4V8nP50h9J7/p3jgHK/0GRtJBqEZ1LAE4Nvay3hCiM7M
	OiZa3L930wsNi7+tCt3MFTTPIkDXhhom6OnmRTJFgQkwLCnKJf91Gu9TG6Avjdo4Kg+86VfJ89E
	011M2K7zriwT5KOHYVj+DzY/R60Npu2JCRmjXydW1SMgyOrw==
X-Received: by 2002:a17:902:ead2:b0:1dc:177b:1d85 with SMTP id p18-20020a170902ead200b001dc177b1d85mr5212139pld.27.1708929738063;
        Sun, 25 Feb 2024 22:42:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPjqXDqvRSryvZUoHlapsPF8sYJ2LccTIQnf1QlrFDeAAnlVtwK8iyELbez+L0Sh0tF4nraIcdu4TqUhKTGGQ=
X-Received: by 2002:a17:902:ead2:b0:1dc:177b:1d85 with SMTP id
 p18-20020a170902ead200b001dc177b1d85mr5212129pld.27.1708929737544; Sun, 25
 Feb 2024 22:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20240216082432.709956-1-stevensd@chromium.org> <20240216082432.709956-2-stevensd@chromium.org>
In-Reply-To: <20240216082432.709956-2-stevensd@chromium.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Feb 2024 14:42:06 +0800
Message-ID: <CACGkMEuP=ZcbRf4G8O1hBjg0s5uNbrRMO=ESnU0AKWSHmF_fMQ@mail.gmail.com>
To: David Stevens <stevensd@chromium.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, 
	virtio-dev@lists.oasis-open.org, parav@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v4 1/1] Add suspend support for virtio PCI devices

On Fri, Feb 16, 2024 at 4:25=E2=80=AFPM David Stevens <stevensd@chromium.or=
g> wrote:
>
> Add a virtio power management PCI capability to allow drivers to suspend
> virtio PCI devices. This allows drivers to suspend devices at the virtio
> level before suspending them at the PCI transport layer. This allows
> drivers to do a two phase suspend, which prevents notifications from
> being ignored or lost if interrupts are reconfigured at the PCI
> transport layer immediately before or after the device is put into the
> PCI PM D3 low power state.
> ---
>  transport-pci.tex | 51 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>

I would like to know how the two phase suspend can prevent the loss of
notification or interrupt. Or for example, if it can be workaround at
the driver level.

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

