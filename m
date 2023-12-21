Return-Path: <virtio-comment-return-8834-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C5FC35274
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 03:37:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4E76C330A7
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 03:37:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24305986602
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 03:37:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E8CE7983EB5; Thu, 21 Dec 2023 03:37:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D3AC39865B6
	for <virtio-comment@lists.oasis-open.org>; Thu, 21 Dec 2023 03:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fBXuCKoRNDC0BK0DmM5lmA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703129848; x=1703734648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEZYsjNBZovgvpT63Ch2XYTUvcay1hZjdIZVnZ47f3U=;
        b=mDeOXp0Pi71uwr/91ERyRICMCBE3HFLN2hu9rqiseVVxELZanKcS1+8iiUtwSKK3sG
         5WlCWnjnCSfBbpvS/d4JsEFJ8LSU0lJXdYPF82Ac/oZ4cLSX9Dm2/KoyuD9du9dYl1ms
         j8TtxK4LW8oqRZInh/e3Lw4OBlH34O0+myN3v08dei1McRLDsMwBIKXyd+28lqKyg+GD
         qKlsUEAQhhF2zBWOl9PAB0Px4vKp7DwmQIleUP5+0rvu01oprl5nmidu6CxiwE3sB3fE
         VwF7z3Kle36hsodceGFXcTCt56hXloJ0SbQVBwDn7iuKwtzPOyrwCJR4FCnP5nOC84il
         476w==
X-Gm-Message-State: AOJu0Yy5Gg3/XQueGdzW1ktmfjegx4uXN+L6IpVRzeG8E48bHOI5GjEz
	/rkGHVuisOj2JNmGnAUUpIJus2QeBlnqfw72Vz88f/30P7MnWdjhWyxMQjCy2HiTmqbe0d4byNl
	xQjd1/h7bXJfjeHcklS3zxGTI2Fl/mIlW40vXwgz1KKSJgrSv0A==
X-Received: by 2002:a05:6808:2013:b0:3bb:6a2a:e2c0 with SMTP id q19-20020a056808201300b003bb6a2ae2c0mr3954358oiw.74.1703129848535;
        Wed, 20 Dec 2023 19:37:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLkmMtUgDxF0D+pBXvHKRMylahdqS9yb/6MCfYKPaNBicEGcTgMhfLVNp+LIpS0ZCe61VEP19CKDCAA5c3fqU=
X-Received: by 2002:a05:6808:2013:b0:3bb:6a2a:e2c0 with SMTP id
 q19-20020a056808201300b003bb6a2ae2c0mr3954347oiw.74.1703129848320; Wed, 20
 Dec 2023 19:37:28 -0800 (PST)
MIME-Version: 1.0
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
In-Reply-To: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 21 Dec 2023 11:37:17 +0800
Message-ID: <CACGkMEt_kvBbnpNt_cfB8KdKWM9WP8T_wnQBm13yKpe5JYVnAg@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting coalescing params for
 multiple vqs

On Wed, Dec 20, 2023 at 10:40=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com>=
 wrote:
>
> Currently, when each time the driver attempts to update the coalescing pa=
rameters
> for a vq, it needs to kick the device and wait for the ctrlq response to =
return.
>
> If a command can only update one vq parameters, when the parameters are u=
pdated
> frequently (such as netdim), ctrlq on the device is kicked frequently, wh=
ich will
> increase the device CPU scheduling overhead, and the number and overhead =
of device
> DMA will also increase.
>
> Merging multiple vq updated parameters into one command can effectively r=
educe
> the number of kick devices and device DMA times.
>
> Test results show that this greatly improves the efficiency of the ctrlq =
in
> responding to multiple vq coalescing parameter updates issued by the driv=
er.

So netdim is per virtqueue, to make use of this, you need to batch the
netdim requests first. And if you do that, you can batch the commands
as well. Then you get one kick for sevreal coal requests?

Or are you saying you run out of ctrl vq?

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

